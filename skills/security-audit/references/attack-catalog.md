# Katalog Serangan

Katalog serangan untuk skill `security-audit`: tiap serangan dicatat
apa, cara cek, dan perbaikan + pemiliknya. Dipakai bersama checklist
(`checklist.md`): checklist menentukan cakupan, katalog ini memberi
detail per serangan. Perbaikan dieksekusi `hardening` (atau skill
yang disebut); audit tidak memperbaiki.

| Serangan | Apa | Cara cek | Perbaikan → pemilik |
|---|---|---|---|
| SQL injection | Query SQL disusun dari input user sehingga penyerang mengubah query | Cari query mentah/concatenation; ORM dipakai mentah?; error DB bocor ke client? | Parameter binding + ORM + user DB least-privilege → `backend`, `hardening` |
| NoSQL injection | Seperti SQL injection tapi ke query NoSQL (operator `$where`, `$ne`) | Cari query dari input mentah; operator dari user lolos? | Validasi skema + query berparameter → `backend`, `hardening` |
| Command injection | Input user sampai ke perintah shell/OS | Cari pemanggilan shell dengan input; pemisah perintah lolos? | Hindari shell; pakai API/pustaka + allowlist → `backend`, `hardening` |
| LDAP injection | Filter LDAP disusun dari input user | Cari filter dari concatenation | Escape/filter berparameter → `backend`, `hardening` |
| XSS (stored/reflected/DOM) | Skrip penyerang jalan di browser korban | Cari output tanpa encode; HTML mentah dari input | Encode sesuai konteks + CSP → `ui-layout`, `hardening` |
| CSRF | Aksi dilakukan atas nama korban lewat situs lain | Aksi state-changing tanpa token/cek origin? | Token CSRF + cek origin + SameSite → `auth`, `hardening` |
| SSRF | Server dipaksa meminta URL internal/metadata cloud | URL dari user difetch tanpa allowlist? | Allowlist + blokir IP internal/metadata → `backend`, `hardening` |
| XXE | Parser XML memproses entitas eksternal | Parser XML dengan DTD/entitas aktif? | Nonaktifkan DTD/entitas eksternal → `backend`, `hardening` |
| SSTI | Template dirender dari input user | Input masuk ke template string? | Jangan render template dari input; pakai template tetap → `backend`, `hardening` |
| Path traversal | Input `../` keluar dari direktori yang diizinkan | Path dari user tanpa normalisasi/batas root? | Normalisasi + batasi ke root + allowlist → `backend`, `hardening` |
| IDOR / BOLA | Akses objek user lain lewat ID | Ganti ID di request: data user lain terbuka? | Otorisasi per objek di server → `auth`, `hardening` |
| Session fixation | Penyerang menetapkan session ID korban | Session ID tidak dirotasi setelah login? | Rotasi session ID saat login → `auth`, `hardening` |
| Credential stuffing & brute force | Tebak password massal dari bocoran/otomatis | Login tanpa rate limit/lockout? | Rate limit + lockout + MFA → `auth`, `hardening` |
| DDoS (L3/L4/L7) | Banjir traffic/koneksi/request membuat layanan tumbang | Rate limit ada? timeout & batas payload ada? WAF/CDN dipakai? | Rate limit + timeout + batas payload + WAF/CDN + guard autoscale → `deploy`, `hardening` (infra: `[USER]`) |
| Insecure deserialization | Data serial dari user di-deserialize tanpa cek | Deserialize objek dari input tak terpercaya? | Format data aman (JSON + skema), jangan deserialize objek mentah → `backend`, `hardening` |
| Clickjacking | Situs korban dibingkai untuk klik tersembunyi | Header framing (X-Frame-Options/CSP frame-ancestors) ada? | Header framing + CSP → `hardening` |
| CORS salah konfigurasi | Origin sembarangan boleh baca respons sensitif | `Access-Control-Allow-Origin: *` + kredensial? | Allowlist origin ketat; jangan `*` + kredensial → `backend`, `hardening` |
| Supply chain | Dependency berbahaya/terbajak masuk lewat paket | Lockfile ada? dependency dipin & diaudit? | Pin + lockfile + audit rutin + update teruji → `hardening`, `deploy` |

## Catatan

- Severity default: injeksi, IDOR, SSRF, deserialisasi → TINGGI/KRITIS
  bila terbukti; sisanya sesuai dampak & bukti.
- DDoS di level aplikasi hanya bisa diperlambat (rate limit, timeout,
  batas payload); penahan penuh butuh infra (WAF/CDN) — itu ranah
  `[USER]`/infra.
- Tiap temuan tetap butuh bukti (lokasi + reproduksi); katalog ini
  bukan daftar tuduhan.
