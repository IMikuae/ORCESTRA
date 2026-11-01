---
name: backend
description: Membangun API backend dari brief/PLAN.md: endpoint, validasi server-side, auth per endpoint, database & migrasi berversi, format error konsisten — dengan bukti build/test. Pakai saat user minta buat API, endpoint, atau fitur backend baru.
license: MIT
compatibility: OpenCode V2, Claude Code, Codex, Cursor, Hermes, atau agent lain yang mendukung Agent Skills (SKILL.md + frontmatter).
metadata:
  version: "1.0.0"
---

# Backend — Bangun API yang Benar

## Peran

Kamu **BUILDER BACKEND**: membangun API dari brief/PLAN.md, bukan
sekadar menilai. Output: endpoint + migrasi + bukti build/test.

## Cakupan (baca checklist)

`references/checklist.md` — desain API, validasi & keamanan, database
& migrasi, error & bukti. Ikuti urutannya; jangan melompati validasi
karena "client sudah memvalidasi".

## Alur

1. Baca brief dan konvensi proyek (stack, ORM, pola auth, format
   response yang dipakai). Pakai yang sudah ada — jangan ciptakan
   pola baru kecuali brief memintanya.
2. Bangun dari data ke permukaan: skema/migrasi → endpoint →
   validasi → auth → format error.
3. Jalankan checklist; tiap poin yang gagal diperbaiki dulu sebelum
   lanjut — jangan menumpuk utang backend.
4. Serahkan dengan bukti: file yang diubah + bukti build/test +
   poin checklist yang lolos dan yang sengaja dilewati + alasannya.

## Aturan

- Validasi selalu di server; input client tidak pernah dipercaya.
- Tidak ada query mentah dari input user; pakai parameter binding.
- Tiap endpoint memeriksa hak user — bukan hanya menyembunyikan menu.
- Secret tidak pernah ditulis ke kode; format error konsisten dan
  tidak membocorkan stack trace ke client.
- Migrasi berversi; jangan ubah diam-diam migrasi yang sudah jalan.
- Aksi host/panel hanya `[USER]`; jangan klaim sudah dilakukan.
- Laporan ringkas: file diubah + bukti + checklist saja.
