#!/usr/bin/env bash
#
# install.sh — pasang skill `orcestra` ke agent coding di project atau home.
#
# Paket ini berisi SATU skill (`skills/orcestra/`) dan TIGA varian definisi
# sub-agent (`agents/opencode`, `agents/claude`, `agents/universal`).
# Installer menyalin skill ke semua direktori skill yang dibaca agent, lalu
# menyalin varian agent yang cocok ke direktori agent masing-masing.
#
# Pemakaian:
#   ./install.sh                       # deteksi platform, pasang ke project ini
#   ./install.sh --global              # pasang ke home dir (semua project)
#   ./install.sh --target /path/proj   # pasang ke project lain
#   ./install.sh --agent opencode claude-code
#   ./install.sh --dry-run             # rencana saja, tidak menulis
#   ./install.sh --uninstall           # copot dari project ini
#
set -euo pipefail

SELF_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
SKILL_ID="orcestra"
SKILL_SRC="$SELF_DIR/skills/$SKILL_ID"

TARGET="$PWD"
GLOBAL=0
DRY_RUN=0
UNINSTALL=0
AGENTS=()

# ---------------------------------------------------------------- argumen

usage() {
  sed -n '3,18p' "${BASH_SOURCE[0]}" | sed 's/^# \{0,1\}//'
  exit "${1:-0}"
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    -h|--help)   usage 0 ;;
    --global|-g) GLOBAL=1; shift ;;
    --dry-run|-n) DRY_RUN=1; shift ;;
    --uninstall) UNINSTALL=1; shift ;;
    --target)    TARGET="${2:?--target butuh path}"; shift 2 ;;
    --target=*)  TARGET="${1#*=}"; shift ;;
    --agent)     shift; while [[ $# -gt 0 && "$1" != --* ]]; do AGENTS+=("$1"); shift; done ;;
    --agent=*)   AGENTS+=("${1#*=}"); shift ;;
    *) echo "argumen tidak dikenal: $1" >&2; usage 1 ;;
  esac
done

[[ -d "$SKILL_SRC" ]] || { echo "ERROR: skill tidak ditemukan: $SKILL_SRC" >&2; exit 1; }

# ---------------------------------------------------------------- self-check
#
# Pastikan paket utuh sebelum menulis apa pun. Kalau skill-nya rusak (mis.
# clone terputus), lebih baik gagal di sini daripada memasang separuh.
if [[ $UNINSTALL -eq 0 && $DRY_RUN -eq 0 && -f "$SELF_DIR/verify.mjs" ]] && command -v node >/dev/null 2>&1; then
  if ! node "$SELF_DIR/verify.mjs" >/dev/null 2>&1; then
    echo "ERROR: paket tidak lolos self-check (node verify.mjs)." >&2
    echo "       Jalankan 'node verify.mjs' untuk melihat detailnya." >&2
    exit 1
  fi
  echo "self-check: OK"
fi

# ---------------------------------------------------------------- platform
#
# Setiap entri: nama|dir_skill_project|dir_skill_global|dir_agent_project|dir_agent_global|file_agent_variant
#
# `dir_agent_*` kosong bila platform itu tidak punya format sub-agent terpisah.
#
PLATFORMS=(
  "opencode|.opencode/skills|$HOME/.config/opencode/skills|.opencode/agents|$HOME/.config/opencode/agents|opencode"
  "claude-code|.claude/skills|$HOME/.claude/skills|.claude/agents|$HOME/.claude/agents|claude"
  "universal|.agents/skills|$HOME/.agents/skills||"
)

# --------------------------------------------------- deteksi platform

detect_agents() {
  local found=()
  local d
  for d in "$HOME/.config/opencode" "$HOME/.opencode" "$HOME/.claude" "$HOME/.codex" "$HOME/.cursor"; do
    [[ -d "$d" ]] && found+=("1")
  done
  # opencode
  command -v opencode >/dev/null 2>&1 && found+=("1")
  # claude code
  command -v claude >/dev/null 2>&1 && found+=("1")
  # codex
  command -v codex >/dev/null 2>&1 && found+=("1")
  # cursor
  command -v cursor >/dev/null 2>&1 && found+=("1")
  (( ${#found[@]} > 0 )) || return 1
  return 0
}

if [[ ${#AGENTS[@]} -eq 0 ]]; then
  if detect_agents; then
    # Ada minimal satu agent di host ini.
    #
    # Default: pasang ke SEMUA direktori skill. Alasannya — ketiga direktori
    # itu dibaca agent yang berbeda, dan isi salinannya identik, jadi tidak
    # ada konflik. Ini yang membuat "clone lalu suruh add" langsung jalan
    # tanpa perlu tahu agent mana yang dipakai.
    AGENTS=(opencode claude-code universal)
  else
    echo "Tidak menemukan agent di host ini — memasang ke semua direktori tetap aman." >&2
    AGENTS=(opencode claude-code universal)
  fi
fi

# ---------------------------------------------------------------- helper

info()  { printf '  %s\n' "$*"; }
step()  { printf '\n%s\n' "$*"; }
warn()  { printf 'PERINGATAN: %s\n' "$*" >&2; }
die()   { printf 'ERROR: %s\n' "$*" >&2; exit 1; }

copy_tree() {
  # copy_tree <src> <dst>
  local src="$1" dst="$2"
  mkdir -p "$dst"
  # rsync bila ada (hapus file$yatim), fallback cp -a
  if command -v rsync >/dev/null 2>&1; then
    rsync -a --delete "$src/" "$dst/"
  else
    rm -rf "${dst:?}/"* 2>/dev/null || true
    cp -a "$src/." "$dst/"
  fi
}

copy_files() {
  # copy_files <src_dir> <dst_dir>
  #
  # Hanya 5 SUB-AGENT yang di-install ke direktori agent. `manager.md` adalah
  # peran **primary** (orchestrator) — bukan sub-agent. Menyalinnya ke
  # `.opencode/agents/` akan menambah agent kedua yang bisa menerima task dan
  # berbalik memanggil agent lain, dan membuat direktori agent berisi 6 file
  # alih-alih 5. Kontrak peran manager tersimpan di dalam skill (folder
  # `references/agents/`) — lihat `references/agents/README.md`.
  local src="$1" dst="$2"
  mkdir -p "$dst"
  local f
  for f in architect builder debugger qa security; do
    [[ -f "$src/$f.md" ]] && cp -a "$src/$f.md" "$dst/$f.md"
  done
}

remove_tree() {
  local d="$1"
  [[ -d "$d" ]] || return 0
  rm -rf "$d"
  info "dihapus: $d"
}

remove_files() {
  # remove_files <src_dir> <dst_dir>
  #
  # Hanya 5 sub-agent yang dicopot — `manager.md` tidak pernah di-install.
  local src="$1" dst="$2"
  [[ -d "$dst" ]] || return 0
  local f
  for f in architect builder debugger qa security; do
    [[ -f "$src/$f.md" ]] || continue
    rm -f "$dst/$f.md"
    info "dihapus: $dst/$f.md"
  done
}

# ---------------------------------------------------------------- aksi

action="PASANG"
[[ $UNINSTALL -eq 1 ]] && action="COPOT"

step "orcestra installer — $action"
info "sumber skill : $SKILL_SRC"
info "tujuan       : $TARGET$([ "$GLOBAL" -eq 1 ] && echo ' (global)')"
info "platform      : ${AGENTS[*]}"
[[ $DRY_RUN -eq 1 ]] && info "MODE DRY-RUN — tidak ada file yang ditulis"

for entry in "${PLATFORMS[@]}"; do
  IFS='|' read -r name skill_proj skill_glob agent_proj agent_glob variant <<< "$entry"

  # hanya platform yang diminta
  wanted=0
  for a in "${AGENTS[@]}"; do [[ "$a" == "$name" ]] && wanted=1; done
  [[ $wanted -eq 1 ]] || continue

  # Codex/Cursor memakai nama "universal" di CLI resmi; terima juga alias.
  case "$name" in
    universal)
      for a in "${AGENTS[@]}"; do
        case "$a" in
          codex|cursor|agents|gemini|cline|zed|warp) wanted=1 ;;
        esac
      done
      ;;
  esac

  step "── $name ──"

  if [[ $GLOBAL -eq 1 ]]; then
    skill_dst="$skill_glob/$SKILL_ID"
    agent_dst="$agent_glob"
  else
    skill_dst="$TARGET/$skill_proj/$SKILL_ID"
    agent_dst="$TARGET/$agent_proj"
  fi

  # --- skill ---
  if [[ $UNINSTALL -eq 1 ]]; then
    info "skill   : $skill_dst"
    if [[ $DRY_RUN -eq 0 ]]; then remove_tree "$skill_dst"; fi
  else
    info "skill   : $skill_dst"
    if [[ $DRY_RUN -eq 0 ]]; then
      copy_tree "$SKILL_SRC" "$skill_dst"
    fi
  fi

  # --- sub-agent ---
  if [[ -n "$variant" && -n "$agent_proj" ]]; then
    src_agents="$SELF_DIR/agents/$variant"
    if [[ $UNINSTALL -eq 1 ]]; then
      if [[ $DRY_RUN -eq 0 ]]; then remove_files "$src_agents" "$agent_dst"; fi
    else
      info "sub-agent: $agent_dst  (varian: $variant)"
      if [[ $DRY_RUN -eq 0 ]]; then
        copy_files "$src_agents" "$agent_dst"
      fi
    fi
  else
    info "sub-agent: (tidak ada format sub-agent untuk $name — skill saja)"
  fi
done

# ---------------------------------------------------------------- verifikasi

step "Verifikasi"
if [[ $UNINSTALL -eq 1 ]]; then
  info "selesai — skill orcestra dicopot dari $TARGET"
  exit 0
fi

fail=0

if [[ $DRY_RUN -eq 1 ]]; then
  info "dry-run: lewati verifikasi file"
else
  for entry in "${PLATFORMS[@]}"; do
    IFS='|' read -r name skill_proj skill_glob agent_proj agent_glob variant <<< "$entry"
    wanted=0
    for a in "${AGENTS[@]}"; do [[ "$a" == "$name" ]] && wanted=1; done
    [[ $wanted -eq 1 ]] || continue
    if [[ $GLOBAL -eq 1 ]]; then
      skill_dst="$skill_glob/$SKILL_ID"
      agent_dst="$agent_glob"
    else
      skill_dst="$TARGET/$skill_proj/$SKILL_ID"
      agent_dst="$TARGET/$agent_proj"
    fi
    if [[ -f "$skill_dst/SKILL.md" ]]; then
      info "OK  $skill_dst/SKILL.md"
    else
      warn "HILANG $skill_dst/SKILL.md"
      fail=1
    fi
    if [[ -n "$variant" && -n "$agent_proj" ]]; then
      # Harus tepat 5 sub-agent (manager primary TIDAK ikut ter-install).
      n=0
      for f in architect builder debugger qa security; do
        [[ -f "$agent_dst/$f.md" ]] && n=$((n + 1))
      done
      if [[ "$n" -eq 5 ]]; then
        info "OK  $agent_dst (5 sub-agent terpasang)"
      else
        warn "HILANG $agent_dst — hanya $n/5 sub-agent terpasang"
        fail=1
      fi
    fi
  done
fi

if command -v opencode >/dev/null 2>&1 && [[ $DRY_RUN -eq 0 ]]; then
  info "cek dengan OpenCode:"
  info "  opencode debug agents"
  info "  opencode api get /api/skill"
fi

step "Selesai."
info "Mulai sesi agent baru agar skill & sub-agent terbaca."
info "Lalu panggil: 'pakai skill orcestra' atau '@orcestra' (OpenCode)."

exit "$fail"
