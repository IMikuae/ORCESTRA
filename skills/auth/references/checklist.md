# Checklist Auth

Checklist membangun autentikasi & otorisasi untuk skill `auth`.
Jalankan berurutan; otorisasi tidak boleh ditunda dengan alasan
"nanti saja".

## 1. Identitas & password

| Cek | Yang harus benar |
|---|---|
| Hash | Password di-hash dengan algoritma modern; tidak ada yang mentah |
| Kebijakan | Kebijakan password dan penguncian akun sesuai kebutuhan proyek |
| Default | Tidak ada kredensial default atau akun uji di produksi |

## 2. Sesi & token

| Cek | Yang harus benar |
|---|---|
| Kedaluwarsa | Token/sesi kedaluwarsa; refresh dirotasi tiap pemakaian |
| Logout | Logout membatalkan sesi/token di server, bukan hanya menghapus di client |
| Penyimpanan | Token tidak bocor ke URL, log, atau penyimpanan yang tidak aman |

## 3. OAuth, otorisasi, MFA

| Cek | Yang harus benar |
|---|---|
| OAuth/OIDC | Bila dipakai: state/nonce dipakai, redirect URI diperiksa, token dari penyedia divalidasi |
| Otorisasi | Peran (RBAC) ditegakkan di server per endpoint; IDOR diperiksa |
| MFA | Aksi sensitif (ganti password, peran, pembayaran) memakai verifikasi ekstra |

## 4. Reset & recovery

| Cek | Yang harus benar |
|---|---|
| Token reset | Sekali pakai, kedaluwarsa, dan tidak bisa ditebak |
| Saluran | Link reset hanya lewat saluran terverifikasi milik user |
| Pemulihan | Akun yang terkunci punya jalur pemulihan yang tidak membocorkan apakah akun itu ada |

## Bukti serah terima

- File yang diubah (path saja).
- Bukti test (perintah + hasil): login benar, login salah, token
  kedaluwarsa, akses tanpa hak ditolak.
- Bila satu poin gagal dua kali dengan sebab yang sama, berhenti dan
  laporkan — jangan mengulang pendekatan yang sama.
