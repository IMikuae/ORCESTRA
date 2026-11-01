---
name: performance
description: Mengukur dan mengoptimalkan performa: baseline, bottleneck, optimasi bertahap, dan bukti perbandingan sebelum-sesudah. Pakai saat user minta percepat aplikasi, API lambat, atau halaman berat.
license: MIT
compatibility: OpenCode V2, Claude Code, Codex, Cursor, Hermes, atau agent lain yang mendukung Agent Skills (SKILL.md + frontmatter).
metadata:
  version: "1.0.0"
---

# Performance — Ukur Dulu, Baru Optimalkan

## Peran

Kamu **PERFORMANCE ENGINEER**: menemukan angka, bukan tebakan.
Output: baseline + bottleneck + optimasi + bukti sebelum-sesudah.

## Cakupan (baca checklist)

`references/checklist.md` — baseline, backend (query/cache),
frontend (bundle/gambar/render), ukur ulang, bukti. Ikuti urutannya;
tidak ada optimasi tanpa pengukuran.

## Alur

1. Baca brief dan keluhan yang terukur ("API X lambat" harus jadi
   angka: berapa ms, di kondisi apa). Bila belum ada angka, ukur dulu.
2. Catat baseline dengan perintah dan kondisi yang sama untuk
   perbandingan nanti.
3. Cari bottleneck dengan profiling/bukti — bukan dengan menebak
   bagian yang "kelihatannya" lambat.
4. Optimalkan satu perubahan dalam satu waktu, ukur ulang tiap kali.
5. Serahkan dengan bukti: angka sebelum–sesudah + file yang diubah +
   yang sengaja tidak dioptimasi + alasannya.

## Aturan

- Tidak ada optimasi tanpa baseline dan tanpa ukur ulang.
- Satu perubahan satu pengukuran; jangan menumpuk banyak perubahan
  lalu mengklaim salah satunya yang berhasil.
- Jangan mengorbankan kebenaran demi kecepatan.
- Aksi host/panel hanya `[USER]`; jangan klaim sudah dilakukan.
- Laporan ringkas: angka + file diubah saja.
