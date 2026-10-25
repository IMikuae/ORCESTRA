# orcestra

**Skill agent multi-agent untuk OpenCode V2, Claude Code, Codex, Cursor, dan agent
lain yang mendukung [Agent Skills](https://agentskills.io).**

Satu repo, satu perintah, banyak platform. Clone → bilang "tambahkan orcestra"
ke AI → agent itu menjalankan `install.sh` → skill aktif.

---

## 1. Yang kamu dapat

| Komponen | Isi |
|---|---|
| `skills/orcestra/` | **Skill** — `SKILL.md` + `references/` (routing, katalog 921 skill, workflow) + `playbooks/` (CVE/advisory) |
| `agents/opencode/` | 6 agent OpenCode V2 (5 sub-agent + manager) — `permissions:` berurutan |
| `agents/claude/` | 6 agent Claude Code (5 sub-agent + manager) — `tools:` / `disallowedTools:` |
| `agents/universal/` | 6 agent Agent Skills spec — untuk Codex, Cursor, dan lainnya |
| `src/agents/` | Sumber tunggal; `build.py` merender ketiga varian darinya |
| `install.sh` | Installer multi-platform (deteksi otomatis) |

---

## 2. Pasang

### Cara A — suruh AI (paling sesuai maksud "tinggal git dan suruh add")

```bash
git clone https://github.com/IMikuae/ORCESTRA.git orcestra
cd orcestra
```

Lalu, di sesi AI-mu (OpenCode / Claude Code / Codex / Cursor), cukup bilang:

> **Tambahkan skill orcestra dari folder ini.**

AI akan membaca `AGENTS.md` di repo, menjalankan `install.sh`, dan
memverifikasi hasilnya. Repo ini sudah berisi `AGENTS.md` yang memberi tahu AI
persis apa yang harus dilakukan — jadi "suruh add" cukup jadi satu kalimat.

Prompt yang bisa langsung di-paste:

```
Tambahkan skill orcestra dari folder ini. Baca AGENTS.md dan install.sh di
repo, jalankan ./install.sh, lalu verifikasi hasilnya dan laporkan ke saya
platform mana yang terpasang dan ke direktori mana.
```

### Cara B — satu perintah (manual)

```bash
git clone https://github.com/IMikuae/ORCESTRA.git orcestra
cd orcestra
./install.sh                 # deteksi platform yang terpasang
```

Opsi:

```bash
./install.sh --agent opencode claude-code   # pilih platform tertentu
./install.sh --global                        # pasang untuk semua project (home dir)
./install.sh --target /path/ke/project       # pasang ke project lain
./install.sh --dry-run                       # tampilkan rencana, tanpa menulis
./install.sh --uninstall                     # copot dari project ini
node verify.mjs                              # cek paket utuh (175 pemeriksaan)
```

### Cara C — `npx skills` (ecosystem resmi, 75+ agent)

```bash
npx skills add IMikuae/ORCESTRA --skill orcestra -a opencode -a claude-code -a codex
```

CLI `skills` mencari skill di `skills/<nama>/SKILL.md` — letaknya sudah sesuai.

> **Catatan:** `npx skills` hanya memasang **skill**. Enam definisi agent
> (5 sub-agent + manager) harus disalin manual — pakai `install.sh` (Cara B)
> untuk semuanya sekaligus.

---

## 3. Di mana file ditaruh

| Platform | Skill | Sub-agent |
|---|---|---|
| **OpenCode V2** | `.opencode/skills/orcestra/` | `.opencode/agents/*.md` |
| **Claude Code** | `.claude/skills/orcestra/` | `.claude/agents/*.md` |
| **Codex / Cursor / Cline / Gemini / Zed / Warp / …** | `.agents/skills/orcestra/` | — (lihat §6) |
| **Global (semua project)** | `~/.config/opencode/skills/`, `~/.claude/skills/`, `~/.agents/skills/` | `~/.config/opencode/agents/`, `~/.claude/agents/` |

Tiga lokasi skill di atas **saling dibaca** oleh masing-masing agent. Installer
menulis ke semuanya, jadi agent mana pun yang kamu pakai akan menemukannya.

### Prioritas bila skill terpasang di lebih dari satu tempat

OpenCode memuat sumber yang **terakhir terdaftar** (lihat `opencode.ai/v2/docs/skills`):

```
~/.config/opencode/skills/   ← lebih rendah
.opencode/skills/            ← dimuat
```

Semua salinan dalam paket ini identik, jadi tidak ada konflik.

---

## 4. Format: kenapa tiga varian agent

Satu bodies (kontrak peran) → tiga frontmatter berbeda. Hanya frontmatter yang
berbeda; isi (peran, aturan kerja, format laporan) **sama persis**.

| | OpenCode V2 | Claude Code | Universal |
|---|---|---|---|
| Field | `permissions:` (`{action, resource, effect}`, urutan, match terakhir menang) | `tools:` + `disallowedTools:` | — (tidak ada field enforced) |
| Granularitas | per-path (`edit` → `PLAN.md` saja) | per-tool | teks di bodies |
| Frontmatter lain | `mode`, `steps`, `color` | `name`, `model: inherit` | `name`, `license`, `metadata` |

`build.py` menerjemahkan tabel izin OpenCode ke daftar tool Claude Code, lalu
**memverifikasi** hasil terjemahannya cocok dengan tabel aslinya. Kalau izin
berubah tanpa terjemahan ikut berubah, build gagal — bukan diam-diam melenceng.

```bash
python3 build.py            # render + verifikasi
python3 build.py --check    # hanya verifikasi (fails kalau output basi)
```

---

## 5. Cara kerja (ringkas)

Kamu adalah **MANAGER**. Kamu tidak menulis kode proyek — hanya `TASKS.md` dan
`PLAN.md`. Kamu membagi kerja ke 5 sub-agent, idealsnya paralel:

| Agent | Peran | Boleh edit? |
|---|---|---|
| `architect` | struktur, stack, rencana (`PLAN.md`) | ya — kerangka saja |
| `builder` | implementasi kode/konfigurasi | ya — file yang ditugaskan |
| `debugger` | akar masalah, build error | ya — perubahan minimal |
| `qa` | test & verifikasi | tidak — kode aplikasi |
| `security` | audit keamanan | tidak — read-only mutlak |

Loop: baca `TASKS.md` → pilih baris `todo` → cek tabrakan file → delegasi →
kumpulkan bukti → ulangi. Detail lengkap ada di `references/workflow.md`.

**Katalog 921 skill adalah blueprint, bukan skill terpasang** — `callable: false`
untuk semuanya. Jangan menjanjikan "saya menjalankan skill X".

---

## 6. Platform tanpa format sub-agent

Codex, Cursor, Cline, Gemini CLI, Zed, Warp, dan agent lain yang hanya mendukung
*skill* (bukan sub-agent terpisah) tetap dapat memakai orcestra:

1. **Skill-nya terpasang** di `.agents/skills/orcestra/` → AI memuatnya saat
   relevan.
2. **Peran manager** dijalankan AI itu sendiri; skill berisi kontrak peran,
   matriks routing, format brief, dan kosakata papan.
3. **Kelima peran** (`architect`, `builder`, `debugger`, `qa`, `security`) tersedia
   sebagai kontrak lengkap di `agents/universal/*.md`. AI dapat memperlakukan
   tiap peran sebagai "sub-agent" melalui fitur multi-agent yang dimilikinya,
   atau meniru peran tersebut secara bergilir dalam satu sesi.

Platform yang punya format sub-agent sendiri (OpenCode, Claude Code) memakai
varian masing-masing agar batas file ditegakkan oleh sistem, bukan sekadar
disiplin.

---

## 7. Isi paket

```
orcestra/
├── README.md                  ← file ini
├── AGENTS.md                  ← instruksi untuk AI: apa yang harus dilakukan saat
│                                user minta "tambahkan orcestra"
├── install.sh                 ← installer multi-platform
├── LICENSE                    ← MIT
├── build.py                   ← render varian agent dari src/agents/
├── src/agents/                ← sumber tunggal (OpenCode V2 = canonical)
│   ├── architect.md  builder.md  debugger.md
│   ├── qa.md         security.md manager.md
├── agents/                    ← hasil render (dipakai installer)
│   ├── opencode/    claude/    universal/
├── skills/orcestra/           ← skill (Agent Skills spec)
│   ├── SKILL.md
│   ├── references/
│   │   ├── capabilities.md      ← L1: 25 arketipe + matriks routing
│   │   ├── catalog.index.json   ← L2: 921 skill, machine-readable
│   │   ├── catalog.md           ← L3: 921 baris + cara menambah skill
│   │   ├── workflow.md          ← loop, brief, bukti, tabrakan file
│   │   ├── TASKS-template.md    ← papan tugas
│   │   └── agents/              ← 5 sub-agent + manager (OpenCode flavour)
│   └── playbooks/
│       ├── README.md            ← indeks + kapan dipakai
│       ├── _TEMPLATE.md
│       ├── runtime-patching.md  ← advisory CVE / upgrade runtime
│       └── scripts/verify-runtime-patching.sh
```

---

## 8. Verifikasi

```bash
# skill terbaca?
opencode api get /api/skill     # OpenCode V2 — cari id "orcestra"
# agent terbaca?
opencode debug agents            # cari architect, builder, debugger, qa, security
```

> **Catatan:** server OpenCode melakukan cache daftar project. Right setelah
> `install.sh` pertama kali membuat folder project baru, query pertama bisa
> masih kosong — jalankan ulang sekali, atau mulai sesi agent baru.

Untuk Claude Code: sub-agent muncul sebagai `/architect`, `/builder`, dan
sebagainya. Untuk Codex/Cursor: skill muncul di daftar skill.

Paket juga bisa dicek sendiri, tanpa memasang apa pun:

```bash
node verify.mjs     # 175 pemeriksaan: format frontmatter, paritas, katalog, link
```

---

## 9. Kustomisasi

| Ingin ubah | Edit |
|---|---|
| Peran / aturan kerja agent | `src/agents/<peran>.md` → `python3 build.py` |
| Izin (permissions) | `src/agents/<peran>.md` (frontmatter `permissions:`) → `python3 build.py` |
| Routing skill | `skills/orcestra/references/capabilities.md` |
| Katalog skill | `skills/orcestra/references/catalog.md` § "Cara menambah skill" |
|.Playbook baru | `skills/orcestra/playbooks/_TEMPLATE.md` |

Setelah mengubah `src/agents/`, **selalu** jalankan `python3 build.py` —Ia
memverifikasi bahwa terjemahan izin ke Claude Code masih konsisten.

---

## 10. Lisensi

MIT. Lihat `LICENSE`.
