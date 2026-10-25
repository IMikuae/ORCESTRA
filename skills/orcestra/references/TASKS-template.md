# Papan Tugas Orcestra — <NAMA PROYEK>

> Papan kumulatif: wave lama **dipertahankan**, hanya status yang berubah.
> Baris hanya boleh `selesai` bila punya bukti (perintah + output) di
> sub-tabel `Bukti`. Format & loop: `references/workflow.md`.

## <Wave> (gelombang aktif)

| ID | Tugas | Pemilik | Status | File yang disentuh | Bergantung pada |
|----|-------|---------|--------|--------------------|-----------------|
| T1 | <tugas pertama: audit + rencana> | architect | todo | PLAN.md | — |
| T2 | <implementasi modul A> | builder | todo | src/modul-a/**, src/shared/x.js | T1 |
| T3 | <audit keamanan read-only> | security | todo | none | T1 |
| T4 | <verifikasi runtime> | qa | todo | qa-*.mjs (probe scripts only) | T2 |

## <Wave berikutnya> (gelombang sebelumnya — carried forward)

| ID | Tugas | Pemilik | Status | File yang disentuh | Bergantung pada |
|----|-------|---------|--------|--------------------|-----------------|
| T0 | <tugas wave lama> | builder | selesai | src/legacy/** | — |

## Temuan keamanan

| ID | Severity | Finding | Status |
|----|----------|---------|--------|
| F1 | Sedang | <deskripsi + file:line> | <T-id (selesai) \| catatan> |

Status temuan: `<T-id>` = sudah diperbaiki task tersebut · `catatan` = diterima,
tidak akan diperbaiki (cukup dicatat, bukan blocker).

## Bukti

| ID | Perintah | Hasil | Waktu |
|----|----------|-------|-------|
| T2 | `npm run build` | ✅ exit 0, 0 error | 2026-10-25 |

## Catatan tabrakan file

- Dua baris `jalan` bersamaan **wajib** himpunan "File yang disentuh"-nya
  tidak beririsan. `none` = read-only, aman paralel dengan siapa pun.
- Nilai negatif yang sah: `none`, `only files with confirmed defects`,
  `<file>.mjs (probe scripts only)`.
- <YYYY-MM-DD> — <baris A> vs <baris B> tumpang tindih di `<path>` → <resolusi:
  di-serialkan via dependensi / dipecah jadi 2 baris>.
- **Verifikasi batas file tiap gelombang** — manager membandingkan daftar file
  yang benar-benar berubah dengan kolom "File yang disentuh". Di repo git:
  `git status --porcelain`. Di luar repo git:
  `find <batas file> -newermt <waktu mulai tugas>`. Selisih = **pelanggaran
  batas file**, bukan "selesai": buat baris temuan baru dan kembalikan file
  tersebut, lalu catat di bagian ini.

---

## Cara pakai

Salin seluruh file ini ke `TASKS.md` di root proyek, ganti `<...>`, lalu isi
baris per baris. Aturan singkat:

- **Kolom ID** — prefiks encode asal-usul: `P` = wave/portal, `O` = batch
  sebelumnya, `N` = fitur baru, `F` = temuan, `S` = perbaikan security,
  `T` = task/tes. ID unik, tak pernah dipakai ulang.
- **Pemilik** — `architect` | `builder` | `debugger` | `qa` | `security`, atau
  `manager` bila manager mengerjakan sendiri (mis. sinkronisasi dua tree).
- **File yang disentuh** — path literal, bukan deskripsi. Nilai negatif sah:
  lihat "Catatan tabrakan file".
- **Bergantung pada** — ID tugas, dipisah koma (`P1,P2,P3`), boleh range
  (`P1..P9`), `—` untuk akar.
- **Status** — `todo` | `jalan` | `selesai` | `selesai (moot)` | `blocked` |
  `catatan`.
  - `selesai` = selesai **dengan bukti** (perintah + output).
  - `selesai (moot)` = selesai **tanpa perubahan** — tugas tak relevan lagi
    karena targetnya sudah diperbaiki task lain. Jangan pakai `selesai` di
    sini supaya audit bisa membedakan.
  - `blocked` = terhalang, butuh keputusan/akses dari user.
  - `catatan` = temuan diterima, tidak akan diperbaiki (baris temuan).
- **Temuan** → baris di "Temuan keamanan" (ID `F`). Temuan yang mau
  diperbaiki jadi task baru (ID `S`) dengan "Bergantung pada" = ID sumber.
- **Perbarui papan setiap perubahan status.** Gelombang selesai tetap tinggal
  di file sebagai riwayat.
