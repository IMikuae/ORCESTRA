# Checklist Backend

Checklist membangun API untuk skill `backend`. Jalankan berurutan;
poin yang gagal diperbaiki dulu sebelum lanjut. Versi audit (menilai
API yang sudah ada) ada di playbook audit backend skill `orcestra`
(`backend-audit.md`) — checklist ini versi membangun yang berdiri sendiri.

## 1. Desain API

| Cek | Yang harus benar |
|---|---|
| Penamaan | Endpoint konsisten dengan konvensi proyek; method sesuai semantiknya |
| Skema | Request/response punya skema yang jelas; tidak ada field bocor (password, token, data internal) |
| Versi | Perubahan yang merusak ditandai versinya; client lama tidak diam-diam rusak |

## 2. Validasi & keamanan

| Cek | Yang harus benar |
|---|---|
| Validasi | Semua input tervalidasi di server, termasuk yang "sudah divalidasi client" |
| Query | Tidak ada query mentah dari input user; pakai parameter binding |
| Auth | Token kedaluwarsa; logout membatalkan sesi; tiap endpoint memeriksa hak user |
| Secret | Tidak ada API key, token, atau password di kode dan file yang ter-commit |

## 3. Database & migrasi

| Cek | Yang harus benar |
|---|---|
| Migrasi | Perubahan skema lewat migrasi berversi; migrasi yang sudah jalan tidak diubah diam-diam |
| Query | Tidak ada N+1 yang jelas; field yang sering dicari punya indeks |
| Backup | Backup ada dan restore pernah dicoba (bila proyek sudah produksi) |

## 4. Error & bukti

| Cek | Yang harus benar |
|---|---|
| Format error | Format error konsisten di semua endpoint; tidak membocorkan stack trace ke client |
| Bukti | Build lolos; test relevan hijau; bukti dicatat, bukan diklaim |

## Bukti serah terima

- File yang diubah (path saja, tanpa isi penuh).
- Bukti build/test (perintah + hasil).
- Poin checklist yang lolos, dan yang sengaja dilewati + alasannya.
- Bila satu poin gagal dua kali dengan sebab yang sama, berhenti dan
  laporkan — jangan mengulang pendekatan yang sama.
