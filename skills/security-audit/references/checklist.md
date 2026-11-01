# Checklist Security-Audit

Checklist audit keamanan mendalam untuk skill `security-audit`.
Periksa hanya cakupan yang diminta; tiap temuan dicatat dengan
lokasi, severity, bukti, dan cara reproduksi bila ada. Ini versi
mendalam dari bagian keamanan kilat `audit-proyek`. Detail tiap
serangan (SQL injection, DDoS, dll) ada di `attack-catalog.md`.

## 1. Threat model & auth

| Cek | Yang dicari |
|---|---|
| Threat model | Aset, aktor ancaman, dan jalur serangan utama tertulis singkat |
| Sesi & token | Token kedaluwarsa; logout membatalkan sesi; token tidak bocor ke URL/log |
| Password | Password di-hash dengan algoritma modern; tidak ada kredensial default |

## 2. Otorisasi & injeksi

| Cek | Yang dicari |
|---|---|
| Otorisasi | Tiap endpoint memeriksa hak user; tidak ada IDOR/BOLA (akses data user lain lewat ID) |
| Injeksi | SQL/NoSQL/perintah/LDAP tidak bisa disuntik dari input; pakai parameter binding (detail: `attack-catalog.md`) |
| XSS | Output di-encode sesuai konteks; tidak ada HTML mentah dari input user |

## 3. Serangan web & kripto

| Cek | Yang dicari |
|---|---|
| CSRF | Aksi yang mengubah state dilindungi token/cek origin |
| SSRF | URL dari user tidak bisa dipakai menyerang layanan internal |
| Upload | File upload dibatasi tipe/ukuran dan tidak bisa dieksekusi sebagai kode |
| Rate limit | Login dan endpoint sensitif dibatasi; tidak bisa brute force bebas |
| DDoS | Rate limit, timeout, batas payload, dan WAF/CDN (infra) sudah siap; layanan tidak tumbang oleh banjir request |
| XXE, SSTI & traversal | Parser XML tanpa DTD/entitas eksternal; template tidak dirender dari input; path dibatasi ke root |
| Kripto & secret | Tidak ada secret di kode; kripto memakai pustaka standar, bukan buatan sendiri |

## Format temuan (siap jadi baris TASKS.md)

| Temuan | Lokasi | Severity | Bukti | Pemilik saran |
|---|---|---|---|---|
| <satu kalimat> | <file:line> | <KRITIS / TINGGI / SEDANG / RENDAH> | <perintah + output / cuplikan> | <hardening / backend / security> |

## Kriteria selesai

- Semua cakupan yang diminta sudah diperiksa dan hasilnya tercatat.
- Tidak ada temuan KRITIS/TINGGI terbuka tanpa rencana tindak lanjut.
- Bila satu cek gagal dua kali dengan error yang sama, berhenti dan
  laporkan — jangan mengulang perintah yang sama.
