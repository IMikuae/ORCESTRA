# SETUP.md — pasang orcestra di agent apa pun

Dokumen ini untuk **agent AI apa pun** (OpenCode, Claude Code, Codex, Cursor,
Hermes, atau lainnya). User cukup bilang: "baca SETUP.md dan pasang orcestra".
Tanpa perlu tahu folder per platform — `install.sh` yang mengurusnya.

## Perintah yang bisa di-paste user

> Baca SETUP.md di repo ini dan pasang skill orcestra. Jalankan install.sh,
> verifikasi hasilnya, lalu laporkan platform mana yang terpasang dan ke
> direktori mana.

## Langkah (untuk agent)

1. Baca `README.md` repo ini untuk memahami isi paket.
2. Jalankan `./install.sh --dry-run` untuk melihat rencana pemasangan.
3. Jalankan `./install.sh` untuk memasang (atau `./install.sh --global` untuk
   semua project, `./install.sh --agent <nama>` untuk satu platform).
4. Verifikasi: `node verify.mjs` harus lolos semua, dan `SKILL.md` skill
   orcestra ada di direktori tujuan.
5. Laporkan ke user: platform mana yang terpasang, ke direktori mana, dan
   cara memakainya ("pakai skill orcestra" atau nama skill lain).

Jangan menyalin file manual kecuali `install.sh` gagal — kalau gagal,
laporkan error-nya, jangan menebak.

## Direktori tujuan

| Platform | Skill (project) | Skill (global) | Sub-agent |
|---|---|---|---|
| OpenCode V2 | `.opencode/skills/<skill>/` | `~/.config/opencode/skills/<skill>/` | `.opencode/agents/` (5 sub-agent) |
| Claude Code | `.claude/skills/<skill>/` | `~/.claude/skills/<skill>/` | `.claude/agents/` (5 sub-agent) |
| Codex / Cursor / lainnya | `.agents/skills/<skill>/` | `~/.agents/skills/<skill>/` | — (skill saja) |
| Hermes | `.hermes/skills/<skill>/` | `~/.hermes/skills/<skill>/` | — (skill saja) |

Pola `<skill>` berlaku untuk tiap skill yang terdaftar; saat ini: `orcestra`,
`audit-proyek`, `ui-layout`, `backend`, `deploy`, `testing`, dan
`performance`. Installer memasang semuanya sekaligus.

## Catatan Hermes

- Hermes memakai format `SKILL.md` agentskills.io yang sama — tanpa konversi.
- Instalasi project (`.hermes/skills/`) baru terbaca bila didaftarkan di
  `skills.external_dirs` pada `config.yaml` Hermes. Instalasi global
  (`~/.hermes/skills/`) langsung terbaca.
- Hermes tidak punya format sub-agent terpisah: peran manager dijalankan
  AI itu sendiri, dan kelima peran tersedia sebagai kontrak di
  `skills/orcestra/references/agents/`. Delegasi antar peran memakai
  `delegate_tool` Hermes, bukan tool Agent ala Claude Code.

## Mode eksekusi skill

Default: **tanya-satu-satu** — tiap kali skill/playbook akan dipakai, tanya
user dengan opsi singkat (jalankan / jelaskan dulu / lewati). User bisa
meminta **mode langsung** ("mode langsung") agar agent mengeksekusi tanpa
tanya, kecuali aksi host/panel yang tetap butuh `[USER]`.
Detail: `skills/orcestra/references/execution-modes.md`.

## Verifikasi per platform

- OpenCode: `opencode debug agents`, `opencode api get /api/skill`.
- Claude Code: sub-agent muncul sebagai `/architect`, `/builder`, dst.
- Codex/Cursor/Hermes: skill terpasang muncul di daftar skill.
- Semua platform: mulai sesi agent baru agar instalasi terbaca.
