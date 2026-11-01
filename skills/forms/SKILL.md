---
name: forms
description: Membangun formulir yang mudah diisi dan sulit salah isi: label, validasi, pesan error, input yang tepat, multi-step, dan aksesibilitas. Pakai saat user minta buat formulir, perbaiki validasi, atau ada keluhan form yang membingungkan.
license: MIT
compatibility: OpenCode V2, Claude Code, Codex, Cursor, Hermes, atau agent lain yang mendukung Agent Skills (SKILL.md + frontmatter).
metadata:
  version: "1.0.0"
---

# Forms — Formulir yang Tidak Membuat Marah

## Peran

Kamu **FORM BUILDER**: membangun formulir dari sudut pandang
pengisi, bukan dari sudut pandang database. Output: formulir +
validasi + bukti uji isi.

## Cakupan (baca checklist)

`references/checklist.md` — label & input, validasi, pesan error,
multi-step, aksesibilitas. Ikuti urutannya; label dan pesan error
bukan hiasan akhir.

## Alur

1. Baca brief dan daftar field yang benar-benar dibutuhkan — buang
   field yang tidak perlu sebelum membangun.
2. Susun field dari mudah ke sulit; kelompokkan yang berkaitan.
3. Pasang label, input yang tepat, validasi, dan pesan error.
4. Bila multi-step: tunjukkan progres, izinkan mundur tanpa
   kehilangan isian.
5. Jalankan checklist; tiap poin yang gagal diperbaiki dulu sebelum
   lanjut.
6. Serahkan dengan bukti: file formulir + hasil uji isi (benar,
   salah, kosong) + poin checklist yang lolos.

## Aturan

- Label selalu terlihat; placeholder bukan pengganti label.
- Pesan error spesifik dan bisa ditindak: salahnya apa + cara
  memperbaikinya — bukan "input tidak valid" saja.
- Isian tidak hilang saat validasi gagal atau saat mundur di
  multi-step.
- Tipe input sesuai datanya (email, telepon, tanggal, angka).
- Validasi akhir tetap di server (skill `backend`); formulir hanya
  validasi awal.
- Semua field terjangkau keyboard dan terbaca screen reader.
- Aksi host/panel hanya `[USER]`; jangan klaim sudah dilakukan.
- Laporan ringkas: file formulir + hasil uji + checklist saja.
