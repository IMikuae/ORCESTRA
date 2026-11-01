# AGENTS.md — orcestra

Instruksi ini untuk **AI agent** yang membaca repo ini.

## Kalau user minta "tambahkan orcestra" / "install skill ini"

Ikuti langkah ini, berurutan:

1. **Baca `README.md`** repo ini untuk memahami isi paket.
2. **Jalankan `./install.sh --dry-run`** untuk melihat rencana pemasangan.
3. **Jalankan `./install.sh`** untuk memasang.
4. **Verifikasi** hasilnya (lihat § Verifikasi di bawah).
5. **Laporkan** ke user: platform mana yang dipasang, ke direktori mana, dan
   bagaimana cara memakainya.

Jangan melewati `install.sh` dengan menyalin file manual kecuali `install.sh`
gagal — kalau gagal, laporkan error-nya, jangan menebak.

## Kalau user minta "agent-nya tidak muncul" / "skill-nya tidak ketemu"

Cek berurutan:

1. `opencode debug agents` — 5 sub-agent + manager harus terdaftar
   (untuk OpenCode V2).
2. `opencode api get /api/skill` — `orcestra` harus ada di daftar.
3. Path skill: `.opencode/skills/orcestra/SKILL.md` (OpenCode),
   `.claude/skills/orcestra/SKILL.md` (Claude Code),
   `.agents/skills/orcestra/SKILL.md` (Codex/Cursor/lainnya).
4. Kalau OpenCode tidak menemukan `.opencode/`, pastikan cwd adalah root project
   (OpenCode mencari `.opencode/` dari cwd ke atas, berhenti di root project).

## Kalau user mau mengubah peran agent atau izinnya

1. Edit `src/agents/<peran>.md` (sumber tunggal; frontmatter `permissions:`
   berisi aturan OpenCode V2).
2. Jalankan `python3 build.py` — ia merender varian Claude Code + Universal
   **dan memverifikasi** bahwa terjemahan izinnya masih konsisten.
3. Kalau `build.py` gagal dengan "MAPPING MISMATCH", perbaiki tabel izinnya
   sampai konsisten. Jangan disablesGate verifikasi.
4. Jalankan `python3 build.py --check` untuk memastikan tidak ada output basi.
5. Pasang ulang: `./install.sh`.

## Aturan umum

- `SETUP.md` adalah pintu masuk universal: bila user menyuruh agent apa pun
  memasang orcestra, arahkan ke `SETUP.md`, bukan ke folder per platform.
- Bila menambah dukungan platform baru: tambah baris `PLATFORMS` di
  `install.sh` (+ deteksi bila ada), gate di `verify.mjs` §7, dan baris di
  `README.md` §3. Jangan buat varian agent baru bila platform itu memakai
  `SKILL.md` agentskills.io — cukup skill-only + catatan dispatch-nya.
- **Jangan** mengubah `skills/orcestra/references/catalog.md` atau
  `catalog.index.json` kecuali diminta. Katalog berisi 921 deskripsi skill
  upstream yang sengaja **dipotong elipsis** (`…`) — jangan diluruskan,
  diterjemahkan, atau dilengkapi.
- **Jangan** mengklaim katalog skill bisa dipanggil. Semua entri punya
  `callable: false` — katalog itu blueprint, bukan skill terpasang.
- Paket ini **multi-skill**: `install.sh` memasang semua direktori di
  `skills/` (kecuali yang berawalan `_`). Skill baru = satu direktori
  `skills/<nama-kebab>/` berisi `SKILL.md` (frontmatter `name` = nama
  direktori, `description` 1..1024 char, ≤500 kata / ≤70 baris) + file
  pendukungnya sendiri; jangan menumpang file skill lain lewat path
  relatif antar-skill, karena tiap skill disalin terpisah.
- Skill `orcestra` adalah **orchestrator**: ia menjalankan banyak skill
  terpasang. Bila task butuh skill lain yang ter-install (mis.
  `audit-proyek`), manager memasukkannya ke brief dan papan — jangan
  mengklaim menjalankannya sendiri tanpa bukti.
- `skills/orcestra/` adalah skill Agent Skills (spec `agentskills.io`).
  `SKILL.md` harus tetap punya frontmatter `name` + `description` yang valid,
  dan tetap di bawah batas 500 kata / 70 baris. Hitung kata dengan pemisah
  whitespace ala JS (mis. `node`), bukan `wc -w` di locale POSIX — `wc`
  melewatkan simbol multibyte seperti → dan — sehingga menghitung lebih
  sedikit dari gate `verify.mjs`.
- Semua path di dalam skill relatif terhadap folder skill-nya, supaya paket
  bisa disalin ke mana saja.
- **Jangan** melakukan aksi di host/panel (restart, patch runtime, deploy)
  tanpa `[USER]` yang eksplisit. Laporkan, jangan klaim sudah dilakukan.

## Verifikasi

```bash
opencode debug agents        # daftar agent yang terdeteksi
opencode api get /api/skill  # daftar skill yang terdaftar
bash skills/orcestra/playbooks/scripts/verify-runtime-patching.sh  # hanya bila
                                                                     # sedang menangani
                                                                     # advisory runtime
```

## Struktur repo

| Path | Peran |
|---|---|
| `skills/orcestra/` | skill utama (orchestrator) yang dipasang (Agent Skills spec) |
| `skills/audit-proyek/` | skill audit proyek sekali jalan yang dipasang bersamaan |
| `skills/ui-layout/` | skill bangun layout tanpa celah yang dipasang bersamaan |
| `skills/backend/` | skill bangun API backend yang dipasang bersamaan |
| `skills/deploy/` | skill rilis yang aman yang dipasang bersamaan |
| `skills/testing/` | skill menulis test yang dipasang bersamaan |
| `skills/performance/` | skill ukur & optimalkan performa yang dipasang bersamaan |
| `skills/database/` | skill rancang database yang dipasang bersamaan |
| `skills/hardening/` | skill keraskan keamanan yang dipasang bersamaan |
| `skills/observability/` | skill buat aplikasi terpantau yang dipasang bersamaan |
| `skills/security-audit/` | skill audit keamanan mendalam yang dipasang bersamaan |
| `skills/auth/` | skill bangun autentikasi & otorisasi yang dipasang bersamaan |
| `skills/incident-response/` | skill tangani insiden keamanan yang dipasang bersamaan |
| `skills/theme/` | skill sistem tema yang dipasang bersamaan |
| `skills/forms/` | skill formulir yang dipasang bersamaan |
| `src/agents/` | sumber tunggal definisi agent |
| `agents/{opencode,claude,universal}/` | hasil render `build.py` |
| `build.py` | renderer + verifier pemetaan izin |
| `install.sh` | installer multi-platform |
| `README.md` | dokumentasi untuk manusia |
