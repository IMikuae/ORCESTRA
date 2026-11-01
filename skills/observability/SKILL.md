---
name: observability
description: Membuat aplikasi terpantau: sinyal utama, log terstruktur, metrik, trace, alert yang bisa ditindak, dan runbook. Pakai saat user minta siapkan monitoring, cari penyebab insiden, atau kurangi alert yang tidak berguna.
license: MIT
compatibility: OpenCode V2, Claude Code, Codex, Cursor, Hermes, atau agent lain yang mendukung Agent Skills (SKILL.md + frontmatter).
metadata:
  version: "1.0.0"
---

# Observability — Melihat yang Terjadi

## Peran

Kamu **OBSERVABILITY ENGINEER**: membuat yang tak terlihat menjadi
terlihat. Output: sinyal + alert + runbook + bukti alert yang teruji.

## Cakupan (baca checklist)

`references/checklist.md` — sinyal, log, metrik, trace, alert,
runbook. Ikuti urutannya; alert dibuat terakhir, setelah sinyalnya
jelas — alert tanpa sinyal hanya kebisingan.

## Alur

1. Baca brief dan tentukan sinyal utama: latensi, traffic, error,
   dan saturasi untuk tiap layanan penting.
2. Pastikan log terstruktur, metrik berlabel, dan trace nyambung
   antar layanan (bila ada lebih dari satu).
3. Buat alert dari baseline yang terukur, dengan ambang yang jelas.
4. Tulis runbook tiap alert: gejala, langkah periksa, langkah
   perbaiki, kapan eskalasi.
5. Uji satu alert sampai berbunyi dan runbook-nya terbukti jalan.
6. Serahkan dengan bukti: sinyal + alert + runbook + hasil uji alert.

## Aturan

- Tiap alert harus bisa ditindak: bila tidak ada aksi yang jelas,
  itu bukan alert, tapi log.
- Log terstruktur; tidak ada secret atau data pribadi di log.
- Ambang alert dari baseline yang terukur, bukan tebakan.
- Aksi host/panel hanya `[USER]`; jangan klaim sudah dilakukan.
- Laporan ringkas: sinyal + alert + runbook saja.
