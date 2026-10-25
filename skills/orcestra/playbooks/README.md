---
id: playbooks-readme
title: Playbook Keamanan
severity: KRITIS
status: active
published: 2026-10-25
components: [nodejs, php]
cves: []
owner_role: security
---

# Playbook Keamanan — Orcestra

Prosedur keamanan orcestra. Playbook **bukan skill terpisah** — prosedur yang memakai peran agent yang sudah ada (security, builder, qa) dan dipicu manager. File ini adalah **index + kebijakan**, bukan playbook yang bisa dieksekusi; playbook actionable ada di tabel di bawah.

## Index playbook

| File | Severity | Status | Scope | Kapan dibuka |
|---|---|---|---|---|
| [`runtime-patching.md`](./runtime-patching.md) | KRITIS | `active` | Node.js + Bun + PHP (Node2Shell, PHP2Shell) | Saat ada advisory runtime, versi runtime di bawah versi patched, atau runtime EOL |
| [`_TEMPLATE.md`](./_TEMPLATE.md) | — | template | Lintas komponen | Saat menulis playbook advisory baru |
| [`scripts/verify-runtime-patching.sh`](./scripts/verify-runtime-patching.sh) | — | utilitas | Verifikasi §7 `runtime-patching.md` | Setelah patch/reload runtime — satu baris output per item §7, exit non-zero bila ada yang gagal |

## Kebijakan severity

| Severity | Arti | Tindakan manager |
|---|---|---|
| **KRITIS** (CRITICAL) | RCE / eksploitasi aktif / tanpa fix | **Blocking.** Gelombang tak boleh `selesai` sampai user konfirmasi semua aksi `[USER]` di §6. Escalate ke user. |
| **TINGGI** (HIGH) | Bypass autentikasi, data leak, privilege escalation | **Blocking sampai ada rencana mitigasi tertulis.** Minimal §7 dijalankan dan dilaporkan, dengan tenggat. |
| **SEDANG** (MEDIUM) | Weakened crypto, DoS, disclosure terbatas | **Non-blocking**, tapi catat di `TASKS.md` dan jadwalkan perbaikan. |
| **RENDAH** (LOW) | Hardening, best practice | **Non-blocking.** Cukup dicatat; tak perlu mengganggu user kecuali bundled dengan severity lebih tinggi. |

`status: resolved` hanya setelah §7 lolos dan, untuk KRITIS/TINGGI, setelah user konfirmasi aksi `[USER]`.

## Pemicu (trigger)

Buka playbook bila salah satu berlaku:

- **(a)** task menyebut CVE, advisory, "patch", atau "upgrade runtime".
- **(b)** versi runtime hasil probe **<** versi patched pada tabel §2.
- **(c)** ada skill katalog bertema runtime-patch yang relevan.
- **(d)** task **bukan** soft issue, tapi runtime-nya EOL dan ada security release terbuka.

## Pemisahan agent vs user (mengikat)

- Agent **tidak pernah** mengklaim aksi host/panel sudah dilakukan. Tindakan yang butuh root, panel hosting/<provider>, atau restart host wajib ditandai `[USER]` di §6.
- Agent tak boleh menandai `resolved` hanya karena binary di disk sudah dipatch — verifikasi harus membandingkan **waktu mulai proses** dengan waktu patch, bukan `runtime -v` saja.
- Tanpa konfirmasi user, manager melaporkan "menunggu user", bukan "selesai".

## Catatan aktivasi katalog

829 skill di `skills-lock.json` **tak ter-install di disk** container ini — katalog itu blueprint, bukan skill yang bisa dipanggil. Agar bisa dipanggil, user harus install dulu, misalnya `npx skills experimental_install` memakai lockfile tersebut.

**Bila suatu saat katalog 921 skill di-install massal, perhatikan risiko berikut** (belum ada install massal sampai sekarang):

- `hermes-agent-skill-authoring` **harus dikecualikan** — skill itu menulis berkas `SKILL.md`, yaitu instruksi agent untuk sesi berikutnya. Installing berarti menulis instruksi baru tanpa review.
- `computer-use` butuh **persetujuan eksplisit user** (kendali desktop).
- `claude-code` / `codex` / `opencode` butuh **persetujuan eksplisit user** (delegasi ke agent kedua di luar tim orcestra).
- Setiap install wajib lewat **`third-party-skill-vetting`** (ada di katalog) plus policy `skill:*` — jangan pasang skill mentah tanpa vetting.
