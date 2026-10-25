---
id: runtime-patching-2026-10
title: Runtime Patching Oktober 2026 (Node2Shell + PHP2Shell)
severity: KRITIS
status: active
published: 2026-10-25
components: [nodejs, php]
cves: [CVE-2026-111497, CVE-2026-109618, CVE-2026-109619]
owner_role: security
---

# Runtime Patching Oktober 2026 — Node2Shell + PHP2Shell

Severity **KRITIS** (CRITICAL) · status `active` · terbit 2026-10-25

## 1. Ringkasan eksekutif

Pada 21 Oktober 2026 Node.js dan PHP menerbitkan rilis keamanan yang sama. `CVE-2026-111497` (Node2Shell) memberi RCE lewat OOB write decoder Brotli; `CVE-2026-109618`/`CVE-2026-109619` (PHP2Shell) memberi RCE lewat out-of-memory corruption dan stale global state — keduanya CVSS v4 **9.2**, PHP2Shell **dieksploitasi sejak 2026-10-21**. Patched: Node.js 22.23.4 / 24.22.1 / 26.12.1; PHP 8.2.35 / 8.3.36 / 8.4.27 / 8.5.12; branch EOL ikut terdampak. **Bun** membawa decoder Brotli yang sama dan baru patched di **1.4.4** (22 Okt 2026). Container ini menjalankan Node.js v22.23.3 (**rentan**), Bun 1.4.2 (**rentan**), dan PHP 8.1.2 (**tanpa fix upstream**). Container tak bisa patch/restart dirinya (`/etc` & `/usr/local` read-only, `sudo` diblokir, `apt-get update` gagal), jadi **user wajib reload/restart container dari panel hosting/<provider>** agar binary baru aktif.

## 2. Komponen terdampak

| Komponen | Rentang rentan | Patched |
|---|---|---|
| Node.js 22.x | < 22.23.4 (incl. 22.23.3) | 22.23.4 |
| Node.js 24.x | < 24.22.1 | 24.22.1 |
| Node.js 26.x | < 26.12.1 | 26.12.1 |
| Node.js 20/21/23/25 | EOL, tanpa patch | — (migrasi ke 24.x/26.x) |
| **Bun** (bundel Brotli sendiri) | **< 1.4.4** (incl. 1.4.2, 1.4.3) | **1.4.4** (rilis 2026-10-22) |
| Python — paket `brotli`/`brotlicffi` | < 1.2.1 / < 1.1.1 / < 1.0.10 | 1.2.1 / 1.1.1 / 1.0.10 |
| PHP 8.5.x | < 8.5.12 | 8.5.12 |
| PHP 8.4.x | < 8.4.27 | 8.4.27 |
| PHP 8.3.x | < 8.3.36 | 8.3.36 |
| PHP 8.2.x | < 8.2.35 | 8.2.35 |
| PHP 8.1.x | semua versi | **tidak ada** (paket distro/LTS, backport php-src, atau upgrade) |
| PHP 8.0.x / 7.4.x | semua versi | **tidak ada** (backport vendor atau upgrade) |
| PHP 7.3 ke bawah (incl. PHP 5) | semua versi | **tidak ada** — wajib upgrade |

Semua instalasi PHP yang melayani request web masuk scope: PHP-FPM, Apache mod_php, php-cgi, LiteSpeed, FrankenPHP. Risiko tertinggi pada **Apache mod_php** — serangan sukses sebelum kode aplikasi berjalan.

## 3. CVE

| CVE | Sev | Vektor | Dampak |
|---|---|---|---|
| CVE-2026-111497 | high | Remote (Brotli) | OOB write decoder Brotli → RCE. Block switch rusak dilaporkan "need more input" (bukan error format permanen) sehingga decoder streaming menumpuk di buffer internal 8-byte. Crash, leak memori, atau RCE bila app dekompres data tak dipercaya via `node:zlib`. 26/24/22.x. **Runtime lain yang membawa decoder Brotli yang sama: Bun < 1.4.4** (bundel Brotli sendiri; `bun:zlib`, `fetch`, dan `DecompressionStream` semuanya menyentuh decoder itu). |
| CVE-2026-105482 | high | Remote (DNS) | `dns.resolve*()`/`dns.reverse()` memotong hostname ber-NUL: `attacker.example\0.trusted.example` → `attacker.example`, memintas allowlist yang resolve setelah validasi. Fix tak lengkap atas CVE-2026-48930. 26/24/22.x |
| CVE-2026-105483 | high | Remote (TLS) | Bypass verifikasi hostname bila host ditulis digit fullwidth (`１２７.0.0.1`): `tls.checkServerIdentity()` tak recognize sebagai IP lalu mencocokkan ke DNS name/CN, jadi sertifikat `DNS:127.0.0.1` bisa autentikasi endpoint IP yang bukan penerbitnya. Regresi setelah fix CVE-2026-48618. 26/24.x |
| CVE-2026-106069 | high | Remote (TLS) | Bypass verifikasi hostname dengan literal IPv4 ber-leading-zero (`0127.0.0.1`): aturan WHATWG URL baca oktal (87.0.0.1), OS resolver bisa baca desimal (127.0.0.1). 26/24/22.x |
| CVE-2026-105481 | medium | Remote (keep-alive) | Reuse socket keep-alive Agent bisa menerima response yang ditulis sebelum request dikirim. Fix tak lengkap atas CVE-2026-48931. 26/24/22.x |
| CVE-2026-106072 | medium | Remote (TLS) | Sertifikat bersan DNS saja autentikasi endpoint IP saat klien terhubung lewat ejaan IPv4 non-kanonik (`0177.0.0.1`, `0x7f.0.0.1`, `2130706433`, `127.1`). 26/24/22.x |
| CVE-2026-106074 | medium | Lokal (snapshot/SEA) | Cache entropi `crypto.randomUUID()`/`randomUUIDv7()`/`randomInt()` dibekukan ke startup snapshot `--build-snapshot` dan SEA → tiap proses mengulang nilai sama (hingga 127 UUID, ~1000 randomInt). 26/24/22.x |
| CVE-2026-106070 | low | Remote (file ZIP) | `zlib.ZipFile` mengembalikan byte prefix yang dikontrol penyerang setelah validasi header ZIP gagal; CRC-32 tetap lolos. 26.x |
| CVE-2026-106071 | low | Lokal (Permission Model) | Over-grant filesystem via wildcard radix lookup (`--allow-fs-read=/etc/passwd.*` juga izinkan `/etc/passwd`). 26.x |
| CVE-2026-106073 | low | Lokal (Permission Model) | Bypass Permission Model via `fs.realpathSync()` (bukan `fs.realpathSync.native()`). 26/24/22.x |
| CVE-2026-109618 | CVSS v4 **9.2** | Remote (request web) | RCE via out-of-memory corruption: PHP kehabisan memori di tengah setup request, meninggalkan data internal setengah dibangun yang dipercaya kode cleanup |
| CVE-2026-109619 | CVSS v4 **9.2** | Remote (request web, shared worker) | RCE via stale global state: state internal bertahan melebihi memori request yang ditunjuk, sehingga request berikutnya di worker PHP yang sama bertindak atas data sisa |

Rilis sama juga memperbarui **c-ares**, **ca-cert** (kompromi eMudhra Intermediate CA), **OpenSSL**, **SQLite**, **Undici**.

PHP2Shell: **dieksploitasi aktif sejak 2026-10-21** (honeypot watchTowr Attacker Eye); **belum di katalog CISA KEV** saat advisory terbit; ditemukan researcher dari Calif; detail bocor di media sosial 2026-10-20, sebelum disclosure 2026-10-22. **PHP menyatakan tak ada perubahan konfigurasi yang memitigasi penuh kedua CVE ini.**

## 4. Status lingkungan saat ini

Probe di container ini (2026-10-25):

```
node -v                                    → v22.23.3
bun -v                                     → 1.4.2
php -v                                     → PHP 8.1.2-1ubuntu2.26 (cli)
php -i | grep -i upload_progress           → session.upload_progress.enabled => On => On
pgrep -x node | wc -l                      → 6
for p in $(pgrep -x node); do echo "$p $(readlink /proc/$p/exe) $(stat -L -c %i /proc/$p/exe)"; done
                                           → 6 baris, semua /usr/bin/node inode 2001074
stat -c '%y %i' /usr/bin/node               → 2026-09-23 07:56:48 +0000  inode 2001074
```

- Node.js **v22.23.3 < 22.23.4** → **rentan CVE-2026-111497**; runtime membawa brotli **1.1.0**.
- **Bun 1.4.2 < 1.4.4** → **rentan CVE-2026-111497**. Bun membundel decoder Brotli sendiri dan di versi ini belum membawa fix (`bun -e "console.log(typeof require('zlib').brotliDecompressSync)"` → `function`). Fix masuk di **Bun 1.4.4** (rilis 2026-10-22).
- Python **3.10.12** → stdlib `zlib` **tidak punya** decoder Brotli, dan paket `brotli`/`brotlicffi` **tidak terpasang** di container ini (`import brotli` → `ModuleNotFoundError`) → **tak terdampak di sini**. Tapi paket Python `brotli`/`brotlicffi` juga rentan CVE-2026-111497 bila terpasang (fix: Brotli 1.2.1 / 1.1.1 / 1.0.10).
- Go **1.27.2** → **tak terdampak**: runtime Go tidak punya decoder Brotli native.
- PHP **8.1.2-1ubuntu2.26** → branch 8.1, **tak ada fix upstream** untuk CVE-2026-109618/109619.
- `session.upload_progress.enabled = On` → **jalur pemicu terkonfirmasi** pada eksploitasi terobservasi.
- Tak ada PHP-FPM/Apache/nginx/php-cgi (`dpkg -l` hanya `php-cli`) → tak ada service PHP berbasis web di sini, tapi host lain bisa.
- Binary Node `/usr/bin/node` (`nodejs 22.23.3-1nodesource1`) terpasang **2026-09-23**, sebelum rilis patch. **6 proses Node** hidup saat probe (hasil probe di environment ini), seluruhnya `/proc/<pid>/exe` → inode `2001074` yang sama → **semua menjalankan binary rentan v22.23.3**; setelah binary diganti ke 22.23.4, proses lama tetap jalan di versi lama sampai di-restart. **Jangan hard-code daftar PID** — hitung ulang tiap kali: `pgrep -x node | wc -l` dan loop `for p in $(pgrep -x node)`.
- `/etc` & `/usr/local` **read-only**; `sudo` ditolak (`no new privileges`); `apt-get update` gagal (`Acquire (30): Read-only file system`) → container tak bisa patch dirinya.

## 5. Yang bisa dilakukan AGENT

| Aksi | Perintah | Bukti |
|---|---|---|
| Audit pemakaian Brotli pada input tak dipercaya | `grep -rn "brotliDecompress" --include=*.js --include=*.mjs work repo src \| grep -v node_modules` | `<project>/src/mitm/logger.js:44` → `zlib.brotliDecompressSync(buf)` pada body request proxy. Path konkret di environment ini: `work/yuerouter/src/mitm/logger.js:44` dan `work/yuerouter-legacy/src/mitm/logger.js:44` — **fakta yang dipakai: dekompresi Brotli pada body request proxy adalah jalur yang terjangkau** |
| Enumerasi proses Node (dinamis — jangan hard-code PID) | `pgrep -x node \| wc -l` lalu `for p in $(pgrep -x node); do echo "$p $(readlink /proc/$p/exe) $(stat -L -c %i /proc/$p/exe)"; done` | hasil probe di environment ini: **6 proses Node**, semua `/usr/bin/node` inode `2001074` (biner rentan). Hitung ulang tiap kali — PID berubah antar-run |
| Inventarisasi lokasi binary | `which -a node php bun; readlink -f /usr/bin/node; dpkg -l \| grep nodejs` | nodejs 22.23.3-1nodesource1 di `/usr/bin/node` |
| Rencana instalasi userland tanpa root | unduh tarball Node 22.23.4 ke `~/.local/node-22.23.4`, override PATH/absolute path | binary baru terisolasi tanpa sentuh `/usr/local` (read-only) |
| Grep log indikasi eksploitasi | `grep -rEi "SIGSEGV\|segfault" log/ \| grep -i -B2 "br"` | cari dump MITM + crash setelah request `Content-Encoding: br` |
| Jalankan skrip verifikasi (sudah tersedia) | `bash playbooks/scripts/verify-runtime-patching.sh` | satu baris output per item §7; exit non-zero bila ada item yang gagal |

## 6. Yang HANYA bisa dilakukan USER

| Aksi | Mengapa |
|---|---|
| `[USER]` Reload/restart container dari panel hosting/<provider> | Patch baru hanya hidup setelah container dimuat ulang; file di disk yang baru belum aktif. Container tak bisa restart dirinya (`/etc` & `/usr/local` read-only, `sudo` diblokir) |
| `[USER]` Upgrade PHP keluar dari branch 8.1 ke 8.2.35+/8.3.36+/8.4.27+/8.5.12, atau paket distro/LTS, atau backport php-src | Branch 8.1 tak punya rilis patch upstream, dan **tak ada perubahan konfigurasi yang memitigasi penuh** (pernyataan resmi PHP) |
| `[USER]` Restart setiap PHP worker / FPM pool setelah update | Worker lama menyimpan state global yang menunjuk ke memori request tak valid → CVE-2026-109619 tetap eksploitabel walau binary sudah dipatch |
| `[USER]` Batasi akses internet ke sistem PHP yang belum bisa diupdate | Mengurangi permukaan eksploitasi PHP2Shell aktif |
| `[USER]` Upgrade Bun ke **1.4.4+** (atau reload image yang sudah membawa Bun 1.4.4) | Bun ≤ 1.4.3 membawa decoder Brotli yang sama dan **rentan CVE-2026-111497**; fix masuk di Bun 1.4.4 (2026-10-22). Container tak bisa upgrade dirinya sendiri (`/etc` & `/usr/local` read-only, `sudo` diblokir) |
| `[USER]` Rencanakan migrasi dari Node.js 20/21/23/25 | Dukungan baris itu dihapus permanen di maintenance window berikutnya |

## 7. Verifikasi

| Perintah | Output diharapkan | Status |
|---|---|---|
| `node -v` | `v22.23.4` atau lebih tinggi | ❌ (`v22.23.3`) |
| `bun -v` | `1.4.4` atau lebih tinggi | ❌ (`1.4.2`) |
| `php -v` | `8.2.35`/`8.3.36`/`8.4.27`/`8.5.12` | ❌ (`8.1.2-1ubuntu2.26`) |
| `stat -c '%y' /usr/bin/node` | tanggal ≥ 2026-10-21 | ❌ (`2026-09-23 07:56:48`) |
| `for p in $(pgrep -x node); do readlink /proc/$p/exe; done` | semua menunjuk 22.23.4 | ❌ (semua inode 2001074 = 22.23.3) |
| `for p in $(pgrep -x node); do [ "$(date -d "$(ps -o lstart= -p $p)" +%s)" -ge "$(stat -c %Y /usr/bin/node)" ] && echo "$p OK" \|\| echo "$p STALE"; done` | semua `OK` (proses start **setelah** binary dipatch) | ❌ (binary belum dipatch) |
| `php -i \| grep -i upload_progress` | `enabled => Off` atau branch sudah dipatch | ❌ (masih `On`) |

Jalankan semuanya sekaligus: `bash playbooks/scripts/verify-runtime-patching.sh` — satu baris output per baris tabel di atas, exit non-zero bila ada yang ❌.

Kunci: **verifikasi versi proses, bukan hanya versi binary di disk.** Binary patched tapi proses lama = belum aman. Bandingkan *waktu mulai proses* vs *waktu binary dipatch*, bukan vs tanggal CVE. Jumlah proses = `pgrep -x node | wc -l` (**6** saat probe 2026-10-25) — hitung ulang, jangan hard-code daftar PID.

## 8. Rollback

- **Pembatal:** batalkan sebelum user reload — urungkan PATH, symlink userland, skrip start service.
- **Titik irreversibel:** image/snapshot lama yang sudah diganti tak bisa dipulihkan dari dalam container; pemulihan lewat panel (deploy ulang image lama).
- **Node.js:** simpan tarball 22.23.4 di `~/.local/` agar rollback cepat (binary stateless). **Rollback ke binary rentan membuka kembali CVE-2026-111497** — hanya sah bila app terbukti rusak, dan sementara saja.
- **Bun:** **Rollback ke Bun ≤ 1.4.3 membuka kembali CVE-2026-111497** (decoder Brotli yang sama).
- **PHP:** mengembalikan worker ke binary 8.1 lama **membuka kembali CVE-2026-109618/109619** yang aktif dieksploitasi — hanya langkah sementara sambil menyiapkan upgrade.
- **Biaya rollback:** rollback mengaktifkan kembali RCE yang sudah dieksploitasi; wajib dicatat di `TASKS.md` sebagai baris `catatan` lengkap dengan tanggal kadaluarsa rollback, dan hanya boleh lewat `[USER]`.
- Konfigurasi tak bisa menggantikan patch PHP; ia hanya mengurangi risiko.

## 9. Deprecation / EOL

| Baris Node.js | EOL | Status |
|---|---|---|
| 26.x | 30 Apr 2029 | didukung |
| 24.x | 30 Apr 2028 | didukung (target migrasi) |
| 22.x | 30 Apr 2027 | didukung; security release tetap impacting |
| 25.x | 1 Jun 2026 | EOL |
| 20.x | 30 Apr 2026 | EOL |
| 21.x | 1 Jun 2024 | tidak didukung |
| 23.x | 1 Jun 2025 | tidak didukung |

**Provider hosting akan menghapus dukungan secara permanen untuk Node.js versi 20, 21, 23, dan 25.** Semuanya sudah End-of-Life dan tak lagi menerima patch keamanan upstream. Migrasikan ke branch LTS (**24.x** atau **26.x**).

## 10. Pemicu playbook berikutnya

- Advisory keamanan Node.js berikutnya → ulangi §4 dan §7.
- Advisory keamanan Bun berikutnya → ulangi §4 dan §7 (`bun -v`).
- Advisory PHP berikutnya atau CVE masuk CISA KEV → ulangi §4 dan §7.
- Container di-restart minimal 1x → ulangi §7 (cek versi proses, bukan binary disk).
- Perubahan versi runtime → ulangi §4.
- Baris EOL mendekati tanggal EOL → tinjau §9.

## 11. Sumber

Diakses 2026-10-25:

- Node.js security release 21 Okt 2026 — https://nodejs.org/en/blog/vulnerability/october-2026-security-releases
- **Bun v1.4.4** (rilis 22 Okt 2026, membawa fix Brotli) — https://bun.com/blog/bun-v1.4.4
- **oven-sh/bun issue 46352** — decoder Brotli belum membawa fix CVE-2026-111497 — https://github.com/oven-sh/bun/issues/46352
- **Bun GHSA-663w-cv8g-jj2p** (Bun ≤ 1.4.3 affected, fixed in 1.4.4) — https://github.com/oven-sh/bun/security/advisories/GHSA-663w-cv8g-jj2p
- **Aikido Node2Shell advisory** ("For Bun, upgrade to 1.4.4 or newer") — https://www.aikido.dev/blog/node2shell-nodejs-brotli-rce-cve-2026-111497
- PHP 21 Okt 2026 security release — https://www.php.net/archive/2026.php#2026-10-21-5
- php-src GHSA-w8hw-w9fx-j79w — https://github.com/php/php-src/security/advisories/GHSA-w8hw-w9fx-j79w
- php-src GHSA-6wmf-4rv5-p3rp — https://github.com/php/php-src/security/advisories/GHSA-6wmf-4rv5-p3rp
- CVE records — https://www.cve.org/CVERecord?id=CVE-2026-111497 (juga CVE-2026-109618, CVE-2026-109619)
- **Brotli upstream fix** (juga dirilis sebagai 1.2.1 / 1.1.1 / 1.0.10) — https://github.com/google/brotli/commit/0ed4268a
- watchTowr Attacker Eye — PHP2Shell FAQ — https://watchtowr.com/blog/
