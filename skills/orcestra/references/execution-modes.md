# Mode Eksekusi Skill — Orcestra

Aturan ini mengatur **kapan manager bertanya dulu dan kapan langsung
mengeksekusi** saat sebuah skill atau playbook akan dipakai. Tujuannya:
hemat token (tidak ada penjelasan berulang), tidak ada perintah yang
diulang-ulang tanpa keputusan, dan user tetap memegang kendali atas aksi
yang berdampak.

## Dua mode

| Mode | Perilaku manager |
|---|---|
| **tanya-satu-satu** (default) | Tiap kali skill/playbook akan dipakai, tanya user dengan **satu pesan opsi singkat** (lihat format di bawah). Eksekusi hanya setelah user memilih. |
| **langsung** | Eksekusi tanpa tanya, lalu laporkan hasilnya singkat. Berlaku sampai user mengubahnya. |

## Ganti mode

User cukup bilang satu kalimat: "mode langsung" atau "mode tanya-satu-satu".
Manager mencatat mode itu di `TASKS.md` (baris `catatan`) agar berlaku
untuk sisa sesi, dan menyebutkannya saat mode berubah.

## Format pertanyaan (mode tanya-satu-satu)

Satu pesan, tanpa prosa panjang:

> Pakai `<skill/playbook>` untuk `<tujuan singkat>`?
> [1] Jalankan · [2] Jelaskan dulu · [3] Lewati

- Pilihan user berlaku untuk pemakaian itu saja, kecuali user bilang
  "selalu" atau "untuk semua".
- Bila beberapa pemakaian skill independen muncul dalam satu tugas,
  gabungkan dalam **satu pesan opsi** (satu baris per skill), jangan kirim
  satu pesan tanya per skill.
- Jawaban "jelaskan dulu" → jelaskan dalam ≤5 baris, lalu tanya ulang
  dengan opsi yang sama. Jangan menjelaskan panjang sebelum ditanya.

## Batas yang tidak bisa ditawar

- Mode **langsung** tidak berlaku untuk aksi host/panel (restart, patch
  runtime, deploy): aksi itu tetap `[USER]` dan tidak pernah diklaim sudah
  dilakukan — lihat `playbooks/README.md` § "Pemisahan agent vs user".
- Mode **langsung** tidak berlaku untuk instalasi skill katalog massal:
  tetap butuh persetujuan eksplisit user dan vetting (`playbooks/README.md`
  § "Catatan aktivasi katalog").
- Bila perintah gagal dua kali dengan error yang sama, berhenti dan
  laporkan — jangan mengulang perintah yang sama terus-menerus. Tulis
  temuan ke `TASKS.md` sebagai baris baru untuk `debugger`, bukan loop.

## Audit selesai = tidak ada perintah ulang

Sebuah tugas dinyatakan selesai bila: bukti terkumpul, temuan tercatat di
papan, dan tidak ada temuan KRITIS/TINGGI terbuka. "Coba lagi perintah yang
sama" bukan bukti kemajuan — bila tidak ada temuan baru, audit berhenti
dan dilaporkan selesai.
