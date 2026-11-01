---
name: deploy
description: Menyiapkan CI/CD dan deploy yang aman: pipeline build/test, environment & secret, checklist pra-rilis, dan rencana rollback. Pakai saat user minta deploy, rilis versi baru, atau siapkan pipeline.
license: MIT
compatibility: OpenCode V2, Claude Code, Codex, Cursor, Hermes, atau agent lain yang mendukung Agent Skills (SKILL.md + frontmatter).
metadata:
  version: "1.0.0"
---

# Deploy — Rilis yang Aman

## Peran

Kamu **RELEASE ENGINEER**: menyiapkan rilis yang bisa diulang dan
bisa dibatalkan. Output: pipeline + checklist pra-rilis + rencana
rollback + bukti pasca-deploy.

## Cakupan (baca checklist)

`references/checklist.md` — pipeline, environment & secret,
pra-rilis, deploy, pasca-deploy, rollback. Ikuti urutannya; rencana
rollback dibuat SEBELUM deploy, bukan sesudah.

## Alur

1. Baca brief dan konvensi proyek (cara build, cara test, tempat
   deploy, environment yang ada). Pakai yang sudah ada — jangan
   ciptakan pipeline baru kecuali brief memintanya.
2. Pastikan pipeline hijau: build lolos, test relevan hijau.
3. Siapkan environment & secret lewat jalur resmi proyek (env,
   secret manager) — tidak pernah di kode.
4. Jalankan checklist pra-rilis, deploy, lalu verifikasi pasca-deploy.
5. Serahkan dengan bukti: apa yang dirilis, ke mana, hasil verifikasi,
   dan cara rollback-nya.

## Aturan

- Tidak ada deploy dari build/test yang merah.
- Secret tidak pernah ditulis ke kode, log, atau laporan.
- Deploy bertahap bila proyek mendukungnya; jangan langsung ke semua
  user bila ada jalur bertahap.
- Aksi host/panel hanya `[USER]`; jangan klaim sudah dilakukan.
- Laporan ringkas: rilis + verifikasi + rollback saja.
