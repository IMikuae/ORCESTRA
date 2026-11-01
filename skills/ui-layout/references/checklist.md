# Checklist UI-Layout

Checklist membangun layout untuk skill `ui-layout`. Jalankan berurutan;
poin yang gagal diperbaiki dulu sebelum lanjut. Versi audit (menilai
layout yang sudah ada) ada di playbook audit layout UI skill `orcestra`
(`ui-layout-audit.md`) — checklist ini versi membangun yang berdiri sendiri.

## 1. Struktur & spacing

| Cek | Yang harus benar |
|---|---|
| Kerangka | Satu kolom utama yang jelas; header, konten, dan aksi tidak berebut tempat |
| Spacing | Jarak memakai token/konvensi proyek; tidak ada angka ajaib yang berbeda-beda |
| Konsistensi | Komponen yang sama tampil sama; jangan buat varian baru tanpa alasan |

## 2. Responsif & overflow

| Cek | Yang harus benar |
|---|---|
| Breakpoint | Layout tidak rusak di mobile, tablet, desktop (pakai breakpoint proyek) |
| Overflow | Tidak ada scroll horizontal tak disengaja atau konten terpotong |
| Sentuh | Target sentuh cukup besar; aksi penting terjangkau jempol di mobile |
| Gambar & media | Gambar responsif (ukuran sesuai tampil), rasio aspek terjaga, tidak pecah layout |
| Uji viewport | Diuji di matriks viewport (mobile/tablet/desktop) + zoom, bukan hanya satu ukuran |

## 3. State & aksesibilitas

| Cek | Yang harus benar |
|---|---|
| State | Loading, kosong, dan error masing-masing punya tampilan sendiri |
| Keyboard | Semua aksi bisa dijangkau dan dioperasikan dari keyboard |
| Kontras & label | Teks cukup kontras; tiap kontrol punya label yang terbaca |

## Bukti serah terima

- File yang diubah (path saja, tanpa isi penuh).
- Poin checklist yang lolos, dan yang sengaja dilewati + alasannya.
- Bila satu poin gagal dua kali dengan sebab yang sama, berhenti dan
  laporkan — jangan mengulang pendekatan yang sama.
