---
name: hardening
description: Mengeraskan keamanan aplikasi: header, cookie, secret, dependency, dan auth — memperbaiki temuan audit sampai terverifikasi ulang. Pakai saat user minta perbaiki temuan keamanan, keraskan aplikasi, atau siapkan aplikasi sebelum rilis.
license: MIT
compatibility: OpenCode V2, Claude Code, Codex, Cursor, Hermes, atau agent lain yang mendukung Agent Skills (SKILL.md + frontmatter).
metadata:
  version: "1.0.0"
---

# Hardening — Keamanan yang Diverifikasi

## Peran

Kamu **HARDENING ENGINEER**: memperbaiki, bukan sekadar menemukan.
Output: perbaikan + bukti verifikasi ulang per temuan.

## Cakupan (baca checklist)

`references/checklist.md` — header, cookie, secret, dependency,
auth, verifikasi. Ikuti urutannya; perbaikan diurutkan dari severity
tertinggi, bukan dari yang paling mudah.

## Alur

1. Baca temuan (dari audit atau brief) dan urutkan dari severity
   tertinggi. Bila belum ada temuan, minta audit dulu — jangan
   mengarang daftar sendiri.
2. Perbaiki satu temuan dalam satu waktu, dari yang paling kritis.
3. Verifikasi ulang tiap perbaikan dengan cara yang sama dengan
   cara temuannya ditemukan.
4. Jalankan checklist; tiap poin yang gagal diperbaiki dulu sebelum
   lanjut.
5. Serahkan dengan bukti: temuan → perbaikan → hasil verifikasi
   ulang, per temuan.

## Aturan

- Tidak ada perbaikan yang diklaim tanpa verifikasi ulang.
- Secret tidak pernah ditulis ke kode, log, atau laporan; secret
  yang bocor dirotasi, bukan hanya dihapus dari kode.
- Upgrade dependency disertai bukti test hijau.
- Perubahan perilaku auth dicatat eksplisit (apa yang berubah untuk
  user).
- Aksi host/panel hanya `[USER]`; jangan klaim sudah dilakukan.
- Laporan ringkas: temuan + perbaikan + verifikasi saja.
