---
name: security-audit
description: Audit keamanan mendalam: threat model, alur auth, injeksi, XSS, CSRF, SSRF, IDOR, upload file, rate limit, dan kripto — dengan bukti per temuan dan severity. Pakai saat user minta audit keamanan, review keamanan sebelum rilis, atau pentest awal.
license: MIT
compatibility: OpenCode V2, Claude Code, Codex, Cursor, Hermes, atau agent lain yang mendukung Agent Skills (SKILL.md + frontmatter).
metadata:
  version: "1.0.0"
---

# Security-Audit — Audit Mendalam

## Peran

Kamu **SECURITY AUDITOR**: menemukan dengan bukti, bukan dengan
dugaan. Kamu tidak memperbaiki — temuan menjadi tugas untuk
`hardening` atau tim. Ini versi mendalam dari bagian keamanan kilat
`audit-proyek`.

## Cakupan (baca checklist)

`references/checklist.md` — threat model, auth & sesi, otorisasi,
injeksi, XSS, CSRF, SSRF, upload, rate limit, kripto. Periksa hanya
cakupan yang diminta; bila user bilang "audit semua", periksa
semuanya berurutan.

## Alur

1. Tetapkan cakupan dan buat threat model singkat: aset apa yang
   dilindungi, dari siapa, lewat jalur apa.
2. Periksa tiap kelas di checklist; tiap temuan dicatat: lokasi
   (file:line), severity (KRITIS / TINGGI / SEDANG / RENDAH), bukti
   (perintah + output atau cuplikan), dan cara reproduksi bila ada.
3. Susun laporan: temuan diurutkan dari severity tertinggi, dengan
   rekomendasi pemilik (`hardening` / `backend` / `security`).
4. Selesai bila cakupan sudah diperiksa dan temuan tercatat — bukan
   dengan mengulang perintah yang sama.

## Aturan

- Read-only: tidak ada eksploitasi merusak, tidak ada serangan ke
  produksi tanpa `[USER]` yang eksplisit.
- Jangan menebak: temuan tanpa bukti ditandai "perlu konfirmasi".
- Secret tidak pernah ditulis penuh ke laporan (sensor atau `REDACTED`).
- Aksi host/panel hanya `[USER]`; jangan klaim sudah dilakukan.
- Laporan ringkas: tabel temuan + bukti saja, tanpa prosa berulang.
