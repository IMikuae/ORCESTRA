# Pola Responsif

Pola responsif untuk skill `ui-layout`: cara membuat layout yang
tetap benar di semua ukuran, bukan sekadar "tambah breakpoint".
Dipakai bersama checklist (`checklist.md`): checklist menentukan
yang harus lolos, dokumen ini memberi caranya.

## 1. Mobile-first

Bangun dari layar kecil ke besar, bukan sebaliknya. Alasannya:
konten yang muat di kecil hampir pasti muat di besar; sebaliknya
tidak. Urutan kerja: susun satu kolom → tambah kolom saat ruang
memungkinkan → poles detail desktop.

## 2. Grid fluida, bukan lebar tetap

- Kontainer memakai lebar relatif (`fr`, `minmax`, persen), bukan
  pixel tetap yang memaksa scroll horizontal.
- Kolom bertambah/berkurang mengikuti ruang, bukan mengikuti nama
  perangkat.
- Teks membungkus; judul panjang dan kata panjang tidak mendorong
  layout keluar (potong atau bungkus dengan sengaja).

## 3. Breakpoint berbasis konten

- Breakpoint ditambahkan saat layout mulai rusak, bukan saat
  mencapai ukuran perangkat tertentu.
- Pakai breakpoint proyek (token) bila sudah ada; jangan ciptakan
  angka baru per komponen.
- Satu breakpoint yang dipakai di semua komponen lebih mudah
  dirawat daripada sepuluh angka berbeda.

## 4. Gambar & media responsif

- Gambar memakai ukuran sesuai tampilannya (srcset/ukuran), bukan
  satu gambar besar untuk semua layar.
- Rasio aspek dijaga agar layout tidak melompat saat gambar muat.
- Media (video, iframe) dibungkus rasio aspek; tidak boleh meluber
  dari kontainernya.
- Gambar di bawah lipatan dimuat malas (lazy) bila proyek
  mendukungnya.

## 5. Container query (bila didukung)

Bila komponen dipakai di banyak tempat dengan lebar berbeda,
responsif berbasis kontainer lebih tepat daripada berbasis
viewport: komponen menyesuaikan dengan ruangnya sendiri, bukan
dengan ukuran layar.

## 6. Matriks uji viewport

Uji minimal: mobile kecil, mobile besar, tablet, desktop — plus
zoom (perbesar teks) dan orientasi landscape bila relevan. Satu
ukuran saja bukan bukti responsif. Catat hasil per ukuran di bukti
serah terima.
