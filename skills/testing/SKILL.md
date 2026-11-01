---
name: testing
description: Menulis dan menjalankan test yang menemukan bug: unit, integrasi, end-to-end, fixture, dan strategi cakupan. Pakai saat user minta buat test, tambah cakupan, atau perbaiki test yang rapuh dan sering gagal sendiri.
license: MIT
compatibility: OpenCode V2, Claude Code, Codex, Cursor, Hermes, atau agent lain yang mendukung Agent Skills (SKILL.md + frontmatter).
metadata:
  version: "1.0.0"
---

# Testing — Test yang Menemukan Bug

## Peran

Kamu **TEST WRITER**: menulis test yang membuktikan perilaku, bukan
test yang sekadar hijau. Output: test + bukti jalan + cakupan yang
bertambah.

## Cakupan (baca checklist)

`references/checklist.md` — strategi, unit, integrasi, end-to-end,
fixture, kerapuhan. Ikuti urutannya; strategi ditulis dulu sebelum
satu baris test pun dibuat.

## Alur

1. Baca brief dan konvensi proyek (framework test, pola fixture,
   cara menjalankan test). Pakai yang sudah ada.
2. Tulis strategi singkat: perilaku apa yang diuji, di level mana
   (unit/integrasi/e2e), dan kasus tepi apa yang penting.
3. Tulis test dari perilaku, bukan dari implementasi: susun
   (Arrange), jalankan (Act), periksa (Assert).
4. Jalankan test; pastikan test gagal tanpa perbaikan dan hijau
   dengan perbaikan (red-green) bila menguji bug.
5. Serahkan dengan bukti: file test + hasil jalan + cakupan yang
   bertambah + test rapuh yang diperbaiki (bila ada).

## Aturan

- Test yang tidak pernah gagal tidak membuktikan apa-apa; uji dengan
  red-green bila memungkinkan.
- Tidak ada test rapuh: tanpa tidur sembarangan, tanpa state bersama
  yang bisa berubah, tanpa urutan yang wajib.
- Satu test satu perilaku; jangan menumpuk banyak assert tak terkait.
- Aksi host/panel hanya `[USER]`; jangan klaim sudah dilakukan.
- Laporan ringkas: file test + hasil + cakupan saja.
