#!/usr/bin/env bash
#
# verify-runtime-patching.sh — verifier for playbooks/runtime-patching.md §7.
#
# Prints exactly one line per §7 verification row, in §7 order.
# Exit code 0 only when EVERY check passes; non-zero as soon as any row fails.
#
# Usage:  bash playbooks/scripts/verify-runtime-patching.sh
#         (run from the skill root, or from anywhere — the script does not
#          depend on the current working directory)
#
# Scope: READ-ONLY. It never writes, patches, installs or restarts anything.

set -uo pipefail

# --- expectations (keep in sync with runtime-patching.md §2 and §7) ----------
MIN_NODE="v22.23.4"          # Node.js 22.x patched release
PHP_PATCHED="8.2.35 8.3.36 8.4.27 8.5.12"
NODE_BIN="/usr/bin/node"
BIN_MTIME_MIN="2026-10-21"   # security release date of the upstream advisories
MIN_BUN="1.4.4"              # Bun release that carries the Brotli fix

FAILURES=0

ok()   { printf '[PASS] %s\n' "$1"; }
bad()  { printf '[FAIL] %s\n' "$1"; FAILURES=$((FAILURES + 1)); }
skip() { printf '[SKIP] %s\n' "$1"; }

# version_ge <a> <b> — true when a >= b, comparing dotted numeric versions.
# Leading "v" is tolerated on either side.
version_ge() {
  local a="${1#v}" b="${2#v}"
  [ -n "$a" ] && [ -n "$b" ] || return 1
  local first=1
  while [ "$first" -eq 1 ]; do
    first=0
    local ai bi
    ai=$(printf '%s' "$a" | cut -d. -f1)
    bi=$(printf '%s' "$b" | cut -d. -f1)
    [ -z "$ai" ] && ai=0
    [ -z "$bi" ] && bi=0
    if [ "$ai" -gt "$bi" ]; then return 0; fi
    if [ "$ai" -lt "$bi" ]; then return 1; fi
    a=$(printf '%s' "$a" | cut -s -d. -f2-)
    b=$(printf '%s' "$b" | cut -s -d. -f2-)
    if [ -n "$a" ] || [ -n "$b" ]; then first=1; fi
  done
  return 0
}

echo "== runtime-patching §7 verification =="

# --- §7 row 1 — Node.js version -------------------------------------------
NODE_V="$(node -v 2>/dev/null || true)"
if [ -z "$NODE_V" ]; then
  skip "node -v — node not found on PATH"
elif version_ge "$NODE_V" "$MIN_NODE"; then
  ok "node -v — ${NODE_V} (>= ${MIN_NODE})"
else
  bad "node -v — ${NODE_V} (expected >= ${MIN_NODE})"
fi

# --- §7 row 2 — Bun version ------------------------------------------------
BUN_V="$(bun -v 2>/dev/null || true)"
if [ -z "$BUN_V" ]; then
  skip "bun -v — bun not found on PATH"
elif version_ge "$BUN_V" "$MIN_BUN"; then
  ok "bun -v — ${BUN_V} (>= ${MIN_BUN})"
else
  bad "bun -v — ${BUN_V} (expected >= ${MIN_BUN})"
fi

# --- §7 row 3 — PHP version ------------------------------------------------
PHP_V="$(php -v 2>/dev/null | head -1 || true)"
if [ -z "$PHP_V" ]; then
  skip "php -v — php not found on PATH"
else
  PHP_PATCHED_HIT=0
  for v in $PHP_PATCHED; do
    case "$PHP_V" in
      *"PHP $v"*|*"PHP $v-"*|*"PHP $v "*|*"PHP $v."*) PHP_PATCHED_HIT=1 ;;
    esac
  done
  if [ "$PHP_PATCHED_HIT" -eq 1 ]; then
    ok "php -v — ${PHP_V} (patched branch)"
  else
    bad "php -v — ${PHP_V} (expected one of: ${PHP_PATCHED})"
  fi
fi

# --- §7 row 4 — Node.js binary mtime --------------------------------------
if [ ! -e "$NODE_BIN" ]; then
  skip "stat -c '%y' ${NODE_BIN} — binary not present"
else
  BIN_MTIME="$(stat -c '%y' "$NODE_BIN" 2>/dev/null || true)"
  BIN_DATE="$(stat -c '%Y' "$NODE_BIN" 2>/dev/null || true)"
  MIN_EPOCH="$(date -d "$BIN_MTIME_MIN" +%s 2>/dev/null || echo 0)"
  if [ -n "$BIN_DATE" ] && [ "$MIN_EPOCH" -gt 0 ] && [ "$BIN_DATE" -ge "$MIN_EPOCH" ]; then
    ok "stat -c '%y' ${NODE_BIN} — ${BIN_MTIME} (>= ${BIN_MTIME_MIN})"
  else
    bad "stat -c '%y' ${NODE_BIN} — ${BIN_MTIME:-unknown} (expected >= ${BIN_MTIME_MIN})"
  fi
fi

# --- §7 row 5 — every live Node process runs the patched binary ------------
NODE_PIDS="$(pgrep -x node 2>/dev/null || true)"
if [ -z "$NODE_PIDS" ]; then
  skip "node process inventory — no live 'node' process found"
else
  NODE_COUNT="$(printf '%s\n' "$NODE_PIDS" | grep -c '[0-9]' || true)"
  DISK_INODE="$(stat -L -c %i "$NODE_BIN" 2>/dev/null || echo "")"
  DISK_VER="$("$NODE_BIN" -v 2>/dev/null || true)"
  OFF_INODE=0
  STALE_VER=0
  DETAIL=""
  for p in $NODE_PIDS; do
    EXE="$(readlink "/proc/$p/exe" 2>/dev/null || echo "?")"
    INO="$(stat -L -c %i "/proc/$p/exe" 2>/dev/null || echo "?")"
    DETAIL="${DETAIL} pid=${p} exe=${EXE} inode=${INO}; "
    if [ -n "$DISK_INODE" ] && [ "$INO" != "$DISK_INODE" ]; then
      OFF_INODE=$((OFF_INODE + 1))
    fi
  done
  if [ -z "$DISK_VER" ]; then
    bad "node process inventory — ${NODE_COUNT} live node process(es), could not read the version of ${NODE_BIN} (${DETAIL})"
  elif ! version_ge "$DISK_VER" "$MIN_NODE"; then
    STALE_VER=1
  fi
  if [ "$OFF_INODE" -gt 0 ]; then
    bad "node process inventory — ${NODE_COUNT} live node process(es), ${OFF_INODE} run a binary OTHER than the on-disk ${NODE_BIN} (${DETAIL})"
  elif [ "$STALE_VER" -eq 1 ]; then
    bad "node process inventory — ${NODE_COUNT} live node process(es) all on ${NODE_BIN} (inode ${DISK_INODE}), but that binary is ${DISK_VER} (< ${MIN_NODE}) — VULNERABLE (${DETAIL})"
  else
    ok "node process inventory — ${NODE_COUNT} live node process(es) all on ${NODE_BIN} (inode ${DISK_INODE}, version ${DISK_VER}) — patched (${DETAIL})"
  fi
fi

# --- §7 row 6 — process start time newer than the patched binary -----------
if [ -z "$NODE_PIDS" ]; then
  skip "process start time vs binary mtime — no live 'node' process found"
elif [ ! -e "$NODE_BIN" ]; then
  skip "process start time vs binary mtime — binary not present"
else
  BIN_EPOCH="$(stat -c %Y "$NODE_BIN" 2>/dev/null || echo 0)"
  MIN_EPOCH="$(date -d "$BIN_MTIME_MIN" +%s 2>/dev/null || echo 0)"
  BIN_PATCHED=0
  if [ "$MIN_EPOCH" -gt 0 ] && [ "$BIN_EPOCH" -ge "$MIN_EPOCH" ]; then
    BIN_PATCHED=1
  fi
  STALE_PROCS=0
  DETAIL=""
  for p in $NODE_PIDS; do
    START_ISO="$(ps -o lstart= -p "$p" 2>/dev/null | sed 's/^ *//' || true)"
    START_EPOCH="$(date -d "$START_ISO" +%s 2>/dev/null || echo 0)"
    DETAIL="${DETAIL} pid=${p} start='${START_ISO}'; "
    if [ "$START_EPOCH" -lt "$BIN_EPOCH" ]; then
      STALE_PROCS=$((STALE_PROCS + 1))
    fi
  done
  if [ "$BIN_PATCHED" -eq 1 ] && [ "$STALE_PROCS" -eq 0 ]; then
    ok "process start time vs binary mtime — every live node process started after the patched binary was installed (${DETAIL})"
  elif [ "$BIN_PATCHED" -eq 0 ]; then
    bad "process start time vs binary mtime — on-disk binary was never patched (mtime < ${BIN_MTIME_MIN}), so 'started after the patch' is unproven (${DETAIL})"
  else
    bad "process start time vs binary mtime — ${STALE_PROCS} process(es) started BEFORE the binary was patched (${DETAIL})"
  fi
fi

# --- §7 row 7 — PHP upload_progress trigger --------------------------------
UP="$(php -i 2>/dev/null | grep -i 'upload_progress.enabled' | head -1 || true)"
if [ -z "$UP" ]; then
  skip "php -i | grep -i upload_progress — php not available"
elif printf '%s' "$UP" | grep -qiE 'upload_progress\.enabled[[:space:]]*=>[[:space:]]*Off'; then
  ok "php -i | grep -i upload_progress — upload_progress disabled"
else
  bad "php -i | grep -i upload_progress — upload_progress still enabled (${UP})"
fi

# --- summary ---------------------------------------------------------------
if [ "$FAILURES" -eq 0 ]; then
  echo "RESULT: PASS — all §7 checks green"
  exit 0
fi
echo "RESULT: FAIL — ${FAILURES} §7 check(s) failed"
exit 1
