---
id: backend-audit
title: Audit Backend
severity: SEDANG
status: active
published: 2026-11-01
components: [api, database, auth, observability]
cves: []
owner_role: security
---

# Audit Backend

Checklist audit backend untuk tim orcestra. Dibuka saat task menyebut audit
backend, review API/database, atau "backend bermasalah". Peran penggerak:
`security` (temuan) → `builder`/`debugger` (perbaikan) → `qa` (verifikasi).
Temuan dicatat di papan ([`TASKS-template.md`](../references/TASKS-template.md)) —
bukan diulang lewat perintah yang sama.

## 1. API

| Cek | Yang dicari |
|---|---|
| Kontrak | Response sesuai skema yang didokumentasikan; tidak ada field bocor (password, token, data internal) |
| Validasi input | Semua input tervalidasi di server; tidak ada query mentah dari input user |
| Error | Error tidak membocorkan stack trace / detail internal ke client; kode status konsisten |
| Rate limit & timeout | Endpoint sensitif (login, OTP, upload) punya batas; timeout tidak menggantung |

## 2. Database

| Cek | Yang dicari |
|---|---|
| Migrasi | Perubahan skema lewat migrasi berversi, bukan edit manual; rollback tercatat |
| Query | Tidak ada N+1 yang jelas; indeks ada untuk kolom yang sering difilter/di-join |
| Backup | Ada jadwal backup dan satu bukti restore pernah dicoba (bukan sekadar "ada") |
| Secret | Kredensial tidak ada di repo, log, atau response; hanya lewat environment |

## 3. Auth & otorisasi

| Cek | Yang dicari |
|---|---|
| Session/token | Token kedaluwarsa; logout benar-benar membatalkan sesi; refresh token dirotasi |
| Hak akses | Setiap endpoint memeriksa hak user, bukan hanya menyembunyikan menu di UI |
| Least privilege | Service account / API key hanya punya izin sesuai kebutuhan |

## 4. Observabilitas

| Cek | Yang dicari |
|---|---|
| Log | Error tercatat dengan konteks (request id, user id) tanpa data sensitif |
| Metrik | Latensi dan error rate endpoint kunci terpantau; alert ada untuk lonjakan error |
| Jejak audit | Aksi sensitif (login, ubah role, hapus data) tercatat siapa dan kapan |

## 5. Kriteria selesai

- Semua cek di atas sudah diperiksa dan hasilnya tercatat (lolos / temuan).
- Tidak ada temuan KRITIS/TINGGI terbuka; temuan SEDANG/RENDAH jadi baris
  `TASKS.md` terjadwal, bukan diabaikan.
- Perbaikan diverifikasi `qa` dengan bukti perintah + hasil, bukan klaim.
- Bila satu cek gagal dua kali dengan error yang sama, berhenti dan
  laporkan — jangan mengulang perintah yang sama (lihat
  `../references/execution-modes.md`).
