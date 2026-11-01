# Checklist Forms

Checklist membangun formulir untuk skill `forms`. Jalankan
berurutan; label dan pesan error bukan hiasan akhir.

## 1. Label & input

| Cek | Yang harus benar |
|---|---|
| Label | Tiap field punya label yang selalu terlihat; placeholder bukan pengganti label |
| Input tepat | Tipe input sesuai datanya (email, telepon, tanggal, angka); keyboard yang muncul sesuai |
| Field perlu | Hanya field yang benar-benar dibutuhkan; sisanya dibuang sebelum membangun |
| Urutan | Field dari mudah ke sulit; yang berkaitan dikelompokkan |

## 2. Validasi & pesan error

| Cek | Yang harus benar |
|---|---|
| Validasi | Aturan validasi jelas per field; format yang diterima dicontohkan |
| Pesan error | Spesifik dan bisa ditindak: salahnya apa + cara memperbaikinya; muncul di dekat field |
| Isian awet | Isian tidak hilang saat validasi gagal |
| Server | Validasi akhir tetap di server; formulir hanya validasi awal |

## 3. Multi-step & aksesibilitas

| Cek | Yang harus benar |
|---|---|
| Progres | Multi-step menunjukkan progres dan langkah saat ini |
| Mundur | Mundur tidak menghilangkan isian; maju kembali tidak mengulang dari nol |
| Keyboard & reader | Semua field terjangkau keyboard; error terbaca screen reader |

## Bukti serah terima

- File formulir (path saja).
- Hasil uji isi: benar, salah, dan kosong.
- Poin checklist yang lolos, dan yang sengaja dilewati + alasannya.
- Bila satu poin gagal dua kali dengan sebab yang sama, berhenti dan
  laporkan — jangan mengulang pendekatan yang sama.
