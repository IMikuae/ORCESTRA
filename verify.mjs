#!/usr/bin/env node
/**
 * verify.mjs — self-check untuk paket orcestra.
 *
 * Dipakai setelah `git clone` untuk memastikan paket masih utuh sebelum
 * dipasang. Tidak menulis apa pun ke filesystem (read-only).
 *
 *   node verify.mjs
 *
 * Exit 0 = semua pemeriksaan lolos.
 */

import fs from "node:fs";
import path from "node:path";
import crypto from "node:crypto";
import { execFileSync } from "node:child_process";
import { fileURLToPath } from "node:url";

const ROOT = path.dirname(fileURLToPath(import.meta.url));
const SKILL = path.join(ROOT, "skills/orcestra");
const SRC = path.join(ROOT, "src/agents");
const AGENTS = path.join(ROOT, "agents");

const NAMES = ["architect", "builder", "debugger", "qa", "security"];
const ALL = [...NAMES, "manager"];

let pass = 0;
let fail = 0;

function check(ok, label, detail = "") {
  if (ok) {
    pass++;
    console.log(`  [PASS] ${label}`);
  } else {
    fail++;
    console.log(`  [FAIL] ${label}${detail ? ` — ${detail}` : ""}`);
  }
}

function read(p) {
  // Normalisasi CRLF: checkout Windows tidak boleh membuat self-check gagal.
  return fs.readFileSync(p, "utf8").replace(/\r\n/g, "\n");
}

function sha(p) {
  return crypto.createHash("sha256").update(fs.readFileSync(p)).digest("hex");
}

function exists(p) {
  return fs.existsSync(p);
}

// --------------------------------------------------------------- 1. skill

console.log("\n=== 1. Skill (Agent Skills spec) ===");

const skillMd = path.join(SKILL, "SKILL.md");
check(exists(skillMd), "SKILL.md ada", skillMd);

if (exists(skillMd)) {
  const raw = read(skillMd);
  check(raw.startsWith("---\n"), "SKILL.md punya frontmatter YAML");

  const end = raw.indexOf("\n---", 3);
  const fm = raw.slice(4, end);
  const body = raw.slice(end + 4);

  const nameM = fm.match(/^name:\s*(.+)$/m);
  const descM = fm.match(/^description:\s*(.+)$/m);

  check(!!nameM, "frontmatter punya `name`");
  if (nameM) {
    const n = nameM[1].trim();
    check(/^[a-z0-9]+(-[a-z0-9]+)*$/.test(n),
      "`name` adalah kebab-case lowercase (spec agentskills.io)", `name=${n}`);
    check(n === "orcestra", "`name` cocok dengan nama folder skill", `name=${n}`);
  }

  check(!!descM, "frontmatter punya `description`");
  if (descM) {
    const d = descM[1].trim();
    check(d.length > 0 && d.length <= 1024,
      "`description` 1..1024 char (batas spec)", `len=${d.length}`);
    const low = d.toLowerCase();
    check(/orkestrat|katalog|catalog|cve|advisory/.test(low),
      "`description` memuat kata pemicu");
  }

  const words = raw.split(/\s+/).filter(Boolean).length;
  const lines = raw.split("\n").length - (raw.endsWith("\n") ? 1 : 0);
  check(words <= 500, "SKILL.md <= 500 kata", `actual=${words}`);
  check(lines <= 70, "SKILL.md <= 70 baris", `actual=${lines}`);

  // Tidak boleh ada field V1 OpenCode di SKILL.md
  check(!/^\s*(tools|temperature|prompt|permission|maxSteps|variant|model)\s*:/m.test(fm),
    "SKILL.md tidak memakai field V1 OpenCode");
}

// ------------------------------------------------------- 2. agent variants

console.log("\n=== 2. Varian agent ===");

for (const variant of ["opencode", "claude", "universal"]) {
  const d = path.join(AGENTS, variant);
  check(exists(d), `agents/${variant}/ ada`);
  if (!exists(d)) continue;

  for (const n of ALL) {
    const f = path.join(d, `${n}.md`);
    check(exists(f), `agents/${variant}/${n}.md ada`);
    if (!exists(f)) continue;

    const raw = read(f);
    check(raw.startsWith("---\n"), `agents/${variant}/${n}.md punya frontmatter`);

    const end = raw.indexOf("\n---", 3);
    const fm = raw.slice(4, end);
    const body = raw.slice(end + 4);

    if (variant === "opencode") {
      // V2-native: permissions ordered rules, no V1 fields, no `name:`
      check(/^mode:\s*(primary|subagent)\s*$/m.test(fm),
        `agents/${variant}/${n}.md punya mode`);
      check(/^permissions:\s*$/m.test(fm),
        `agents/${variant}/${n}.md punya permissions`);
      check(!/^\s*(tools|temperature|prompt|permission|maxSteps|name|variant|model)\s*:/m.test(fm),
        `agents/${variant}/${n}.md bebas field V1`);
      const rules = fm.match(/^ {2}- action: /gm) || [];
      check(rules.length > 0, `agents/${variant}/${n}.md punya rule izin`,
        `rules=${rules.length}`);
      // every rule must have resource + effect
      const blocks = fm.split(/^ {2}- /m).slice(1);
      const bad = blocks.filter((b) => !/^action:/.test(b) || !/^ {4}resource:/m.test(b)
        || !/^ {4}effect:/m.test(b));
      check(bad.length === 0,
        `agents/${variant}/${n}.md tiap rule punya action/resource/effect`,
        `bad=${bad.length}`);
    }

    if (variant === "claude") {
      check(/^name:\s*/m.test(fm), `agents/${variant}/${n}.md punya name`);
      check(/^tools:\s*\S/m.test(fm), `agents/${variant}/${n}.md punya tools`);
      check(!/^permissions:/m.test(fm),
        `agents/${variant}/${n}.md tidak punya permissions (format Claude)`);
      check(!/^mode:/m.test(fm),
        `agents/${variant}/${n}.md tidak punya mode (format Claude)`);
    }

    if (variant === "universal") {
      check(/^name:\s*/m.test(fm), `agents/${variant}/${n}.md punya name`);
      check(/^license:\s*/m.test(fm), `agents/${variant}/${n}.md punya license`);
      check(!/^permissions:/m.test(fm) && !/^tools:/m.test(fm),
        `agents/${variant}/${n}.md bebas field khusus platform`);
    }

    // no model pinning anywhere
    check(!/^\s*model:\s*(?!inherit)\S/m.test(fm),
      `agents/${variant}/${n}.md tidak pin model`);
  }
}

// ------------------------------------------------- 3. parity with sources

console.log("\n=== 3. Paritas dengan sumber ===");

for (const n of ALL) {
  const s = path.join(SRC, `${n}.md`);
  const o = path.join(AGENTS, "opencode", `${n}.md`);
  const ref = path.join(SKILL, "references/agents", `${n}.md`);
  if (!exists(s)) { check(false, `src/agents/${n}.md ada`); continue; }
  check(exists(o) && sha(s) === sha(o),
    `agents/opencode/${n}.md identik dengan src/agents/${n}.md`);
  check(exists(ref) && sha(s) === sha(ref),
    `skill references/agents/${n}.md identik dengan src/agents/${n}.md`);
}

// ------------------------------------------- 4. skill tree integrity

console.log("\n=== 4. Integritas isi skill ===");

const REQUIRED = [
  "SKILL.md",
  "references/capabilities.md",
  "references/catalog.md",
  "references/catalog.index.json",
  "references/workflow.md",
  "references/TASKS-template.md",
  "references/agents/README.md",
  "playbooks/README.md",
  "playbooks/_TEMPLATE.md",
];
for (const rel of REQUIRED) {
  check(exists(path.join(SKILL, rel)), `skill berisi ${rel}`);
}

// katalog: 921 baris
const catMd = path.join(SKILL, "references/catalog.md");
if (exists(catMd)) {
  const rows = (read(catMd).match(/^\| `[^`]+` \|/gm) || []).length;
  check(rows === 921, "catalog.md berisi 921 baris skill", `actual=${rows}`);
}
const catJson = path.join(SKILL, "references/catalog.index.json");
if (exists(catJson)) {
  try {
    const idx = JSON.parse(read(catJson));
    const n = Object.keys(idx.skills || {}).length;
    check(n === 921, "catalog.index.json berisi 921 skill", `actual=${n}`);
    const callable = Object.values(idx.skills || {}).filter((s) => s.callable === true).length;
    check(callable === 0, "tidak ada skill katalog yang ditandai callable", `callable=${callable}`);
  } catch (e) {
    check(false, "catalog.index.json valid JSON", String(e.message).slice(0, 120));
  }
}

// relative links resolve
{
  const dangling = [];
  const walk = (d) => {
    for (const f of fs.readdirSync(d)) {
      const p = path.join(d, f);
      if (fs.statSync(p).isDirectory()) walk(p);
      else if (f.endsWith(".md")) {
        const t = read(p);
        for (const m of t.matchAll(/\[[^\]]*\]\(([^)\s]+)\)/g)) {
          const tgt = m[1];
          if (/^(https?:|mailto:|#)/i.test(tgt)) continue;
          const r = path.resolve(path.dirname(p), tgt.split("#")[0]);
          if (!fs.existsSync(r)) dangling.push(`${path.relative(SKILL, p)} -> ${tgt}`);
        }
      }
    }
  };
  walk(SKILL);
  check(dangling.length === 0, "semua link relatif di dalam skill resolve",
    dangling.slice(0, 5).join(" | "));
}

// no absolute paths from the build machine
{
  const hits = [];
  const walk = (d) => {
    for (const f of fs.readdirSync(d)) {
      const p = path.join(d, f);
      if (fs.statSync(p).isDirectory()) walk(p);
      else if (/\.(md|json|sh|py|mjs)$/.test(f)) {
        const t = read(p);
        if (t.includes(ROOT)) hits.push(path.relative(ROOT, p));
      }
    }
  };
  walk(ROOT);
  check(hits.length === 0, "tidak ada path absolut mesin-build di dalam paket",
    hits.slice(0, 5).join(", "));
}

// --------------------------------------------------- 5. installer + build

console.log("\n=== 5. Installer & build ===");

check(exists(path.join(ROOT, "install.sh")), "install.sh ada");
check(exists(path.join(ROOT, "build.py")), "build.py ada");
check(exists(path.join(ROOT, "README.md")), "README.md ada");
check(exists(path.join(ROOT, "AGENTS.md")), "AGENTS.md ada");
check(exists(path.join(ROOT, "LICENSE")), "LICENSE ada");

{
  const sh = path.join(ROOT, "install.sh");
  if (exists(sh)) {
    const winBash = [
      path.join(process.env.ProgramFiles || "C:\\Program Files", "Git", "bin", "bash.exe"),
      path.join(process.env["ProgramFiles(x86)"] || "C:\\Program Files (x86)", "Git", "bin", "bash.exe"),
      path.join(process.env.LOCALAPPDATA || "", "Programs", "Git", "bin", "bash.exe"),
    ].find(exists);
    const bash = process.platform === "win32" ? winBash : "bash";

    if (bash) {
      try {
        execFileSync(bash, ["-n", sh], { encoding: "utf8" });
        check(true, "install.sh lolos syntax check");
      } catch (err) {
        check(false, "install.sh lolos syntax check", String(err.message || err).split("\n")[0]);
      }
    } else {
      console.log("  [SKIP] install.sh syntax check (bash tidak tersedia di PATH)");
    }

    if (process.platform === "win32") {
      console.log("  [SKIP] mode executable (tidak berlaku di Windows; Git menyimpan mode file)");
    } else {
      const mode = fs.statSync(sh).mode;
      check((mode & 0o111) !== 0, "install.sh executable", `mode=${(mode & 0o777).toString(8)}`);
    }
  }
}

// --------------------------------------------------- 6. npx skills compat

console.log("\n=== 6. Kompatibilitas `npx skills` ===");

// CLI `skills` mencari `skills/<nama>/SKILL.md` di root repo.
check(exists(path.join(ROOT, "skills/orcestra/SKILL.md")),
  "skills/orcestra/SKILL.md di root repo (pola discovery `npx skills add`)");
{
  const dirs = fs.readdirSync(path.join(ROOT, "skills"));
  check(dirs.length === 1 && dirs[0] === "orcestra",
    "hanya satu skill yang dikunci (tidak ada katalog 921 ikut ter-install)",
    `dirs=${dirs.join(",")}`);
}

console.log(`\n================ RINGKASAN ================`);
console.log(`PASS: ${pass}   FAIL: ${fail}`);
console.log(fail === 0 ? "RESULT: OK — paket utuh." : "RESULT: GAGAL — paket rusak.");
process.exit(fail === 0 ? 0 : 1);
