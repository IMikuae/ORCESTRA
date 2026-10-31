---
id: ui-layout-audit
title: Audit Layout UI
severity: SEDANG
status: active
published: 2026-11-01
components: [frontend, layout, accessibility]
cves: []
owner_role: qa
---

# Audit Layout UI

Checklist audit tampilan untuk tim orcestra. Dibuka saat task menyebut audit
UI/layout, "ada celah", overflow, atau tampilan rusak. Peran penggerak: `qa`
(temuan) → `builder` (perbaikan) → `qa` (verifikasi ulang). Temuan dicatat
di papan ([`TASKS-template.md`](../references/TASKS-template.md)) — satu temuan satu
baris, dengan lokasi layar dan kondisi pemicunya.

## 1. Layout & celah

| Cek | Yang dicari |
|---|---|
| Overflow | Tidak ada konten terpotong atau scroll horizontal yang tidak disengaja, di semua breakpoint yang didukung |
| Celah & jarak | Tidak ada ruang kosong aneh antar komponen; jarak mengikuti sistem spacing yang sama |
| Tumpang tindih | Tidak ada elemen menumpuk (z-index liar, dialog di bawah overlay, tooltip terpotong) |
| Konsistensi | Komponen yang sama tampil sama di semua halaman (tombol, kartu, form, tabel) |

## 2. Responsif

| Cek | Yang dicari |
|---|---|
| Breakpoint | Layout tidak rusak di mobile, tablet, dan desktop; bukan hanya di satu ukuran |
| Sentuh | Target sentuh cukup besar; tidak ada aksi yang hanya bisa dilakukan dengan hover |
| Teks | Teks tidak meluber keluar kartu/tombol saat diperbesar atau saat teks panjang |

## 3. State & aksesibilitas

| Cek | Yang dicari |
|---|---|
| State | Loading, kosong, dan error punya tampilan sendiri — bukan layar putih atau spinner abadi |
| Fokus & keyboard | Semua aksi bisa dijangkau keyboard; urutan fokus masuk akal; fokus terlihat |
| Kontras | Teks di atas latar memenuhi kontras baca; informasi tidak hanya disampaikan lewat warna |

## 4. Kriteria selesai

- Semua cek di atas sudah diperiksa per layar yang diubah, hasilnya tercatat.
- Tidak ada temuan TINGGI terbuka (konten hilang, aksi tidak bisa dijangkau).
- Perbaikan diverifikasi `qa` dengan bukti (tangkapan layar / deskripsi
  kondisi sebelum-sesudah), bukan klaim "sudah diperbaiki".
- Audit dinyatakan selesai bila checklist lolos dan temuan tercatat — bukan
  dengan mengulang perintah yang sama sampai terlihat hijau tanpa temuan baru
  (lihat `../references/execution-modes.md`).
