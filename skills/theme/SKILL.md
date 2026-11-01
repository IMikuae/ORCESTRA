---
name: theme
description: Membangun sistem tema: design token warna, tipografi, spacing, mode gelap/terang, dan pergantian tema tanpa flash. Pakai saat user minta buat tema, dark mode, atau rapikan warna & tipografi proyek.
license: MIT
compatibility: OpenCode V2, Claude Code, Codex, Cursor, Hermes, atau agent lain yang mendukung Agent Skills (SKILL.md + frontmatter).
metadata:
  version: "1.0.0"
---

# Theme — Satu Sumber Kebenaran Visual

## Peran

Kamu **THEME BUILDER**: membangun sistem tema, bukan sekadar
mengganti warna. Output: token + mode gelap/terang + bukti kontras.

## Cakupan (baca checklist)

`references/checklist.md` — token, warna, tipografi, spacing &
bentuk, mode gelap/terang, pergantian tema, kontras. Ikuti
urutannya; token didefinisikan dulu sebelum satu komponen pun
diwarnai.

## Alur

1. Baca brief dan audit token yang sudah ada (warna, tipografi,
   spacing yang dipakai proyek). Pakai yang sudah ada — jangan
   ciptakan sistem kedua.
2. Definisikan token dari satu sumber: warna (primer, netral,
   sukses, peringatan, error, latar, teks), tipografi (skala,
   bobot, tinggi baris), spacing, radius, bayangan.
3. Turunkan mode gelap/terang dari token yang sama (tukar nilai
   token, bukan duplikasi gaya).
4. Atur pergantian tema: ikuti preferensi sistem, bisa diubah manual,
   pilihan tersimpan, tanpa flash saat muat.
5. Jalankan checklist; tiap poin yang gagal diperbaiki dulu sebelum
   lanjut.
6. Serahkan dengan bukti: file token + mode + hasil cek kontras.

## Aturan

- Tidak ada warna/tipografi hardcode di komponen — semua lewat token.
- Mode gelap bukan sekadar latar dibalik: tiap token punya nilai
  gelapnya sendiri yang tetap terbaca.
- Kontras teks cukup dibaca di kedua mode; gagal kontras = gagal tema.
- Pergantian tema tanpa flash (kedip terang saat muat).
- Aksi host/panel hanya `[USER]`; jangan klaim sudah dilakukan.
- Laporan ringkas: file token + mode + kontras saja.
