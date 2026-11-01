# Checklist Performance

Checklist mengoptimalkan performa untuk skill `performance`. Jalankan
berurutan; tidak ada optimasi tanpa baseline dan tanpa ukur ulang.

## 1. Baseline

| Cek | Yang harus benar |
|---|---|
| Angka | Keluhan sudah jadi angka (ms, ukuran, skor) dengan kondisi yang jelas |
| Perintah | Perintah ukur dicatat agar bisa diulang persis sama nanti |
| Lingkungan | Pengukuran dilakukan di kondisi yang sebanding (data, jaringan, perangkat) |

## 2. Backend

| Cek | Yang harus benar |
|---|---|
| Query | Query lambat ditemukan lewat bukti (log/profiling); N+1 diperbaiki |
| Cache | Hasil yang mahal dan jarang berubah di-cache dengan masa berlaku jelas |
| Beban | Pekerjaan berat dipindah ke latar bila tidak harus menunggu user |

## 3. Frontend

| Cek | Yang harus benar |
|---|---|
| Bundle | Bundle diperiksa isinya; dependensi berat yang tak dipakai dibuang |
| Gambar & aset | Gambar dikompres dan berukuran sesuai tampilannya; aset di-cache |
| Render | Render berulang yang tak perlu dikurangi; daftar panjang di-virtualisasi bila perlu |

## 4. Ukur ulang & bukti

| Cek | Yang harus benar |
|---|---|
| Per perubahan | Tiap perubahan diukur ulang sendiri sebelum lanjut ke berikutnya |
| Bukti | Angka sebelum–sesudah dicatat dengan perintah ukur yang sama |
| Tidak dioptimasi | Bagian yang sengaja tidak dioptimasi dicatat + alasannya |

## Bukti serah terima

- Angka sebelum–sesudah (perintah ukur + hasil).
- File yang diubah (path saja).
- Bila satu optimasi gagal dua kali dengan sebab yang sama, berhenti
  dan laporkan — jangan mengulang pendekatan yang sama.
