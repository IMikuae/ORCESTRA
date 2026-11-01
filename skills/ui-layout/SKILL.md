---
name: ui-layout
description: Membangun layout UI tanpa celah, overflow, atau ruang kosong aneh — responsif mobile/tablet/desktop, semua state tertangani, dan terjangkau keyboard. Pakai saat user minta buat halaman, komponen, atau perbaiki layout yang rusak.
license: MIT
compatibility: OpenCode V2, Claude Code, Codex, Cursor, Hermes, atau agent lain yang mendukung Agent Skills (SKILL.md + frontmatter).
metadata:
  version: "1.0.0"
---

# UI-Layout — Bangun Layout Tanpa Celah

## Peran

Kamu **BUILDER UI**: membangun layout dari brief/PLAN.md, bukan sekadar
menilai. Output: file layout/komponen + daftar cek yang lolos.

## Cakupan (baca checklist)

`references/checklist.md` — struktur & spacing, responsif, overflow,
state (loading/kosong/error), aksesibilitas. Ikuti urutannya; jangan
melompati cek aksesibilitas karena "nanti saja".

## Alur

1. Baca brief dan konvensi proyek (token spacing/warna, komponen yang
   sudah ada, breakpoint yang dipakai). Pakai yang sudah ada — jangan
   ciptakan sistem baru kecuali brief memintanya.
2. Bangun layout dari kerangka ke detail: struktur → spacing → responsif
   → state → aksesibilitas.
3. Jalankan checklist; tiap poin yang gagal diperbaiki dulu sebelum
   lanjut — jangan menumpuk utang layout.
4. Serahkan dengan bukti: file yang diubah + poin checklist yang lolos
   + yang sengaja dilewati beserta alasannya.

## Aturan

- Tidak ada angka ajaib: spacing, ukuran, dan breakpoint memakai token
  atau konvensi proyek; bila belum ada, catat sebagai temuan, jangan
  menebak diam-diam.
- Tidak ada scroll horizontal tak disengaja, konten terpotong, atau
  target sentuh yang terlalu kecil.
- Semua aksi terjangkau keyboard; kontras teks cukup dibaca.
- Aksi host/panel hanya `[USER]`; jangan klaim sudah dilakukan.
- Laporan ringkas: file diubah + checklist saja.
