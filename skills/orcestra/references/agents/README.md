# `references/agents/` — kontrak peran orcestra (portabel)

Folder ini berisi **kontrak peran** keenam agent orcestra dalam format
**OpenCode V2-native** (`permissions:` berurutan).

Isinya sengaja **duplikat** dari `.opencode/agents/`, dan duplikasi itu
disengaja. Baca dokumen ini sebelum mengubah salah satu file.

## Dua lokasi, dua peran

| Lokasi | Peran | Dipakai oleh |
|---|---|---|
| `.opencode/agents/*.md` | **Definisi AKTIF** — ditemukan otomatis oleh OpenCode V2 di project ini. | Runtime OpenCode saat skill orcestra memicu |
| `references/agents/*.md` | **Salinan PORTABEL** — agar skill tetap berguna saat disalin ke mesin/project lain yang **tidak punya** `.opencode/agents/`. | Pembacaan manual, dokumentasi skill, hasil `skill_view` |

## Isi folder

- `architect.md`, `builder.md`, `debugger.md`, `qa.md`, `security.md` — 5
  sub-agent. **Salinan byte-identical** dari `.opencode/agents/`.
- `manager.md` — peran **primary** (orchestrator). **Bukan** salinan: file ini
  tidak ada di `.opencode/agents/`, dan isinya bukan byte-copy.
- `README.md` — dokumen ini.

## Varian per platform

Repo distributabel (`orcestra-skill/`) merender kontrak peran yang sama
menjadi tiga format frontmatter berbeda. **Badan (isi markdown) identik
persis**; hanya frontmatter yang berubah:

| Format | Field | Dipakai oleh |
|---|---|---|
| `agents/opencode/*.md` | `permissions:` (`{action, resource, effect}`, berurutan, match terakhir menang) | OpenCode V2 |
| `agents/claude/*.md` | `tools:` + `disallowedTools:` | Claude Code |
| `agents/universal/*.md` | `name`, `license`, `metadata` | Codex, Cursor, dan agent lain berbasis Agent Skills |

Folder ini (`references/agents/`) berisi varian **OpenCode** — itu yang aktif
dan yang diverifikasi gate byte-parity. Varian lain ada di repo distributabel.

## Aturan byte-identical

Untuk 5 sub-agent, kedua set file **harus tetap identik byte-per-byte**.

Verifikasi (dari root project):

```bash
for n in architect builder debugger qa security; do
  if diff -q ".opencode/agents/$n.md" ".opencode/skills/orcestra/references/agents/$n.md" >/dev/null; then
    echo "IDENTICAL $n"
  else
    echo "DIFFERS $n"
  fi
done
```

Kalau hashes berbeda, salin ulang dengan `cp` — **jangan** menulis ulang isi
file secara manual. Mengetik ulang berisiko menyisipkan perbedaan kecil
(tanda baca, spasi, newline akhir) yang lolos dari pemeriksaan mata tetapi
menyebabkan `diff` gagal.

## Cara memasang di project lain

Jalankan installer repo distributabel — ia menangani skill **dan** kelima
sub-agent sekaligus:

```bash
./install.sh --target /path/ke/project
```

Kalau menyalin manual, sub-agent untuk OpenCode V2:

```bash
mkdir -p <project>/.opencode/agents
cp .opencode/skills/orcestra/references/agents/{architect,builder,debugger,qa,security}.md \
   <project>/.opencode/agents/
```

Catatan:

- **`agents/` (jamak) adalah lokasi yang benar untuk OpenCode V2.** Lokasi V1
  `agent/` (tunggal) masih ditemukan oleh OpenCode V2, tapi `agents/` adalah
  lokasi canonical V2 — gunakan itu.
- `manager.md` **tidak** dipasang ke `.opencode/agents/` secara default. Ia
  adalah agent **primary** (orchestrator), bukan sub-agent. Memasangnya akan
  membuat direktori agent berisi 6 file — bukan 5 — dan memungkinkan agent
  kedua menerima task lalu memanggil agent lain. Peran manager berjalan di
  sesi utama (yaitu skill `orcestra` itu sendiri).
- Setelah menyalin, restart/reload OpenCode supaya agent baru terdeteksi.

## Format frontmatter

Seluruh file di folder ini memakai **frontmatter V2-native saja**:

```yaml
---
description: <apa perannya, kapan dipakai>
mode: subagent        # atau: primary
steps: 40
color: "#22c55e"
permissions:
  - action: read
    resource: "*"
    effect: allow
  ...
---
```

Field yang **dipakai**: `description`, `mode`, `steps`, `color`, `permissions`.

Field yang **dilarang** (format V1, diabaikan OpenCode V2):

- `tools:` — digantikan `permissions` dengan `action`/`resource`/`effect`.
- `temperature:` — V2 mengatur sampling lewat model/variant, bukan per-agent.
- `prompt:` — digantikan isi body markdown.
- `permission:` — nama V1 untuk blok izin; V2 memakai `permissions`.
- `maxSteps:` — V2 memakai `steps`.
- `name:` / `variant:` — bukan field frontmatter V2 yang valid.
- `model:` — **tidak dipin** di agent. Sub-agent mewarisi model parent
  (keputusan D4 di `PLAN.md`). Kalau perlu pinning, lakukan di
  `opencode.json` lewat `agents.<id>.model`.

Kalau ada file yang mencampur format V1 dan V2, OpenCode V2 akan
**memperingatkan** bahwa field V1 diabaikan (`tools`, `temperature`, dll.)
dan memakai nilai default — bukan error, tapi perilakunya tidak lagi kamu
kendalikan. Karena itu, semua file di folder ini wajib V2-only; pemeriksaan
otomatis:

```bash
grep -nE '^(tools|temperature|prompt|permission|maxSteps|name|variant|model):' \
  .opencode/skills/orcestra/references/agents/*.md \
  && echo "FAIL: ada field V1" || echo "PASS: V2-only"
```

## Ringkas

- `.opencode/agents/` = **aktif**, auto-discovered, **5 sub-agent**.
- `references/agents/` = **portabel**, untuk dibawa ke mesin/project lain.
- 5 sub-agent: harus **byte-identical** (verifikasi dengan `diff`).
- `manager.md`: agent **primary**, **tidak** di-`.opencode/agents/` secara default.
- Semua file: frontmatter **V2-only**.
