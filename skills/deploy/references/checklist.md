# Checklist Deploy

Checklist merilis untuk skill `deploy`. Jalankan berurutan; poin yang
gagal diperbaiki dulu sebelum lanjut. Rencana rollback dibuat sebelum
deploy — rilis tanpa rencana rollback bukan rilis, tapi judi.

## 1. Pipeline

| Cek | Yang harus benar |
|---|---|
| Build | Build lolos dari sumber yang sama dengan yang akan dirilis |
| Test | Test relevan hijau; test yang gagal diperbaiki, bukan dilewati |
| Artefak | Artefak yang dirilis berasal dari pipeline, bukan dari laptop |

## 2. Environment & secret

| Cek | Yang harus benar |
|---|---|
| Environment | Target deploy jelas (staging/produksi); konfigurasi per environment terpisah |
| Secret | Secret lewat env atau secret manager; tidak ada di kode, log, atau laporan |
| Akses | Hanya akun/layanan yang berhak yang bisa deploy ke produksi |

## 3. Pra-rilis, deploy, pasca-deploy

| Cek | Yang harus benar |
|---|---|
| Pra-rilis | Migrasi (bila ada) siap dan urutannya benar; catatan rilis ditulis |
| Deploy | Langkah deploy sesuai runbook proyek; tiap langkah terverifikasi |
| Pasca-deploy | Health check lolos; alur utama dicoba; log dipantau sebentar |

## 4. Rollback

| Cek | Yang harus benar |
|---|---|
| Rencana | Cara kembali ke versi sebelumnya sudah ditulis SEBELUM deploy |
| Data | Rollback data (bila migrasi ikut) sudah dipikirkan, bukan diasumsikan |
| Pemicu | Kondisi yang memicu rollback jelas (error melonjak, health check gagal) |

## Bukti serah terima

- Apa yang dirilis (versi/komit) dan ke mana.
- Hasil verifikasi pasca-deploy.
- Cara rollback dan pemicunya.
- Bila satu poin gagal dua kali dengan sebab yang sama, berhenti dan
  laporkan — jangan mengulang pendekatan yang sama.
