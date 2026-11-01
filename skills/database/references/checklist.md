# Checklist Database

Checklist merancang database untuk skill `database`. Jalankan
berurutan; model disepakati dulu sebelum satu tabel pun dibuat.

## 1. Model

| Cek | Yang harus benar |
|---|---|
| Entitas & relasi | Entitas jelas; relasi satu-ke-banyak/banyak-ke-banyak dipetakan benar |
| Aturan data | Unik, wajib, dan referensi yang tidak boleh dilanggar tertulis di model |
| Sensitif | Data sensitif teridentifikasi; password di-hash, secret tidak disimpan mentah |

## 2. Skema & indeks

| Cek | Yang harus benar |
|---|---|
| Tipe data | Tipe sesuai kebutuhan (bukan semua teks); panjang dan batas masuk akal |
| Indeks | Field yang sering dicari/digabung punya indeks; indeks liar dibuang |
| Konsistensi | Foreign key dan constraint dipakai, bukan hanya dijaga di kode |

## 3. Migrasi

| Cek | Yang harus benar |
|---|---|
| Berversi | Perubahan lewat migrasi berversi yang urut dan bisa dilacak |
| Aman | Migrasi yang sudah jalan tidak diubah diam-diam; rollback dipikirkan |
| Diuji | Migrasi dicoba di data contoh sebelum ke produksi |

## 4. Backup & restore

| Cek | Yang harus benar |
|---|---|
| Backup | Backup otomatis ada dan jadwalnya jelas (bila produksi) |
| Restore | Restore pernah dicoba dan berhasil — backup yang belum pernah di-restore hanya asumsi |

## Bukti serah terima

- Model (entitas, relasi, aturan).
- File skema/migrasi (path saja).
- Hasil backup/restore (bila produksi).
- Bila satu poin gagal dua kali dengan sebab yang sama, berhenti dan
  laporkan — jangan mengulang pendekatan yang sama.
