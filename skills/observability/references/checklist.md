# Checklist Observability

Checklist membuat aplikasi terpantau untuk skill `observability`.
Jalankan berurutan; alert dibuat terakhir, setelah sinyalnya jelas.

## 1. Sinyal

| Cek | Yang harus benar |
|---|---|
| Empat sinyal | Latensi, traffic, error, dan saturasi terdefinisi untuk tiap layanan penting |
| Baseline | Nilai normal tiap sinyal sudah terukur, bukan ditebak |
| Cakupan | Jalur kritis user (login, bayar, baca utama) semuanya terpantau |

## 2. Log, metrik, trace

| Cek | Yang harus benar |
|---|---|
| Log | Log terstruktur (level, layanan, id permintaan); tanpa secret/data pribadi |
| Metrik | Metrik berlabel jelas; satuan dan namanya konsisten |
| Trace | Permintaan bisa ditelusuri antar layanan (bila ada lebih dari satu) |

## 3. Alert & runbook

| Cek | Yang harus benar |
|---|---|
| Ambang | Ambang alert dari baseline; alert yang sering salah bunyi diperbaiki, bukan dibiarkan |
| Bisa ditindak | Tiap alert punya aksi yang jelas; alert tanpa aksi diubah jadi log |
| Runbook | Tiap alert punya runbook: gejala, langkah periksa, langkah perbaiki, kapan eskalasi |
| Uji | Satu alert diuji sampai berbunyi dan runbook-nya terbukti jalan |

## Bukti serah terima

- Sinyal yang dipantau + baseline-nya.
- Alert + ambang + runbook-nya.
- Hasil uji alert.
- Bila satu poin gagal dua kali dengan sebab yang sama, berhenti dan
  laporkan — jangan mengulang pendekatan yang sama.
