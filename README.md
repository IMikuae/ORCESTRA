# orcestra

**Skill agent multi-agent untuk OpenCode V2, Claude Code, Codex, Cursor, Hermes,
dan agent lain yang mendukung [Agent Skills](https://agentskills.io).**

Satu repo, satu perintah, banyak platform. Clone → bilang "tambahkan orcestra"
ke AI → agent itu menjalankan `install.sh` → skill aktif.

---

## 1. Yang kamu dapat

| Komponen | Isi |
|---|---|
| `skills/orcestra/` | **Skill utama (orchestrator)** — `SKILL.md` + `references/` (routing, katalog 921 skill, workflow, mode eksekusi) + `playbooks/` (advisory, audit backend, audit UI) |
| `skills/audit-proyek/` | **Skill audit** — audit proyek sekali jalan (backend, layout UI, keamanan kilat) → temuan siap jadi baris `TASKS.md` |
| `skills/ui-layout/` | **Skill bangun UI** — membangun layout tanpa celah/overflow, responsif, semua state tertangani, terjangkau keyboard |
| `skills/backend/` | **Skill bangun backend** — membangun API: endpoint, validasi server-side, auth per endpoint, migrasi berversi, format error konsisten |
| `skills/deploy/` | **Skill rilis** — menyiapkan CI/CD dan deploy yang aman: pipeline, environment & secret, checklist pra-rilis, rencana rollback |
| `skills/testing/` | **Skill test** — menulis dan menjalankan test yang menemukan bug: unit, integrasi, end-to-end, fixture, strategi cakupan |
| `skills/performance/` | **Skill performa** — mengukur dan mengoptimalkan: baseline, bottleneck, optimasi bertahap, bukti sebelum-sesudah |
| `skills/database/` | **Skill database** — merancang data: model & relasi, skema & indeks, migrasi aman, backup dan latihan restore |
| `skills/hardening/` | **Skill hardening** — mengeraskan keamanan: header, cookie, secret, dependency, auth, sampai terverifikasi ulang |
| `skills/observability/` | **Skill observability** — membuat aplikasi terpantau: sinyal utama, log, metrik, trace, alert yang bisa ditindak, runbook |
| `skills/security-audit/` | **Skill audit keamanan** — audit mendalam: threat model, auth, injeksi, XSS, CSRF, SSRF, IDOR, upload, rate limit, kripto + katalog serangan (SQL injection, DDoS, dll) |
| `skills/auth/` | **Skill auth** — membangun autentikasi & otorisasi: sesi, token & refresh, OAuth/OIDC, RBAC, MFA, reset password |
| `skills/incident-response/` | **Skill insiden** — menangani insiden keamanan: triase, containment, eradikasi, pemulihan, postmortem |
| `skills/theme/` | **Skill tema** — membangun sistem tema: design token, warna, tipografi, mode gelap/terang tanpa flash |
| `skills/forms/` | **Skill formulir** — membangun formulir yang mudah diisi: label, validasi, pesan error yang bisa ditindak, multi-step |
| `agents/opencode/` | 6 agent OpenCode V2 (5 sub-agent + manager) — `permissions:` berurutan |
| `agents/claude/` | 6 agent Claude Code (5 sub-agent + manager) — `tools:` / `disallowedTools:` |
| `agents/universal/` | 6 agent Agent Skills spec — untuk Codex, Cursor, dan lainnya |
| `src/agents/` | Sumber tunggal; `build.py` merender ketiga varian darinya |
| `install.sh` | Installer multi-platform (deteksi otomatis) |
| `SETUP.md` | Instruksi setup universal — dibaca agent apa pun, tanpa folder per platform |

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

Alternatif: bilang "baca SETUP.md dan pasang orcestra" — langkahnya sama,
berlaku untuk agent apa pun.

### Cara B — satu perintah (manual)

```bash
git clone https://github.com/IMikuae/ORCESTRA.git orcestra
cd orcestra
./install.sh                 # deteksi platform yang terpasang
```

Opsi:

```bash
./install.sh --agent opencode claude-code   # pilih platform tertentu
./install.sh --agent hermes                # skill saja (Hermes)
./install.sh --global                        # pasang untuk semua project (home dir)
./install.sh --target /path/ke/project       # pasang ke project lain
./install.sh --dry-run                       # tampilkan rencana, tanpa menulis
./install.sh --uninstall                     # copot dari project ini
node verify.mjs                              # cek paket utuh (340 pemeriksaan)
```

### Cara C — `npx skills` (ecosystem resmi, 75+ agent)

```bash
npx skills add IMikuae/ORCESTRA --skill orcestra -a opencode -a claude-code -a codex
```

CLI `skills` mencari skill di `skills/<nama>/SKILL.md` — letaknya sudah sesuai.
Pasang per skill dengan `--skill <nama>`; ulangi flag-nya untuk beberapa skill
(mis. `--skill orcestra --skill audit-proyek`).

> **Catatan:** `npx skills` hanya memasang **skill**. Enam definisi agent
> (5 sub-agent + manager) harus disalin manual — pakai `install.sh` (Cara B)
> untuk semuanya sekaligus.

---

## 3. Di mana file ditaruh

| Platform | Skill | Sub-agent |
|---|---|---|
| **OpenCode V2** | `.opencode/skills/<skill>/` | `.opencode/agents/*.md` |
| **Claude Code** | `.claude/skills/<skill>/` | `.claude/agents/*.md` |
| **Codex / Cursor / Cline / Gemini / Zed / Warp / …** | `.agents/skills/<skill>/` | — (lihat §6) |
| **Hermes** | `.hermes/skills/<skill>/` | — (skill saja; delegasi via `delegate_tool`) |
| **Global (semua project)** | `~/.config/opencode/skills/<skill>/`, `~/.claude/skills/<skill>/`, `~/.agents/skills/<skill>/`, `~/.hermes/skills/<skill>/` | `~/.config/opencode/agents/`, `~/.claude/agents/` |

Pola `<skill>` berlaku untuk tiap skill yang terdaftar; saat ini: `orcestra`,
`audit-proyek`, `ui-layout`, `backend`, `deploy`, `testing`,
`performance`, `database`, `hardening`, `observability`,
`security-audit`, `auth`, `incident-response`, `theme`, dan `forms`.
Installer memasang semuanya sekaligus, bukan satu skill saja.

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

Codex, Cursor, Hermes, Cline, Gemini CLI, Zed, Warp, dan agent lain yang hanya mendukung
*skill* (bukan sub-agent terpisah) tetap dapat memakai orcestra:

1. **Skill-nya terpasang** di `.agents/skills/orcestra/` → AI memuatnya saat
   relevan.
2. **Peran manager** dijalankan AI itu sendiri; skill berisi kontrak peran,
   matriks routing, format brief, dan kosakata papan.
3. **Kelima peran** (`architect`, `builder`, `debugger`, `qa`, `security`) tersedia
   sebagai kontrak lengkap di `agents/universal/*.md`. AI dapat memperlakukan
   tiap peran sebagai "sub-agent" melalui fitur multi-agent yang dimilikinya,
   atau meniru peran tersebut secara bergilir dalam satu sesi.

Hermes: skill terpasang di `~/.hermes/skills/orcestra/` (global) atau
`.hermes/skills/orcestra/` (project, daftarkan di `skills.external_dirs` pada
`config.yaml`). Sub-agent didispatch lewat `delegate_tool`, bukan tool Agent.

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
├── SETUP.md                   ← instruksi setup universal untuk agent apa pun
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
│   │   ├── execution-modes.md   ← mode tanya-satu-satu vs langsung
│   │   ├── sub-skills.md        ← daftar pilih: semua tim atau satu peran
│   │   ├── TASKS-template.md    ← papan tugas
│   │   └── agents/              ← 5 sub-agent + manager (OpenCode flavour)
│   └── playbooks/
│       ├── README.md            ← indeks + kapan dipakai
│       ├── _TEMPLATE.md
│       ├── runtime-patching.md  ← advisory CVE / upgrade runtime
│       ├── backend-audit.md     ← checklist audit backend
│       ├── ui-layout-audit.md   ← checklist audit layout UI
│       └── scripts/verify-runtime-patching.sh
├── skills/audit-proyek/       ← skill audit proyek sekali jalan
│   ├── SKILL.md
│   └── references/checklist.md  ← backend, layout UI, keamanan kilat
├── skills/ui-layout/          ← skill bangun layout tanpa celah
│   ├── SKILL.md
│   └── references/              ← checklist + responsive-patterns.md
├── skills/theme/              ← skill sistem tema
│   ├── SKILL.md
│   └── references/checklist.md  ← token, warna, tipografi, gelap/terang
├── skills/forms/              ← skill formulir yang mudah diisi
│   ├── SKILL.md
│   └── references/checklist.md  ← label, validasi, pesan error, multi-step
├── skills/backend/            ← skill bangun API backend
│   ├── SKILL.md
│   └── references/checklist.md  ← API, validasi, auth, migrasi, error
├── skills/deploy/             ← skill rilis yang aman
│   ├── SKILL.md
│   └── references/checklist.md  ← pipeline, secret, pra-rilis, rollback
├── skills/testing/            ← skill menulis test yang menemukan bug
│   ├── SKILL.md
│   └── references/checklist.md  ← strategi, unit, integrasi, e2e, fixture
├── skills/performance/        ← skill ukur & optimalkan performa
│   ├── SKILL.md
│   └── references/checklist.md  ← baseline, backend, frontend, bukti
├── skills/database/           ← skill rancang database
│   ├── SKILL.md
│   └── references/checklist.md  ← model, skema, indeks, migrasi, backup
├── skills/hardening/          ← skill keraskan keamanan
│   ├── SKILL.md
│   └── references/checklist.md  ← header, cookie, secret, dependency, auth
├── skills/observability/      ← skill buat aplikasi terpantau
│   ├── SKILL.md
│   └── references/checklist.md  ← sinyal, log, metrik, alert, runbook
├── skills/security-audit/     ← skill audit keamanan mendalam
│   ├── SKILL.md
│   └── references/checklist.md  ← threat model, auth, injeksi, XSS, SSRF
├── skills/auth/               ← skill bangun autentikasi & otorisasi
│   ├── SKILL.md
│   └── references/checklist.md  ← password, sesi, OAuth, RBAC, MFA, reset
├── skills/incident-response/  ← skill tangani insiden keamanan
│   ├── SKILL.md
│   └── references/checklist.md  ← triase, bukti, containment, postmortem
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
node verify.mjs     # 340 pemeriksaan: format frontmatter, paritas, katalog, link, multi-skill
```

---

## 9. Kustomisasi

| Ingin ubah | Edit |
|---|---|
| Peran / aturan kerja agent | `src/agents/<peran>.md` → `python3 build.py` |
| Izin (permissions) | `src/agents/<peran>.md` (frontmatter `permissions:`) → `python3 build.py` |
| Routing skill | `skills/orcestra/references/capabilities.md` |
| Katalog skill | `skills/orcestra/references/catalog.md` § "Cara menambah skill" |
| Mode eksekusi skill | `skills/orcestra/references/execution-modes.md` |
| Skill baru | `skills/<nama-kebab>/SKILL.md` — installer memasangnya otomatis, gate `verify.mjs` §1b |
| Dukungan platform baru | `install.sh` (tabel `PLATFORMS`) + `verify.mjs` §7 + `README.md` §3 |
|.Playbook baru | `skills/orcestra/playbooks/_TEMPLATE.md` |

Setelah mengubah `src/agents/`, **selalu** jalankan `python3 build.py` —Ia
memverifikasi bahwa terjemahan izin ke Claude Code masih konsisten.

---

## 10. Lisensi

MIT. Lihat `LICENSE`.
