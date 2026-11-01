# Daftar Skill & Sub-Skill Orcestra

Satu skill utama, enam peran yang bisa dipakai **semua atau satu-satu**
sesuai kebutuhan. Peran di sini sering disebut "sub-skill": kontrak kerja
lengkap yang bisa dipanggil sendiri tanpa menjalankan seluruh tim.

Di luar itu, paket ini multi-skill: skill lain terdaftar berdampingan dan
dipasang sekaligus oleh `install.sh`, bukan dikunci ke satu skill saja.

## Skill utama

| Nama | Jenis | Dipakai untuk |
|---|---|---|
| `orcestra` | skill utama | Orkestrasi tim penuh: manager membagi tugas ke sub-agent lewat papan `TASKS.md`. Ini mode default. |

## Peran (sub-skill)

| Peran | Jenis | Dipakai sendiri untuk | Output |
|---|---|---|---|
| `manager` | primary (orchestrator) | Merencanakan dan membagi tugas; **bukan** sub-agent yang dipasang | `TASKS.md`, `PLAN.md` |
| `architect` | sub-agent | Merancang stack, struktur, dan pembagian modul sebelum implementasi | `PLAN.md` + kerangka (spesifikasi) |
| `builder` | sub-agent | Mengimplementasikan kode sesuai brief dan batas file | kode + bukti build |
| `debugger` | sub-agent | Mencari akar masalah dan memperbaiki dengan perubahan minimal | patch + bukti build/test hijau |
| `qa` | sub-agent | Menulis dan menjalankan test, menguji alur dan edge case | test + laporan lulus/gagal |
| `security` | sub-agent | Audit keamanan read-only (secret, dependency, auth, injection) | temuan severity + bukti |

Benar: selain `architect` masih ada lima peran lain — `manager`,
`builder`, `debugger`, `qa`, dan `security`.

## Pilih semua atau satu

- **Semua (tim penuh):** panggil skill `orcestra`, manager yang membagi
  tugas. Cocok untuk pekerjaan besar yang perlu dipecah.
- **Satu peran saja:** panggil peran itu langsung, tanpa manager dan tanpa
  peran lain. Cocok untuk tugas yang sudah jelas batasnya, misalnya
  "cuma minta `architect` buatkan `PLAN.md`" atau "cuma minta `qa`
  menguji fitur ini".
- **Sebagian:** sebutkan peran yang dipakai ("pakai `builder` dan `qa`
  saja") — manager hanya mendelegasikan ke peran yang disebut.

## Skill lain yang terpasang

| Skill | Dipakai untuk | Output |
|---|---|---|
| `audit-proyek` | Audit proyek sekali jalan: backend, layout UI, keamanan kilat | daftar temuan siap jadi baris `TASKS.md` |
| `ui-layout` | Membangun layout tanpa celah/overflow, responsif, semua state tertangani | file layout/komponen + checklist yang lolos |

Skill `orcestra` sebagai orchestrator menjalankan banyak skill: bila task
butuh skill terpasang lain (mis. `audit-proyek`), manager memasukkannya
ke brief dan papan — itulah logikanya: orcestra mengatur, skill lain
mengeksekusi keahliannya.

## Cara memanggil per peran

| Platform | Caranya |
|---|---|
| OpenCode V2 | Sub-agent terpasang di `.opencode/agents/`; panggil lewat nama (`architect`, `builder`, `debugger`, `qa`, `security`). Manager = sesi utama dengan skill `orcestra`. |
| Claude Code | Sub-agent muncul sebagai `/architect`, `/builder`, `/debugger`, `/qa`, `/security`. |
| Codex / Cursor / Hermes / lainnya | Kontrak peran lengkap ada di [`agents/`](agents/) (dibaca sebagai konteks); jalankan peran itu dalam sesi, atau delegasikan lewat fitur multi-agent platform tersebut (Hermes: `delegate_tool`). |

## Kontrak lengkap per peran

Definisi tiap peran (tanggung jawab, batas izin, aturan kerja, checklist
selesai) ada di [`agents/`](agents/) — sumber tunggalnya
`src/agents/<peran>.md` di repo, dirender ke tiga varian platform oleh
`build.py`. Aturan mode eksekusi (tanya-satu-satu vs langsung) ada di
[`execution-modes.md`](execution-modes.md); playbook audit ada di
[`../playbooks/`](../playbooks/).
