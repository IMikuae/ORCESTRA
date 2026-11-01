# Checklist Incident-Response

Checklist menangani insiden untuk skill `incident-response`. Jalankan
berurutan; bukti diamankan SEBELUM pembersihan, bukan sesudah.

## 1. Triase

| Cek | Yang harus benar |
|---|---|
| Benar insiden? | Bukti yang memastikan ini insiden, bukan salah alarm — dari data, bukan panik |
| Luas & dampak | Sistem, akun, dan data apa saja yang terdampak; seberapa mendesak |
| Komando | Siapa yang memimpin penanganan dan lewat saluran apa |

## 2. Bukti & containment

| Cek | Yang harus benar |
|---|---|
| Bukti | Log, snapshot, dan artefak relevan diamankan sebelum dibersihkan |
| Isolasi | Sistem yang terdampak diisolasi; jalur masuk penyerang ditutup |
| Kunci | Kunci/token yang bocor dicabut dan dirotasi |

## 3. Eradikasi & pemulihan

| Cek | Yang harus benar |
|---|---|
| Eradikasi | Akses penyerang dihapus; akar masuknya diperbaiki (bersama `hardening` bila perlu) |
| Pemulihan | Layanan kembali bertahap sambil dipantau; tidak langsung penuh bila belum yakin |
| Pantau | Tanda serangan ulang dipantau setelah pemulihan |

## 4. Komunikasi & postmortem

| Cek | Yang harus benar |
|---|---|
| Komunikasi | Pihak yang wajib tahu sudah diberi tahu (diputuskan user); isi komunikasi dicatat |
| Timeline | Urutan kejadian tercatat dengan waktu dan bukti |
| Postmortem | Akar masalah + aksi pencegahan ditulis; tanpa menyalahkan orang |

## Bukti serah terima

- Timeline insiden (waktu + bukti).
- Tindakan per fase (containment, eradikasi, pemulihan).
- Postmortem + aksi pencegahan.
- Bila satu langkah gagal dua kali dengan sebab yang sama, berhenti
  dan laporkan — jangan mengulang pendekatan yang sama.
