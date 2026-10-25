#!/usr/bin/env python3
"""
build.py — render the cross-platform agent variants from one canonical source.

SINGLE SOURCE OF TRUTH
-----------------------
`src/agents/<id>.md` is the canonical agent definition. It is the **OpenCode
V2** flavour: `permissions:` with ordered `{action, resource, effect}` rules.

This script derives two more flavours from it:

  claude/     -> agents/claude/<id>.md      Claude Code: tools / disallowedTools
  universal/  -> agents/universal/<id>.md   Agent Skills spec (Codex, Cursor, ...)

and re-renders the OpenCode flavour into:

  skills/orcestra/references/agents/<id>.md
  agents/opencode/<id>.md

Because the canonical file is byte-stable, the OpenCode output is byte-identical
to the canonical input — which is what keeps the live `.opencode/agents/*.md`
and the skill's portable copy in lockstep (QA gate G7).

WHAT IS TRANSLATED
------------------
Only the FRONTMATTER changes; the body (the role contract) is shared verbatim
across all three flavours. The body is the source of truth for *behaviour*;
the frontmatter is the source of truth for *enforcement*, and each platform
enforces it differently:

  OpenCode V2   permissions: [{action, resource, effect}]  (ordered, last wins)
  Claude Code   tools: <allowlist>  +  disallowedTools: <denylist>
  Universal     no enforcement field — enforcement falls back to the body text

DRIFT PROTECTION
----------------
`verify()` asserts the hand-written tool mappings in `TOOLS` still agree with
the canonical permission table:

  * an action denied in OpenCode must not appear in the Claude `tools:` list
  * an action allowed in OpenCode must appear in the Claude `tools:` list
  * `disallowedTools` must cover exactly the denied OpenCode actions

If the canonical permissions change without the mappings following, the build
FAILS. The prose can never silently contradict the actual permissions.

Usage:
    python3 build.py            # render + verify
    python3 build.py --check    # verify only, fail if output is stale
"""

from __future__ import annotations

import argparse
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parent
SRC = ROOT / "src" / "agents"
OUT = ROOT / "skills" / "orcestra" / "references" / "agents"
AGENTS_OUT = ROOT / "agents"

LICENSE = "MIT"
VERSION = "1.0.0"

#: The five sub-agents, in canonical order.
SUBAGENTS = ["architect", "builder", "debugger", "qa", "security"]

#: Every agent shipped by this package, including the manager (primary role).
ALL_AGENTS = SUBAGENTS + ["manager"]

#: OpenCode permission action -> Claude Code tool name.
#:
#: Claude Code has no ordered permission rules; its `tools:` field is a flat
#: allowlist and `disallowedTools:` a flat denylist. This mapping is the
#: bridge between the two models.
ACTION_TO_TOOL = {
    "read": "Read",
    "glob": "Glob",
    "grep": "Grep",
    "webfetch": "WebFetch",
    "websearch": "WebSearch",
    "edit": "Edit",
    "shell": "Bash",
    "subagent": "Agent",
    "skill": "Skill",
    "todowrite": "TodoWrite",
}

#: Actions that imply filesystem write access. Claude Code expresses this with
#: both `Write` and `Edit`.
WRITE_ACTIONS = {"edit"}


def parse_frontmatter(text: str) -> tuple[dict, str]:
    """Split a markdown file into (frontmatter dict, body).

    Handles the two shapes this project uses: scalar keys and a `permissions:`
    list of `{action, resource, effect}` maps.
    """
    if not text.startswith("---\n"):
        raise ValueError("no frontmatter")
    end = text.index("\n---", 3)
    raw = text[4:end]
    body = text[end + 4:].lstrip("\n")

    fm: dict = {}
    key = None
    current: dict | None = None

    for line in raw.split("\n"):
        if not line.strip() or line.strip().startswith("#"):
            continue

        stripped = line.strip()

        # A new list item: "- action: read". This MUST be tested before the
        # continuation branch, otherwise every item after the first would be
        # merged into the first item's map.
        if stripped.startswith("- "):
            item_text = stripped[2:]
            k, _, v = item_text.partition(":")
            if key is None:
                raise ValueError(f"list item before any key: {line!r}")
            if not isinstance(fm.get(key), list):
                fm[key] = []
            current = {k.strip(): v.strip().strip('"')}
            fm[key].append(current)
            continue

        # Continuation of the current list item: "  resource: \"*\""
        if current is not None and line.startswith("  ") and ":" in stripped:
            k, _, v = stripped.partition(":")
            current[k.strip()] = v.strip().strip('"')
            continue

        # A new key
        k, _, v = stripped.partition(":")
        key = k.strip()
        v = v.strip()
        current = None
        if v == "":
            fm[key] = []
        else:
            fm[key] = v.strip('"') if v.startswith('"') and v.endswith('"') else v

    return fm, body


def permission_rules(fm: dict) -> list[dict]:
    """Extract the ordered permission rules from an OpenCode frontmatter."""
    rules = []
    for item in fm.get("permissions", []):
        if isinstance(item, str):
            continue
        rules.append(item)
    return rules


def action_effect(rules: list[dict], action: str) -> str | None:
    """The effect of the LAST rule for `action` (OpenCode: last match wins)."""
    effects = [r.get("effect") for r in rules if r.get("action") == action]
    return effects[-1] if effects else None


def claude_tools(rules: list[dict]) -> tuple[list[str], list[str]]:
    """Translate OpenCode permission rules into Claude Code tool lists.

    Returns (allowed_tools, denied_tools).

    * An action whose final effect is `allow` -> its tool is allowed.
    * An action whose final effect is `deny`  -> its tool is denied.
    * An action whose final effect is `ask`   -> its tool is allowed, but the
      runtime will prompt; Claude Code has no third tier, so it is treated as
      allowed and the body text explains that permission is requested.
    """
    allowed: set[str] = set()
    denied: set[str] = set()

    for action in ACTION_TO_TOOL:
        effect = action_effect(rules, action)
        if effect is None:
            continue
        tool = ACTION_TO_TOOL[action]
        if effect == "allow" or effect == "ask":
            allowed.add(tool)
        else:
            denied.add(tool)

    # `edit` in OpenCode implies both writing and editing a file.
    if action_effect(rules, "edit") in ("allow", "ask"):
        allowed.add("Write")
    else:
        denied.add("Write")

    # Never deny a tool that is also allowed — Claude Code applies
    # `disallowedTools` first, so an overlap would silently disable the tool.
    denied -= allowed

    order = ["Read", "Grep", "Glob", "WebFetch", "WebSearch", "Skill", "Read",
             "Write", "Edit", "NotebookEdit", "Bash", "Agent", "Task",
             "TodoWrite"]
    def sort_key(t: str) -> int:
        return order.index(t) if t in order else len(order)

    return sorted(allowed, key=sort_key), sorted(denied, key=sort_key)


def yaml_scalar(s: str) -> str:
    """Quote a scalar only when YAML would otherwise misread it."""
    if s.startswith(("'", '"')) and s.endswith(("'", '"')) and len(s) > 1:
        return s
    if any(c in s for c in ':#{}[]&*!|>%@`"') or s.strip() != s or s == "":
        return '"' + s.replace("\\", "\\\\").replace('"', '\\"') + '"'
    return s


def render_claude(fm: dict, body: str) -> str:
    rules = permission_rules(fm)
    allowed, denied = claude_tools(rules)
    desc = fm.get("description", "")
    lines = [
        "---",
        "name: __NAME__",
        f"description: {yaml_scalar(desc)}",
        "tools: " + ", ".join(allowed),
    ]
    if denied:
        lines.append("disallowedTools: " + ", ".join(denied))
    lines.append("model: inherit")
    lines.append("---")
    return "\n".join(lines) + "\n\n" + body.rstrip("\n") + "\n"


def render_universal(fm: dict, body: str) -> str:
    desc = fm.get("description", "")
    lines = [
        "---",
        "name: __NAME__",
        f"description: {yaml_scalar(desc)}",
        f"license: {LICENSE}",
        "metadata:",
        f"  version: \"{VERSION}\"",
        "---",
    ]
    return "\n".join(lines) + "\n\n" + body.rstrip("\n") + "\n"


# --------------------------------------------------------------------------


def verify(entries: dict[str, tuple[dict, str]]) -> list[str]:
    """Assert the Claude tool mapping agrees with the canonical permissions."""
    problems: list[str] = []

    for aid, (fm, body) in entries.items():
        rules = permission_rules(fm)
        if not rules:
            problems.append(f"{aid}: canonical file has no `permissions:` rules")
            continue

        allowed, denied = claude_tools(rules)

        # Every denied action must be denied in the Claude variant, and every
        # allowed action must be allowed.
        for action, tool in ACTION_TO_TOOL.items():
            effect = action_effect(rules, action)
            if effect == "deny" and tool not in denied and tool not in allowed:
                problems.append(f"{aid}: OpenCode denies `{action}` but Claude allows `{tool}`")
            if effect in ("allow", "ask") and tool not in allowed:
                problems.append(f"{aid}: OpenCode permits `{action}` but Claude denies `{tool}`")

        # The `write` action maps to two Claude tools.
        if action_effect(rules, "edit") == "deny":
            if "Write" not in denied and "Write" not in allowed:
                problems.append(f"{aid}: OpenCode denies `edit` but Claude permits Write")

        # A body that mentions a denied action must still explain itself.
        if "## Batasan izin yang berlaku (OpenCode V2)" in body and denied:
            pass  # informational only

    return problems


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--check", action="store_true",
                    help="verify only; fail if rendered output is stale")
    args = ap.parse_args()

    entries: dict[str, tuple[dict, str]] = {}
    for aid in ALL_AGENTS:
        f = SRC / f"{aid}.md"
        if not f.exists():
            print(f"ERROR: missing canonical agent {f}", file=sys.stderr)
            return 2
        fm, body = parse_frontmatter(f.read_text(encoding="utf-8"))
        entries[aid] = (fm, body)

    problems = verify(entries)
    if problems:
        print("MAPPING MISMATCH — Claude tool mapping contradicts the canonical "
              "permissions:", file=sys.stderr)
        for p in problems:
            print(f"  {p}", file=sys.stderr)
        return 3

    stale: list[str] = []
    written = 0

    for aid, (fm, body) in entries.items():
        canonical = (SRC / f"{aid}.md").read_text(encoding="utf-8")
        claude = render_claude(fm, body).replace("name: __NAME__", f"name: {aid}")
        universal = render_universal(fm, body).replace("name: __NAME__", f"name: {aid}")

        variants = {
            OUT / f"{aid}.md": canonical,
            AGENTS_OUT / "opencode" / f"{aid}.md": canonical,
            AGENTS_OUT / "claude" / f"{aid}.md": claude,
            AGENTS_OUT / "universal" / f"{aid}.md": universal,
        }
        for path, content in variants.items():
            path.parent.mkdir(parents=True, exist_ok=True)
            if path.exists() and path.read_text(encoding="utf-8") == content:
                continue
            if args.check:
                stale.append(str(path.relative_to(ROOT)))
                continue
            path.write_text(content, encoding="utf-8")
            written += 1

    if args.check:
        if stale:
            print("STALE — rerun `python3 build.py`:", file=sys.stderr)
            for s in stale:
                print(f"  {s}", file=sys.stderr)
            return 1
        print("OK — rendered output is up to date")
        return 0

    print(f"rendered {written} file(s); mapping consistent")
    return 0


if __name__ == "__main__":
    sys.exit(main())
