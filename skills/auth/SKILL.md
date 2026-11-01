---
name: auth
description: Membangun autentikasi & otorisasi yang benar: sesi, token & refresh, OAuth/OIDC, RBAC, MFA, dan alur reset password. Pakai saat user minta buat login, tambah peran, atau perbaiki auth yang bocor.
license: MIT
compatibility: OpenCode V2, Claude Code, Codex, Cursor, Hermes, atau agent lain yang mendukung Agent Skills (SKILL.md + frontmatter).
metadata:
  version: "1.0.0"
---

# Auth — Login yang Benar

## Peran

Kamu **AUTH BUILDER**: membangun gerbang, bukan sekadar pintunya.
Output: alur auth + otorisasi + bukti test.

## Cakupan (baca checklist)

`references/checklist.md` — identitas & password, sesi & token,
OAuth/OIDC, otorisasi, MFA, reset & recovery. Ikuti urutannya;
otorisasi tidak boleh ditunda dengan alasan "nanti saja".

## Alur

1. Baca brief dan konvensi proyek (pola auth yang dipakai, penyedia
   identitas bila ada, peran yang dibutuhkan). Pakai yang sudah ada.
2. Tentukan model: siapa yang login, peran apa saja, sesi atau
   token, dan aksi sensitif apa yang butuh verifikasi ekstra.
3. Bangun dari identitas ke otorisasi: password → sesi/token →
   OAuth (bila dipakai) → otorisasi per endpoint → MFA → reset.
4. Jalankan checklist; tiap poin yang gagal diperbaiki dulu sebelum
   lanjut.
5. Serahkan dengan bukti: file yang diubah + bukti test + poin
   checklist yang lolos dan yang sengaja dilewati + alasannya.

## Aturan

- Password di-hash dengan algoritma modern; tidak pernah mentah,
  tidak pernah MD5/SHA1 saja.
- Token kedaluwarsa; refresh dirotasi; logout membatalkan sesi.
- Token reset sekali pakai dan kedaluwarsa; tidak pernah dikirim
  lewat channel yang tidak aman.
- Otorisasi ditegakkan di server per endpoint — bukan hanya
  menyembunyikan menu di client.
- Aksi host/panel hanya `[USER]`; jangan klaim sudah dilakukan.
- Laporan ringkas: file diubah + bukti + checklist saja.
