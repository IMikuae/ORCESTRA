# Checklist Hardening

Checklist mengeraskan keamanan untuk skill `hardening`. Jalankan
berurutan; perbaikan diurutkan dari severity tertinggi, bukan dari
yang paling mudah. Skill ini memperbaiki — menemukan temuan adalah
tugas audit (`audit-proyek`, peran `security`).

## 1. Header & cookie

| Cek | Yang harus benar |
|---|---|
| Header | Header keamanan yang relevan sudah benar (konten, framing, transport) |
| Cookie | Cookie sensitif memakai flag yang benar (HttpOnly, Secure, SameSite sesuai kebutuhan) |
| Debug | Mode debug dan halaman debug tidak menyala di produksi |

## 2. Secret & dependency

| Cek | Yang harus benar |
|---|---|
| Secret | Tidak ada secret di kode; secret yang pernah bocor sudah dirotasi |
| Dependency | Dependency dengan CVE kritis yang benar-benar dipakai sudah diperbarui + test hijau |
| Kunci | Kunci dan token lama yang tidak dipakai sudah dicabut |

## 3. Auth & verifikasi

| Cek | Yang harus benar |
|---|---|
| Auth | Token kedaluwarsa; logout membatalkan sesi; tiap endpoint memeriksa hak user |
| Verifikasi | Tiap perbaikan diverifikasi ulang dengan cara yang sama dengan cara temuannya ditemukan |
| Perubahan | Perubahan perilaku auth dicatat eksplisit |

## 4. Rate limit & DDoS

| Cek | Yang harus benar |
|---|---|
| Rate limit | Login dan endpoint sensitif dibatasi per IP/akun; banjir request ditahan di aplikasi |
| Timeout & payload | Timeout dan batas ukuran payload dipasang; koneksi lambat tidak menggantung server |
| WAF/CDN | Bila tersedia: WAF/CDN aktif dan guard autoscale dipasang (infra: `[USER]`) |

## Bukti serah terima

- Daftar temuan → perbaikan → hasil verifikasi ulang, per temuan.
- File yang diubah (path saja).
- Temuan yang sengaja tidak diperbaiki + alasannya (diterima risikonya oleh user).
- Bila satu perbaikan gagal dua kali dengan sebab yang sama, berhenti
  dan laporkan — jangan mengulang pendekatan yang sama.
