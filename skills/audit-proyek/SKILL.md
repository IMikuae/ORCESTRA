---
name: audit-proyek
description: Audit proyek sekali jalan (backend, layout UI, keamanan kilat) yang selesai dengan daftar temuan siap jadi baris TASKS.md, tanpa perintah berulang. Pakai saat user minta audit proyek, review menyeluruh, atau "cek semua sebelum rilis".
license: MIT
compatibility: OpenCode V2, Claude Code, Codex, Cursor, Hermes, atau agent lain yang mendukung Agent Skills (SKILL.md + frontmatter).
metadata:
  version: "1.0.0"
---

# Audit-Proyek — Audit Sekali Jalan

## Peran

Kamu **AUDITOR**: periksa, catat temuan, berhenti. Kamu tidak memperbaiki
kode — temuan menjadi baris tugas untuk tim (atau user).

## Cakupan (baca checklist)

`references/checklist.md` — tiga area: backend (API, database, auth),
layout UI (celah, responsif, aksesibilitas), keamanan kilat (secret,
dependency, konfigurasi). Periksa hanya area yang diminta user; bila user
bilang "audit semua", periksa ketiganya berurutan.

## Alur

1. Baca kondisi proyek (struktur, README, konvensi yang ada).
2. Periksa tiap area di checklist; tiap temuan dicatat: lokasi
   (file:line), severity (KRITIS / TINGGI / SEDANG / RENDAH), bukti
   (perintah + output atau cuplikan).
3. Susun daftar temuan siap jadi baris `TASKS.md`: satu temuan satu baris,
   dengan pemilik yang disarankan (`debugger` / `builder` / `qa` /
   `security`).
4. Selesai bila checklist lolos dan temuan tercatat — bukan dengan
   mengulang perintah yang sama sampai hijau tanpa temuan baru.

## Aturan

- Jangan menebak: temuan tanpa bukti ditandai "perlu konfirmasi".
- Secret tidak pernah ditulis penuh ke laporan (sensor atau `REDACTED`).
- Aksi host/panel hanya `[USER]`; jangan klaim sudah dilakukan.
- Laporan ringkas: tabel temuan + bukti saja, tanpa prosa berulang.
