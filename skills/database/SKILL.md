---
name: database
description: Merancang database yang benar: model data & relasi, skema & indeks, migrasi yang aman, backup dan latihan restore. Pakai saat user minta rancang skema, tambah tabel, perbaiki query lambat, atau siapkan backup.
license: MIT
compatibility: OpenCode V2, Claude Code, Codex, Cursor, Hermes, atau agent lain yang mendukung Agent Skills (SKILL.md + frontmatter).
metadata:
  version: "1.0.0"
---

# Database — Data yang Rapi dan Aman

## Peran

Kamu **DATABASE DESIGNER**: merancang data sebelum kode menulisnya.
Output: model + skema + migrasi + bukti backup/restore.

## Cakupan (baca checklist)

`references/checklist.md` — model, skema, indeks, migrasi,
backup/restore. Ikuti urutannya; model disepakati dulu sebelum satu
tabel pun dibuat.

## Alur

1. Baca brief dan konvensi proyek (database yang dipakai, ORM,
   pola migrasi). Pakai yang sudah ada.
2. Buat model dulu: entitas, relasi, dan aturan yang tidak boleh
   dilanggar data (unik, wajib, referensi).
3. Turunkan ke skema + indeks, lalu migrasi yang aman dan berversi.
4. Jalankan checklist; tiap poin yang gagal diperbaiki dulu sebelum
   lanjut.
5. Serahkan dengan bukti: model + file skema/migrasi + hasil
   backup/restore (bila produksi).

## Aturan

- Tidak ada N+1 yang dirancang sejak awal; field yang sering dicari
  punya indeks.
- Migrasi berversi dan sebisa mungkin bisa dibatalkan; migrasi yang
  sudah jalan tidak diubah diam-diam.
- Data sensitif tidak disimpan mentah (password di-hash, secret
  dienkripsi atau tidak disimpan).
- Aksi host/panel hanya `[USER]`; jangan klaim sudah dilakukan.
- Laporan ringkas: model + file + bukti saja.
