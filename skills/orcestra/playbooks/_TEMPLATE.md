---
id: <slug-kebab>
title: <judul advisori>
severity: <KRITIS|TINGGI|SEDANG|RENDAH>
status: <active|deprecated|resolved>
published: <YYYY-MM-DD>
components: [<komponen>, ...]
cves: [<CVE-...>, ...]
owner_role: <security|builder|qa>
---

# <Judul Advisori>

Severity **<KRITIS|TINGGI|SEDANG|RENDAH>** · status `<active>` · terbit `<YYYY-MM-DD>`

## 1. Ringkasan eksekutif

<Ringkas 3-5 kalimat: apa advisori ini, komponen terdampak, apakah sudah dieksploitasi, tindakan wajib pengguna.>

## 2. Komponen terdampak

| Komponen | Rentang rentan | Patched |
|---|---|---|
| <release line> | <rentang versi rentan> | <versi patched> |
| <branch tanpa patch> | <semua versi> | **tidak ada** — <paket vendor / backport / upgrade> |

## 3. CVE

| CVE | Sev | Vektor | Dampak |
|---|---|---|---|
| CVE-<tahun>-<nomor> | <high\|medium\|low\|CVSS v4 x.x> | <remote\|local> | <dampak singkat> |

<Catatan: dependency yang diperbarui, status eksploitasi, status KEV.>

## 4. Status lingkungan saat ini

```
<perintah probe>   → <output nyata>
```

- <versi ditemukan vs versi patched> → <rentan / aman>.
- <batasan lingkungan: read-only, sudo diblokir, tak bisa restart>.
- <proses hidup yang menjalankan binary rentan>.

## 5. Yang bisa dilakukan AGENT

| Aksi | Perintah | Bukti |
|---|---|---|
| <audit / inventarisasi / grep log> | `<perintah>` | <hasil nyata> |
| <draft patch / jalankan skrip verifikasi> | `<perintah>` — contoh: `bash playbooks/scripts/verify-runtime-patching.sh` | <output yang dihasilkan> |

## 6. Yang HANYA bisa dilakukan USER

| Aksi | Mengapa |
|---|---|
| `[USER]` <aksi host/panel> | <butuh root/panel/restart> |
| `[USER]` <aksi upgrade/konfigurasi> | <tak bisa dikerjakan agent> |

> Agent **tidak pernah** mengklaim aksi host/panel sudah dilakukan. Tandai selalu `[USER]`.

## 7. Verifikasi

| Perintah | Output diharapkan | Status |
|---|---|---|
| `<perintah>` | `<output>` | ✅/❌ (sekarang: `<output saat ini>`) |

<Verifikasi versi bisa berarti versi proses, bukan hanya versi binary di disk.>

## 8. Rollback

- **Pembatal:** <batalkan sebelum deploy>.
- **Titik irreversibel:** <mis. image lama yang dihapus>.
- **Biaya rollback:** <risiko bila rollback ke versi rentan>.

## 9. Deprecation / EOL

| Baris / Versi | Tanggal EOL | Status |
|---|---|---|
| <versi> | <YYYY-MM-DD> | <didukung / EOL> |

<Dukungan resmi dihapus pada maintenance window berikutnya; target migrasi.>

## 10. Pemicu playbook berikutnya

- <advisory berikutnya untuk komponen yang sama> → ulangi §4 dan §7.
- <restart/deploy container> → ulangi §7.
- <perubahan versi runtime> → ulangi §4.

## 11. Sumber

Diakses <YYYY-MM-DD>:

- <URL primer advisori resmi>
- <URL CVE record>
- <URL advisory upstream / GHSA>

---

## Cara mengisi template ini

1. Salin jadi `playbooks/<slug>.md`. **Jangan** edit `_TEMPLATE.md` langsung.
2. Ganti semua `<placeholder>` dengan fakta terverifikasi dari sumber primer. **Jangan menebak** nomor CVE, versi, tanggal, atau skor CVSS.
3. Isi §4 dengan output probe yang benar-benar dijalankan — bukan asumsi. Jika probe tak bisa dijalankan, tulis alasannya.
4. Tandai tiap tindakan yang butuh root, panel, atau restart host dengan `[USER]` di §6. Pemisahan agent-vs-user mengikat.
5. Set `severity` sesuai kebijakan di `playbooks/README.md`; `status: resolved` hanya setelah §7 lolos.
6. Perbarui tabel index di `playbooks/README.md`.
7. Jaga ringkas: ±900 kata per playbook (tabel, bukan prosa).
8. Kalau §7 punya item yang bisa diotomatisasi, taruh skripnya di `playbooks/scripts/<nama>.sh` (executable, `#!/usr/bin/env bash`, `set -uo pipefail`), satu baris output per item §7, exit non-zero bila ada yang gagal, lalu tambahkan ke tabel index `playbooks/README.md`.
