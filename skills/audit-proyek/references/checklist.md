# Checklist Audit-Proyek

Checklist ringkas untuk skill `audit-proyek`. Periksa hanya area yang
diminta; tiap temuan dicatat dengan lokasi, severity, dan bukti. Versi
lengkap untuk tim orcestra ada di playbook audit skill `orcestra`
(`backend-audit.md`, `ui-layout-audit.md`) — checklist ini versi
sekali-jalan yang berdiri sendiri.

## 1. Backend

| Cek | Yang dicari |
|---|---|
| API | Response sesuai skema; tidak ada field bocor (password, token, data internal); error tidak membocorkan stack trace |
| Validasi | Semua input tervalidasi di server; tidak ada query mentah dari input user |
| Database | Perubahan skema lewat migrasi berversi; tidak ada N+1 yang jelas; backup ada dan restore pernah dicoba |
| Auth | Token kedaluwarsa; logout membatalkan sesi; tiap endpoint memeriksa hak user (bukan hanya menyembunyikan menu) |

## 2. Layout UI

| Cek | Yang dicari |
|---|---|
| Celah & overflow | Tidak ada konten terpotong, scroll horizontal tak disengaja, atau ruang kosong aneh |
| Responsif | Layout tidak rusak di mobile, tablet, desktop; target sentuh cukup besar |
| State & a11y | Loading, kosong, dan error punya tampilan sendiri; semua aksi terjangkau keyboard; kontras baca cukup |

## 3. Keamanan kilat

| Cek | Yang dicari |
|---|---|
| Secret | Tidak ada API key, token, atau password di kode dan file yang ter-commit |
| Dependency | Tidak ada dependency dengan CVE kritis yang benar-benar dipakai di jalur kode |
| Konfigurasi | Header keamanan dan cookie sudah benar; mode debug tidak menyala di produksi |

## Format temuan (siap jadi baris TASKS.md)

| Temuan | Lokasi | Severity | Bukti | Pemilik saran |
|---|---|---|---|---|
| <satu kalimat> | <file:line> | <KRITIS / TINGGI / SEDANG / RENDAH> | <perintah + output / cuplikan> | <debugger / builder / qa / security> |

## Kriteria selesai

- Semua area yang diminta sudah diperiksa dan hasilnya tercatat.
- Tidak ada temuan KRITIS/TINGGI terbuka tanpa rencana tindak lanjut.
- Bila satu cek gagal dua kali dengan error yang sama, berhenti dan
  laporkan — jangan mengulang perintah yang sama.
