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

- **Jangan** mengubah `skills/orcestra/references/catalog.md` atau
  `catalog.index.json` kecuali diminta. Katalog berisi 921 deskripsi skill
  upstream yang sengaja **dipotong elipsis** (`…`) — jangan diluruskan,
  diterjemahkan, atau dilengkapi.
- **Jangan** mengklaim katalog skill bisa dipanggil. Semua entri punya
  `callable: false` — katalog itu blueprint, bukan skill terpasang.
- `skills/orcestra/` adalah skill Agent Skills (spec `agentskills.io`).
  `SKILL.md` harus tetap punya frontmatter `name` + `description` yang valid,
  dan tetap di bawah batas 500 kata / 70 baris.
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
| `skills/orcestra/` | skill yang dipasang (Agent Skills spec) |
| `src/agents/` | sumber tunggal definisi agent |
| `agents/{opencode,claude,universal}/` | hasil render `build.py` |
| `build.py` | renderer + verifier pemetaan izin |
| `install.sh` | installer multi-platform |
| `README.md` | dokumentasi untuk manusia |
