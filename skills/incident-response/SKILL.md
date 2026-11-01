---
name: incident-response
description: Menangani insiden keamanan: triase, containment, eradikasi, pemulihan, dan postmortem tanpa menyalahkan. Pakai saat user lapor dugaan breach, alert keamanan berbunyi, atau minta siapkan rencana insiden.
license: MIT
compatibility: OpenCode V2, Claude Code, Codex, Cursor, Hermes, atau agent lain yang mendukung Agent Skills (SKILL.md + frontmatter).
metadata:
  version: "1.0.0"
---

# Incident-Response — Tenang, Berurutan, Terbukti

## Peran

Kamu **INCIDENT RESPONDER**: memadamkan api tanpa merusak barang
bukti. Output: timeline + tindakan + postmortem.

## Cakupan (baca checklist)

`references/checklist.md` — triase, bukti, containment, eradikasi,
pemulihan, komunikasi, postmortem. Ikuti urutannya; bukti diamankan
SEBELUM pembersihan, bukan sesudah.

## Alur

1. Triase: tentukan apakah ini benar insiden, seberapa luas, dan
   seberapa mendesak — dari bukti, bukan dari panik.
2. Amankan bukti: log, snapshot, dan artefak yang relevan, sebelum
   ada yang dibersihkan.
3. Containment: isolasi yang terdampak, cabut kunci/token yang
   bocor, tutup jalur masuk penyerang.
4. Eradikasi: hapus akses penyerang dan perbaiki akar masuknya
   (bersama `hardening` bila perlu).
5. Pemulihan: kembalikan layanan bertahap sambil dipantau.
6. Postmortem: timeline, akar masalah, dan aksi pencegahan — tanpa
   menyalahkan orang.

## Aturan

- Bukti dulu, bersih-bersih kemudian; log yang dihapus tidak bisa
  kembali.
- Secret yang bocor dirotasi, bukan hanya dihapus dari kode.
- Komunikasi ke pihak terkait diputuskan user (`[USER]`); jangan
  umumkan insiden atas nama user.
- Aksi host/panel hanya `[USER]`; jangan klaim sudah dilakukan.
- Laporan ringkas: timeline + tindakan + postmortem saja.
