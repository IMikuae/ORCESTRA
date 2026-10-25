# Kapabilitas & Routing — Orcestra

> **L1 routing layer.** Katalog 921 skill di `references/catalog.index.json` (L2) dan
> `references/catalog.md` (L3) adalah **blueprint**, bukan skill yang bisa dipanggil:
> `callable` = `false` untuk **seluruh 921** entri. Baca deskripsi skill, lalu
> kerjakan sendiri / delegasikan — jangan pernah menjanjikan `skill_view`.

## 1. Cara memakai dokumen ini

- Routing task: baca **§3** (pilih arketipe → kategori → skill representatif), lalu **§4** (algoritma 9 langkah).
- Butuh skill di luar 3–6 contoh per arketipe: saring L2 dengan `jq` (§4) — **jangan muat `catalog.md` ke konteks** (≈150 KB).
- §2 untuk memetakan kategori yang belum pernah dilihat; §6 wajib dibaca sekali sebelum routing pertama.

## 2. Ringkasan 19 kategori

| id | judul | jml | tema | peran default |
|---|---|---|---|---|
| offensive-security | Offensive Sec & Red Team | 91 | active-directory-abuse, credential-access, web-api-exploitation, command-and-control, social-engineering-phishing, cloud-and-network-exploitation | security |
| malware-analysis | Malware Analysis & RE | 111 | static-analysis, dynamic-sandbox-analysis, reverse-engineering, yara-detection-rules, memory-disk-forensics, malware-actor-analysis | security |
| detection-engineering | Detection Eng & Hunting | 122 | siem-detection-authoring, threat-hunting, mitre-attack-coverage, behavioral-anomaly-detection, cloud-and-identity-detection, network-and-protocol-anomalies | builder |
| incident-response | Incident Response & Forensics | 54 | incident-triage-containment, digital-forensics, timeline-reconstruction, ransomware-response, cloud-forensics, soc-process-playbooks | security |
| threat-intelligence | Threat Intel & Actors | 30 | ioc-management, threat-platforms, stix-taxii-sharing, threat-actor-profiling, osint-collection, threat-hunting-analysis | builder |
| grc | Governance, Risk & Compliance | 50 | regulatory-frameworks, risk-assessment, privacy-data-protection, identity-governance, third-party-vendor-risk, vulnerability-prioritization | architect |
| appsec | App & Product Security | 85 | api-security, supply-chain, llm-security, encryption, secure-coding, devsecops-pipeline | security |
| cloud-security | Cloud, Identity & Infra Sec | 106 | iam-and-identity, zero-trust-access, network-segmentation, kubernetes-and-containers, secrets-and-pam, ot-ics-security | security |
| endpoint-security | Endpoint & Host Sec | 56 | edr-endpoint-protection, hardening-benchmarking, data-loss-prevention, email-security, deception-technology, endpoint-monitoring | builder |
| vulnerability-management | Vuln Mgmt & Sec Testing | 127 | vulnerability-scanning, penetration-testing, container-iac-scanning, secret-scanning, network-traffic-analysis, application-and-mobile-security | security |
| frontend | Frontend & Web Eng | 20 | nextjs-app-router, css-design-systems, accessibility-a11y, responsive-layout, design-review, react-performance | debugger |
| software-development | Software Dev & Tooling | 29 | code-refactoring, testing-and-qa, debugging, whatsapp-bot-development, github-workflow, project-tooling | builder |
| agents | Autonomous Agents | 6 | coding-agents, agent-platform, desktop-automation, bot-fleet-operations | builder |
| productivity | Productivity & Documents | 19 | document-creation, spreadsheet-and-data, note-taking, business-saas-automation, workspace-admin-security, meeting-and-review-workflow | builder |
| creative | Creative & Media | 8 | generative-art, video-animation, audio-and-music, writing-style, content-repurposing, asset-search | builder |
| research | Research | 3 | academic-search, competitive-intelligence, citation-grounding | builder |
| social | Social Media | 2 | x-twitter-cli, social-media-scraping, social-posting | builder |
| email | Email | 1 | email-cli, imap-smtp, email-operations | builder |
| blocked-page | Blocked Page Recovery | 1 | web-fetch-resilience, anti-bot-workaround, content-retrieval | builder |

## 3. Matriks 25 task-archetype

| # | task-archetype | kategori | skill representatif (blueprint) | peran | kriteria selesai |
|---|---|---|---|---|---|
| 1. | Audit API auth & otorisasi | appsec | `conducting-api-security-testing`, `testing-api-for-broken-object-level-authorization`, `testing-for-broken-access-control`, `performing-security-headers-audit` | security | tabel PASS/FAIL per endpoint auth + temuan severity + file:line |
| 2. | Menulis rule deteksi SIEM | detection-engineering | `building-detection-rules-with-sigma`, `building-detection-rule-with-splunk-spl`, `building-cloud-siem-with-sentinel`, `building-threat-intelligence-enrichment-in-splunk` | builder | rule lolos lint + 1 fixture positif & 1 negatif |
| 3. | Hunting ancaman / triase alert | detection-engineering | `performing-threat-hunting-with-elastic-siem`, `detecting-lateral-movement-with-splunk`, `triaging-security-alerts-in-splunk`, `performing-alert-triage-with-elastic-siem`, `performing-false-positive-reduction-in-siem` | security / qa | query + jumlah alert triase + verdict false-positive |
| 4. | Investigasi insiden & forensik | incident-response | `containing-active-breach`, `performing-timeline-reconstruction-with-plaso`, `building-incident-timeline-with-timesketch`, `performing-cloud-forensics-with-aws-cloudtrail` | security | super-timeline + langkah containment + bukti artefak |
| 5. | Malware triage & reverse engineering | malware-analysis | `performing-malware-triage-with-yara`, `analyzing-linux-elf-malware`, `analyzing-packed-malware-with-upx-unpacker`, `performing-memory-forensics-with-volatility3` | security | hash+IOC+YARA verdict+perilaku+hipotesis family |
| 6. | Red team / uji exploiting | offensive-security | `executing-red-team-exercise`, `exploiting-idor-vulnerabilities`, `exploiting-aws-with-pacu`, `conducting-social-engineering-penetration-test` | security | skenario terotorisasi + bukti tiap langkah + rules of engagement |
| 7. | Vulnerability scanning & triase CVE | vulnerability-management, grc | `performing-vulnerability-scanning-with-nessus`, `performing-cve-prioritization-with-kev-catalog`, `prioritizing-vulnerabilities-with-cvss-scoring`, `find-security-vulnerabilities-in-code` | security | daftar CVE + skor + target + severity + urutan perbaikan |
| 8. | Hardening container & IaC | cloud-security, vulnerability-management | `hardening-docker-containers-for-production`, `performing-container-image-hardening`, `implementing-infrastructure-as-code-security-scanning`, `performing-container-security-scanning-with-trivy` | builder | scan bersih/diterima + diff hardening + uji container boot |
| 9. | Cloud IAM & posture | cloud-security | `auditing-gcp-iam-permissions`, `securing-aws-iam-permissions`, `implementing-aws-iam-permission-boundaries`, `implementing-cloud-security-posture-management` | security | matriks izin overly-permissive + rekomendasi + bukti API |
| 10. | Secret scanning & rotation | vulnerability-management | `implementing-secret-scanning-with-gitleaks`, `detecting-aws-credential-exposure-with-trufflehog`, `implementing-secrets-scanning-in-ci-cd` | security | jumlah secret + lokasi + status rotasi + bukti |
| 11. | Kepatuhan, risiko & audit GRC | grc | `conducting-cyber-risk-assessment-with-nist-800-30`, `performing-nist-csf-maturity-assessment`, `implementing-iso-27001-information-security-management`, `performing-privacy-impact-assessment`, `implementing-gdpr-data-subject-access-request` | architect | matriks kontrol + gap + bukti evidence per kontrol |
| 12. | Threat intel & IoC pipeline | threat-intelligence | `building-ioc-enrichment-pipeline-with-opencti`, `implementing-stix-taxii-feed-integration`, `building-threat-feed-aggregation-with-misp`, `generating-threat-intelligence-reports` | builder | feed aktif + jumlah IoC ter-enrich + laporan brief |
| 13. | Endpoint hardening & EDR | endpoint-security | `hardening-windows-endpoint-with-cis-benchmark`, `hardening-linux-endpoint-with-cis-benchmark`, `deploying-edr-agent-with-crowdstrike`, `implementing-endpoint-dlp-controls` | builder | baseline CIS pass/fail per host + status policy EDR |
| 14. | Email security & phishing | endpoint-security | `implementing-dmarc-dkim-spf-email-security`, `performing-dmarc-policy-enforcement-rollout`, `implementing-anti-phishing-training-program`, `implementing-email-sandboxing-with-proofpoint` | builder | DMARC p=reject + SPF/DKIM align + simulasi phishing 1x |
| 15. | Kriptografi & data-at-rest | appsec | `performing-cryptographic-audit-of-application`, `implementing-envelope-encryption-with-aws-kms`, `implementing-aes-encryption-for-data-at-rest`, `implementing-disk-encryption-with-bitlocker` | security | tabel cipher/IV/KMS + temuan + uji decrypt/enkripsi |
| 16. | LLM/app security (prompt injection, guardrails) | appsec | `testing-prompt-injection-in-rag-pipelines`, `defending-llms-with-guardrails`, `auditing-mcp-servers-for-tool-poisoning`, `continuous-llm-red-teaming-with-promptfoo` | security | payload uji + respons + status guardrail + temuan |
| 17. | Supply chain & SBOM/provenance | appsec, software-development | `generating-and-analyzing-sboms`, `verifying-build-provenance-with-slsa-sigstore`, `implementing-sigstore-for-software-signing`, `implementing-image-provenance-verification-with-cosign`, `securing-github-actions-workflows` | builder | SBOM (SPDX/CycloneDX) + signature/provenance verify |
| 18. | Next.js / React performance | frontend | `nextjs-app-audit`, `nextjs`, `vercel-react-best-practices`, `nextjs-disk-job-queue`, `nextjs-secure-delivery` | debugger | build lolos + before/after metrik bundle + Lighthouse delta |
| 19. | Aksesibilitas & desain UI | frontend | `accessibility-wcag`, `nextjs-viewport-a11y-check`, `responsive-design`, `web-design-guidelines`, `frontend-design` | qa | violations axe sebelum/sesudah + daftar viewport uji |
| 20. | Refactoring & clean code | software-development | `clean-code`, `simplify-code`, `code-refactoring`, `refactoring-specialist`, `requesting-code-review` | builder | diff + test tetap hijau + review notes |
| 21. | Testing & QA (unit/integrasi) | software-development | `test-driven-development`, `dogfood`, `hermaguard`, `integrating-dast-with-owasp-zap-in-pipeline` | qa | "X lulus, Y gagal" + perintah + output mentah |
| 22. | Debugging build/runtime | software-development | `systematic-debugging`, `node-inspect-debugger`, `python-debugpy`, `inspecting-hermes-desktop-dom` | debugger | root cause tertulis + build lolos + regresi hijau |
| 23. | Otomasi dokumen & produktivitas | productivity, email | `docx`, `pdf`, `xlsx`, `powerpoint`, `notion`, `himalaya` | builder | file hasil + path + ringkasan isi |
| 24. | Riset akademik & sitasi | research | `arxiv`, `grounded-citations`, `competitor-news-monitor` | builder | jawaban + sitasi URL per klaim + tanggal |
| 25. | Konten sosial & media | social, creative, blocked-page | `xurl`, `social-media-scraping`, `youtube-content`, `humanizer`, `gif-search`, `blocked-page-recovery` | builder | draft konten + bukti fetch + hashtag & jadwal |

## 4. Algoritma routing (9 langkah)

1. **Baca prompt + konteks** (repo, papan `TASKS.md`, hasil langkah sebelumnya). Tulis ulang jadi satu kalimat tujuan.
2. **Klasifikasikan arketipe** → 1 arketipe utama + maks 2 sekunder dari §3 (keyword + sudut pandang). Tidak cocok → arketipe 20/22 sebagai default umum.
3. **Petakan ke kategori** → 1–3 kategori L2; tandai TOPIK UTAMA (paling spesifik) vs PENDUKUNG.
4. **Ambil kandidat skill** → 3–6 dari §3; perlu lebih → saring L2 (semua `jq` dijalankan di dir `references/`):
   ```bash
   jq -r --arg c "appsec" '.skills[] | select(.category==$c) | .id' catalog.index.json
   jq -r --arg t "supply-chain" '.skills[] | select(.themes | index($t)) | .id' catalog.index.json
   jq -r --arg c "appsec" --arg t "api-security" '.skills[] | select(.category==$c and (.themes|index($t))) | .id' catalog.index.json
   jq -r --arg k "sigma" '.skills[] | select(.id|test($k)) | .id' catalog.index.json
   jq -r --arg c "appsec" '.skills[] | select(.category==$c and .installed==true) | .id' catalog.index.json
   jq -r '.skills[] | select(.callable==true) | .id' catalog.index.json   # → KOSONG
   ```
5. **Cek status** → `callable==false` (seluruh katalog) ⇒ skill adalah **blueprint**: baca deskripsinya, lalu kerjakan sendiri. `installed==true` (829) catat di brief; 92 `documented_only` tidak ada di lockfile.
6. **Cek playbook keamanan** → baca `playbooks/README.md`; bila trigger cocok (CVE/advisory/patch/EOL runtime), **playbook menang** atas matriks ini. Severity & `[USER]` mengikuti `playbooks/README.md`.
7. **Pilih peran** → audit/ancaman/bukti → `security`; menulis konten → `builder`; akar masalah/build error → `debugger`; verifikasi berulang → `qa`; struktur/prioritas → `architect`. >1 arketipe ⇒ >1 baris papan.
8. **Rancang batas file** → tiap baris papan punya "File yang disentuh" eksplisit; irisan himpunan file antar-baris paralel **= 0**, kalau overlap pecah atau serialisasi.
9. **Tulis brief & delegasi** → tujuan · arketipe+skill acuan (blueprint) · peran · batas file · kriteria selesai (perintah yang dijalankan) · konteks & dependency · bukti. Tutup laporan: apa, file berubah, temuan severity+file:line, bukti (perintah+output), langkah berikutnya. Loop: temuan qa/security → baris baru.

## 5. Peran agent vs jenis kerja

| peran | boleh edit? | output | bukti | kapan dipanggil |
|---|---|---|---|---|
| architect | ya (rencana/struktur) | PLAN, pembagian tugas, prioritas | matriks risiko/dependensi tertulis | requirements kabur, >1 arketipe, butuh struktur |
| builder | ya, hanya batas file | kode/konfigurasi/dokumen/rule | diff + perintah jalankan + output | pekerjaan dengan batas file jelas |
| debugger | ya, perubahan minimal | patch akar masalah | build lolos + regresi hijau + root cause | Build error, crash, regresi |
| qa | **tidak** (kode aplikasi) | test, laporan verifikasi | "X lulus, Y gagal" + output mentah | Perlu verifikasi berulang/audit a11y |
| security | **tidak** (read-only) | temuan severity + bukti | tabel kontrol PASS/FAIL + file:line | Audit, threat model, validasi kontrol |

## 6. Peringatan

- **Katalog = blueprint.** `callable` = `false` untuk **921/921** skill (direktori skill di disk kosong; `skill_view` akan gagal). **Jangan pernah** menjanjikan "saya menjalankan skill X" — skill hanya blueprint: baca deskripsi, kerjakan sendiri, atau delegasikan dengan instruksi turunan.
- **810 dari 921 deskripsi terpotong elipsis `…`** (kondisi upstream). Jangan menyalin/memperbaiki/menerjemahkan; jangan menyimpulkan dari deskripsi separuh.
- **92 skill `documented_only`** (ada di katalog, absen di `skills-lock.json`): tidak akan terpasang kecuali di-`npx skills add`.
- **Rantai fallback L1→L2→L3:** `capabilities.md` (arsitektur & arketipe) → `catalog.index.json` (saring `jq`, L2) → `catalog.md` (teks lengkap satu blok kategori, L3, **jangan dimuat penuh**).
- **Precedence playbook keamanan:** bila `playbooks/README.md` match, ikuti playbook (termasuk `[USER]` untuk aksi host & konfirmasi severity KRITIS/TINGGI) — matriks §3 hanya untuk routing skill & peran.
- **Risiko instalasi massal katalog.** Bila suatu saat 921 skill di-install sekaligus: kecualikan `hermes-agent-skill-authoring` (ia menulis `SKILL.md` = instruksi agent berikutnya); minta persetujuan eksplisit user untuk `computer-use` (kendali desktop) dan `claude-code`/`codex`/`opencode` (delegasi ke agent kedua); setiap install wajib lewat `third-party-skill-vetting` plus policy `skill:*`. Rincian: `playbooks/README.md` § "Catatan aktivasi katalog".
