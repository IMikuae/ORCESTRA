# Workflow Orcestra — loop kerja, brief, bukti

> Prosedur lengkap. `SKILL.md` hanya ringkas. Routing task → skill & peran:
> `references/capabilities.md` §4. Kontrak peran (output & bukti tiap agent):
> `references/capabilities.md` §5. Format papan: `references/TASKS-template.md`.

## 1. Loop kerja detail

1. **Baca konteks** — `TASKS.md` (papan), `PLAN.md` (rencana), kondisi repo.
   Tulis ulang permintaan user jadi satu kalimat tujuan.
2. **Klasifikasi** — matriks 25 arketipe (`references/capabilities.md` §3):
   1 arketipe utama + maksimal 2 sekunder. Satu arketipe = satu baris papan.
3. **Pilih baris `todo`** yang dependensinya sudah `selesai`. Baris tanpa
   dependensi adalah akar (`Bergantung pada` = `—`).
4. **Rancang batas file** — tulis kolom "File yang disentuh" tiap baris
   **sebelum** delegasi. Himpunan file antar-baris yang `jalan` bersamaan
   wajib beririsan 0.
5. **Delegasi** — satu brief per agent (§2). Batas file di brief identik
   dengan yang tertulis di papan.
6. **Kumpulkan laporan** — periksa 4 penutup wajib (§2). Kurang satu = belum
   selesai; minta agent melengkapi, jangan tandai `selesai`.
7. **Perbarui papan** — status baris + sub-tabel `Bukti` + baris temuan baru
   bila ada. Papan diperbarui pada **setiap** perubahan status, bukan di akhir.
8. **Ulangi** — kembali ke langkah 3. Selesai bila tidak ada `todo`/`jalan`
   tersisa, semua baris punya bukti, dan tidak ada temuan KRITIS/TINGGI terbuka.

## 2. Format brief (wajib)

Setiap delegasi memuat 4 bagian:

1. **Tujuan & spesifikasi** — apa yang harus dihasilkan, secara presisi;
   arketipe + skill acuan dari katalog (blueprint) bila relevan.
2. **Batas file** — daftar path yang boleh disentuh; path di luar daftar itu
   di luar wewenang. Sebut eksplisit bila agent hanya boleh menulis file probe.
3. **Kriteria selesai terverifikasi** — perintah yang bisa dijalankan + hasil
   yang diharapkan (mis. "`npm run build` exit 0, 0 error"). Bukan "selesai
   bila sudah bagus".
4. **Konteks** — path proyek, konvensi (`AGENTS.md`, `CLAUDE.md`, gaya kode),
   hasil tugas sebelumnya yang relevan, dan ringkasan brief yang sudah
   diberikan ke agent lain.

Tutup laporan dengan 4 item: (1) apa yang dikerjakan, (2) file dibuat/diubah,
(3) masalah atau temuan — severity + `file:line`, (4) saran langkah berikutnya.

## 3. Aturan tabrakan file

- Kolom "File yang disentuh" adalah **kunci tabrakan**. Dua baris `jalan`
  bersamaan wajib himpunan filenya tidak beririsan.
- Nilai negatif sah: `none` (read-only), `only files with confirmed defects`,
  `<file>.mjs (probe scripts only)`. `none` = aman paralel dengan siapa pun.
- Tabrakan terdeteksi → **re-sekuensialkan** (tambah dependensi) atau
  **pecah** baris jadi dua dengan batas file terpisah. Jangan kompromi dengan
  "keduanya boleh edit file yang sama".
- Tabrakan yang sudah terjadi → catat di bagian "Catatan tabrakan file" papan.

## 4. Aturan bukti

Bukti = **perintah yang dijalankan + output-nya**. Bukan ringkasan, bukan
"test terlihat baik".

- Perintah harus bisa diulang reviewer: path jelas, env tercantum.
- Simpan di sub-tabel `Bukti` (ID, Perintah, Hasil, Waktu).
- Tanpa bukti → status **tidak boleh** `selesai`; pakai `blocked` + alasan.
- Hasil negatif tetap bukti: test gagal = temuan, bukan kegagalan laporan.

### 4.1 Verifikasi batas file (wajib, tiap gelombang)

Manager **wajib** membandingkan daftar file yang benar-benar berubah dengan kolom
"File yang disentuh" tiap baris board:

- Di repo git: `git status --porcelain`
- Di luar repo git: `find <batas file> -newermt <waktu mulai tugas>`

Selisih = **pelanggaran batas file**, bukan "selesai" — buat baris temuan baru
dan kembalikan file tersebut ke batas yang benar.

## 5. Baris baru di papan

- **Scope creep** — perubahan di luar rencana → baris baru + ID baru; jangan
  diam-diam memperluas batas file.
- **Temuan `qa`/`security`** → baris baru untuk `debugger`/`builder`, ID baru
  (prefiks `S`/`F`), "Bergantung pada" = ID tugas sumber temuan.
- Temuan diterima, tak akan diperbaiki → status `catatan`, alasan di sel Temuan.
- Manager boleh mengerjakan task sinkronisasi/copy sendiri → `Pemilik` = `manager`.

## 6. Paralel vs serial

- **Aman paralel**: `qa` ∥ `security` — keduanya tidak menulis kode aplikasi
  (`qa` hanya folder test, `security` read-only).
- **Serial**: `architect` → `builder` → `debugger` → (`qa` ∥ `security`) →
  perbaikan → selesai.
- Prasyarat paralel: tiap baris paralel punya "File yang disentuh" eksplisit
  dan tidak beririsan.
