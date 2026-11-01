# Checklist Theme

Checklist membangun sistem tema untuk skill `theme`. Jalankan
berurutan; token didefinisikan dulu sebelum satu komponen pun
diwarnai.

## 1. Token

| Cek | Yang harus benar |
|---|---|
| Satu sumber | Semua warna/tipografi/spacing lewat token; tidak ada hardcode di komponen |
| Penamaan | Nama token bermakna peran (mis. `latar`, `teks`, `primer`), bukan nilai mentah |
| Cakupan | Token mencakup warna, tipografi, spacing, radius, dan bayangan |

## 2. Warna & tipografi

| Cek | Yang harus benar |
|---|---|
| Palet | Warna primer, netral, sukses, peringatan, error, latar, dan teks terdefinisi |
| Tipografi | Skala ukuran, bobot, dan tinggi baris konsisten di seluruh proyek |
| Spacing & bentuk | Spacing, radius, dan bayangan memakai token yang sama |

## 3. Mode gelap/terang & pergantian

| Cek | Yang harus benar |
|---|---|
| Dua mode | Tiap token punya nilai terang dan gelap; mode gelap tetap terbaca |
| Preferensi | Mengikuti preferensi sistem secara default; bisa diubah manual |
| Tersimpan & tanpa flash | Pilihan tersimpan; pergantian dan muat awal tanpa flash (kedip terang) |

## 4. Kontras

| Cek | Yang harus benar |
|---|---|
| Teks | Kontras teks cukup dibaca di kedua mode, termasuk teks kecil dan sekunder |
| State | State (hover, fokus, disabled, error) tetap terbaca di kedua mode |

## Bukti serah terima

- File token (path saja) + mode yang tersedia.
- Hasil cek kontras di kedua mode.
- Token lama yang digantikan (bila ada) + alasannya.
- Bila satu poin gagal dua kali dengan sebab yang sama, berhenti dan
  laporkan — jangan mengulang pendekatan yang sama.
