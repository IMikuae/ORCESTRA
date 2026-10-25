# Katalog Skill — 921 entri (19 kategori)

> **Sumber tunggal (single source of truth).** File ini adalah katalog
> **lengkap** dari 921 skill yang terdokumentasi di 19 kategori. Katalog ini
> dibangun ulang dari snapshot `docs/skill/` **sebelum** folder itu dihapus
> (T11), sehingga isinya 100% identik dengan sumber aslinya.
>
> **Deskripsi dipertahankan persis (verbatim).** 810 dari 921 deskripsi
> sudah **terpotong elipsis `…`** pada snapshot sumber — itu kondisi
> upstream, bukan kerusakan. **Jangan diperbaiki, diluruskan, diterjemahkan,
> atau dinormalisasi.** QA membandingkan string byte-per-byte dengan
> sumber, elipsis termasuk. Deskripsi lengkap tidak tersedia.
>
> **Jangan muat seluruh file ini ke konteks.** 921 baris ≈ 150 KB.
> Gunakan `references/catalog.index.json` dengan `jq`/`grep` untuk
> menyaring, atau baca **satu blok kategori** saja bila perlu teks lengkap.
>
> **Status dua kolom.** `Terpasang` = ada di `skills-lock.json`
> (829 skill, bisa dipulihkan). `Status` = `installed` atau
> `documented-only`. **Tidak ada satupun skill yang bisa dipanggil saat
> ini**: direktori skill di disk kosong, jadi `callable` = `false` untuk
> seluruh 921 entri. Perlakukan skill `documented-only` sebagai *blueprint*,
> bukan sesuatu yang bisa di-`skill_view`.

## Ringkasan per kategori

| Kategori | Judul | Jumlah | Terpasang | Documented-only |
|---|---|---|---|---|
| offensive-security | Offensive Security & Red Teaming | 91 | 91 | 0 |
| malware-analysis | Malware Analysis & Reverse Engineering | 111 | 111 | 0 |
| detection-engineering | Detection Engineering & Threat Hunting | 122 | 122 | 0 |
| incident-response | Incident Response & Forensics | 54 | 54 | 0 |
| threat-intelligence | Threat Intelligence & Adversary Tracking | 30 | 30 | 0 |
| grc | Governance, Risk & Compliance | 50 | 48 | 2 |
| appsec | Application & Product Security | 85 | 80 | 5 |
| cloud-security | Cloud, Identity & Infrastructure Security | 106 | 101 | 5 |
| endpoint-security | Endpoint & Host Security | 56 | 54 | 2 |
| vulnerability-management | Vulnerability Management & Security Testing | 127 | 125 | 2 |
| frontend | Frontend & Web Engineering | 20 | 7 | 13 |
| software-development | Software Development & Tooling | 29 | 3 | 26 |
| agents | Autonomous Agents & Hermes Platform | 6 | 0 | 6 |
| productivity | Productivity & Documents | 19 | 3 | 16 |
| creative | Creative & Media | 8 | 0 | 8 |
| research | Research | 3 | 0 | 3 |
| social | Social Media | 2 | 0 | 2 |
| email | Email | 1 | 0 | 1 |
| blocked-page | Blocked Page Recovery | 1 | 0 | 1 |
| **Total** | | **921** | **829** | **92** |

---

## 1. Offensive Security & Red Teaming — 91 skill

**Kategori:** offensive-security  ·  **Terpasang:** 91 / 91  ·  **Documented-only:** 0  

**Ringkasan:** Active adversary simulation: initial access, privilege escalation, lateral movement, Active Directory abuse, credential attacks, C2, and authorized exploitation.

**Tema:** `active-directory-abuse`, `credential-access`, `web-api-exploitation`, `command-and-control`, `social-engineering-phishing`, `cloud-and-network-exploitation`

| Skill | Kegunaan | Terpasang | Status |
|---|---|---|---|
| `abusing-dpapi-for-credential-access` | Extract and decrypt Windows DPAPI-protected secrets (Credential Manager, browser logins/cookies, Wi-Fi credentials, KeePass keys) online or offline using SharpDPAPI, Sha… | ya | installed |
| `abusing-shadow-credentials-for-privesc` | Take over Active Directory accounts by writing attacker-controlled public keys to msDS-KeyCredentialLink (Shadow Credentials) with pyWhisker, Whisker, or Certipy, then a… | ya | installed |
| `analyzing-active-directory-acl-abuse` | Detect dangerous ACL misconfigurations in Active Directory using ldap3 to identify GenericAll, WriteDACL, and WriteOwner abuse paths | ya | installed |
| `analyzing-cobalt-strike-beacon-configuration` | Extract and analyze Cobalt Strike beacon configuration from PE files and memory dumps to identify C2 infrastructure, malleable profiles, and operator tradecraft. | ya | installed |
| `analyzing-cobaltstrike-malleable-c2-profiles` | Parse and analyze Cobalt Strike Malleable C2 profiles with dissect.cobaltstrike (profiles and beacon-payload configs) and pyMalleableC2 (AST parsing) to extract HTTP/DNS… | ya | installed |
| `attacking-entra-id-with-roadtools` | Enumerate Microsoft Entra ID (Azure AD) tenants with ROADrecon and acquire, exchange, and abuse tokens (including primary refresh tokens) with roadtx. Use for authorized… | ya | installed |
| `attacking-oauth-with-device-code-phishing` | Run OAuth 2.0 device-code and illicit-consent phishing attacks against Microsoft Entra ID, using TokenTactics-style tooling to steal access and refresh tokens, bypass MF… | ya | installed |
| `auditing-azure-active-directory-configuration` | Auditing Microsoft Entra ID (Azure Active Directory) configuration to identify risky authentication policies, overly permissive role assignments, stale accounts, conditi… | ya | installed |
| `auditing-entra-id-with-aadinternals` | Drive the AADInternals PowerShell toolkit to perform Microsoft Entra ID tenant reconnaissance, access-token acquisition across Microsoft APIs, and federation/AD FS backd… | ya | installed |
| `building-adversary-infrastructure-tracking-system` | Build an automated adversary infrastructure tracking system in Python (dnspython, python-whois, shodan, networkx) that pivots across passive DNS, certificate transparenc… | ya | installed |
| `building-c2-infrastructure-with-sliver-framework` | Deploy and harden a Sliver C2 team server (BishopFox's Go-based adversary emulation framework) with multi-protocol listeners (mTLS, HTTP/S, DNS, WireGuard), redirectors,… | ya | installed |
| `building-c2-redirector-infrastructure` | Build dumb-pipe and traffic-filtering C2 redirectors with nginx (proxy_pass) and Apache (mod_rewrite), deriving filter rules from a Malleable C2 profile, layering Let's… | ya | installed |
| `building-red-team-c2-infrastructure-with-havoc` | Deploy and configure the Havoc C2 framework (teamserver, HTTPS/HTTP/SMB listeners, Nginx redirectors, and Demon agents) with malleable traffic profiles and OPSEC-hardene… | ya | installed |
| `bypassing-authentication-with-forced-browsing` | Discovering and accessing unprotected pages, APIs, and administrative interfaces by enumerating URLs and bypassing authentication controls during authorized security ass… | ya | installed |
| `coercing-authentication-with-coercer-petitpotam` | Trigger machine account authentication with PetitPotam (MS-EFSR) and Coercer (MS-RPRN, MS-DFSNM, MS-FSRVP, MS-EVEN) via Coercer's scan/coerce/fuzz modes, feeding the coe… | ya | installed |
| `conducting-domain-persistence-with-dcsync` | Perform DCSync attacks by abusing MS-DRSR replication rights (DS-Replication-Get-Changes/-All) to impersonate a Domain Controller and extract KRBTGT, Domain Admin, and s… | ya | installed |
| `conducting-man-in-the-middle-attack-simulation` | Simulates man-in-the-middle attacks using Ettercap, mitmproxy, and Bettercap in authorized environments to intercept, analyze, and modify network traffic for testing enc… | ya | installed |
| `conducting-pass-the-ticket-attack` | Perform Pass-the-Ticket (PtT) lateral movement by extracting Kerberos TGT/TGS tickets from LSASS memory on a compromised host and injecting them into another session to… | ya | installed |
| `conducting-social-engineering-penetration-test` | Design and execute a social engineering penetration test combining OSINT-driven target profiling with phishing, vishing, smishing, and physical pretexting campaigns usin… | ya | installed |
| `conducting-social-engineering-pretext-call` | Plan and execute authorized vishing (voice phishing) pretext calls to assess employee susceptibility to social engineering and evaluate security awareness controls. | ya | installed |
| `conducting-spearphishing-simulation-campaign` | Run a targeted spearphishing simulation for initial access by developing OSINT-derived pretexts, building payloads (HTML smuggling, macro docs, ISO/LNK, OneNote, QR code… | ya | installed |
| `configuring-active-directory-tiered-model` | Implement Microsoft's Enhanced Security Admin Environment (ESAE) tiered administration model for Active Directory, covering Tier 0/1/2 separation, privileged access work… | ya | installed |
| `detecting-dcsync-attack-in-active-directory` | Detect DCSync attacks (MITRE T1003.006) where adversaries abuse Active Directory replication privileges to extract password hashes, by auditing Event ID 4662 for the DS-… | ya | installed |
| `detecting-kerberoasting-attacks` | Detect Kerberoasting attacks by monitoring for anomalous Kerberos TGS requests (Event ID 4769) targeting service accounts with SPNs, which attackers request offline to c… | ya | installed |
| `detecting-ntlm-relay-with-event-correlation` | Detect NTLM relay attacks (T1557.001) by correlating Windows Event 4624 LogonType 3 for IP-to-hostname mismatches, identifying Responder/LLMNR poisoning artifacts, audit… | ya | installed |
| `detecting-pass-the-hash-attacks` | Detect Pass-the-Hash (T1550.002) attacks by analyzing NTLM authentication patterns, flagging Type 3 logons using NTLM where Kerberos would be expected, and correlating w… | ya | installed |
| `detecting-pass-the-ticket-attacks` | Detect Kerberos Pass-the-Ticket (PtT) attacks by analyzing Windows Event IDs 4768, 4769, and 4771 for anomalous ticket usage patterns, with detection queries for Splunk… | ya | installed |
| `emulating-cloud-attacks-with-stratus-red-team` | Install and run Stratus Red Team to detonate granular, MITRE ATT&CK-mapped AWS, Azure, GCP, and Kubernetes attack techniques through their warmup-detonate-revert-cleanup… | ya | installed |
| `escaping-containers-to-host` | Exploits privileged pods, host mounts, runC CVEs, and exposed Docker sockets to break out of a container and reach the underlying host during an authorized container-sec… | ya | installed |
| `executing-active-directory-attack-simulation` | Executes authorized attack simulations against Active Directory environments to identify misconfigurations, weak credentials, dangerous privilege paths, and exploitable… | ya | installed |
| `executing-red-team-engagement-planning` | Build the foundational red team engagement plan - scope definition, Rules of Engagement (restrictions, communication plan, emergency stop procedures, legal authorization… | ya | installed |
| `executing-red-team-exercise` | Run a stealthy, MITRE ATT&CK-mapped adversary emulation against an organization's people, processes, and technology, using C2 infrastructure (Cobalt Strike, Sliver, Brut… | ya | installed |
| `exploiting-active-directory-certificate-services-esc1` | Exploit misconfigured Active Directory Certificate Services (AD CS) ESC1 vulnerability to request certificates as high-privileged users and escalate domain privileges du… | ya | installed |
| `exploiting-active-directory-with-bloodhound` | BloodHound is a graph-based Active Directory reconnaissance tool that uses graph theory to reveal hidden and unintended relationships within AD environments. Red teams u… | ya | installed |
| `exploiting-adcs-with-certipy` | Use Certipy to enumerate AD CS certificate authorities and templates over LDAP/RPC, then exploit ESC1-ESC16 misconfigurations - SAN abuse, NTLM relay to web enrollment (… | ya | installed |
| `exploiting-api-injection-vulnerabilities` | Tests API parameters, headers, and request bodies for injection flaws — SQL injection, NoSQL injection, OS command injection, LDAP injection, and SSRF — by crafting payl… | ya | installed |
| `exploiting-aws-with-pacu` | Runs the Pacu AWS exploitation framework end-to-end — session and credential setup, IAM enumeration, automated privilege-escalation scanning via iam__privesc_scan, and p… | ya | installed |
| `exploiting-bgp-hijacking-vulnerabilities` | Analyzes and simulates BGP hijacking scenarios in authorized lab environments to assess route origin validation, RPKI deployment, and BGP monitoring defenses against pre… | ya | installed |
| `exploiting-broken-function-level-authorization` | Tests APIs for Broken Function Level Authorization (OWASP API5:2023) by identifying admin and privileged endpoints, then reaching them with regular-user credentials via… | ya | installed |
| `exploiting-broken-link-hijacking` | Discovers and exploits broken link hijacking by spidering a site (Burp Suite Spider, Scrapy, curl scraping), extracting referenced external scripts/domains, and checking… | ya | installed |
| `exploiting-constrained-delegation-abuse` | Exploits Kerberos Constrained Delegation misconfigurations in Active Directory using Impacket's findDelegation.py and getST.py (or Rubeus/Kekeo on Windows) to abuse S4U2… | ya | installed |
| `exploiting-excessive-data-exposure-in-api` | Tests APIs for excessive data exposure (OWASP API3:2023) by intercepting raw API responses and comparing them against what the UI actually renders, looking for leaked PI… | ya | installed |
| `exploiting-http-request-smuggling` | Detects and exploits HTTP request smuggling caused by Content-Length/Transfer-Encoding parsing discrepancies between front-end and back-end servers, using Burp Suite Rep… | ya | installed |
| `exploiting-idor-vulnerabilities` | Identifies and exploits Insecure Direct Object Reference (IDOR) vulnerabilities by manipulating object identifiers (numeric IDs, UUIDs, slugs) in API requests and URLs,… | ya | installed |
| `exploiting-ipv6-vulnerabilities` | Identifies and exploits IPv6-specific vulnerabilities including SLAAC spoofing, Router Advertisement flooding, and IPv6 tunneling during authorized assessments to test d… | ya | installed |
| `exploiting-kerberoasting-with-impacket` | Performs Kerberoasting (MITRE ATT&CK T1558.003) using Impacket's GetUserSPNs.py to request Kerberos TGS tickets for SPN-registered service accounts, then cracks the extr… | ya | installed |
| `exploiting-mass-assignment-in-rest-apis` | Discovers and exploits mass assignment (autobinding) in REST APIs by injecting unexpected or hidden parameters (e.g. role, isAdmin, plan) into create/update requests, us… | ya | installed |
| `exploiting-nopac-cve-2021-42278-42287` | Exploits the noPac Active Directory privilege-escalation chain (CVE-2021-42278 sAMAccountName spoofing plus CVE-2021-42287 KDC PAC confusion) using Impacket and secretsd… | ya | installed |
| `exploiting-nosql-injection-vulnerabilities` | Detects and exploits NoSQL injection vulnerabilities in MongoDB, CouchDB, and similar databases to demonstrate authentication bypass, data extraction, and unauthorized a… | ya | installed |
| `exploiting-oauth-misconfiguration` | Identifying and exploiting OAuth 2.0 and OpenID Connect misconfigurations including redirect URI manipulation, token leakage, and authorization code theft during securit… | ya | installed |
| `exploiting-prototype-pollution-in-javascript` | Detects and exploits JavaScript prototype pollution vulnerabilities in client-side and server-side (Node.js) applications to achieve XSS, RCE, or authentication bypass t… | ya | installed |
| `exploiting-race-condition-vulnerabilities` | Detects and exploits race condition (TOCTOU) vulnerabilities in web applications using Burp Suite's Turbo Intruder extension and its single-packet attack technique to fi… | ya | installed |
| `exploiting-server-side-request-forgery` | Identifying and exploiting SSRF vulnerabilities to access internal services, cloud metadata, and restricted network resources during authorized penetration tests. | ya | installed |
| `exploiting-smb-vulnerabilities-with-metasploit` | Identifies and exploits SMB protocol vulnerabilities using Metasploit Framework during authorized penetration tests to demonstrate risks from unpatched Windows systems,… | ya | installed |
| `exploiting-sql-injection-vulnerabilities` | Identifies and exploits SQL injection vulnerabilities in web applications during authorized penetration tests using manual techniques and automated tools like sqlmap. Th… | ya | installed |
| `exploiting-sql-injection-with-sqlmap` | Detecting and exploiting SQL injection vulnerabilities using sqlmap to extract database contents during authorized penetration tests. | ya | installed |
| `exploiting-template-injection-vulnerabilities` | Detects and exploits Server-Side Template Injection (SSTI) vulnerabilities across Jinja2, Twig, Freemarker, and other template engines to achieve remote code execution.… | ya | installed |
| `exploiting-type-juggling-vulnerabilities` | Exploits PHP type juggling vulnerabilities caused by loose (==) comparison operators to bypass authentication, defeat hash verification via magic hashes, and manipulate… | ya | installed |
| `exploiting-vulnerabilities-with-metasploit-framework` | Uses the Metasploit Framework (msfconsole and its exploit, auxiliary, and post-exploitation modules) to validate that identified CVEs and vulnerabilities are actually ex… | ya | installed |
| `exploiting-websocket-vulnerabilities` | Testing WebSocket implementations for authentication bypass, cross-site hijacking, injection attacks, and insecure message handling during authorized security assessment… | ya | installed |
| `hunting-for-beaconing-with-frequency-analysis` | Identify command-and-control beaconing patterns in network traffic by applying statistical frequency analysis, jitter calculation, and coefficient of variation scoring t… | ya | installed |
| `hunting-for-cobalt-strike-beacons` | Detect Cobalt Strike beacon command-and-control traffic using default TLS certificate signatures (serial 8BB00EE), JA3/JA3S/JARM fingerprints, HTTP malleable C2 profile… | ya | installed |
| `hunting-for-command-and-control-beaconing` | Detect C2 beaconing patterns in network traffic using frequency analysis, jitter detection, and domain reputation to identify compromised endpoints communicating with ad… | ya | installed |
| `hunting-for-dcsync-attacks` | Detect DCSync attacks (MITRE ATT&CK T1003.006) by analyzing Windows Event ID 4662 (AccessMask 0x100) for DS-Replication-Get-Changes and DS-Replication-Get-Changes-All re… | ya | installed |
| `hunting-for-domain-fronting-c2-traffic` | Detects domain fronting C2 traffic by analyzing SNI-vs-HTTP-Host-header mismatches in proxy logs and inspecting TLS certificate discrepancies with pyOpenSSL. Use when hu… | ya | installed |
| `hunting-for-ntlm-relay-attacks` | Detects NTLM relay attacks (MITRE T1557.001) by analyzing Windows Event ID 4624 logon type 3 with NTLMSSP authentication, flagging IP-to-hostname mismatches, Responder/L… | ya | installed |
| `moving-laterally-with-netexec` | Use NetExec (nxc) to validate credentials, enumerate SMB shares/users/policy, password-spray safely across lockout thresholds, execute commands, and dump SAM/LSA/NTDS cr… | ya | installed |
| `operating-havoc-c2` | Deploy a Havoc C2 team server with Yaotl malleable profiles, generate evasive Demon agents using indirect syscalls and sleep obfuscation, and run post-exploitation and p… | ya | installed |
| `operating-sliver-c2` | Stand up a Sliver C2 server and mTLS listeners, generate cross-platform implants and beacons, and run post-exploitation, pivoting, and BOF/.NET tooling via the Armory fo… | ya | installed |
| `performing-active-directory-bloodhound-analysis` | Use BloodHound and SharpHound (or AzureHound) to enumerate Active Directory relationships and graph attack paths from a compromised user to Domain Admin. Use when perfor… | ya | installed |
| `performing-active-directory-compromise-investigation` | Investigate Active Directory compromise by analyzing authentication logs, replication metadata, Group Policy changes, and Kerberos ticket anomalies to identify attacker… | ya | installed |
| `performing-active-directory-forest-trust-attack` | Enumerate and audit Active Directory forest trust relationships using Impacket for SID filtering analysis, trust key extraction, cross-forest SID history abuse detection… | ya | installed |
| `performing-active-directory-penetration-test` | Conduct a focused Active Directory penetration test using BloodHound, Impacket, Certipy, Rubeus, and NetExec to enumerate domain objects, discover attack paths, exploit… | ya | installed |
| `performing-clickjacking-attack-test` | Testing web applications for clickjacking vulnerabilities by assessing frame embedding controls and crafting proof-of-concept overlay attacks during authorized security… | ya | installed |
| `performing-cloud-penetration-testing-with-pacu` | Run authorized AWS penetration tests with Pacu, the open-source AWS exploitation framework, to enumerate IAM configuration, scan for privilege escalation paths, and test… | ya | installed |
| `performing-credential-access-with-lazagne` | Extract stored credentials from compromised endpoints using the LaZagne post-exploitation tool to recover passwords from browsers, databases, system vaults, and applicat… | ya | installed |
| `performing-initial-access-with-evilginx3` | Perform authorized initial access using EvilGinx3 adversary-in-the-middle phishing framework to capture session tokens and bypass multi-factor authentication during red… | ya | installed |
| `performing-kerberoasting-attack` | Perform Kerberoasting, a post-exploitation technique that enumerates Active Directory service accounts with Service Principal Names (SPNs), requests their Kerberos TGS t… | ya | installed |
| `performing-lateral-movement-with-wmiexec` | Perform lateral movement across Windows networks using WMI-based remote execution techniques including Impacket wmiexec.py, CrackMapExec, and native WMI commands for ste… | ya | installed |
| `performing-phishing-simulation-with-gophish` | Deploy and run authorized phishing awareness campaigns with GoPhish, covering admin panel setup, SMTP sending profiles, email template and landing page creation, target… | ya | installed |
| `performing-physical-intrusion-assessment` | Conduct authorized physical penetration testing against facilities, server rooms, and restricted areas using tailgating, RFID badge cloning, lock bypassing, rogue networ… | ya | installed |
| `performing-purple-team-atomic-testing` | Executes Atomic Red Team tests mapped to MITRE ATT&CK via Invoke-AtomicRedTeam PowerShell, generates ATT&CK Navigator coverage heatmaps, correlates results against Sigma… | ya | installed |
| `performing-purple-team-exercise` | Performs purple team exercises by coordinating red team adversary emulation with blue team detection validation using MITRE ATT&CK-mapped attack scenarios, real-time det… | ya | installed |
| `performing-red-team-phishing-with-gophish` | Automates GoPhish phishing simulation campaigns using the Python gophish library, creating email templates with tracking pixels, configuring SMTP sending profiles, build… | ya | installed |
| `performing-red-team-with-covenant` | Conducts red team operations using the Covenant C2 framework for authorized adversary simulation, covering listener setup, grunt deployment, task execution, and lateral… | ya | installed |
| `performing-soc2-type2-audit-preparation` | Automates SOC 2 Type II audit preparation including gap assessment against AICPA Trust Services Criteria (CC1-CC9), evidence collection from cloud providers and identity… | ya | installed |
| `performing-threat-emulation-with-atomic-red-team` | Executes Atomic Red Team tests for MITRE ATT&CK technique validation using the atomic-operator Python framework. Loads test definitions from YAML atomics, runs attack si… | ya | installed |
| `performing-wifi-password-cracking-with-aircrack` | Captures WPA/WPA2 handshakes and performs offline password cracking using aircrack-ng, hashcat, and dictionary attacks during authorized wireless security assessments to… | ya | installed |
| `performing-wireless-security-assessment-with-kismet` | Conduct wireless network security assessments using Kismet to detect rogue access points, hidden SSIDs, weak encryption, and unauthorized clients through passive RF moni… | ya | installed |
| `post-exploiting-microsoft-graph-with-graphrunner` | Runs GraphRunner, a PowerShell post-exploitation toolset built on the Microsoft Graph API, to perform tenant recon, establish persistence (OAuth app injection, inbox rul… | ya | installed |
| `relaying-ntlm-for-adcs-esc8` | Uses Impacket's ntlmrelayx.py with a coercion tool (PetitPotam, Coercer, printerbug) to relay NTLM authentication from a coerced domain controller into the AD CS HTTP we… | ya | installed |

## 2. Malware Analysis & Reverse Engineering — 111 skill

**Kategori:** malware-analysis  ·  **Terpasang:** 111 / 111  ·  **Documented-only:** 0  

**Ringkasan:** Static and dynamic analysis of hostile binaries and documents: unpacking, disassembly, deobfuscation, sandboxing, and YARA classification.

**Tema:** `static-analysis`, `dynamic-sandbox-analysis`, `reverse-engineering`, `yara-detection-rules`, `memory-disk-forensics`, `malware-actor-analysis`

| Skill | Kegunaan | Terpasang | Status |
|---|---|---|---|
| `analyzing-android-malware-with-apktool` | Perform static analysis of Android APK malware using apktool for resource decompilation, jadx for Java source recovery, and androguard for manifest inspection, dangerous… | ya | installed |
| `analyzing-api-gateway-access-logs` | Parses API Gateway access logs (AWS API Gateway, Kong, Nginx) to detect BOLA/IDOR attacks, rate limit bypass, credential scanning, and injection attempts. Uses pandas fo… | ya | installed |
| `analyzing-apt-group-with-mitre-navigator` | Query ATT&CK data with attackcti, mitreattack-python, and stix2, then build MITRE ATT&CK Navigator layers and multi-layer heatmap overlays mapping one or more APT groups… | ya | installed |
| `analyzing-azure-activity-logs-for-threats` | Queries Azure Monitor activity logs and sign-in logs via azure-monitor-query to detect suspicious administrative operations, impossible travel, privilege escalation, and… | ya | installed |
| `analyzing-bootkit-and-rootkit-samples` | Analyzes bootkit and advanced rootkit malware infecting the Master Boot Record (MBR), Volume Boot Record (VBR), or UEFI firmware for below-OS persistence, covering boot… | ya | installed |
| `analyzing-browser-forensics-with-hindsight` | Parse Chromium-based browser databases with Hindsight to extract and correlate browsing history, downloads, cookies, cached content, autofill data, saved passwords, and… | ya | installed |
| `analyzing-campaign-attribution-evidence` | Systematically evaluate cyber-campaign evidence to attribute an operation to a threat actor, using the Diamond Model and Analysis of Competing Hypotheses (ACH) to weigh… | ya | installed |
| `analyzing-certificate-transparency-for-phishing` | Monitor Certificate Transparency logs using crt.sh and Certstream to detect phishing domains, lookalike certificates, and unauthorized certificate issuance targeting you… | ya | installed |
| `analyzing-cloud-storage-access-patterns` | Detect abnormal access in AWS S3, GCS, and Azure Blob Storage by analyzing CloudTrail Data Events, GCS audit logs, and Azure Storage Analytics for after-hours bulk downl… | ya | installed |
| `analyzing-command-and-control-communication` | Analyzes malware C2 communication over HTTP, HTTPS, DNS, and custom protocols to reverse-engineer beacon patterns, command structures, data encoding, and infrastructure… | ya | installed |
| `analyzing-cyber-kill-chain` | Analyzes intrusion activity against the Lockheed Martin Cyber Kill Chain framework to identify which phases an adversary has completed, where defenses succeeded or faile… | ya | installed |
| `analyzing-disk-image-with-autopsy` | Perform comprehensive forensic analysis of raw (dd), E01, or AFF disk images with Autopsy and The Sleuth Kit, recovering deleted files, examining metadata and embedded a… | ya | installed |
| `analyzing-dns-logs-for-exfiltration` | Analyzes DNS query logs to detect data exfiltration via DNS tunneling, DGA domain communication, and covert C2 channels using entropy analysis, query volume anomalies, a… | ya | installed |
| `analyzing-docker-container-forensics` | Investigate compromised Docker containers by analyzing images, layers, volumes, logs, and runtime artifacts to identify malicious activity and evidence. | ya | installed |
| `analyzing-ethereum-smart-contract-vulnerabilities` | Perform static and symbolic analysis of Solidity smart contracts using Slither and Mythril to detect reentrancy, integer overflow, access control, and other vulnerabilit… | ya | installed |
| `analyzing-golang-malware-with-ghidra` | Reverse engineer Go-compiled malware in Ghidra by parsing Go buildinfo and pclntab structures, recovering stripped/obfuscated function names (e.g. via GoResolver), and e… | ya | installed |
| `analyzing-heap-spray-exploitation` | Detect and analyze heap spray attacks in memory dumps using Volatility3 plugins to identify NOP sled patterns, shellcode landing zones, and suspicious large allocations… | ya | installed |
| `analyzing-indicators-of-compromise` | Analyzes indicators of compromise (IOCs) including IP addresses, domains, file hashes, URLs, and email artifacts to determine maliciousness confidence, campaign attribut… | ya | installed |
| `analyzing-kubernetes-audit-logs` | Parses Kubernetes API server audit logs (JSON lines) to detect exec-into-pod, secret access, RBAC modifications, privileged pod creation, and anonymous API access, and b… | ya | installed |
| `analyzing-linux-audit-logs-for-intrusion` | Uses the Linux Audit framework (auditd) with ausearch and aureport utilities to detect intrusion attempts, unauthorized access, privilege escalation, and suspicious syst… | ya | installed |
| `analyzing-linux-elf-malware` | Analyze malicious Linux ELF binaries — botnets, cryptominers, ransomware, and rootkits targeting Linux servers, containers, and cloud infrastructure — through static ana… | ya | installed |
| `analyzing-linux-kernel-rootkits` | Detect kernel-level rootkits in Linux memory dumps using Volatility3 linux plugins (check_syscall, lsmod, hidden_modules), rkhunter system scanning, and /proc vs /sys di… | ya | installed |
| `analyzing-linux-system-artifacts` | Examine Linux system artifacts (auth logs, cron/systemd persistence, shell history, SSH keys, and system configuration) to uncover evidence of compromise, detect rootkit… | ya | installed |
| `analyzing-lnk-file-and-jump-list-artifacts` | Analyze Windows LNK shortcut files and Jump List artifacts with LECmd, JLECmd, and manual Shell Link Binary Format parsing to establish evidence of file access, program… | ya | installed |
| `analyzing-macro-malware-in-office-documents` | Analyzes malicious VBA macros embedded in Microsoft Office documents (Word, Excel, PowerPoint) to identify download cradles, payload execution, persistence mechanisms, a… | ya | installed |
| `analyzing-malicious-pdf-with-peepdf` | Perform static analysis of malicious PDF documents using peepdf, pdfid, and pdf-parser to extract embedded JavaScript, shellcode, and suspicious objects. Use when triagi… | ya | installed |
| `analyzing-malicious-url-with-urlscan` | URLScan.io is a free service for scanning and analyzing suspicious URLs. It captures screenshots, DOM content, HTTP transactions, JavaScript behavior, and network connec… | ya | installed |
| `analyzing-malware-behavior-with-cuckoo-sandbox` | Detonate malware samples in Cuckoo Sandbox to observe runtime behavior — process creation, file system and registry changes, network communications, and API calls — and… | ya | installed |
| `analyzing-malware-family-relationships-with-malpedia` | Query the Malpedia API to look up malware family aliases and naming (platform.family_name), pull community/vendor YARA rules, link families to threat actors, and map fam… | ya | installed |
| `analyzing-malware-persistence-with-autoruns` | Use Sysinternals Autoruns to systematically enumerate and analyze malware persistence mechanisms across Windows registry run keys, scheduled tasks, services, drivers, an… | ya | installed |
| `analyzing-malware-sandbox-evasion-techniques` | Detect sandbox and VM evasion techniques in malware samples by analyzing timing checks, VM/hypervisor artifact queries, user-interaction checks, and sleep-inflation patt… | ya | installed |
| `analyzing-memory-dumps-with-volatility` | Analyzes RAM memory dumps from compromised systems using the Volatility framework to identify malicious processes, injected code, network connections, loaded modules, an… | ya | installed |
| `analyzing-memory-forensics-with-lime-and-volatility` | Performs Linux memory acquisition using LiME (Linux Memory Extractor) kernel module and analysis with Volatility 3 framework. Extracts process lists, network connections… | ya | installed |
| `analyzing-mft-for-deleted-file-recovery` | Analyze the NTFS Master File Table ($MFT) with MFTECmd, analyzeMFT, and X-Ways Forensics to recover metadata and content of deleted files by examining MFT record entries… | ya | installed |
| `analyzing-network-covert-channels-in-malware` | Detect and analyze covert communication channels used by malware, including DNS tunneling, ICMP exfiltration, steganographic HTTP, and other protocol abuse used for C2 a… | ya | installed |
| `analyzing-network-flow-data-with-netflow` | Parse NetFlow v9 and IPFIX records to detect volumetric anomalies, port scanning, data exfiltration, and C2 beaconing patterns. Uses the Python netflow library to decode… | ya | installed |
| `analyzing-network-packets-with-scapy` | Use Scapy to craft, send, sniff, and dissect TCP/UDP/ICMP/DNS packets, analyze pcap files, implement SYN scans, and detect anomalous traffic such as fragmented or malfor… | ya | installed |
| `analyzing-network-traffic-for-incidents` | Analyzes network traffic captures and flow data to identify adversary activity during security incidents, including command-and-control communications, lateral movement,… | ya | installed |
| `analyzing-network-traffic-of-malware` | Analyzes network traffic generated by malware during sandbox execution or live incident response to identify C2 protocols, data exfiltration channels, payload downloads,… | ya | installed |
| `analyzing-network-traffic-with-wireshark` | Captures and analyzes network packet data using Wireshark and tshark to identify malicious traffic patterns, diagnose protocol issues, extract artifacts, and support inc… | ya | installed |
| `analyzing-office365-audit-logs-for-compromise` | Parse Office 365 Unified Audit Logs via Microsoft Graph API to detect email forwarding rule creation, inbox delegation, suspicious OAuth app grants, and other indicators… | ya | installed |
| `analyzing-outlook-pst-for-email-forensics` | Parse Microsoft Outlook PST and OST files using libpff and pst-utils to extract message content, headers, attachments, deleted items, and MAPI metadata, including recove… | ya | installed |
| `analyzing-packed-malware-with-upx-unpacker` | Identifies and unpacks UPX-packed malware samples, including binaries with modified UPX magic bytes or headers that block automated decompression, to recover the origina… | ya | installed |
| `analyzing-pdf-malware-with-pdfid` | Analyzes malicious PDF files using PDFiD, pdf-parser, and peepdf to identify embedded JavaScript, shellcode, exploits, and suspicious objects without opening the documen… | ya | installed |
| `analyzing-persistence-mechanisms-in-linux` | Scan Linux systems for persistence mechanisms including crontab/systemd entries, LD_PRELOAD injection, shell profile modifications (.bashrc, .profile), and SSH authorize… | ya | installed |
| `analyzing-powershell-empire-artifacts` | Detect PowerShell Empire post-exploitation framework artifacts in Windows Script Block Logging (Event ID 4104) and Module Logging (Event ID 4103), including the default… | ya | installed |
| `analyzing-powershell-script-block-logging` | Parse Windows PowerShell Script Block Logs (Event ID 4104) from EVTX files to detect obfuscated commands, encoded payloads, and living-off-the-land techniques. Uses pyth… | ya | installed |
| `analyzing-prefetch-files-for-execution-history` | Parse Windows Prefetch files (versions 17, 23, 26, 30) with tools like PECmd, WinPrefetchView, or python-prefetch to determine program execution history, including run c… | ya | installed |
| `analyzing-ransomware-encryption-mechanisms` | Analyzes encryption algorithms, key management, and file encryption routines used by ransomware families to assess decryption feasibility, identify implementation weakne… | ya | installed |
| `analyzing-ransomware-leak-site-intelligence` | Safely monitor ransomware group Tor-hosted data leak sites (DLS) to collect and extract structured victim posting data, track group activity trends over time, and produc… | ya | installed |
| `analyzing-ransomware-network-indicators` | Identify ransomware-related network indicators, including C2 beaconing patterns, TOR exit node connections, data exfiltration flows, and encryption key exchange, by anal… | ya | installed |
| `analyzing-ransomware-payment-wallets` | Traces ransomware cryptocurrency payment flows using blockchain analysis tools such as Chainalysis Reactor, WalletExplorer, and blockchain.com APIs, identifying wallet c… | ya | installed |
| `analyzing-sbom-for-supply-chain-vulnerabilities` | Parses Software Bill of Materials (SBOM) in CycloneDX and SPDX JSON formats to identify supply chain vulnerabilities by correlating components against the NVD CVE databa… | ya | installed |
| `analyzing-security-logs-with-splunk` | Leverages Splunk Enterprise Security and SPL (Search Processing Language) to investigate security incidents through log correlation, timeline reconstruction, and anomaly… | ya | installed |
| `analyzing-slack-space-and-file-system-artifacts` | Examine NTFS slack space, MFT entries, the USN Change Journal, and Alternate Data Streams (ADS) to recover hidden or residual data, reconstruct deleted-file metadata, an… | ya | installed |
| `analyzing-supply-chain-malware-artifacts` | Investigate supply chain attack artifacts including trojanized software updates, compromised build pipelines, and sideloaded dependencies to identify intrusion vectors a… | ya | installed |
| `analyzing-threat-actor-ttps-with-mitre-attack` | Systematically map threat actor behavior and observed IOCs to the MITRE ATT&CK framework, build technique coverage heatmaps with the ATT&CK Navigator, identify detection… | ya | installed |
| `analyzing-threat-actor-ttps-with-mitre-navigator` | Map advanced persistent threat (APT) group TTPs to the MITRE ATT&CK framework using the attackcti Python library to query STIX/TAXII data for group-technique association… | ya | installed |
| `analyzing-threat-intelligence-feeds` | Analyzes structured and unstructured threat intelligence feeds to extract actionable indicators, adversary tactics, and campaign context. Use when ingesting commercial o… | ya | installed |
| `analyzing-threat-landscape-with-misp` | Query a MISP (Malware Information Sharing Platform) instance via PyMISP to compute event statistics, IOC type breakdowns, threat actor galaxy clusters, and tag trends, a… | ya | installed |
| `analyzing-tls-certificate-transparency-logs` | Queries Certificate Transparency logs via crt.sh and pycrtsh to detect phishing domains, unauthorized certificate issuance, and shadow IT. Monitors newly issued certific… | ya | installed |
| `analyzing-typosquatting-domains-with-dnstwist` | Generate domain permutations with dnstwist and check DNS resolution to detect typosquatting, homograph phishing, and brand impersonation domains registered against your… | ya | installed |
| `analyzing-uefi-bootkit-persistence` | Analyzes UEFI bootkit persistence (SPI flash implants, ESP modifications, Secure Boot bypass, UEFI variable manipulation) using chipsec for firmware integrity verificati… | ya | installed |
| `analyzing-usb-device-connection-history` | Correlate Windows registry keys (USBSTOR, MountedDevices), Event Logs, and setupapi.dev.log to reconstruct USB device connection history, first/last-plugged timestamps,… | ya | installed |
| `analyzing-web-server-logs-for-intrusion` | Parse Apache and Nginx access logs to detect SQL injection attempts, local file inclusion, directory traversal, web scanner fingerprints, and brute-force patterns. Uses… | ya | installed |
| `analyzing-windows-amcache-artifacts` | Parses the Windows Amcache.hve registry hive with Eric Zimmerman's AmcacheParser and Timeline Explorer to extract evidence of program execution, application installation… | ya | installed |
| `analyzing-windows-event-logs-in-splunk` | Analyzes Windows Security, System, and Sysmon event logs in Splunk to detect authentication attacks, privilege escalation, persistence mechanisms, and lateral movement u… | ya | installed |
| `analyzing-windows-lnk-files-for-artifacts` | Parse Windows LNK shortcut files to extract target paths, MAC timestamps, volume serial numbers, and machine identifiers for forensic timeline reconstruction. Use when i… | ya | installed |
| `analyzing-windows-prefetch-with-python` | Parse Windows Prefetch (.pf) files with the windowsprefetch Python library to reconstruct application execution history, run counts, and accessed file/volume lists. Use… | ya | installed |
| `analyzing-windows-registry-for-artifacts` | Extract and analyze Windows Registry hives with tools like RegRipper and Registry Explorer to uncover user activity, installed software, autostart/persistence entries, a… | ya | installed |
| `analyzing-windows-shellbag-artifacts` | Analyze Windows Shellbag (BagMRU) registry artifacts with SBECmd and Shellbags Explorer to reconstruct folder browsing activity and prove user interaction with directori… | ya | installed |
| `auditing-uefi-firmware-with-chipsec` | Use Intel CHIPSEC to assess platform firmware configuration, SPI flash write protection, BIOS lock, SMM/SMRR, and Secure Boot variable state, dump SPI flash, and triage… | ya | installed |
| `building-automated-malware-submission-pipeline` | Builds an automated malware submission and analysis pipeline that collects suspicious files from endpoints and email gateways, submits them to sandbox environments and m… | ya | installed |
| `building-malware-incident-communication-template` | Build structured communication templates for malware incidents (ransomware, wiper, trojan, worm), covering internal stakeholder notifications, executive briefings, techn… | ya | installed |
| `conducting-malware-incident-response` | Respond to malware infections across enterprise endpoints by identifying the malware family, determining infection vectors, assessing spread, and executing containment,… | ya | installed |
| `deobfuscating-javascript-malware` | Deobfuscates malicious JavaScript found in phishing pages, web skimmers, and dropper scripts by reversing encoding layers, eval chains, string manipulation, and control-… | ya | installed |
| `deobfuscating-powershell-obfuscated-malware` | Systematically deobfuscates multi-layer PowerShell malware using AST analysis, dynamic tracing, and tools like PSDecode and PowerDecode to reveal hidden payloads and C2… | ya | installed |
| `detecting-container-escape-attempts` | Detects container escape at runtime across tooling - namespace manipulation, capability abuse, kernel exploits, sensitive host mounts, and anomalous syscalls - and expla… | ya | installed |
| `detecting-container-escape-with-falco-rules` | Writes and tunes Falco rule syntax for container escape detection - conditions, macros, lists, priorities, and output fields - covering host filesystem mounts, sensitive… | ya | installed |
| `detecting-fileless-malware-techniques` | Detects and analyzes fileless malware that operates entirely in memory using PowerShell, WMI, .NET reflection, registry-resident payloads, and living-off-the-land binari… | ya | installed |
| `detecting-mobile-malware-behavior` | Detects and analyzes malicious behavior in mobile applications through behavioral analysis, permission abuse detection, network traffic monitoring, and dynamic instrumen… | ya | installed |
| `detecting-ransomware-encryption-behavior` | Detects ransomware encryption activity in real time using entropy analysis, file system I/O monitoring (Sysmon, watchdog, psutil), and behavioral scoring to identify mas… | ya | installed |
| `detecting-rootkit-activity` | Detects rootkit presence on compromised systems by identifying hidden processes, hooked system calls, modified kernel structures, and covert network connections using Vo… | ya | installed |
| `eradicating-malware-from-infected-systems` | Systematically map and remove malware, backdoors, and attacker persistence mechanisms (registry Run keys, scheduled tasks, WMI subscriptions, services, cron/init.d) from… | ya | installed |
| `extracting-browser-history-artifacts` | Extracts and analyzes browser history, cookies, cache, downloads, and bookmarks from Chrome, Firefox, and Edge using sqlite3, DB Browser for SQLite, Hindsight, and NirSo… | ya | installed |
| `extracting-config-from-agent-tesla-rat` | Extracts embedded configuration from Agent Tesla RAT samples, including SMTP/FTP/Telegram exfiltration credentials, keylogger settings, and C2 endpoints, via .NET decomp… | ya | installed |
| `extracting-credentials-from-memory-dump` | Extracts cached credentials, password hashes, Kerberos tickets, and authentication tokens from Windows memory dumps using Volatility 3, Mimikatz, and pypykatz. Use when… | ya | installed |
| `extracting-iocs-from-malware-samples` | Extracts indicators of compromise (IOCs) from malware samples, including file hashes, network indicators (IPs, domains, URLs, PCAP indicators), host artifacts (file path… | ya | installed |
| `extracting-memory-artifacts-with-rekall` | Uses Rekall memory forensics framework to analyze memory dumps for process hollowing, injected code via VAD anomalies, hidden processes, and rootkit detection. Applies p… | ya | installed |
| `extracting-windows-event-logs-artifacts` | Extract, parse, and analyze Windows Event Logs (EVTX) using Chainsaw, Hayabusa, and EvtxECmd to detect lateral movement, persistence, and privilege escalation. | ya | installed |
| `hunting-bootkits-in-efi-system-partition` | Baseline the EFI System Partition and hunt malicious EFI binaries such as ESPecter, BlackLotus, Bootkitty, and Glupteba by mounting the ESP, hashing and verifying boot l… | ya | installed |
| `performing-automated-malware-analysis-with-cape` | Deploy and operate the CAPEv2 malware sandbox (a Cuckoo derivative) to run samples in a monitored Windows guest VM, capturing behavioral signatures, dropped files, PCAP… | ya | installed |
| `performing-container-escape-detection` | Audits container and pod configuration for escape-enabling misconfiguration using the Kubernetes Python client - privileged flags, dangerous capability grants, host path… | ya | installed |
| `performing-dynamic-analysis-with-any-run` | Perform interactive dynamic malware analysis using the ANY.RUN cloud sandbox to detonate samples, observe real-time execution behavior, interact with malware prompts suc… | ya | installed |
| `performing-firmware-extraction-with-binwalk` | Performs firmware image extraction and analysis using binwalk to identify embedded filesystems, compressed archives, bootloaders, kernel images, and cryptographic materi… | ya | installed |
| `performing-firmware-malware-analysis` | Analyzes firmware images for embedded malware, backdoors, and unauthorized modifications in routers, IoT devices, UEFI/BIOS, and embedded systems, covering firmware extr… | ya | installed |
| `performing-malware-hash-enrichment-with-virustotal` | Enrich malware file hashes (MD5, SHA-1, SHA-256) using the VirusTotal API v3 to retrieve multi-engine detection rates, sandbox behavioral analysis, YARA rule matches, re… | ya | installed |
| `performing-malware-ioc-extraction` | Malware IOC extraction is the process of analyzing malicious software to identify actionable indicators of compromise including file hashes, network indicators (C2 domai… | ya | installed |
| `performing-malware-persistence-investigation` | Systematically investigate all persistence mechanisms on Windows and Linux systems to identify how malware survives reboots and maintains access. | ya | installed |
| `performing-malware-triage-with-yara` | Performs rapid malware triage and classification using YARA rules that match file patterns, strings, byte sequences, and structural characteristics against known malware… | ya | installed |
| `performing-plc-firmware-security-analysis` | This skill covers analyzing Programmable Logic Controller (PLC) firmware for security vulnerabilities including hardcoded credentials, insecure update mechanisms, backdo… | ya | installed |
| `performing-static-malware-analysis-with-pe-studio` | Performs static analysis of Windows PE malware samples using PEStudio to examine file headers, imports, strings, and resources without executing the binary, identifying… | ya | installed |
| `performing-steganography-detection` | Detects and extracts hidden data embedded in images, audio, and other media files using steganalysis tools such as StegDetect, zsteg, stegsolve, binwalk, steghide, and O… | ya | installed |
| `performing-threat-hunting-with-yara-rules` | Use YARA pattern-matching rules to hunt for malware, suspicious files, and indicators of compromise across filesystems and memory dumps. Covers rule authoring, yara-pyth… | ya | installed |
| `performing-threat-landscape-assessment-for-sector` | Conducts a sector-specific threat landscape assessment (financial, healthcare, energy, government, etc.) by profiling targeting threat actors, mapping attack vectors and… | ya | installed |
| `performing-yara-rule-development-for-detection` | Develops precise YARA and YARA-X rules for malware detection by identifying unique strings, byte sequences, PE header traits, and behavioral indicators in unpacked malwa… | ya | installed |
| `reverse-engineering-android-malware-with-jadx` | Reverse engineers malicious Android APK files using the JADX decompiler to read Java/Kotlin source, inspect manifest permissions, receivers, services, and native librari… | ya | installed |
| `reverse-engineering-dotnet-malware-with-dnspy` | Reverse engineers .NET malware samples using the dnSpy decompiler and debugger to read C#/VB.NET source, deobfuscate code protected by tools like ConfuserEx or SmartAsse… | ya | installed |
| `reverse-engineering-malware-with-ghidra` | Reverse engineers malware binaries using NSA's Ghidra disassembler and decompiler to study internal logic, cryptographic routines, C2 protocols, and evasion techniques a… | ya | installed |
| `reverse-engineering-ransomware-encryption-routine` | Reverse engineer ransomware encryption routines to identify cryptographic algorithms, key generation flaws, and potential decryption opportunities using static and dynam… | ya | installed |
| `reverse-engineering-rust-malware` | Reverse engineers Rust-compiled malware using IDA Pro and Ghidra, covering techniques for non-null-terminated fat-pointer strings, monomorphized/duplicated generic code,… | ya | installed |

## 3. Detection Engineering & Threat Hunting — 122 skill

**Kategori:** detection-engineering  ·  **Terpasang:** 122 / 122  ·  **Documented-only:** 0  

**Ringkasan:** Writing and tuning detection content: SIEM rules, Sigma, behavioural hunting, beaconing and anomaly analysis, and MITRE ATT&CK coverage mapping.

**Tema:** `siem-detection-authoring`, `threat-hunting`, `mitre-attack-coverage`, `behavioral-anomaly-detection`, `cloud-and-identity-detection`, `network-and-protocol-anomalies`

| Skill | Kegunaan | Terpasang | Status |
|---|---|---|---|
| `building-cloud-siem-with-sentinel` | Deploy Microsoft Sentinel as a cloud-native SIEM/SOAR by configuring multi-cloud data connectors (AWS, Azure, GCP), writing KQL detection and hunting queries, and buildi… | ya | installed |
| `building-detection-rule-with-splunk-spl` | Build effective detection rules using Splunk Search Processing Language (SPL) correlation searches to identify security threats in SOC environments. | ya | installed |
| `building-detection-rules-with-sigma` | Builds vendor-agnostic detection rules using the Sigma rule format for threat detection across SIEM platforms including Splunk, Elastic, and Microsoft Sentinel. Use when… | ya | installed |
| `building-threat-intelligence-enrichment-in-splunk` | Build automated IOC enrichment pipelines in Splunk Enterprise Security by ingesting threat feeds into KV Store collections and correlating them against security events v… | ya | installed |
| `correlating-security-events-in-qradar` | Correlates security events in IBM QRadar SIEM using AQL (Ariel Query Language), custom rules, building blocks, and offense management to detect multi-stage attacks acros… | ya | installed |
| `correlating-threat-campaigns` | Correlates disparate security incidents, IOCs, and adversary behaviors across time and organizations to identify unified threat campaigns, attribute them to common threa… | ya | installed |
| `designing-adversary-engagement-with-mitre-engage` | Plan, run, and measure an adversary engagement operation using the MITRE Engage framework so that deployed deception is driven by strategy instead of deployed ad hoc. Co… | ya | installed |
| `detecting-ai-model-prompt-injection-attacks` | Detects prompt injection using regex signature matching, heuristic scoring for structural anomalies, and DeBERTa-based transformer classification, flagging direct inject… | ya | installed |
| `detecting-anomalies-in-industrial-control-systems` | Deploys anomaly detection for OT/ICS environments using machine learning on OT network baselines, physics-based process models, and Modbus/DNP3/OPC UA traffic analysis t… | ya | installed |
| `detecting-anomalous-authentication-patterns` | Detects anomalous authentication patterns using UEBA analytics, statistical baselines, and machine learning models to identify impossible travel, credential stuffing, br… | ya | installed |
| `detecting-api-enumeration-attacks` | Detect API enumeration attacks (BOLA/IDOR, OWASP API1:2023) by writing SIEM detection rules that flag sequential or UUID identifier iteration, parameter tampering, and m… | ya | installed |
| `detecting-arp-poisoning-in-network-traffic` | Detect Layer 2 ARP poisoning/spoofing by deploying ARPWatch, Dynamic ARP Inspection (DAI), Wireshark packet analysis, and custom Python monitoring scripts that flag grat… | ya | installed |
| `detecting-attacks-on-historian-servers` | Detect cyber attacks on OT historian servers (OSIsoft PI, Ignition, GE Proficy, Wonderware InSQL) using a Python detector that flags unauthorized queries, data manipulat… | ya | installed |
| `detecting-attacks-on-scada-systems` | This skill covers detecting cyber attacks targeting Supervisory Control and Data Acquisition (SCADA) systems including man-in-the-middle attacks on industrial protocols,… | ya | installed |
| `detecting-aws-cloudtrail-anomalies` | Detect unusual API call patterns in AWS CloudTrail logs using boto3, statistical baselining, and behavioral analysis to identify credential compromise, privilege escalat… | ya | installed |
| `detecting-aws-credential-exposure-with-trufflehog` | Scan source code repositories, CI/CD pipelines, and configuration files for exposed AWS credentials using TruffleHog, git-secrets, and AWS-native detection. Use when int… | ya | installed |
| `detecting-aws-guardduty-findings-automation` | Build automated AWS GuardDuty finding response pipelines using EventBridge and Lambda to trigger real-time incident response, automatically quarantine compromised resour… | ya | installed |
| `detecting-aws-iam-privilege-escalation` | Detect AWS IAM privilege escalation paths using boto3 and Cloudsplaining policy analysis to identify overly permissive policies, dangerous permission combinations, and l… | ya | installed |
| `detecting-azure-lateral-movement` | Detect lateral movement in Azure AD/Entra ID environments using Microsoft Graph API audit logs, Azure Sentinel KQL hunting queries, and sign-in anomaly correlation to id… | ya | installed |
| `detecting-azure-service-principal-abuse` | Detect Azure service principal abuse in Microsoft Entra ID using KQL detection queries (Sentinel/Splunk) against Azure AD Audit and Sign-in Logs, covering added credenti… | ya | installed |
| `detecting-azure-storage-account-misconfigurations` | Audit Azure Blob and ADLS storage accounts for public access exposure, weak or long-lived SAS tokens, missing encryption at rest, disabled HTTPS-only traffic, and outdat… | ya | installed |
| `detecting-bluetooth-low-energy-attacks` | Detects and analyzes Bluetooth Low Energy (BLE) security attacks including sniffing, replay attacks, GATT enumeration abuse, and Man-in-the-Middle interception. Uses Ube… | ya | installed |
| `detecting-broken-object-property-level-authorization` | Detect and test for OWASP API3:2023 Broken Object Property Level Authorization (BOPLA), covering excessive data exposure in API responses and mass assignment via injecte… | ya | installed |
| `detecting-business-email-compromise` | Detect Business Email Compromise (BEC) fraud, where attackers impersonate executives or vendors to trick employees into wire transfers or data disclosure without malicio… | ya | installed |
| `detecting-business-email-compromise-with-ai` | Deploy AI and NLP-powered detection systems to identify business email compromise attacks by analyzing writing style, behavioral patterns, and contextual anomalies that… | ya | installed |
| `detecting-cloud-threats-with-guardduty` | Deploy and operationalize Amazon GuardDuty, covering protection plans for S3, EKS, EC2 runtime monitoring, and Lambda, interpreting finding severity, and building automa… | ya | installed |
| `detecting-command-and-control-over-dns` | Detect command-and-control (C2) traffic tunneled over DNS from tools like Iodine, dnscat2, dns2tcp, and Cobalt Strike DNS beacon, using Shannon entropy analysis of query… | ya | installed |
| `detecting-compromised-cloud-credentials` | Detect compromised cloud credentials across AWS, Azure, and GCP by analyzing anomalous API activity, impossible-travel patterns, and credential-stuffing indicators using… | ya | installed |
| `detecting-container-drift-at-runtime` | Detects unauthorized runtime drift in containers by monitoring binary execution, filesystem changes, and configuration deviation from the original immutable image, using… | ya | installed |
| `detecting-container-runtime-threats-with-falco` | Deploys and operates Falco with the modern eBPF driver in Kubernetes and Docker, covering driver selection, Helm installation, output channels, and the built-in ruleset… | ya | installed |
| `detecting-credential-dumping-techniques` | Detect LSASS credential dumping, SAM database extraction, and NTDS.dit theft (e.g. via Mimikatz) using Sysmon Event ID 10 process-access logging, Windows Security logs,… | ya | installed |
| `detecting-cryptomining-in-cloud` | This skill teaches security teams how to detect and respond to unauthorized cryptocurrency mining operations in cloud environments. It covers identifying cryptomining in… | ya | installed |
| `detecting-data-and-model-poisoning` | Identify poisoned training data and backdoored ML models across the pipeline using IBM's Adversarial Robustness Toolbox (activation clustering, spectral signatures, trig… | ya | installed |
| `detecting-deepfake-audio-in-vishing-attacks` | Detect AI-generated deepfake audio used in voice phishing (vishing) by extracting spectral features (MFCC, spectral centroid, spectral contrast, zero-crossing rate) and… | ya | installed |
| `detecting-dll-sideloading-attacks` | Detect DLL side-loading and search-order hijacking (MITRE T1574) where adversaries plant malicious DLLs for legitimate signed applications to load, by analyzing Sysmon E… | ya | installed |
| `detecting-dnp3-protocol-anomalies` | Detect anomalies in DNP3 communications used in SCADA/ICS systems by monitoring unauthorized control commands, firmware update attempts, protocol violations, and deviati… | ya | installed |
| `detecting-dns-exfiltration-with-dns-query-analysis` | Detect data exfiltration via DNS tunneling (tools like iodine, dnscat2, dns2tcp) by analyzing query entropy, subdomain length, query volume to single domains, TXT/CNAME/… | ya | installed |
| `detecting-email-account-compromise` | Detect compromised O365 and Google Workspace email accounts by analyzing Unified Audit Logs and Azure AD sign-in logs for impossible travel, inbox rule creation/deletion… | ya | installed |
| `detecting-email-forwarding-rules-attack` | Detect malicious inbox/mail-flow forwarding rules that adversaries create to maintain persistent access to email communications for intelligence collection and business… | ya | installed |
| `detecting-entra-offensive-tools-in-graph-logs` | Hunt AADGraphActivityLogs and MicrosoftGraphActivityLogs in Microsoft Sentinel/Log Analytics using KQL to fingerprint offensive Entra ID enumeration tools such as ROADto… | ya | installed |
| `detecting-golden-ticket-attacks-in-kerberos-logs` | Detect Golden Ticket attacks in Active Directory using Splunk and KQL queries against domain controller event logs, looking for Kerberos TGT anomalies such as mismatched… | ya | installed |
| `detecting-golden-ticket-forgery` | Detect Kerberos Golden Ticket forgery (e.g. Mimikatz-forged tickets) by analyzing Windows Event ID 4769 for RC4 encryption downgrades (0x17), abnormal ticket lifetimes,… | ya | installed |
| `detecting-indirect-prompt-injection` | Detect and defend against indirect prompt injection hidden in web pages, documents, and images consumed by an agent, via content extraction (HTML/PDF/OCR), normalization… | ya | installed |
| `detecting-lateral-movement-in-network` | Identifies lateral movement techniques in enterprise networks by analyzing authentication logs, network flows, SMB traffic, and RDP sessions using Zeek, Velociraptor, an… | ya | installed |
| `detecting-lateral-movement-with-splunk` | Detect adversary lateral movement across networks using Splunk SPL queries against Windows authentication logs, SMB traffic, and remote service (WMI/PsExec/RDP) abuse. U… | ya | installed |
| `detecting-living-off-the-land-attacks` | Detect abuse of legitimate Windows binaries (LOLBins) used for living off the land attacks. Monitors process creation, command-line arguments, and parent-child relations… | ya | installed |
| `detecting-malicious-npm-packages` | Triage npm packages and lockfiles for install-script malware, credential exfiltration, and worming behavior using GuardDog, manual tarball inspection, and dynamic detona… | ya | installed |
| `detecting-malicious-scheduled-tasks-with-sysmon` | Detect malicious scheduled task creation and modification using Sysmon Event IDs 1 (Process Create for schtasks.exe), 11 (File Create for task XML), and Windows Security… | ya | installed |
| `detecting-mimikatz-execution-patterns` | Detect Mimikatz credential-dumping activity via command-line pattern matching, LSASS access signatures, binary/hash indicators, and in-memory detection of known Mimikatz… | ya | installed |
| `detecting-misconfigured-azure-storage` | Audit Azure Storage accounts for public blob containers, missing encryption, overly permissive SAS tokens, disabled logging, and network access violations using Azure CL… | ya | installed |
| `detecting-modbus-command-injection-attacks` | Detect command injection against Modbus TCP/RTU in ICS/SCADA environments by monitoring unauthorized writes, anomalous function codes, malformed frames, and deviations f… | ya | installed |
| `detecting-modbus-protocol-anomalies` | Detect anomalies in Modbus/TCP and Modbus RTU industrial traffic via function code monitoring, register range validation, timing analysis, and deep packet inspection, us… | ya | installed |
| `detecting-model-extraction-attacks` | Detect MITRE ATLAS AML.T0024 attacks (model stealing, inversion, membership inference) performed via inference-API abuse, by monitoring per-principal query volume/distri… | ya | installed |
| `detecting-oauth-token-theft` | Detect and respond to OAuth token theft and replay in Microsoft Entra ID (Azure AD), covering access token theft, refresh token replay, Primary Refresh Token (PRT) abuse… | ya | installed |
| `detecting-privilege-escalation-attempts` | Detect privilege escalation attempts across Windows and Linux, including access token manipulation, UAC bypass, unquoted service path abuse, kernel exploits, and sudo/do… | ya | installed |
| `detecting-privilege-escalation-in-kubernetes-pods` | Detects and prevents privilege escalation inside Kubernetes pods by combining admission control (OPA policies), runtime monitoring (Falco), and audit log analysis of sec… | ya | installed |
| `detecting-process-hollowing-technique` | Detect process hollowing (MITRE T1055.012) by analyzing memory-mapped sections, hollowed process indicators, and parent-child anomalies using EDR telemetry, Volatility's… | ya | installed |
| `detecting-process-injection-techniques` | Detects and analyzes process injection techniques used by malware including classic DLL injection, process hollowing, APC injection, thread hijacking, and reflective loa… | ya | installed |
| `detecting-ransomware-precursors-in-network` | Detects early-stage ransomware indicators in network traffic before encryption begins, including initial access broker activity, command-and-control beaconing, credentia… | ya | installed |
| `detecting-rdp-brute-force-attacks` | Detect RDP brute force attacks by parsing Windows Security Event Logs (EVTX files, via python-evtx) for failed logon patterns (Event ID 4625, Logon Type 10/3), correlati… | ya | installed |
| `detecting-s3-data-exfiltration-attempts` | Detecting data exfiltration attempts from AWS S3 buckets by analyzing CloudTrail S3 data events, VPC Flow Logs, GuardDuty findings, Amazon Macie alerts, and S3 access pa… | ya | installed |
| `detecting-secure-boot-bypass` | Detect UEFI Secure Boot bypasses and bootkits such as BlackLotus and Bootkitty by verifying Secure Boot state, checking dbx revocation currency, and hashing EFI boot bin… | ya | installed |
| `detecting-serverless-function-injection` | Detects and prevents code injection attacks targeting serverless functions (AWS Lambda, Azure Functions, Google Cloud Functions) through event source poisoning, maliciou… | ya | installed |
| `detecting-shadow-it-cloud-usage` | Detect unauthorized SaaS and cloud service usage (shadow IT) by parsing proxy access logs, DNS query logs, and firewall/netflow data with Python pandas to aggregate traf… | ya | installed |
| `detecting-spearphishing-with-email-gateway` | Detect and block spearphishing emails that use personalized, researched content to evade generic spam filters, by configuring email security gateway (SEG) impersonation… | ya | installed |
| `detecting-sql-injection-via-waf-logs` | Analyze WAF (ModSecurity/AWS WAF/Cloudflare) logs to detect SQL injection attack campaigns. Parses ModSecurity audit logs and JSON WAF event logs to identify SQLi patter… | ya | installed |
| `detecting-stuxnet-style-attacks` | Detects sophisticated cyber-physical attacks that follow the Stuxnet pattern of modifying PLC logic while spoofing sensor readings to hide the manipulation, using PLC lo… | ya | installed |
| `detecting-supply-chain-attacks-in-ci-cd` | Scans GitHub Actions workflows and CI/CD pipeline configurations for supply chain attack vectors including unpinned actions, script injection via expressions, dependency… | ya | installed |
| `detecting-suspicious-oauth-application-consent` | Detect risky OAuth application consent grants in Azure AD / Microsoft Entra ID using Microsoft Graph API, audit logs, and permission analysis to identify illicit consent… | ya | installed |
| `detecting-suspicious-powershell-execution` | Hunt for suspicious PowerShell execution (T1059.001) such as encoded commands, download cradles, AMSI bypass, and constrained language mode evasion using EDR telemetry (… | ya | installed |
| `detecting-t1055-process-injection-with-sysmon` | Detect process injection techniques (T1055) - including DLL injection, process hollowing, and APC injection - by analyzing Sysmon Event IDs 1, 7, 8, 10, and 25 for cross… | ya | installed |
| `detecting-t1548-abuse-elevation-control-mechanism` | Detect abuse of elevation control mechanisms (T1548), including Windows UAC bypass via auto-elevating binaries like fodhelper.exe and Linux sudo/setuid/setgid exploitati… | ya | installed |
| `detecting-typosquatting-packages` | Flag misspelled, brandjacked, and typosquatted package names across npm, PyPI, and crates.io before installation, using edit-distance, keyboard-proximity, and known-targ… | ya | installed |
| `detecting-typosquatting-packages-in-npm-pypi` | Detects typosquatting attacks in npm and PyPI package registries by analyzing package name similarity using Levenshtein distance and other string metrics, examining publ… | ya | installed |
| `detecting-wmi-persistence` | Detect WMI event subscription persistence (MITRE T1546.003) by analyzing Sysmon Event IDs 19, 20, and 21 for malicious EventFilter, EventConsumer, and FilterToConsumerBi… | ya | installed |
| `fleet-hunting-with-velociraptor` | Deploy a Velociraptor server and agents, then author VQL (Velociraptor Query Language) artifacts and run them as fleet-wide hunts, on-demand forensic collections, or sta… | ya | installed |
| `generating-forensic-timelines-with-hayabusa` | Run Hayabusa against collected Windows EVTX files to apply Sigma detection rules and produce a prioritized, chronological CSV/JSON timeline with severity levels, MITRE A… | ya | installed |
| `hunting-advanced-persistent-threats` | Proactively hunts for Advanced Persistent Threat (APT) activity within enterprise environments using hypothesis-driven searches across endpoint telemetry, network logs,… | ya | installed |
| `hunting-credential-stuffing-attacks` | Detects credential stuffing attacks by analyzing authentication logs for login velocity anomalies, ASN diversity, password spray patterns, and geographic distribution of… | ya | installed |
| `hunting-evtx-with-chainsaw` | Run Chainsaw against collected Windows EVTX files to hunt with the SigmaHQ rule corpus, built-in detection rules, and high-speed keyword/regex search, plus analyze shimc… | ya | installed |
| `hunting-for-anomalous-powershell-execution` | Hunt for malicious PowerShell activity by analyzing Script Block Logging (Event 4104), Module Logging (Event 4103), and process creation events. The analyst parses Windo… | ya | installed |
| `hunting-for-data-exfiltration-indicators` | Hunt for data exfiltration by analyzing Zeek and Suricata network telemetry for unusual data flows, DNS tunneling via large/frequent TXT queries, uploads to personal clo… | ya | installed |
| `hunting-for-data-staging-before-exfiltration` | Detect data-staging activity (MITRE ATT&CK T1074) by analyzing EDR/Sysmon process-creation and file-system telemetry (Event ID 4688, Sysmon 1/11) for 7-Zip/RAR/tar archi… | ya | installed |
| `hunting-for-dcom-lateral-movement` | Hunt for DCOM-based lateral movement (MITRE ATT&CK T1021.003) by detecting abuse of MMC20.Application, ShellBrowserWindow, and ShellWindows COM objects via Sysmon Event… | ya | installed |
| `hunting-for-defense-evasion-via-timestomping` | Detect NTFS timestamp manipulation (MITRE T1070.006) by comparing $STANDARD_INFORMATION vs $FILE_NAME timestamps in the MFT. Uses analyzeMFT and Python to identify files… | ya | installed |
| `hunting-for-lateral-movement-via-wmi` | Detects WMI-based lateral movement (e.g. wmic process call create, Win32_Process.Create()) by analyzing Windows Event ID 4688 and Sysmon Event ID 1 for WmiPrvSE.exe spaw… | ya | installed |
| `hunting-for-living-off-the-cloud-techniques` | Hunts for adversary abuse of legitimate cloud services (Azure, AWS, GCP, and SaaS platforms) for command-and-control, data staging, and exfiltration, i.e. "living off th… | ya | installed |
| `hunting-for-living-off-the-land-binaries` | Proactively hunts for adversary abuse of legitimate, signed system binaries (LOLBins) used to execute malicious payloads, download files, or proxy execution while evadin… | ya | installed |
| `hunting-for-persistence-mechanisms-in-windows` | Systematically hunts for adversary persistence mechanisms across Windows endpoints, covering registry Run/RunOnce keys, services, startup folders, scheduled tasks, and W… | ya | installed |
| `hunting-for-persistence-via-wmi-subscriptions` | Hunts for adversary persistence via WMI event subscriptions (MITRE T1546.003) by monitoring the creation of WMI event filters, consumers, and filter-to-consumer bindings… | ya | installed |
| `hunting-for-process-injection-techniques` | Detects process injection techniques (MITRE T1055) — including CreateRemoteThread injection, process hollowing, and DLL injection — by analyzing Sysmon Event IDs 8 (Crea… | ya | installed |
| `hunting-for-registry-persistence-mechanisms` | Hunts for registry-based persistence mechanisms (MITRE T1547) in Windows environments, including Run/RunOnce keys, Winlogon Shell/Userinit modifications, Image File Exec… | ya | installed |
| `hunting-for-registry-run-key-persistence` | Detect MITRE ATT&CK T1547.001 registry Run key persistence by analyzing Sysmon Event ID 13 logs and registry queries to identify malicious auto-start entries. | ya | installed |
| `hunting-for-scheduled-task-persistence` | Runs a hypothesis-driven threat hunt for Windows Scheduled Task persistence (T1053), guiding SIEM/EDR queries against task creation events (e.g. Event ID 4698), suspicio… | ya | installed |
| `hunting-for-shadow-copy-deletion` | Runs a hypothesis-driven threat hunt for Volume Shadow Copy deletion (T1490) by querying SIEM/EDR telemetry for vssadmin, wmic shadowcopy, and PowerShell shadow-copy-del… | ya | installed |
| `hunting-for-spearphishing-indicators` | Hunt for spearphishing campaign indicators across email logs, endpoint telemetry, and network data to detect targeted email attacks. | ya | installed |
| `hunting-for-startup-folder-persistence` | Detects T1547.001 startup folder persistence by monitoring Windows startup directories for suspicious file creation, cross-referencing Autoruns entries, and running a Py… | ya | installed |
| `hunting-for-supply-chain-compromise` | Runs a hypothesis-driven threat hunt for supply-chain compromise (T1195) by querying SIEM/EDR logs for trojanized software updates, compromised dependencies, unauthorize… | ya | installed |
| `hunting-for-suspicious-scheduled-tasks` | Hunts for adversary persistence and execution via Windows scheduled tasks (T1053.005) by analyzing Security Event ID 4698 task-creation events, suspicious task propertie… | ya | installed |
| `hunting-for-t1098-account-manipulation` | Hunts for MITRE ATT&CK T1098 account manipulation - shadow admin creation, SID history injection, group membership changes, and credential modifications - by analyzing W… | ya | installed |
| `hunting-for-unusual-network-connections` | Runs a hypothesis-driven threat hunt for command-and-control activity (T1071) by querying SIEM/EDR network telemetry for anomalous outbound traffic, rare destinations, n… | ya | installed |
| `hunting-for-unusual-service-installations` | Detects suspicious Windows service installations (MITRE ATT&CK T1543.003) by parsing System event log Event ID 7045, analyzing service binary paths, and flagging indicat… | ya | installed |
| `hunting-for-webshell-activity` | Runs a hypothesis-driven threat hunt for web shell deployment (T1505.003) on internet-facing servers by analyzing file creation in web directories, suspicious child-proc… | ya | installed |
| `hunting-saas-sso-token-abuse` | Hunts for stolen-session and OAuth/PRT token replay (T1550.001) by correlating Microsoft Entra ID SigninLogs SessionId/UniqueTokenIdentifier fields and Okta System Log s… | ya | installed |
| `implementing-mitre-attack-coverage-mapping` | Implement MITRE ATT&CK coverage mapping to identify detection gaps, prioritize rule development, and measure SOC detection maturity against adversary techniques. | ya | installed |
| `implementing-siem-correlation-rules-for-apt` | Write multi-event correlation rules in Splunk SPL and Sigma format that detect APT lateral movement by chaining Windows authentication events (4624, 4648), process execu… | ya | installed |
| `implementing-siem-use-case-tuning` | Tune SIEM detection rules in Splunk and Elastic to reduce false positives by analyzing alert volumes, creating context-aware exclusion lists, adjusting thresholds agains… | ya | installed |
| `implementing-siem-use-cases-for-detection` | Implements SIEM detection use cases by designing correlation rules, threshold alerts, and behavioral analytics mapped to MITRE ATT&CK techniques across Splunk, Elastic,… | ya | installed |
| `implementing-soar-automation-with-phantom` | Implements Security Orchestration, Automation, and Response (SOAR) workflows using Splunk SOAR (formerly Phantom) to automate alert triage, IOC enrichment, containment a… | ya | installed |
| `implementing-soar-playbook-for-phishing` | Automates phishing incident response by calling the Splunk SOAR (Phantom) REST API to create containers, attach artifacts (emails, URLs, attachments), and trigger respon… | ya | installed |
| `implementing-soar-playbook-with-palo-alto-xsoar` | Build automated incident response playbooks in Cortex XSOAR (Demisto) using its YAML playbook structure, integration commands, and task types to orchestrate phishing, ma… | ya | installed |
| `implementing-threat-modeling-with-mitre-attack` | Implements threat modeling using the MITRE ATT&CK framework to map adversary TTPs against organizational assets, assess detection coverage gaps, and prioritize defensive… | ya | installed |
| `mapping-mitre-attack-techniques` | Maps observed adversary behaviors, security alerts, and detection rules to MITRE ATT&CK techniques and sub-techniques to quantify detection coverage and guide control pr… | ya | installed |
| `monitoring-darkweb-sources` | Monitors dark web forums, marketplaces, paste sites, and ransomware leak sites for mentions of organizational assets, leaked credentials, threatened attacks, and threat… | ya | installed |
| `monitoring-scada-modbus-traffic-anomalies` | Monitors Modbus TCP traffic on SCADA and ICS networks to detect anomalous function code usage, unauthorized register writes, and suspicious communication patterns. The a… | ya | installed |
| `performing-alert-triage-with-elastic-siem` | Perform systematic alert triage in Elastic Security SIEM—classifying, prioritizing, and investigating alerts using Kibana, ES\|QL queries, and ECS-normalized data—to driv… | ya | installed |
| `performing-dns-tunneling-detection` | Detects DNS tunneling by computing Shannon entropy of DNS query names, analyzing query length distributions, inspecting TXT record payloads, and identifying high subdoma… | ya | installed |
| `performing-false-positive-reduction-in-siem` | Reduces SIEM false positives through systematic rule tuning, threshold adjustment, correlation logic refinement, allowlisting, and threat intelligence enrichment. Use wh… | ya | installed |
| `performing-log-source-onboarding-in-siem` | Perform structured log source onboarding into SIEM platforms (Splunk, Elastic, Sentinel, QRadar, or similar) by prioritizing sources with a tiered value framework, confi… | ya | installed |
| `performing-threat-hunting-with-elastic-siem` | Performs proactive threat hunting in Elastic Security SIEM using KQL/EQL queries, detection rules, and Timeline investigation to identify threats that evade automated de… | ya | installed |
| `performing-user-behavior-analytics` | Performs User and Entity Behavior Analytics (UEBA) to detect anomalous user activities including impossible travel, unusual access patterns, privilege abuse, and insider… | ya | installed |
| `triaging-security-alerts-in-splunk` | Triages security alerts in Splunk Enterprise Security by classifying severity, investigating notable events, correlating related telemetry, and making escalation or clos… | ya | installed |

## 4. Incident Response & Forensics — 54 skill

**Kategori:** incident-response  ·  **Terpasang:** 54 / 54  ·  **Documented-only:** 0  

**Ringkasan:** Responding to compromise and reconstructing what happened: triage, containment, eradication, memory and disk forensics, artifact parsing, and super-timelines.

**Tema:** `incident-triage-containment`, `digital-forensics`, `timeline-reconstruction`, `ransomware-response`, `cloud-forensics`, `soc-process-playbooks`

| Skill | Kegunaan | Terpasang | Status |
|---|---|---|---|
| `acquiring-disk-image-with-dd-and-dcfldd` | Create forensically sound bit-for-bit disk images with dd or dcfldd on a Linux forensic workstation, preserving evidence integrity through hash verification (MD5/SHA) du… | ya | installed |
| `building-incident-response-dashboard` | Builds real-time incident response dashboards in Splunk, Elastic, or Grafana to provide SOC analysts and leadership with situational awareness during active incidents, t… | ya | installed |
| `building-incident-response-playbook` | Designs and documents structured incident response playbooks with step-by-step procedures per incident type, decision trees, escalation criteria, RACI matrices, and SOAR… | ya | installed |
| `building-incident-timeline-with-timesketch` | Build collaborative forensic incident timelines using Timesketch to ingest, normalize, and analyze multi-source event data (including Plaso output) for attack chain reco… | ya | installed |
| `building-soc-escalation-matrix` | Build a structured SOC escalation matrix defining severity tiers, response SLAs, tiered escalation paths, and notification procedures for security incidents, using conte… | ya | installed |
| `building-soc-metrics-and-kpi-tracking` | Builds SOC performance metrics and KPI tracking dashboards measuring Mean Time to Detect (MTTD), Mean Time to Respond (MTTR), alert quality ratios, analyst productivity,… | ya | installed |
| `building-soc-playbook-for-ransomware` | Builds a structured SOC incident response playbook for ransomware attacks covering detection, containment, eradication, and recovery phases with specific SIEM queries, i… | ya | installed |
| `building-super-timelines-with-plaso` | Generate forensic super-timelines with Plaso's log2timeline.py, pinfo.py, psort.py, and psteal.py CLI tools (fusing file-system MACB, registry, EVTX, browser history, pr… | ya | installed |
| `collecting-indicators-of-compromise` | Systematically collects, categorizes, and distributes indicators of compromise (IOCs) during and after security incidents to enable detection, blocking, and threat intel… | ya | installed |
| `collecting-open-source-intelligence` | Collects and synthesizes open-source intelligence (OSINT) about threat actors, malicious infrastructure, and attack campaigns using publicly available data sources, pass… | ya | installed |
| `collecting-threat-intelligence-with-misp` | Deploy MISP, configure threat feeds (MISP community, freetext, TAXII, CSV), and use the PyMISP API to programmatically fetch, add, and search events and IOCs, building a… | ya | installed |
| `collecting-volatile-evidence-from-compromised-host` | Collect volatile forensic evidence from a compromised host by following the order of volatility, preserving memory, network connections, running processes, and system st… | ya | installed |
| `conducting-cloud-incident-response` | Respond to security incidents in AWS, Azure, and GCP via identity-based containment, cloud-native log analysis (CloudTrail, Azure Activity Logs, GCP Audit Logs), resourc… | ya | installed |
| `conducting-cloud-penetration-testing` | This skill outlines methodologies for performing authorized penetration testing against AWS, Azure, and GCP cloud environments. It covers understanding the shared respon… | ya | installed |
| `conducting-memory-forensics-with-volatility` | Performs memory forensics analysis using Volatility 3 to extract evidence of malware execution, process injection, network connections, and credential theft from RAM dum… | ya | installed |
| `conducting-phishing-incident-response` | Respond to phishing incidents by analyzing reported emails, extracting indicators, sandboxing URLs/attachments, assessing credential compromise, quarantining malicious m… | ya | installed |
| `configuring-windows-event-logging-for-detection` | Configures Windows Event Logging with advanced audit policies to generate high-fidelity security events for threat detection and forensic investigation. Use when enablin… | ya | installed |
| `containing-active-breach` | Executes containment strategies to stop active adversary operations and prevent lateral movement during a confirmed security breach. Implements short-term and long-term… | ya | installed |
| `implementing-anti-ransomware-group-policy` | Configures Windows Group Policy Objects to block ransomware execution and lateral spread, covering AppLocker rules, Software Restriction Policies, Controlled Folder Acce… | ya | installed |
| `implementing-ransomware-backup-strategy` | Designs a ransomware-resilient backup strategy using the 3-2-1-1-0 methodology (3 copies, 2 media types, 1 offsite, 1 immutable/air-gapped, 0 restore errors), configurin… | ya | installed |
| `implementing-ransomware-kill-switch-detection` | Analyzes ransomware kill switch mechanisms, including mutex-based execution guards, domain-based kill switches (e.g. WannaCry-style), and registry termination checks, th… | ya | installed |
| `implementing-ticketing-system-for-incidents` | Implements an integrated incident ticketing system connecting SIEM alerts to ServiceNow, Jira, or TheHive for structured incident tracking, SLA management, escalation wo… | ya | installed |
| `implementing-usb-device-control-policy` | Implements USB device control policies to restrict unauthorized removable media access on endpoints, preventing data exfiltration and malware introduction via USB device… | ya | installed |
| `implementing-velociraptor-for-ir-collection` | Deploy and configure Velociraptor for scalable endpoint forensic artifact collection during incident response using VQL queries, hunts, and pre-built artifact packs acro… | ya | installed |
| `investigating-phishing-email-incident` | Investigates phishing email incidents from initial user report through header analysis, URL/attachment detonation, impacted user identification, and containment actions… | ya | installed |
| `investigating-ransomware-attack-artifacts` | Forensically preserve memory and disk, collect ransom notes and encrypted file samples, and identify the ransomware variant using tools such as ID Ransomware, Volatility… | ya | installed |
| `performing-cloud-asset-inventory-with-cartography` | Run Cartography to sync AWS, GCP, or Azure resources into a Neo4j graph database, mapping relationships such as IAM permission chains, network paths, and cross-account t… | ya | installed |
| `performing-cloud-forensics-investigation` | Collect and analyze cloud forensic evidence using AWS CLI, Azure CLI, or gcloud to snapshot volumes, capture instance metadata and security group configurations, and pre… | ya | installed |
| `performing-cloud-forensics-with-aws-cloudtrail` | Investigate AWS account compromise by querying CloudTrail with boto3's LookupEvents or AWS Athena SQL over S3-delivered logs, filtering on suspicious user agents, source… | ya | installed |
| `performing-cloud-incident-containment-procedures` | Execute cloud-native incident containment across AWS, Azure, and GCP using platform CLIs to revoke or disable compromised IAM credentials, isolate resources with securit… | ya | installed |
| `performing-cloud-log-forensics-with-athena` | Uses AWS Athena to query CloudTrail, VPC Flow Logs, S3 access logs, and ALB logs for forensic investigation. Covers CREATE TABLE DDL with partition projection, forensic… | ya | installed |
| `performing-cloud-native-forensics-with-falco` | Uses Falco YAML rules for runtime threat detection in containers and Kubernetes, monitoring syscalls for shell spawns, file tampering, network anomalies, and privilege e… | ya | installed |
| `performing-cloud-native-threat-hunting-with-aws-detective` | Investigate AWS security incidents using Amazon Detective's behavior graphs, built from CloudTrail, VPC Flow Logs, GuardDuty, and EKS audit logs, to trace entity timelin… | ya | installed |
| `performing-cloud-storage-forensic-acquisition` | Perform forensic acquisition of cloud storage services including Google Drive, OneDrive, Dropbox, and Box by pulling API-based remote data such as revision history and a… | ya | installed |
| `performing-disk-forensics-investigation` | Conduct disk forensics investigations using forensic imaging, file system analysis, and timeline reconstruction, with tools such as FTK Imager, Autopsy, and The Sleuth K… | ya | installed |
| `performing-file-carving-with-foremost` | Recovers files from disk images and unallocated space using Foremost's header-footer signature carving, extracting evidence independent of the file system's state. Use d… | ya | installed |
| `performing-linux-log-forensics-investigation` | Perform forensic investigation of Linux system logs including syslog, auth.log, systemd journal (via journalctl), kern.log, auditd, and application logs to reconstruct u… | ya | installed |
| `performing-log-analysis-for-forensic-investigation` | Collect, parse, and correlate system, application, and security logs to reconstruct events and establish timelines during forensic investigations. | ya | installed |
| `performing-memory-forensics-with-volatility3` | Analyze volatile memory (RAM) dumps using the Volatility 3 framework to extract running processes, network connections, loaded modules, credentials, and encryption keys,… | ya | installed |
| `performing-memory-forensics-with-volatility3-plugins` | Analyze memory dumps using Volatility3 plugins to detect injected code, rootkits, credential theft, and malware artifacts in Windows, Linux, and macOS memory images. | ya | installed |
| `performing-mobile-device-forensics-with-cellebrite` | Acquire and analyze mobile device data using Cellebrite UFED Touch/4PC, UFED Physical Analyzer, and open-source alternatives (ALEAPP, iLEAPP, MEAT, libimobiledevice) to… | ya | installed |
| `performing-network-forensics-with-wireshark` | Capture and analyze network traffic using Wireshark and tshark to reconstruct network events from PCAP/PCAPNG files, extract transferred files and credentials, and ident… | ya | installed |
| `performing-ransomware-response` | Executes a structured ransomware incident response from detection through containment, forensic analysis, decryption assessment, recovery, and post-incident hardening, c… | ya | installed |
| `performing-ransomware-tabletop-exercise` | Plans and facilitates tabletop exercises simulating ransomware incidents, using realistic scenarios based on threat actors like LockBit and ALPHV/BlackCat with injects c… | ya | installed |
| `performing-soc-tabletop-exercise` | Performs tabletop exercises for SOC teams simulating security incidents through discussion-based scenarios to test incident response procedures, communication workflows,… | ya | installed |
| `performing-timeline-reconstruction-with-plaso` | Builds comprehensive forensic super-timelines using Plaso (log2timeline and psort) to correlate events across file system metadata, event logs, browser history, and regi… | ya | installed |
| `recovering-deleted-files-with-photorec` | Recovers deleted files from disk images and storage media using PhotoRec's file signature-based carving engine, which works regardless of file system damage or corruptio… | ya | installed |
| `recovering-from-ransomware-attack` | Executes structured ransomware incident recovery following NIST/CISA frameworks: environment isolation, forensic evidence preservation, clean infrastructure rebuild, pri… | ya | installed |
| `securing-container-registry-images` | Secures container registry images (ECR, ACR, GCR, Docker Hub) by scanning with Trivy and Grype, signing with Cosign and Sigstore, configuring registry access controls, a… | ya | installed |
| `securing-container-registry-with-harbor` | Configures the security features of the Harbor open-source container registry - integrated Trivy scanning, Cosign and Notary content trust policies, project-level RBAC,… | ya | installed |
| `triaging-security-incident` | Performs initial triage of security incidents using the NIST SP 800-61r3 and SANS PICERL frameworks, classifying incident type, assigning priority by business impact, an… | ya | installed |
| `triaging-security-incident-with-ir-playbook` | Classifies and prioritizes security incidents using structured IR playbooks and SIEM/case-management queries (Splunk, TheHive) to determine severity, assign response tea… | ya | installed |
| `triaging-vulnerabilities-with-ssvc-framework` | Triages and prioritizes vulnerabilities with CISA's Stakeholder-Specific Vulnerability Categorization (SSVC) decision tree, weighing exploitation status (via the CISA KE… | ya | installed |
| `triaging-windows-with-kape` | Runs KAPE (Kroll Artifact Parser and Extractor) to collect targeted forensic artifacts (registry hives, $MFT, event logs, prefetch, browser data) via Targets and parse t… | ya | installed |

## 5. Threat Intelligence & Adversary Tracking — 30 skill

**Kategori:** threat-intelligence  ·  **Terpasang:** 30 / 30  ·  **Documented-only:** 0  

**Ringkasan:** Producing and consuming intelligence: IOC handling, feed aggregation, MISP and OpenCTI, STIX/TAXII, campaign correlation, actor profiling, and leak-site monitoring.

**Tema:** `ioc-management`, `threat-platforms`, `stix-taxii-sharing`, `threat-actor-profiling`, `osint-collection`, `threat-hunting-analysis`

| Skill | Kegunaan | Terpasang | Status |
|---|---|---|---|
| `automating-ioc-enrichment` | Automates the enrichment of raw indicators of compromise with multi-source threat intelligence context using SOAR platforms, Python pipelines, or TIP playbooks to reduce… | ya | installed |
| `building-attack-pattern-library-from-cti-reports` | Parse cyber threat intelligence reports (Mandiant, CrowdStrike, Talos, Microsoft) with stix2, mitreattack-python, and spaCy to extract adversary behaviors, map them to M… | ya | installed |
| `building-ioc-defanging-and-sharing-pipeline` | Build an automated pipeline that ingests raw IOCs (URLs, IPs, domains, emails), normalizes and deduplicates them, then produces defanged renderings for safe human readin… | ya | installed |
| `building-ioc-enrichment-pipeline-with-opencti` | Build an automated IOC enrichment pipeline on OpenCTI (STIX 2.1 native threat intel platform) using its internal enrichment connectors to pull context from VirusTotal, S… | ya | installed |
| `building-threat-actor-profile-from-osint` | Build threat actor profiles by collecting OSINT from vendor reports, paste sites, dark web forums, social media, and code repos, correlating indicators, mapping adversar… | ya | installed |
| `building-threat-feed-aggregation-with-misp` | Deploy MISP via Docker and configure feeds from sources like abuse.ch, AlienVault OTX, and CIRCL to aggregate, correlate, and distribute threat intelligence, including a… | ya | installed |
| `building-threat-hunt-hypothesis-framework` | Build a systematic threat-hunt workflow that turns threat intelligence and ATT&CK gap analysis into testable hypotheses, then executes and validates them via EDR/SIEM qu… | ya | installed |
| `building-threat-intelligence-feed-integration` | Builds automated threat intelligence feed integration pipelines connecting STIX/TAXII feeds, open-source threat intel, and commercial TI platforms into SIEM and security… | ya | installed |
| `building-threat-intelligence-platform` | Design and deploy a Threat Intelligence Platform (TIP) by integrating open-source CTI tools (MISP, OpenCTI, TheHive, Cortex) into a unified system with feed ingestion pi… | ya | installed |
| `evaluating-threat-intelligence-platforms` | Evaluates and selects Threat Intelligence Platform (TIP) products based on organizational requirements including feed integration capability, STIX/TAXII support, workflo… | ya | installed |
| `executing-phishing-simulation-campaign` | Executes authorized phishing simulation campaigns to assess an organization's susceptibility to email-based social engineering attacks. The tester designs realistic phis… | ya | installed |
| `generating-threat-intelligence-reports` | Generates structured cyber threat intelligence reports at strategic, operational, and tactical levels tailored to specific audiences including executives, security opera… | ya | installed |
| `implementing-diamond-model-analysis` | The Diamond Model of Intrusion Analysis provides a structured framework for analyzing cyber intrusions by examining four core features - Adversary, Capability, Infrastru… | ya | installed |
| `implementing-security-information-sharing-with-stix2` | Create, validate, and share STIX 2.1 threat intelligence objects (indicators, malware, campaigns, relationships, bundles) using the stix2 Python library, and publish the… | ya | installed |
| `implementing-stix-taxii-feed-integration` | Implements a STIX 2.1/TAXII 2.1 threat-intelligence feed consumer and producer in Python, covering TAXII server discovery, collection polling, parsing STIX bundles with… | ya | installed |
| `implementing-taxii-server-with-opentaxii` | Deploy and configure a TAXII 2.1 server (Medallion) with Docker, publish and consume STIX 2.1 bundles across collections, and integrate the feed with SIEM/SOAR platforms… | ya | installed |
| `implementing-threat-intelligence-lifecycle-management` | Build out a full CTI program around the six-phase threat intelligence lifecycle (direction, collection, processing, analysis, dissemination, feedback), including definin… | ya | installed |
| `managing-intelligence-lifecycle` | Manages the end-to-end cyber threat intelligence lifecycle from planning and direction through collection, processing, analysis, dissemination, and feedback to ensure in… | ya | installed |
| `modeling-threats-with-opencti` | Deploy OpenCTI (Filigran) via Docker Compose and use the pycti Python client to model threat actors, intrusion sets, campaigns, and indicators as a STIX 2.1 knowledge gr… | ya | installed |
| `operationalizing-misp-threat-feeds` | Stand up MISP, enable and cache curated threat feeds (CIRCL, abuse.ch, Feodo Tracker), apply warninglists to suppress false positives, query indicators with PyMISP, and… | ya | installed |
| `performing-ai-driven-osint-correlation` | Use AI/LLM-based reasoning with Sherlock, theHarvester, and SpiderFoot to correlate OSINT findings—usernames, emails, social profiles, domain records, breach databases,… | ya | installed |
| `performing-dark-web-monitoring-for-threats` | Dark web monitoring involves systematically scanning Tor hidden services, underground forums, paste sites, and dark web marketplaces to identify threats targeting an org… | ya | installed |
| `performing-ioc-enrichment-automation` | Automates Indicator of Compromise (IOC) enrichment by orchestrating lookups across VirusTotal, AbuseIPDB, Shodan, MISP, and other intelligence sources to provide context… | ya | installed |
| `performing-open-source-intelligence-gathering` | Open Source Intelligence (OSINT) gathering is the first active phase of a red team engagement, where operators collect publicly available information about the target or… | ya | installed |
| `performing-osint-with-spiderfoot` | Automate OSINT collection with the SpiderFoot REST API and CLI (sf.py/spiderfoot-cli) across 200+ modules, selecting scan modes (footprint, investigate, passive) and par… | ya | installed |
| `performing-paste-site-monitoring-for-credentials` | Monitor paste sites like Pastebin and GitHub Gists for leaked credentials, API keys, and sensitive data dumps using automated scraping and keyword matching to detect bre… | ya | installed |
| `performing-threat-intelligence-sharing-with-misp` | Uses PyMISP (the official MISP REST API library) to create events with structured IOCs (IPs, domains, hashes, URLs), enrich them with MITRE ATT&CK tags and galaxy cluste… | ya | installed |
| `processing-stix-taxii-feeds` | Processes STIX 2.1 threat intelligence bundles delivered via TAXII 2.1 servers, normalizing objects into platform-native schemas and routing them to appropriate consumin… | ya | installed |
| `profiling-threat-actor-groups` | Develops comprehensive threat actor profiles for APT groups, criminal organizations, and hacktivist collectives by aggregating TTP documentation, historical campaign dat… | ya | installed |
| `tracking-threat-actor-infrastructure` | Discovers and maps adversary-controlled infrastructure (C2 servers, phishing domains, exploit-kit hosts, bulletproof hosting) by pivoting across passive DNS, certificate… | ya | installed |

## 6. Governance, Risk & Compliance — 50 skill

**Kategori:** grc  ·  **Terpasang:** 48 / 50  ·  **Documented-only:** 2  

**Ringkasan:** Assessing and evidencing control maturity against frameworks, and managing risk, privacy, vendor, and vulnerability programmes.

**Tema:** `regulatory-frameworks`, `risk-assessment`, `privacy-data-protection`, `identity-governance`, `third-party-vendor-risk`, `vulnerability-prioritization`

| Skill | Kegunaan | Terpasang | Status |
|---|---|---|---|
| `achieving-cmmc-level-2-compliance` | Prepare a defense-contractor environment for CMMC Level 2 certification: scope CUI and FCI, implement the 110 NIST SP 800-171 Rev 2 security requirements across 14 famil… | ya | installed |
| `building-identity-governance-lifecycle-process` | Design identity governance and lifecycle (IGA) programs on platforms like SailPoint, Saviynt, or Entra ID Governance, covering joiner-mover-leaver (JML) automation, role… | ya | installed |
| `building-patch-tuesday-response-process` | Establish a repeatable operational process for triaging, testing, and deploying Microsoft Patch Tuesday security updates (Windows, Office, Exchange, SQL Server, Azure) v… | ya | installed |
| `building-ransomware-playbook-with-cisa-framework` | Builds a structured ransomware incident response playbook aligned with the CISA StopRansomware Guide and NIST Cybersecurity Framework, covering preparation, detection, c… | ya | installed |
| `building-role-mining-for-rbac-optimization` | Apply bottom-up and top-down role mining techniques, including clustering algorithms and formal concept analysis, to discover optimal RBAC roles from existing user-permi… | ya | installed |
| `conducting-cyber-risk-assessment-with-nist-800-30` | Conduct a defensible cybersecurity risk assessment using the NIST SP 800-30 Rev 1 methodology: prepare scope and a risk model, identify threat sources and threat events,… | ya | installed |
| `conducting-gdpr-compliance-assessment` | Conduct comprehensive GDPR compliance assessments by evaluating data processing activities against EU Regulation 2016/679, including Article 30 records of processing, la… | ya | installed |
| `conducting-post-incident-lessons-learned` | Facilitate structured post-incident reviews to identify root causes, document what worked and failed, and produce actionable recommendations to improve future incident r… | ya | installed |
| `executing-nist-rmf-authorization-to-operate` | Drive a federal system through the NIST Risk Management Framework (SP 800-37 Rev 2) to an Authorization to Operate (ATO): Prepare, Categorize (FIPS 199), Select a contro… | ya | installed |
| `implementing-alert-fatigue-reduction` | Implements strategies to reduce SOC alert fatigue by tuning detection rules, consolidating duplicate alerts, implementing risk-based alerting, and measuring alert qualit… | ya | installed |
| `implementing-aws-config-rules-for-compliance` | Implements AWS Config managed and custom rules for continuous compliance monitoring of AWS resources aligned to CIS and PCI DSS, configuring automatic remediation with S… | ya | installed |
| `implementing-aws-security-hub-compliance` | Deploy AWS Security Hub, backed by AWS Config, to aggregate findings from GuardDuty, Inspector, Macie, Firewall Manager, and Prowler across multi-account AWS Organizatio… | ya | installed |
| `implementing-cisa-zero-trust-maturity-model` | Assess, gap-analyze, and progressively implement the CISA Zero Trust Maturity Model v2.0 across five pillars (Identity, Devices, Networks, Applications & Workloads, Data… | ya | installed |
| `implementing-device-posture-assessment-in-zero-trust` | Implements device posture assessment as a zero trust access control by integrating endpoint health signals from CrowdStrike ZTA, Microsoft Intune, and Jamf into conditio… | ya | installed |
| `implementing-end-to-end-encryption-for-messaging` | Implements a simplified Signal Protocol-style end-to-end encryption scheme for messaging, covering key exchange, forward secrecy, and the core cryptographic components s… | ya | installed |
| `implementing-gdpr-data-protection-controls` | Implements GDPR (EU 2016/679) technical and organizational measures — privacy by design/default, DPIAs, data subject rights management, 72-hour breach notification, and… | ya | installed |
| `implementing-gdpr-data-subject-access-request` | Automates GDPR Data Subject Access Request (DSAR) workflows including identity verification, PII discovery across databases and files using regex and NER, data mapping,… | ya | installed |
| `implementing-hipaa-security-rule-safeguards` | Implement the HIPAA Security Rule (45 CFR Part 164 Subpart C) to protect electronic protected health information (ePHI): conduct the required risk analysis, deploy the a… | ya | installed |
| `implementing-identity-governance-with-sailpoint` | Deploys SailPoint IdentityNow or IdentityIQ for identity governance and administration, covering identity lifecycle management, access request workflows, certification c… | ya | installed |
| `implementing-iso-27001-information-security-management` | Guides implementation of an ISO/IEC 27001:2022 Information Security Management System (ISMS) end to end: gap analysis and scoping, risk assessment methodology, Annex A c… | ya | installed |
| `implementing-nerc-cip-compliance-controls` | Implements NERC CIP controls for Bulk Electric System (BES) cyber systems: asset categorization (CIP-002), electronic security perimeters (CIP-005), system security mana… | ya | installed |
| `implementing-ot-incident-response-playbook` | Develops OT-specific incident response playbooks using a SANS PICERL-based Python engine that classifies incident severity (safety, process, access, recon) and coordinat… | ya | installed |
| `implementing-patch-management-for-ot-systems` | Implements a structured patch management program for OT/ICS environments where IT-style patching can cause process disruption or safety hazards, covering vendor compatib… | ya | installed |
| `implementing-patch-management-workflow` | Patch management is the systematic process of identifying, testing, deploying, and verifying software updates to remediate vulnerabilities across an organization's IT in… | ya | installed |
| `implementing-pci-dss-compliance-controls` | Implements PCI DSS 4.0.1's 12 requirements across 6 control objectives for organizations that store, process, or transmit cardholder data, including the customized valid… | ya | installed |
| `managing-cloud-identity-with-okta` | Implement Okta as a centralized cloud identity provider: configure SSO with AWS, Azure, and GCP, deploy phishing-resistant MFA with Okta FastPass, automate user provisio… | ya | installed |
| `managing-third-party-vendor-risk` | Build and run a third-party/vendor risk management (TPRM) program aligned to NIST SP 800-161 C-SCRM: inventory and tier vendors, issue SIG/CAIQ questionnaires, review SO… | ya | installed |
| `performing-access-recertification-with-saviynt` | Configure and execute access recertification campaigns in Saviynt Enterprise Identity Cloud to validate user entitlements, revoke excessive access, and maintain complian… | ya | installed |
| `performing-access-review-and-certification` | Designs and runs access review and certification campaigns-scoping, reviewer selection, risk-based prioritization, micro-certification, and remediation tracking-to verif… | ya | installed |
| `performing-asset-criticality-scoring-for-vulns` | Build a multi-factor asset criticality scoring model—incorporating data sensitivity, business function dependency, regulatory scope, network exposure, and recoverability… | ya | installed |
| `performing-aws-privilege-escalation-assessment` | Performing authorized privilege escalation assessments in AWS environments to identify IAM misconfigurations that allow users or roles to elevate their permissions using… | ya | installed |
| `performing-bluetooth-security-assessment` | Assess Bluetooth Low Energy (BLE) device security using Python's bleak asyncio library to discover nearby devices, enumerate GATT services and characteristics, and flag… | ya | installed |
| `performing-cve-prioritization-with-kev-catalog` | Fetch and parse the CISA Known Exploited Vulnerabilities (KEV) catalog, enrich it with EPSS scores and CVSS metrics, and build a multi-factor prioritization engine and r… | ya | installed |
| `performing-docker-bench-security-assessment` | Runs Docker Bench for Security, the open-source CIS Docker Benchmark audit script, across host configuration, daemon settings, images, and runtime configuration, then in… | ya | installed |
| `performing-entitlement-review-with-sailpoint-iiq` | Runs entitlement review and access certification campaigns in SailPoint IdentityIQ, covering manager certifications, targeted entitlement reviews, role-based access vali… | ya | installed |
| `performing-gcp-security-assessment-with-forseti` | Performing comprehensive security assessments of Google Cloud Platform environments using Forseti Security, Security Command Center, and gcloud CLI to audit IAM policies… | ya | installed |
| `performing-graphql-security-assessment` | Assessing GraphQL API endpoints for introspection leaks, injection attacks, authorization flaws, and denial-of-service vulnerabilities during authorized security tests. | ya | installed |
| `performing-iot-security-assessment` | Performs comprehensive security assessments of IoT devices and their ecosystems by testing hardware interfaces, firmware, network communications, cloud APIs, and compani… | ya | installed |
| `performing-kubernetes-etcd-security-assessment` | Assesses the security posture of the etcd cluster backing Kubernetes: encryption at rest, TLS peer and client transport, access control, backup encryption, and network i… | ya | installed |
| `performing-nist-csf-maturity-assessment` | Conduct a NIST Cybersecurity Framework (CSF) 2.0 maturity assessment across the six core Functions (Govern, Identify, Protect, Detect, Respond, Recover), scoring organiz… | ya | installed |
| `performing-oil-gas-cybersecurity-assessment` | Conduct cybersecurity assessments of upstream, midstream, and downstream oil and gas operations, covering pipeline SCADA, refinery DCS, safety instrumented systems, and… | ya | installed |
| `performing-ot-network-security-assessment` | This skill covers conducting comprehensive security assessments of Operational Technology (OT) networks including SCADA systems, DCS architectures, and industrial contro… | ya | installed |
| `performing-power-grid-cybersecurity-assessment` | Conduct cybersecurity assessments of power grid infrastructure spanning generation, transmission substations, distribution, and EMS control centers, covering NERC CIP co… | ya | installed |
| `performing-privacy-impact-assessment` | Automates the Privacy Impact Assessment (PIA) workflow including data flow mapping, privacy risk scoring matrices, GDPR Article 35 DPIA and CCPA/CPRA alignment checks, d… | ya | installed |
| `performing-privilege-escalation-assessment` | Performs privilege escalation assessments on compromised Linux and Windows systems to identify paths from low-privilege access to root or SYSTEM-level control. The teste… | ya | installed |
| `performing-scada-hmi-security-assessment` | Perform security assessments of SCADA Human-Machine Interface (HMI) systems to identify vulnerabilities in web-based HMIs, thin-client configurations, authentication mec… | ya | installed |
| `performing-ssl-tls-security-assessment` | Assess SSL/TLS server configurations using the sslyze Python scanning library to evaluate supported protocol versions, cipher suite strength, certificate chain validatio… | ya | installed |
| `prioritizing-vulnerabilities-with-cvss-scoring` | The Common Vulnerability Scoring System (CVSS) is the industry standard framework maintained by FIRST (Forum of Incident Response and Security Teams) for assessing vulne… | ya | installed |
| `third-party-skill-vetting` | Vet an untrusted agent skill before installing it. | tidak | documented-only |
| `whatsapp-interactive-messaging` | Send WhatsApp buttons, lists, native flows correctly. | tidak | documented-only |

## 7. Application & Product Security — 85 skill

**Kategori:** appsec  ·  **Terpasang:** 80 / 85  ·  **Documented-only:** 5  

**Ringkasan:** Finding and fixing flaws in code and APIs: secure coding, SAST/DAST/SCA, secret scanning, SBOM, supply-chain integrity, and web/API testing.

**Tema:** `api-security`, `supply-chain`, `llm-security`, `encryption`, `secure-coding`, `devsecops-pipeline`

| Skill | Kegunaan | Terpasang | Status |
|---|---|---|---|
| `auditing-kubernetes-rbac-privilege-escalation` | Finds over-permissive RBAC roles and service-account token abuse paths in a Kubernetes cluster using kubectl auth can-i, rbac-police, kubectl-who-can, and rakkess, traci… | ya | installed |
| `auditing-mcp-servers-for-tool-poisoning` | Audit MCP servers for tool poisoning, tool shadowing, rug pulls, SSRF, and unauthenticated exposure using Invariant Labs' mcp-scan for static/runtime scanning plus manua… | ya | installed |
| `building-devsecops-pipeline-with-gitlab-ci` | Configure a GitLab CI/CD pipeline that embeds SAST (Semgrep, SpotBugs, Gosec, Bandit, NodeJsScan), DAST, container scanning, dependency scanning, and secret detection vi… | ya | installed |
| `conducting-api-security-testing` | Conducts security testing of REST, GraphQL, and gRPC APIs to identify vulnerabilities in authentication, authorization, rate limiting, input validation, and business log… | ya | installed |
| `configuring-zscaler-private-access-for-ztna` | Configures Zscaler Private Access (ZPA) to replace traditional VPN with zero trust network access by deploying App Connectors, defining application segments, configuring… | ya | installed |
| `continuous-llm-red-teaming-with-promptfoo` | Wires Promptfoo and DeepTeam into CI/CD for automated, repeatable red-teaming of LLM apps against OWASP LLM Top 10, OWASP Agentic, and MITRE ATLAS presets, failing the b… | ya | installed |
| `conversational-bot-assistant` | Additive chat assistant over a bot command registry. | tidak | documented-only |
| `defending-llms-with-guardrails` | Deploys Llama Guard 3 safety classification, NeMo Guardrails programmable dialogue rails, and LLM Guard input/output scanner pipelines as complementary runtime defenses… | ya | installed |
| `find-security-vulnerabilities-in-code` | Find security vulnerabilities in a codebase or repository with Strix — a white-box AI security review that reads your source, reasons about the actual data flow and auth… | ya | installed |
| `generating-and-analyzing-sboms` | Generate CycloneDX and SPDX SBOMs from container images and filesystems with Syft, correlate them to CVEs with Grype, and sign/attest them with Cosign. Use when you need… | ya | installed |
| `implementing-aes-encryption-for-data-at-rest` | Guides implementing AES-256 encryption in GCM mode (FIPS 197) for files and data stores at rest, covering key derivation, IV/nonce management, and authenticated encrypti… | ya | installed |
| `implementing-api-abuse-detection-with-rate-limiting` | Implements API abuse detection using token bucket, sliding window, and fixed window rate-limiting algorithms backed by Redis, including adaptive limits that tighten duri… | ya | installed |
| `implementing-api-gateway-security-controls` | Configures API gateways such as Kong, AWS API Gateway, Azure APIM, or Apigee as a centralized security enforcement point, covering authentication enforcement, rate limit… | ya | installed |
| `implementing-api-key-security-controls` | Implements secure API key generation with sufficient entropy, server-side hashing (SHA-256/bcrypt) instead of plaintext storage, per-key scoping to endpoints/IPs/rate li… | ya | installed |
| `implementing-api-rate-limiting-and-throttling` | Implements API rate limiting and throttling with token bucket, sliding window, and fixed window algorithms, configuring per-user, per-IP, and per-endpoint limits via Red… | ya | installed |
| `implementing-api-schema-validation-security` | Implements API schema validation using OpenAPI Specification and JSON Schema documents, enforced both at the API gateway (runtime) and during development (shift-left), t… | ya | installed |
| `implementing-api-security-posture-management` | Implements API Security Posture Management (API-SPM) to continuously discover, classify, and risk-score APIs -- including internal, external, partner, and shadow endpoin… | ya | installed |
| `implementing-api-security-testing-with-42crunch` | Implements API security testing on the 42Crunch platform, combining API Audit for static analysis of OpenAPI definitions, API Conformance Scan for dynamic vulnerability… | ya | installed |
| `implementing-api-threat-protection-with-apigee` | Implements API threat protection using Google Apigee reverse-proxy policies, including JSON/XML threat protection, OAuth 2.0 enforcement, SpikeArrest rate limiting, rege… | ya | installed |
| `implementing-cloud-waf-rules` | Deploys and tunes Web Application Firewall rules on AWS WAF, Azure WAF, and Cloudflare, covering managed rule sets, custom business-logic rules, rate limiting, bot manag… | ya | installed |
| `implementing-code-signing-for-artifacts` | Implements code signing for build artifacts (binaries, packages, containers) using GPG, Sigstore, and platform-specific signing tools, establishing trust chains and veri… | ya | installed |
| `implementing-digital-signatures-with-ed25519` | Implements digital signatures using the Ed25519 algorithm (Curve25519), covering key-pair generation, signing, signature verification, and security tradeoffs versus RSA… | ya | installed |
| `implementing-disk-encryption-with-bitlocker` | Implements full disk encryption using Microsoft BitLocker on Windows endpoints to protect data at rest from unauthorized access in case of device loss or theft. Use when… | ya | installed |
| `implementing-dragos-platform-for-ot-monitoring` | Deploys and configures Dragos Platform sensors and detection analytics for OT/ICS network monitoring, using industrial protocol parsers and threat-intel packs to detect… | ya | installed |
| `implementing-envelope-encryption-with-aws-kms` | Implements envelope encryption with AWS KMS, encrypting data locally with a data encryption key (DEK) and protecting that DEK with a KMS-managed key (KEK), covering the… | ya | installed |
| `implementing-image-provenance-verification-with-cosign` | Signs and verifies container image provenance with Sigstore Cosign, covering key-based and keyless OIDC signing (Fulcio, Rekor transparency log), SLSA attestations, and… | ya | installed |
| `implementing-llm-guardrails-for-security` | Implements input/output validation guardrails for LLM applications using NVIDIA NeMo Guardrails (Colang), custom Python validators for PII detection, and the Guardrails… | ya | installed |
| `implementing-passwordless-authentication-with-fido2` | Deploy FIDO2/WebAuthn passwordless authentication using security keys and platform authenticators, covering WebAuthn API integration, FIDO2 server configuration, passkey… | ya | installed |
| `implementing-rsa-key-pair-management` | Generates, stores, rotates, and manages RSA key pairs following NIST SP 800-57 guidelines, covering serialization formats (PEM, DER, PKCS#8), passphrase protection, and… | ya | installed |
| `implementing-runtime-application-self-protection` | Deploy Runtime Application Self-Protection (RASP) agents to detect and block attacks from within application runtime, covering OpenRASP integration, attack pattern detec… | ya | installed |
| `implementing-runtime-security-with-tetragon` | Implements eBPF-based runtime observability and in-kernel enforcement in Kubernetes with Cilium Tetragon, monitoring process execution, file access, network connections,… | ya | installed |
| `implementing-semgrep-for-custom-sast-rules` | Write custom Semgrep SAST rules in YAML to detect application-specific vulnerabilities, enforce coding standards, and integrate into CI/CD pipelines. | ya | installed |
| `implementing-sigstore-for-software-signing` | Implements Sigstore-based software signing and verification using Cosign keyless signing, Rekor transparency log verification, and Fulcio certificate authority integrati… | ya | installed |
| `implementing-supply-chain-security-with-in-toto` | Implements supply chain integrity verification for container builds with the in-toto framework: generating signing keys, defining a supply chain layout, recording pipeli… | ya | installed |
| `implementing-web-application-logging-with-modsecurity` | Configure ModSecurity WAF with the OWASP Core Rule Set (CRS) for web application audit logging, tuning SecRuleEngine, SecAuditEngine, and CRS paranoia levels to reduce f… | ya | installed |
| `implementing-zero-knowledge-proof-for-authentication` | Implements the Schnorr identification protocol and a simplified Zero-Knowledge Password Proof (ZKPP) over the discrete logarithm problem, letting a prover authenticate b… | ya | installed |
| `implementing-zero-trust-network-access-with-zscaler` | Configures Zero Trust Network Access using Zscaler Private Access (ZPA) to broker identity-based, context-aware connections between authenticated users and internal appl… | ya | installed |
| `integrating-dast-with-owasp-zap-in-pipeline` | Integrates OWASP ZAP (Zed Attack Proxy) into GitHub Actions and GitLab CI pipelines, covering baseline, full, and API scan configuration against running applications, ZA… | ya | installed |
| `integrating-sast-into-github-actions-pipeline` | Integrates CodeQL and Semgrep SAST scanning into GitHub Actions, covering scans on pull requests/pushes, rule tuning to cut false positives, SARIF upload to GitHub Advan… | ya | installed |
| `llm-wiki` | Karpathy's LLM Wiki: build/query interlinked markdown KB. | tidak | documented-only |
| `orchestrating-llm-attacks-with-pyrit` | Build automated multi-turn adversarial attacks against conversational LLM targets using Microsoft PyRIT's RedTeamingOrchestrator, CrescendoOrchestrator (gradual escalati… | ya | installed |
| `performing-adversary-in-the-middle-phishing-detection` | Detect and respond to Adversary-in-the-Middle (AiTM) phishing attacks that use reverse proxy kits like EvilProxy, Evilginx, and Tycoon 2FA to bypass MFA and steal sessio… | ya | installed |
| `performing-api-inventory-and-discovery` | Performs API inventory and discovery to identify all API endpoints in an organization's environment including documented, undocumented, shadow, zombie, and deprecated AP… | ya | installed |
| `performing-api-rate-limiting-bypass` | Tests API rate limiting for bypass vulnerabilities using Python (requests/aiohttp) and Burp Suite Turbo Intruder to manipulate headers (e.g. X-Forwarded-For spoofing), I… | ya | installed |
| `performing-api-security-testing-with-postman` | Uses Postman to build structured API security test collections covering the OWASP API Security Top 10—authentication bypass, authorization flaws, injection, and data exp… | ya | installed |
| `performing-bandwidth-throttling-attack-simulation` | Simulate bandwidth throttling and network degradation attacks using tc, iperf3, and Scapy in authorized lab environments to test QoS controls, application resilience, an… | ya | installed |
| `performing-blind-ssrf-exploitation` | Detect and exploit blind Server-Side Request Forgery (SSRF) using out-of-band techniques such as Burp Collaborator DNS interactions and timing analysis, to reach interna… | ya | installed |
| `performing-cryptographic-audit-of-application` | A cryptographic audit systematically reviews an application's use of cryptographic primitives, protocols, and key management to identify vulnerabilities such as weak alg… | ya | installed |
| `performing-csrf-attack-simulation` | Testing web applications for Cross-Site Request Forgery vulnerabilities by crafting forged requests that exploit authenticated user sessions during authorized security a… | ya | installed |
| `performing-directory-traversal-testing` | Test web applications for path traversal and Local/Remote File Inclusion vulnerabilities by manipulating file path parameters, applying encoding and filter-bypass techni… | ya | installed |
| `performing-graphql-introspection-attack` | Performs GraphQL introspection attacks that extract the full API schema (types, queries, mutations, subscriptions, field definitions), map the attack surface, test query… | ya | installed |
| `performing-privilege-escalation-on-linux` | Guides manual enumeration and automated tooling to escalate from a low-privilege Linux user to root by exploiting misconfigurations, vulnerable services, kernel exploits… | ya | installed |
| `performing-second-order-sql-injection` | Detect and exploit second-order SQL injection vulnerabilities where malicious input is stored in a database and later executed in an unsafe SQL query during a different… | ya | installed |
| `performing-security-headers-audit` | Auditing HTTP security headers including CSP, HSTS, X-Frame-Options, and cookie attributes to identify missing or misconfigured browser-level protections. | ya | installed |
| `performing-soap-web-service-security-testing` | Performs security testing of SOAP web services by analyzing WSDL definitions and testing for XML injection, XXE, WS-Security bypass, SOAPAction spoofing, and XPath injec… | ya | installed |
| `performing-supply-chain-attack-simulation` | Simulates and detects software supply chain attacks: typosquatting detection via Levenshtein distance against popular PyPI package names, dependency confusion testing ag… | ya | installed |
| `performing-threat-modeling-with-owasp-threat-dragon` | Uses OWASP Threat Dragon (web or desktop) to build data flow diagrams, identify threats with STRIDE, LINDDUN, CIA, DIE, or PLOT4ai methodologies via its auto-generation… | ya | installed |
| `performing-web-application-firewall-bypass` | Bypasses Web Application Firewall protections using encoding tricks, HTTP method manipulation, parameter pollution, and payload obfuscation to smuggle SQL injection, XSS… | ya | installed |
| `performing-web-application-penetration-test` | Performs systematic security testing of web applications following the OWASP Web Security Testing Guide (WSTG) methodology to identify vulnerabilities in authentication,… | ya | installed |
| `performing-web-cache-deception-attack` | Executes web cache deception attacks by exploiting path normalization discrepancies between CDN/reverse-proxy caching layers (Cloudflare, Akamai, Varnish, Nginx) and ori… | ya | installed |
| `performing-web-cache-poisoning-attack` | Exploiting web cache mechanisms to serve malicious content to other users by poisoning cached responses through unkeyed headers and parameters during authorized security… | ya | installed |
| `red-teaming-llms-with-garak` | Runs NVIDIA garak probe suites (jailbreak, prompt injection, data leakage, toxicity, and more) against an LLM endpoint - Hugging Face models, OpenAI-compatible APIs, or… | ya | installed |
| `secret-guard` | Cek kebocoran rahasia (token, API key, password, file .env, sesi bot) di proyek Next.js/TypeScript dan Go. Pakai saat audit keamanan, saat menambah env var, sebelum comm… | tidak | documented-only |
| `secure-coding` | Apply secure coding practices when writing, reviewing, or refactoring code in Java Spring/Spring Boot, Django, Flask, FastAPI, Ruby on Rails, React, Vue, Angular, Go, AS… | ya | installed |
| `securing-agentic-ai-tool-invocation` | Implements defense-in-depth controls at an AI agent's tool-invocation boundary using tool allowlisting, least-privilege identity binding, NeMo Guardrails policy enforcem… | ya | installed |
| `securing-api-gateway-with-aws-waf` | Secures AWS API Gateway endpoints with AWS WAF by configuring managed rule groups for OWASP Top 10 protection, custom rate-limiting rules, bot control, IP reputation fil… | ya | installed |
| `security-audit` | Audit unfamiliar codebases for security flaws in parallel. | tidak | documented-only |
| `security-auditor` | Scan code for vulnerabilities, secret leaks, dependency issues, and configuration problems. Use when the user wants a security audit, vulnerability scan, or code securit… | tidak | documented-only |
| `testing-android-intents-for-vulnerabilities` | Tests Android inter-process communication (IPC) through intents for vulnerabilities including intent injection, unauthorized component access, broadcast sniffing, pendin… | ya | installed |
| `testing-api-for-broken-object-level-authorization` | Tests REST and GraphQL APIs for Broken Object Level Authorization (BOLA/IDOR, OWASP API1:2023) by intercepting API calls, identifying object ID parameters (numeric IDs,… | ya | installed |
| `testing-api-security-with-owasp-top-10` | Systematically assesses REST, GraphQL, and gRPC API endpoints against the OWASP API Security Top 10 (2023) using Burp Suite and Postman for automated and manual testing.… | ya | installed |
| `testing-cors-misconfiguration` | Identifying and exploiting Cross-Origin Resource Sharing misconfigurations that allow unauthorized cross-domain data access and credential theft during security assessme… | ya | installed |
| `testing-for-broken-access-control` | Systematically tests web applications and APIs for broken access control (OWASP A01:2021), including privilege escalation, missing function-level checks, insecure direct… | ya | installed |
| `testing-for-business-logic-vulnerabilities` | Manually identifies flaws in application business logic - price manipulation, multi-step workflow bypass, and privilege escalation - by intercepting and modifying reques… | ya | installed |
| `testing-for-host-header-injection` | Test web applications for HTTP Host header injection vulnerabilities to identify password reset poisoning, web cache poisoning, SSRF, and virtual host routing manipulati… | ya | installed |
| `testing-for-open-redirect-vulnerabilities` | Identifies and exploits open redirect vulnerabilities by analyzing URL redirection parameters (next, url, redirect, return, goto), applying bypass techniques, and chaini… | ya | installed |
| `testing-for-sensitive-data-exposure` | Identifying sensitive data exposure vulnerabilities including API key leakage, PII in responses, insecure storage, and unprotected data transmission during security asse… | ya | installed |
| `testing-for-system-prompt-leakage` | Extracts LLM system prompts using direct requests, jailbreak/instruction-override framing, translation/encoding tricks, and few-shot replay, combining manual payloads wi… | ya | installed |
| `testing-for-xml-injection-vulnerabilities` | Test web applications for XML injection vulnerabilities including XXE, XPath injection, and XML entity attacks to identify data exposure and server-side request forgery… | ya | installed |
| `testing-for-xss-vulnerabilities` | Tests web applications for reflected, stored, and DOM-based Cross-Site Scripting by injecting JavaScript payloads with Burp Suite (XSS extensions, Active Scan++) and bro… | ya | installed |
| `testing-for-xss-vulnerabilities-with-burpsuite` | Identifying and validating cross-site scripting vulnerabilities using Burp Suite's scanner, intruder, and repeater tools during authorized security assessments. | ya | installed |
| `testing-for-xxe-injection-vulnerabilities` | Discovering and exploiting XML External Entity injection vulnerabilities to read server files, perform SSRF, and exfiltrate data during authorized penetration tests. | ya | installed |
| `testing-prompt-injection-in-rag-pipelines` | Probes Retrieval-Augmented Generation pipelines for indirect prompt injection via poisoned retrieved documents and embedding-space manipulation, using NVIDIA garak, Prom… | ya | installed |
| `testing-websocket-api-security` | Tests WebSocket API implementations for missing upgrade-handshake authentication, Cross-Site WebSocket Hijacking (CSWSH), message injection, insufficient input validatio… | ya | installed |
| `verifying-build-provenance-with-slsa-sigstore` | Verifies artifact signatures and SLSA provenance using Sigstore's cosign (verify, verify-attestation, verify-blob-attestation) and slsa-verifier (verify-artifact), enfor… | ya | installed |

## 8. Cloud, Identity & Infrastructure Security — 106 skill

**Kategori:** cloud-security  ·  **Terpasang:** 101 / 106  ·  **Documented-only:** 5  

**Ringkasan:** Securing cloud platforms, Kubernetes, containers, identity, and network infrastructure, including zero-trust and privileged access, and OT/ICS environments.

**Tema:** `iam-and-identity`, `zero-trust-access`, `network-segmentation`, `kubernetes-and-containers`, `secrets-and-pam`, `ot-ics-security`

| Skill | Kegunaan | Terpasang | Status |
|---|---|---|---|
| `auditing-aws-s3-bucket-permissions` | Systematically audit AWS S3 bucket permissions to identify publicly accessible buckets, overly permissive ACLs, misconfigured bucket policies, and missing encryption set… | ya | installed |
| `auditing-foundry-smart-contract-security` | Pre-deployment security audit of Solidity smart contracts in a Foundry project. Combines static analysis (Slither, Aderyn), symbolic execution (Mythril), and property-ba… | ya | installed |
| `auditing-gcp-iam-permissions` | Auditing Google Cloud Platform IAM permissions to identify overly permissive bindings, primitive role usage, service account key proliferation, and cross-project access… | ya | installed |
| `auditing-kubernetes-cluster-rbac` | Auditing Kubernetes cluster RBAC configurations to identify overly permissive roles, wildcard permissions, dangerous ClusterRoleBindings, service account abuse, and priv… | ya | installed |
| `auditing-terraform-infrastructure-for-security` | Auditing Terraform infrastructure-as-code for security misconfigurations using Checkov, tfsec, Terrascan, and OPA/Rego policies to detect overly permissive IAM policies,… | ya | installed |
| `auditing-tls-certificate-transparency-logs` | Monitors Certificate Transparency (CT) logs to detect unauthorized certificate issuance, discover subdomains via CT data, and alert on suspicious certificate activity fo… | ya | installed |
| `benchmarking-kubernetes-with-kube-bench` | Installs and runs the kube-bench tool against a Kubernetes cluster as a Job, DaemonSet, or standalone binary, selecting the correct benchmark version and targets (contro… | ya | installed |
| `building-identity-federation-with-saml-azure-ad` | Configure SAML 2.0 identity federation between on-premises Active Directory (via AD FS or a third-party IdP) and Microsoft Entra ID, covering federation models (AD FS, p… | ya | installed |
| `configuring-aws-verified-access-for-ztna` | Configure AWS Verified Access to provide VPN-less zero trust network access to internal apps, combining identity trust providers (IAM Identity Center, Okta/OIDC), device… | ya | installed |
| `configuring-certificate-authority-with-openssl` | Build a two-tier PKI Certificate Authority hierarchy (offline Root CA plus issuing Intermediate CA) using OpenSSL and the Python cryptography library, covering certifica… | ya | installed |
| `configuring-identity-aware-proxy-with-google-iap` | Configures Google Cloud Identity-Aware Proxy (IAP) via gcloud to enforce per-request identity verification on Compute Engine, App Engine, Cloud Run, and GKE, including I… | ya | installed |
| `configuring-microsegmentation-for-zero-trust` | Configures microsegmentation policies to enforce least-privilege workload-to-workload access using tools such as VMware NSX, Illumio, and Calico, preventing lateral move… | ya | installed |
| `configuring-multi-factor-authentication-with-duo` | Deploys Cisco Duo multi-factor authentication across enterprise applications, VPN, RDP, and SSH access points, covering Duo Authentication Proxy setup, adaptive authenti… | ya | installed |
| `configuring-network-segmentation-with-vlans` | Designs and implements VLAN-based (802.1Q) network segmentation on managed switches to isolate zones such as corporate, servers, DMZ, guest, and IoT, and to limit latera… | ya | installed |
| `configuring-oauth2-authorization-flow` | Configures secure OAuth 2.0 authorization flows, including Authorization Code with PKCE, Client Credentials, and Device Authorization Grant, covering flow selection, PKC… | ya | installed |
| `configuring-pfsense-firewall-rules` | Configures pfSense firewall rules, NAT policies, IPsec/OpenVPN tunnels, and traffic shaping to enforce network segmentation and control traffic between zones such as DMZ… | ya | installed |
| `configuring-snort-ids-for-intrusion-detection` | Installs, configures, and tunes Snort 3 to monitor network traffic for malicious activity using custom and community rulesets, preprocessors, and alert output plugins. U… | ya | installed |
| `configuring-suricata-for-network-monitoring` | Deploys and configures Suricata IDS/IPS with Emerging Threats rulesets, EVE JSON logging, and custom rules for high-throughput, protocol-aware traffic inspection (HTTP,… | ya | installed |
| `configuring-tls-1-3-for-secure-communications` | Configures TLS 1.3 (RFC 8446) on servers, covering cipher suite and key-exchange group selection, and validates the resulting configuration with openssl s_client and tes… | ya | installed |
| `container-service-ops` | Use when operating services inside containers. | tidak | documented-only |
| `cross-platform-go-bot-migration` | Use when migrating bot features into Gobot. | tidak | documented-only |
| `enumerating-cloud-with-cloudfox` | Run CloudFox's read-only Describe/List/Get enumeration (all-checks, role-trusts, secrets, endpoints, and permissions commands) to map AWS and Azure attack paths and surf… | ya | installed |
| `go-bot-feature-audit` | Audit bot features vs mibot/gobot/zapo. | tidak | documented-only |
| `go-bot-moderation` | Use when hardening group antilink or frozen bot features. | tidak | documented-only |
| `hardening-docker-containers-for-production` | Hardens Dockerfiles, images, and per-container runtime settings against the CIS Docker Benchmark v1.8.0: non-root users, dropped capabilities, read-only root filesystem,… | ya | installed |
| `hardening-docker-daemon-configuration` | Hardens the Docker daemon (dockerd) through /etc/docker/daemon.json with user namespace remapping, TLS client authentication, seccomp profiles, and CIS Docker Benchmark… | ya | installed |
| `implementing-aws-iam-permission-boundaries` | Configures AWS IAM permission boundaries that cap the maximum permissions an identity-based policy can grant to a user or role, so effective permissions are the intersec… | ya | installed |
| `implementing-aws-macie-for-data-classification` | Enable and configure Amazon Macie via AWS CLI/Terraform to discover, classify, and protect sensitive data (PII, financial data, credentials) in S3 using ML and pattern m… | ya | installed |
| `implementing-aws-nitro-enclave-security` | Build AWS Nitro Enclave confidential computing environments using nitro-cli to create enclave images, configure attestation-aware KMS policies with PCR condition keys, v… | ya | installed |
| `implementing-aws-security-hub` | Deploy AWS Security Hub as a centralized CSPM platform, backed by AWS Config, aggregating findings from GuardDuty, Inspector, Macie, and third-party tools; enable CIS Fo… | ya | installed |
| `implementing-azure-ad-privileged-identity-management` | Configure Microsoft Entra Privileged Identity Management (PIM) to convert standing privileged assignments into eligible, time-bound roles requiring justification, MFA, a… | ya | installed |
| `implementing-beyondcorp-zero-trust-access-model` | Implement Google's BeyondCorp zero trust access model using Cloud IAP, Access Context Manager, Endpoint Verification, Chrome Enterprise Premium, and BeyondCorp Enterpris… | ya | installed |
| `implementing-bgp-security-with-rpki` | Implement RPKI-based BGP route origin validation by creating Route Origin Authorizations (ROAs) at RIRs (ARIN, RIPE, APNIC, AFRINIC, LACNIC), deploying validator softwar… | ya | installed |
| `implementing-browser-isolation-for-zero-trust` | Deploys remote browser isolation (RBI) as a core component of a Zero Trust architecture. Implements isolation policies with URL categorization and risk-based routing, co… | ya | installed |
| `implementing-canary-tokens-for-network-intrusion` | Deploys DNS, HTTP, and AWS API key canary tokens across network infrastructure to detect unauthorized access and lateral movement. Integrates with webhook alerting (Slac… | ya | installed |
| `implementing-cloud-security-posture-management` | Continuously monitor multi-cloud environments (AWS, Azure, GCP) for misconfigurations, compliance violations, and security risks using Prowler, ScoutSuite, AWS Security… | ya | installed |
| `implementing-cloud-trail-log-analysis` | Implementing AWS CloudTrail log analysis for security monitoring, threat detection, and forensic investigation using Athena, CloudWatch Logs Insights, and SIEM integrati… | ya | installed |
| `implementing-cloud-workload-protection` | Implements cloud workload protection using boto3 and google-cloud APIs for runtime security monitoring, process anomaly detection, and file integrity checking on EC2/GCE… | ya | installed |
| `implementing-conditional-access-policies-azure-ad` | Configures Microsoft Entra ID (Azure AD) Conditional Access policies for zero trust access control, covering signal-based policy design, device compliance requirements,… | ya | installed |
| `implementing-conduit-security-for-ot-remote-access` | Implements secure conduit architecture for OT remote access under the IEC 62443 zones-and-conduits model, deploying jump servers, MFA gateways, session recording, and ap… | ya | installed |
| `implementing-container-network-policies-with-calico` | Uses Calico's own policy CRDs beyond the upstream Kubernetes API - GlobalNetworkPolicy, HostEndpoint, NetworkSet, policy tiers, and DNS-based egress rules - applied and… | ya | installed |
| `implementing-ddos-mitigation-with-cloudflare` | Configure Cloudflare DDoS protection with managed rulesets, rate limiting, WAF rules, Bot Management, and origin protection to mitigate volumetric, protocol, and applica… | ya | installed |
| `implementing-delinea-secret-server-for-pam` | Implements Delinea Secret Server for privileged access management, covering secret vault configuration, role-based access policies, automated password rotation, session… | ya | installed |
| `implementing-gcp-binary-authorization` | Implements GCP Binary Authorization end to end, including creating KMS-backed attestors, Container Analysis notes, deploy-time policies, and signing image attestations,… | ya | installed |
| `implementing-gcp-organization-policy-constraints` | Implements GCP Organization Policy constraints via gcloud and Terraform, such as restricting external IPs, resource locations, default service accounts, and service acco… | ya | installed |
| `implementing-gcp-vpc-firewall-rules` | Implements and audits GCP VPC firewall rules using gcloud, covering auditing overly permissive rules, creating restrictive ingress/egress rules, hierarchical firewall po… | ya | installed |
| `implementing-hashicorp-vault-dynamic-secrets` | Configures HashiCorp Vault dynamic secrets engines for database credentials, AWS IAM keys, and PKI certificates, with automatic generation, lease management, and rotatio… | ya | installed |
| `implementing-honeypot-for-ransomware-detection` | Deploys canary files, honeypot shares, and decoy systems to detect ransomware activity at the earliest possible stage. Configures canary tokens embedded in strategic fil… | ya | installed |
| `implementing-honeytokens-for-breach-detection` | Deploys canary tokens and honeytokens (fake AWS credentials, DNS canaries, document beacons, database records) that trigger alerts when accessed by attackers. Uses the C… | ya | installed |
| `implementing-ics-firewall-with-tofino` | Deploys and configures Tofino industrial firewalls (Belden/Hirschmann) to protect SCADA systems and PLCs, using deep packet inspection of OT protocols (Modbus, EtherNet/… | ya | installed |
| `implementing-identity-verification-for-zero-trust` | Implements continuous, risk-adaptive identity verification for zero trust using phishing-resistant MFA (FIDO2/WebAuthn), risk-based conditional access, and identity gove… | ya | installed |
| `implementing-iec-62443-security-zones` | Designs security zones and conduits for industrial control systems (IACS) per IEC 62443-3-2 — risk-based zone partitioning, Security Level target (SL-T) assignment, cond… | ya | installed |
| `implementing-immutable-backup-with-restic` | Implements ransomware-resistant backups using restic with S3-compatible Object Lock (AWS S3, MinIO, Backblaze B2), automating backup creation, integrity checks via resti… | ya | installed |
| `implementing-kubernetes-network-policy-with-calico` | Installs Calico as the cluster CNI and writes standard Kubernetes NetworkPolicy under it, covering default-deny baselines, policy ordering and precedence, service-accoun… | ya | installed |
| `implementing-kubernetes-pod-security-standards` | Chooses and applies the correct Kubernetes Pod Security Standard (Privileged, Baseline, Restricted) for a workload: what each profile forbids, how to map existing worklo… | ya | installed |
| `implementing-microsegmentation-with-guardicore` | Implements microsegmentation with Akamai Guardicore Segmentation to map application dependencies, visualize east-west traffic flows, and create granular, least-privilege… | ya | installed |
| `implementing-mtls-for-zero-trust-services` | Configures mutual TLS (mTLS) authentication between microservices using Python cryptography library for certificate generation and ssl module for TLS verification. Valid… | ya | installed |
| `implementing-network-access-control` | Implements 802.1X port-based network access control using RADIUS authentication, PacketFence NAC, and switch configuration to enforce identity-based access policies, pos… | ya | installed |
| `implementing-network-access-control-with-cisco-ise` | Deploys Cisco Identity Services Engine (ISE) as a RADIUS policy server for 802.1X wired and wireless authentication, MAC Authentication Bypass, posture assessment, dynam… | ya | installed |
| `implementing-network-deception-with-honeypots` | Deploy and manage network honeypots using OpenCanary, T-Pot, or Cowrie to detect unauthorized access, lateral movement, and attacker reconnaissance. | ya | installed |
| `implementing-network-intrusion-prevention-with-suricata` | Deploys and configures Suricata as an inline network intrusion prevention system, covering IPS mode setup (NFQueue), custom rule writing, Emerging Threats ruleset manage… | ya | installed |
| `implementing-network-policies-for-kubernetes` | Writes portable upstream Kubernetes NetworkPolicy YAML - default-deny-all, DNS egress, namespace and pod selector rules - that works on any conformant CNI such as Calico… | ya | installed |
| `implementing-network-segmentation-for-ot` | Implements OT network segmentation using VLANs, OT-aware firewalls, data diodes, and IEC 62443 zone/conduit architecture, with a traffic-baseline-driven design tool for… | ya | installed |
| `implementing-network-segmentation-with-firewall-zones` | Designs and implements network segmentation using firewall security zones, VLANs, inter-zone ACLs, and workload-level microsegmentation to restrict east-west lateral mov… | ya | installed |
| `implementing-next-generation-firewall-with-palo-alto` | Configures and deploys Palo Alto Networks next-generation firewalls end-to-end, covering App-ID application-aware policies, User-ID identity-based enforcement, zone-base… | ya | installed |
| `implementing-opa-gatekeeper-for-policy-enforcement` | Deploys OPA Gatekeeper via Helm as a Kubernetes admission controller and writes ConstraintTemplates with Rego plus instantiated Constraints to validate, mutate, or deny… | ya | installed |
| `implementing-passwordless-auth-with-microsoft-entra` | Implements passwordless authentication using Microsoft Entra ID with FIDO2 security keys, Windows Hello for Business, Microsoft Authenticator passkeys, and certificate-b… | ya | installed |
| `implementing-pod-security-admission-controller` | Configures and operates the Kubernetes Pod Security Admission (PSA) controller that enforces Pod Security Standards: namespace enforce/audit/warn labels, cluster-wide de… | ya | installed |
| `implementing-policy-as-code-with-open-policy-agent` | Implements policy-as-code enforcement with Open Policy Agent (OPA) and Gatekeeper for Kubernetes and CI/CD pipelines, covering writing Rego policies, deploying OPA Gatek… | ya | installed |
| `implementing-privileged-access-management-with-cyberark` | Deploy CyberArk Privileged Access Management to discover, vault, rotate, and monitor privileged credentials across enterprise infrastructure, covering vault architecture… | ya | installed |
| `implementing-privileged-access-workstation` | Design and implement Privileged Access Workstations (PAWs) using the tiered administration model, with device hardening, device compliance enforcement via Microsoft Intu… | ya | installed |
| `implementing-purdue-model-network-segmentation` | Implement network segmentation based on the Purdue Enterprise Reference Architecture (PERA) model, separating ICS networks into hierarchical security zones from Level 0… | ya | installed |
| `implementing-rbac-hardening-for-kubernetes` | Hardens Kubernetes RBAC by designing least-privilege Roles and ClusterRoles, auditing RoleBindings, eliminating cluster-admin sprawl, separating service accounts, and in… | ya | installed |
| `implementing-saml-sso-with-okta` | Implement SAML 2.0 Single Sign-On using Okta as the Identity Provider, covering SP-initiated and IdP-initiated flows, attribute mapping, certificate management, SHA-256… | ya | installed |
| `implementing-scim-provisioning-with-okta` | Implement automated user lifecycle provisioning and deprovisioning using the SCIM 2.0 protocol with Okta as the identity provider. Use when automating account creation,… | ya | installed |
| `implementing-secrets-management-with-vault` | Deploy HashiCorp Vault for centralized secrets management, covering dynamic secret generation for databases and cloud providers, transit encryption, PKI certificate mana… | ya | installed |
| `implementing-syslog-centralization-with-rsyslog` | Configure rsyslog for centralized log collection with TLS encryption, custom templates, and log rotation, generating server and client configuration files with GnuTLS st… | ya | installed |
| `implementing-zero-standing-privilege-with-cyberark` | Deploy CyberArk Secure Cloud Access (SCA) to eliminate standing privileges in AWS, Azure, and GCP by provisioning ephemeral, scoped roles on a just-in-time basis governe… | ya | installed |
| `implementing-zero-trust-dns-with-nextdns` | Configure NextDNS as an encrypted (DoH/DoT) zero trust DNS resolver that blocks malicious, phishing, and cryptojacking domains via real-time threat intelligence, detects… | ya | installed |
| `implementing-zero-trust-for-saas-applications` | Secures SaaS apps (Microsoft 365, Google Workspace, Salesforce, Slack) via CASB/SSPM deployment, conditional access policies, OAuth app governance, and session-level DLP… | ya | installed |
| `implementing-zero-trust-in-cloud` | Guides zero trust implementation across AWS, Azure, and GCP per NIST SP 800-207 and BeyondCorp principles, covering identity-centric access, micro-segmentation, continuo… | ya | installed |
| `implementing-zero-trust-network-access` | Configures Zero Trust Network Access (ZTNA) in AWS, Azure, and GCP using identity-aware proxies, micro-segmentation, and continuous verification with conditional access… | ya | installed |
| `implementing-zero-trust-with-beyondcorp` | Configures Google BeyondCorp Enterprise Identity-Aware Proxy (IAP) as the access enforcement point for web applications, defining Access Context Manager access levels fr… | ya | installed |
| `implementing-zero-trust-with-hashicorp-boundary` | Installs and configures HashiCorp Boundary as a default-deny, identity-aware proxy for infrastructure access, including controller/worker setup, Vault-backed credential… | ya | installed |
| `performing-aws-account-enumeration-with-scout-suite` | Run the agentless, open-source ScoutSuite tool (via pip install and the `scout` CLI) against an AWS account to enumerate resources across services, identify misconfigura… | ya | installed |
| `performing-container-image-hardening` | Harden container images by minimizing attack surface, stripping unnecessary packages, implementing multi-stage builds, configuring non-root users, and applying CIS Docke… | ya | installed |
| `performing-gcp-penetration-testing-with-gcpbucketbrute` | Performs authorized GCP security testing using GCPBucketBrute to enumerate publicly accessible storage buckets, combined with gcloud CLI IAM enumeration to find privileg… | ya | installed |
| `performing-ics-asset-discovery-with-claroty` | Performs ICS/OT asset discovery with Claroty xDome, combining passive monitoring and Claroty Edge active queries to inventory PLCs, RTUs, HMIs, and network infrastructur… | ya | installed |
| `performing-kubernetes-penetration-testing` | Evaluates Kubernetes cluster security by actively simulating attacker techniques against the API server, kubelet, etcd, pods, RBAC, network policy, and secrets, using ku… | ya | installed |
| `performing-oauth-scope-minimization-review` | Performs OAuth 2.0 scope minimization review to identify over-permissioned third-party application integrations, excessive API scopes, unused token grants, and risky OAu… | ya | installed |
| `performing-s7comm-protocol-security-analysis` | Perform security analysis of Siemens S7comm and S7CommPlus protocols used by SIMATIC S7 PLCs to identify vulnerabilities including replay attacks, integrity bypass, unau… | ya | installed |
| `performing-serverless-function-security-review` | Performing security reviews of serverless functions across AWS Lambda, Azure Functions, and GCP Cloud Functions to identify overly permissive execution roles, insecure e… | ya | installed |
| `performing-ssl-certificate-lifecycle-management` | Automates the full SSL/TLS certificate lifecycle, including generating Certificate Signing Requests, issuing, deploying, monitoring, renewing, and revoking X.509 certifi… | ya | installed |
| `performing-ssl-stripping-attack` | Simulates SSL stripping / HTTPS downgrade attacks using sslstrip, Bettercap, and mitmproxy in authorized lab environments to test HSTS enforcement, certificate validatio… | ya | installed |
| `performing-ssl-tls-inspection-configuration` | Configure SSL/TLS break-and-inspect on next-generation firewalls and forward proxies to decrypt, inspect, and re-encrypt HTTPS traffic for malware and exfiltration detec… | ya | installed |
| `performing-vlan-hopping-attack` | Simulates VLAN hopping attacks using switch spoofing and 802.1Q double tagging techniques in authorized lab environments to test VLAN segmentation effectiveness and swit… | ya | installed |
| `remediating-s3-bucket-misconfiguration` | Provides step-by-step procedures for remediating Amazon S3 bucket misconfigurations that expose sensitive data: enabling S3 Block Public Access, auditing bucket policies… | ya | installed |
| `securing-aws-iam-permissions` | Hardens AWS IAM configurations to enforce least-privilege access, covering IAM policy scoping, permission boundaries, IAM Access Analyzer integration, and credential rot… | ya | installed |
| `securing-aws-lambda-execution-roles` | Hardens AWS Lambda execution roles by writing least-privilege IAM policies, applying permission boundaries, restricting resource-based policies, validating permissions w… | ya | installed |
| `securing-historian-server-in-ot-environment` | Audits and hardens process historian servers (OSIsoft PI, Honeywell PHD, GE Proficy, AVEVA Historian) in OT environments: Purdue-level network placement, interface acces… | ya | installed |
| `securing-kubernetes-on-cloud` | Hardens managed Kubernetes clusters on EKS, AKS, and GKE by implementing Pod Security Standards, network policies, workload identity (IRSA for EKS, Workload Identity for… | ya | installed |
| `securing-remote-access-to-ot-environment` | Designs and configures secure remote access to OT/ICS environments for operators, engineers, and vendors: jump server architecture, multi-factor authentication, session… | ya | installed |
| `securing-serverless-functions` | Hardens serverless compute platforms (AWS Lambda, Azure Functions, Google Cloud Functions): least-privilege IAM roles, dependency vulnerability scanning, secrets managem… | ya | installed |
| `testing-oauth2-implementation-flaws` | Tests OAuth 2.0 and OpenID Connect implementations for authorization code interception, redirect URI manipulation, CSRF in OAuth flows, token leakage, scope escalation,… | ya | installed |
| `tg-go-bot-ops` | Diagnosa bot Telegram berbasis Go: error 409, webhook vs polling, secret token, batas kirim 429, token tidak valid, bot diam di grup, dan kebocoran token di log. Pakai s… | tidak | documented-only |
| `validating-tpm-measured-boot-attestation` | Verifies TPM 2.0 measured-boot integrity and remote attestation with tpm2-tools -- reading PCRs (tpm2_pcrread), replaying the boot event log, generating and checking sig… | ya | installed |

## 9. Endpoint & Host Security — 56 skill

**Kategori:** endpoint-security  ·  **Terpasang:** 54 / 56  ·  **Documented-only:** 2  

**Ringkasan:** Protecting and monitoring endpoints: EDR, hardening, whitelisting, DLP, email security, and host-based intrusion detection.

**Tema:** `edr-endpoint-protection`, `hardening-benchmarking`, `data-loss-prevention`, `email-security`, `deception-technology`, `endpoint-monitoring`

| Skill | Kegunaan | Terpasang | Status |
|---|---|---|---|
| `auditing-cloud-with-cis-benchmarks` | Audit AWS, Azure, and GCP environments against the CIS Foundations Benchmarks by running automated scans with tools like Prowler and ScoutSuite, interpreting failed cont… | ya | installed |
| `building-phishing-reporting-button-workflow` | Implement a phishing report button (Microsoft 365 built-in Report button or third-party like KnowBe4/Cofense) in email clients with a SOAR-driven automated triage workfl… | ya | installed |
| `configuring-host-based-intrusion-detection` | Configures host-based intrusion detection systems (HIDS) to monitor endpoint file integrity, system calls, and configuration changes for security violations. Use when de… | ya | installed |
| `configuring-ldap-security-hardening` | Hardens LDAP directory services against credential harvesting, LDAP injection, anonymous binding, and channel-binding bypass by enforcing LDAPS, channel binding, and LDA… | ya | installed |
| `configuring-windows-defender-advanced-settings` | Configures Microsoft Defender for Endpoint (MDE) advanced protection settings including attack surface reduction rules, controlled folder access, network protection, and… | ya | installed |
| `deploying-active-directory-honeytokens` | Deploys deception-based honeytokens in Active Directory including fake privileged accounts with AdminCount=1, fake SPNs for Kerberoasting detection (honeyroasting), deco… | ya | installed |
| `deploying-cloud-deception-with-decoy-resources` | Deploy cloud-native deception across AWS, Azure, and GCP using decoy (honey) resources whose only purpose is to generate a high-fidelity alert the instant an attacker to… | ya | installed |
| `deploying-cloudflare-access-for-zero-trust` | Deploys Cloudflare Access with Cloudflare Tunnel for zero trust access to self-hosted apps, configuring identity-aware policies, device posture checks, and WARP client e… | ya | installed |
| `deploying-decoy-files-for-ransomware-detection` | Deploys canary files (honeytokens) across file systems to detect ransomware encryption activity in real time. Uses strategically placed decoy documents monitored via fil… | ya | installed |
| `deploying-edr-agent-with-crowdstrike` | Deploys and configures CrowdStrike Falcon EDR agents across enterprise endpoints to enable real-time threat detection, behavioral analysis, and automated response. Use w… | ya | installed |
| `deploying-honeytokens-and-canarytokens` | Plants Canarytokens-based decoy artifacts (honey credentials, DNS tokens, web-bug URLs, AWS keys, documents, kubeconfigs) using Thinkst's open-source Canarytokens projec… | ya | installed |
| `deploying-osquery-for-endpoint-monitoring` | Deploys and configures osquery for real-time endpoint monitoring using SQL-based queries to inspect running processes, open ports, installed software, and system configu… | ya | installed |
| `deploying-palo-alto-prisma-access-zero-trust` | Deploys Palo Alto Networks Prisma Access for SASE-based zero trust network access, configuring GlobalProtect agents, ZTNA Connectors, security policy enforcement, and St… | ya | installed |
| `deploying-ransomware-canary-files` | Deploys and monitors ransomware canary files using Python's watchdog library, placing decoy files mimicking high-value targets (financial records, credentials, database… | ya | installed |
| `deploying-software-defined-perimeter` | Deploys a Software-Defined Perimeter per the CSA v2.0 specification, configuring Single Packet Authorization, mutual TLS, and SDP controller/gateway components to enforc… | ya | installed |
| `deploying-tailscale-for-zero-trust-vpn` | Deploys and configures Tailscale (or self-hosted Headscale) as a WireGuard-based zero trust mesh VPN, setting up identity-aware ACLs, exit nodes, subnet routers, and Mag… | ya | installed |
| `detecting-dependency-confusion` | Detect and prevent dependency confusion (public-over-private package name resolution) in npm, PyPI, and Maven by enumerating claimable internal package names with tools… | ya | installed |
| `detecting-evasion-techniques-in-endpoint-logs` | Detects defense evasion techniques used by adversaries in endpoint logs including log tampering, timestomping, process injection, and security tool disabling. Use when i… | ya | installed |
| `detecting-fileless-attacks-on-endpoints` | Detects fileless malware and in-memory attacks that execute entirely in RAM without writing persistent files to disk, evading traditional antivirus. Use when building de… | ya | installed |
| `detecting-insider-data-exfiltration-via-dlp` | Detects insider data exfiltration by analyzing DLP policy violations, file access patterns, upload volume anomalies, and off-hours activity in endpoint and cloud logs. U… | ya | installed |
| `detecting-qr-code-phishing-with-email-security` | Detect and prevent QR code phishing (quishing) attacks that embed malicious URLs inside QR code images to bypass link-based email security, using image-based threat dete… | ya | installed |
| `detecting-shadow-api-endpoints` | Discover and inventory shadow API endpoints that operate outside documented OpenAPI/Swagger specs, using traffic analysis against API gateways (Kong, AWS API Gateway, En… | ya | installed |
| `detecting-t1003-credential-dumping-with-edr` | Detect OS credential dumping (MITRE T1003) targeting LSASS memory, the SAM database, NTDS.dit, and cached credentials by correlating EDR telemetry, Sysmon process-access… | ya | installed |
| `endpoint-security-remediation` | Use when fixing audit findings across multiple endpoints. | tidak | documented-only |
| `hardening-linux-endpoint-with-cis-benchmark` | Hardens Linux endpoints using CIS Benchmark recommendations for Ubuntu, RHEL, and CentOS to reduce attack surface, enforce security baselines, and meet compliance requir… | ya | installed |
| `hardening-windows-endpoint-with-cis-benchmark` | Hardens Windows endpoints using CIS (Center for Internet Security) Benchmark recommendations to reduce attack surface, enforce security baselines, and meet compliance re… | ya | installed |
| `hermes-custom-model-endpoints` | Wire an OpenAI-compatible endpoint into Hermes as a model. | tidak | documented-only |
| `hunting-for-lolbins-execution-in-endpoint-logs` | Hunts for LOLBins (Living Off the Land Binaries) abuse, mapped to MITRE T1218, by analyzing endpoint process-creation logs for suspicious execution patterns of legitimat… | ya | installed |
| `implementing-anti-phishing-training-program` | Guides designing, deploying, and measuring an anti-phishing security awareness program - baseline phishing simulations, interactive training modules, just-in-time learni… | ya | installed |
| `implementing-application-whitelisting-with-applocker` | Implements application whitelisting using Windows AppLocker to restrict unauthorized software execution on endpoints, reducing attack surface from malware, unauthorized… | ya | installed |
| `implementing-azure-defender-for-cloud` | Enable Microsoft Defender for Cloud (CSPM + CWPP) across VMs, containers, SQL, storage, and Key Vault, using Azure Policy for evaluation, Log Analytics for telemetry, Az… | ya | installed |
| `implementing-cloud-dlp-for-data-protection` | Implement cloud DLP using Amazon Macie, Google Cloud DLP API, Microsoft Purview, Azure Information Protection, and Nightfall AI to discover, classify, label, de-identify… | ya | installed |
| `implementing-data-loss-prevention-with-microsoft-purview` | Implements DLP policies using Microsoft Purview PowerShell cmdlets and the Graph API to protect data across Exchange Online, SharePoint, OneDrive, Teams, endpoints, and… | ya | installed |
| `implementing-dmarc-dkim-spf-email-security` | Configures SPF, DKIM, and DMARC DNS TXT records to authenticate outbound email, prevent domain spoofing, and enforce a rejection/quarantine policy on unauthenticated mai… | ya | installed |
| `implementing-ebpf-security-monitoring` | Implements eBPF-based security monitoring using Cilium Tetragon for real-time process execution tracking, network connection observability, file access auditing, and run… | ya | installed |
| `implementing-email-sandboxing-with-proofpoint` | Email sandboxing detonates suspicious attachments and URLs in isolated environments to detect zero-day malware and evasive phishing payloads. Proofpoint Targeted Attack… | ya | installed |
| `implementing-endpoint-detection-with-wazuh` | Deploys and configures Wazuh SIEM/XDR for endpoint detection, covering agent authentication and management, custom decoder and rule XML creation, alert querying via the… | ya | installed |
| `implementing-endpoint-dlp-controls` | Implements endpoint Data Loss Prevention (DLP) controls to detect and prevent sensitive data exfiltration through email, USB, cloud storage, and printing. Use when deplo… | ya | installed |
| `implementing-file-integrity-monitoring-with-aide` | Configures AIDE (Advanced Intrusion Detection Environment) for file integrity monitoring on Linux, covering baseline database creation, scheduled integrity checks via cr… | ya | installed |
| `implementing-log-forwarding-with-fluentd` | Configures Fluent Bit as an endpoint log forwarder and Fluentd as the central aggregator for centralized log collection, routing, filtering, and enrichment, covering inp… | ya | installed |
| `implementing-log-integrity-with-blockchain` | Builds an append-only log integrity chain using SHA-256 hash chaining, where each entry incorporates the previous entry's hash so tampering invalidates all subsequent ha… | ya | installed |
| `implementing-memory-protection-with-dep-aslr` | Implements memory protection mechanisms including DEP (Data Execution Prevention), ASLR (Address Space Layout Randomization), CFG (Control Flow Guard), and other exploit… | ya | installed |
| `implementing-mimecast-targeted-attack-protection` | Deploys and configures Mimecast Targeted Threat Protection (TTP) modules -- URL Protect (click-time URL rewriting/analysis), Attachment Protect (sandbox detonation), Imp… | ya | installed |
| `implementing-privileged-session-monitoring` | Implements privileged session monitoring and recording using PAM solutions, focusing on CyberArk Privileged Session Manager (PSM) and open-source alternatives, covering… | ya | installed |
| `implementing-proofpoint-email-security-gateway` | Deploy and configure Proofpoint Email Protection as a secure email gateway to detect and block phishing, malware, BEC, and spam before messages reach user inboxes. | ya | installed |
| `implementing-security-chaos-engineering` | Implements security chaos engineering experiments that deliberately disable or degrade security controls to verify detection and response capabilities. Tests WAF bypass,… | ya | installed |
| `implementing-security-monitoring-with-datadog` | Implements security monitoring using Datadog Cloud SIEM, Cloud Security Management (CSM), and Workload Protection to detect threats, enforce compliance, and respond to s… | ya | installed |
| `performing-deception-technology-deployment` | Deploys deception technology including honeypots, honeytokens, and decoy systems to detect attackers who have bypassed perimeter defenses, providing high-fidelity alerts… | ya | installed |
| `performing-dmarc-policy-enforcement-rollout` | Execute a phased DMARC rollout by inventorying sending sources, configuring SPF/DKIM alignment, and progressing DNS policy from p=none monitoring through p=quarantine to… | ya | installed |
| `performing-endpoint-forensics-investigation` | Performs digital forensics investigation on compromised endpoints including memory acquisition, disk imaging, artifact analysis, and timeline reconstruction. Use when in… | ya | installed |
| `performing-endpoint-vulnerability-remediation` | Performs vulnerability remediation on endpoints by prioritizing CVEs based on risk scoring, deploying patches, applying configuration changes, and validating fixes. Use… | ya | installed |
| `performing-graphql-depth-limit-attack` | Execute and test GraphQL depth limit attacks using deeply nested recursive queries to identify denial-of-service vulnerabilities in GraphQL APIs. | ya | installed |
| `performing-kubernetes-cis-benchmark-with-kube-bench` | Turns kube-bench output into a finished CIS Kubernetes Benchmark audit: interpreting PASS/FAIL/WARN per control, judging which failures are genuine on a managed cluster,… | ya | installed |
| `performing-sca-dependency-scanning-with-snyk` | This skill covers implementing Software Composition Analysis (SCA) using Snyk to detect vulnerable open-source dependencies in CI/CD pipelines. It addresses scanning pac… | ya | installed |
| `securing-azure-with-microsoft-defender` | Deploys and configures Microsoft Defender for Cloud as a CNAPP for Azure, multi-cloud, and hybrid environments: enabling Defender plans for servers, containers, storage,… | ya | installed |
| `securing-helm-chart-deployments` | Secures Helm chart deployments by verifying chart signatures and provenance, rendering and linting templates for misconfiguration, enforcing pod security contexts throug… | ya | installed |

## 10. Vulnerability Management & Security Testing — 127 skill

**Kategori:** vulnerability-management  ·  **Terpasang:** 125 / 127  ·  **Documented-only:** 2  

**Ringkasan:** Discovering, assessing, and tracking vulnerabilities across infrastructure and applications.

**Tema:** `vulnerability-scanning`, `penetration-testing`, `container-iac-scanning`, `secret-scanning`, `network-traffic-analysis`, `application-and-mobile-security`

| Skill | Kegunaan | Terpasang | Status |
|---|---|---|---|
| `analyzing-email-headers-for-phishing-investigation` | Parse and analyze email headers (Received chain, Return-Path, Message-ID) to trace the true origin of a phishing email and validate SPF, DKIM, and DMARC results to confi… | ya | installed |
| `analyzing-ios-app-security-with-objection` | Runtime iOS app security testing with Objection (Frida): inspect keychain and filesystem data, explore app internals at runtime, and validate/bypass client-side protecti… | ya | installed |
| `assessing-vector-and-embedding-weaknesses` | Test RAG vector stores (Pinecone, Qdrant, Weaviate, Chroma, pgvector, FAISS) for embedding inversion, cross-tenant data leakage, and data poisoning per OWASP LLM08:2025.… | ya | installed |
| `building-vulnerability-aging-and-sla-tracking` | Implement a vulnerability aging dashboard and SLA tracking system that measures time-to-remediation against severity-based deadlines (e.g. 14 days critical, 30 days high… | ya | installed |
| `building-vulnerability-dashboard-with-defectdojo` | Deploy DefectDojo as a centralized vulnerability management dashboard that ingests findings from 200+ security scanners, deduplicates results, tracks remediation metrics… | ya | installed |
| `building-vulnerability-exception-tracking-system` | Build a vulnerability exception and risk acceptance tracking system covering approval workflows, compensating controls documentation, and automatic expiration for vulner… | ya | installed |
| `building-vulnerability-scanning-workflow` | Builds a structured vulnerability scanning workflow using tools like Nessus, Qualys, and OpenVAS to discover, prioritize, and track remediation of security vulnerabiliti… | ya | installed |
| `codebase-inspection` | Inspect codebases w/ pygount: LOC, languages, ratios. | tidak | documented-only |
| `conducting-external-reconnaissance-with-osint` | Conduct external recon using OSINT techniques to map an organization's external attack surface without touching target systems, gathering DNS records, certificate transp… | ya | installed |
| `conducting-full-scope-red-team-engagement` | Plan and execute a comprehensive, MITRE ATT&CK-aligned red team engagement spanning threat modeling, reconnaissance, initial access, and post-exploitation to evaluate an… | ya | installed |
| `conducting-internal-network-penetration-test` | Execute an internal network penetration test simulating an insider threat or post-breach attacker to identify lateral movement paths, privilege escalation vectors, and s… | ya | installed |
| `conducting-internal-reconnaissance-with-bloodhound-ce` | Conduct internal Active Directory reconnaissance using BloodHound Community Edition's graph database with the SharpHound (AD) and AzureHound (Entra ID) collectors, mappi… | ya | installed |
| `conducting-mobile-app-penetration-test` | Conducts penetration testing of iOS and Android mobile applications following the OWASP Mobile Application Security Testing Guide (MASTG) to identify vulnerabilities in… | ya | installed |
| `conducting-network-penetration-test` | Conducts comprehensive network penetration tests against authorized target environments by performing host discovery, port scanning, service enumeration, vulnerability i… | ya | installed |
| `conducting-wireless-network-penetration-test` | Conducts authorized wireless network penetration tests to assess the security of WiFi infrastructure by testing for weak encryption protocols, captive portal bypasses, e… | ya | installed |
| `configuring-hsm-for-key-storage` | Configures Hardware Security Modules for cryptographic key storage using the PKCS#11 standard interface, covering key generation, signing, encryption, and key management… | ya | installed |
| `detecting-beaconing-patterns-with-zeek` | Performs statistical analysis of Zeek conn.log connection intervals to detect C2 beaconing patterns. Uses the ZAT library to load Zeek logs into Pandas DataFrames, calcu… | ya | installed |
| `detecting-exfiltration-over-dns-with-zeek` | Detect DNS-based data exfiltration by analyzing Zeek dns.log for high-entropy subdomains, oversized TXT/NULL records, and anomalous query volume or patterns. Use when in… | ya | installed |
| `detecting-insider-threat-behaviors` | Detect insider threat behavioral indicators including unusual data access, off-hours activity, mass file downloads, privilege abuse, and resignation-correlated data thef… | ya | installed |
| `detecting-insider-threat-with-ueba` | Implement User and Entity Behavior Analytics (UEBA) using Elasticsearch/OpenSearch to build behavioral baselines, calculate anomaly scores, perform peer group analysis,… | ya | installed |
| `detecting-lateral-movement-with-zeek` | Detect lateral movement in network traffic using Zeek (formerly Bro) log analysis. Parses conn.log, smb_mapping.log, smb_files.log, dce_rpc.log, kerberos.log, and ntlm.l… | ya | installed |
| `detecting-living-off-the-land-with-lolbas` | Detect Living Off the Land Binaries (LOLBins/LOLBAS) abuse including certutil, regsvr32, mshta, and rundll32 via process telemetry, Sigma rules, and parent-child process… | ya | installed |
| `detecting-network-anomalies-with-zeek` | Deploy and configure Zeek (formerly Bro) to passively analyze network traffic, generate structured connection/DNS/HTTP/SSL/file logs, detect anomalous behavior, and writ… | ya | installed |
| `detecting-network-scanning-with-ids-signatures` | Detect network reconnaissance and port scanning using Suricata and Snort IDS signatures, threshold-based detection rules, and traffic anomaly analysis to identify Nmap,… | ya | installed |
| `detecting-port-scanning-with-fail2ban` | Configures Fail2ban with custom filters and actions to detect port scanning activity, SSH brute force attempts, and network reconnaissance, automatically banning offendi… | ya | installed |
| `detecting-service-account-abuse` | Detect abuse of service accounts by hunting for anomalous interactive logons, privilege escalation, and lateral movement using EDR/SIEM telemetry (CrowdStrike Falcon, Mi… | ya | installed |
| `exploiting-deeplink-vulnerabilities` | Tests and exploits deep link (URL scheme and App Link) vulnerabilities in Android and iOS mobile applications to identify unauthorized access, data injection, intent hij… | ya | installed |
| `exploiting-insecure-data-storage-in-mobile` | Identifies and exploits insecure local data storage vulnerabilities in Android and iOS mobile applications including unencrypted databases, world-readable files, insecur… | ya | installed |
| `exploiting-insecure-deserialization` | Identifying and exploiting insecure deserialization vulnerabilities in Java, PHP, Python, and .NET applications to achieve remote code execution during authorized penetr… | ya | installed |
| `exploiting-jwt-algorithm-confusion-attack` | Exploits JWT algorithm confusion where the server's verification library trusts the alg named in the token header, by switching RS256 to HS256 (signing with the RSA publ… | ya | installed |
| `exploiting-ms17-010-eternalblue-vulnerability` | Detects and exploits MS17-010 (EternalBlue), a critical remote code execution flaw in Microsoft's SMBv1 implementation, using Nmap's ms-17-010 NSE script for detection a… | ya | installed |
| `exploiting-zerologon-vulnerability-cve-2020-1472` | Exploits the Zerologon vulnerability (CVE-2020-1472) in the Netlogon Remote Protocol using Impacket to reset a domain controller's machine account password to empty, the… | ya | installed |
| `go-service-baseline` | Standar kualitas layanan backend Go (HTTP API, bot): vet dan test, timeout, graceful shutdown, log terstruktur, health check, konkurensi, error, dan database. Pakai saat… | tidak | documented-only |
| `hunting-for-dns-based-persistence` | Hunts for DNS-based persistence mechanisms such as DNS hijacking, dangling CNAME records enabling subdomain takeover, wildcard DNS abuse, and unauthorized zone or NS del… | ya | installed |
| `hunting-for-dns-tunneling-with-zeek` | Detects DNS tunneling and covert-channel data exfiltration by analyzing Zeek dns.log for high-entropy subdomain queries, excessive query volume, abnormally long query le… | ya | installed |
| `implementing-aqua-security-for-container-scanning` | Deploy Aqua Security's Trivy scanner to detect vulnerabilities, misconfigurations, secrets, and license issues in container images across CI/CD pipelines and registries. | ya | installed |
| `implementing-attack-path-analysis-with-xm-cyber` | Deploys XM Cyber's continuous exposure management platform to build attack graphs that chain vulnerabilities, misconfigurations, identity risks, and credential weaknesse… | ya | installed |
| `implementing-attack-surface-management` | Implements external attack surface management (EASM) using Shodan, Censys, and ProjectDiscovery tools (subfinder, httpx, nuclei) for asset discovery, subdomain enumerati… | ya | installed |
| `implementing-cloud-vulnerability-posture-management` | Implement multi-cloud CSPM to detect cloud-native misconfigurations and vulnerabilities (IAM over-permissions, exposed storage, unencrypted data, missing network control… | ya | installed |
| `implementing-container-image-minimal-base-with-distroless` | Reduces container attack surface by building application images on Google distroless base images that ship only the application runtime - no shell, package manager, or O… | ya | installed |
| `implementing-continuous-security-validation-with-bas` | Deploys Breach and Attack Simulation (BAS) platforms such as SafeBreach, AttackIQ, Picus, Cymulate, Pentera, or SCYTHE to continuously validate endpoint, network, email-… | ya | installed |
| `implementing-deception-based-detection-with-canarytoken` | Deploys and monitors Canary Tokens via the Thinkst Canary REST API for deception-based breach detection, programmatically creating web bug, DNS, MS Word document, and AW… | ya | installed |
| `implementing-devsecops-security-scanning` | Integrates SAST, DAST, and SCA into CI/CD pipelines using Semgrep for SAST, Trivy for SCA and container scanning, OWASP ZAP for DAST, and Gitleaks for secrets detection.… | ya | installed |
| `implementing-epss-score-for-vulnerability-prioritization` | Queries FIRST's Exploit Prediction Scoring System (EPSS) API to fetch exploitation-probability and percentile scores for CVEs, then uses those scores to prioritize vulne… | ya | installed |
| `implementing-fuzz-testing-in-cicd-with-aflplusplus` | Integrates AFL++ coverage-guided fuzzing into CI/CD pipelines, covering harness construction, AFL++/AddressSanitizer/CmpLog instrumentation builds, and persistent-mode f… | ya | installed |
| `implementing-github-advanced-security-for-code-scanning` | Configures GitHub Advanced Security (code scanning with CodeQL, secret scanning, dependency review, and Dependabot alerts) to perform automated static analysis and vulne… | ya | installed |
| `implementing-hardware-security-key-authentication` | Builds a FIDO2/WebAuthn relying party server with the python-fido2 library, covering registration and authentication ceremonies, YubiKey enrollment, resident key (discov… | ya | installed |
| `implementing-infrastructure-as-code-security-scanning` | Implements automated security scanning for Infrastructure as Code using Checkov, tfsec, and KICS to detect misconfigurations in Terraform, CloudFormation, Kubernetes man… | ya | installed |
| `implementing-just-in-time-access-provisioning` | Implements Just-In-Time (JIT) access provisioning to eliminate standing privileges by granting temporary, time-bound access, covering approval workflows, automatic expir… | ya | installed |
| `implementing-jwt-signing-and-verification` | Implements secure JWT (RFC 7519) signing and verification using HMAC-SHA256, RSA-PSS, ES256, and EdDSA, including token expiration, claims validation, and defenses again… | ya | installed |
| `implementing-mobile-application-management` | Implements Mobile Application Management (MAM) policies to protect enterprise data on managed and unmanaged mobile devices through app-level controls including data loss… | ya | installed |
| `implementing-network-traffic-analysis-with-arkime` | Queries Arkime (formerly Moloch) full packet capture via its API to search sessions, download PCAPs, detect C2 beaconing through connection interval/jitter stats, spot D… | ya | installed |
| `implementing-network-traffic-baselining` | Builds network traffic baselines from NetFlow/IPFIX CSV or JSON exports using Python pandas, computing hourly/daily volume distributions, per-host and protocol/port stat… | ya | installed |
| `implementing-ot-network-traffic-analysis-with-nozomi` | Deploy Nozomi Networks Guardian sensors for passive OT network traffic analysis, providing asset visibility, behavioral anomaly detection, protocol-aware monitoring, and… | ya | installed |
| `implementing-pam-for-database-access` | Deploy privileged access management for database systems including Oracle, SQL Server, PostgreSQL, and MySQL, covering session proxy configuration, credential vaulting,… | ya | installed |
| `implementing-rapid7-insightvm-for-scanning` | Deploy and configure Rapid7 InsightVM Security Console and Scan Engines, including scan templates, credentialed scanning, and Insight Agent integration, for authenticate… | ya | installed |
| `implementing-secret-scanning-with-gitleaks` | This skill covers implementing Gitleaks for detecting and preventing hardcoded secrets in git repositories. It addresses configuring pre-commit hooks, CI/CD pipeline int… | ya | installed |
| `implementing-secrets-scanning-in-ci-cd` | Integrate gitleaks and trufflehog into CI/CD pipelines to detect leaked secrets before deployment | ya | installed |
| `implementing-vulnerability-management-with-greenbone` | Deploy and operate Greenbone/OpenVAS vulnerability management using the python-gvm library over the Greenbone Management Protocol (GMP) to connect via Unix socket or TLS… | ya | installed |
| `implementing-vulnerability-remediation-sla` | Design a vulnerability remediation SLA program covering asset tiering, a severity-based SLA matrix, exception processes, escalation chains, ticketing-system integration,… | ya | installed |
| `implementing-vulnerability-sla-breach-alerting` | Build an automated SLA breach alerting system for vulnerability remediation, including a database schema for SLA tracking, breach detection logic, notification dispatch,… | ya | installed |
| `intercepting-mobile-traffic-with-burpsuite` | Intercepts and analyzes HTTP/HTTPS traffic from mobile applications using Burp Suite proxy to identify insecure API communications, authentication flaws, data leakage, a… | ya | installed |
| `investigating-insider-threat-indicators` | Investigates insider threat indicators including data exfiltration attempts, unauthorized access patterns, policy violations, and pre-departure behaviors using SIEM anal… | ya | installed |
| `mapping-attack-paths-with-bloodhound-ce` | Collect Active Directory data with SharpHound and Entra ID data with AzureHound, ingest into BloodHound Community Edition, and analyze on-prem, cloud, and hybrid attack… | ya | installed |
| `migrating-to-post-quantum-cryptography` | Build a cryptographic inventory/CBOM with OpenSSL 3.5+, deploy hybrid post-quantum key exchange (X25519MLKEM768) on TLS/VPN/SSH endpoints, generate ML-KEM/ML-DSA keys an… | ya | installed |
| `parsing-artifacts-with-eric-zimmerman-tools` | Parse Windows forensic artifacts—$MFT/$J (MFTECmd), Prefetch (PECmd), registry hives (RECmd), shellbags, and Amcache—into normalized CSV/JSON with Eric Zimmerman's EZ To… | ya | installed |
| `performing-active-directory-vulnerability-assessment` | Assess Active Directory security posture using PingCastle, BloodHound, and Purple Knight to identify misconfigurations, privilege escalation paths, and attack vectors. | ya | installed |
| `performing-agentless-vulnerability-scanning` | Configure and execute agentless vulnerability scanning using network protocols, cloud snapshot analysis, and API-based discovery to assess systems without installing end… | ya | installed |
| `performing-android-app-static-analysis-with-mobsf` | Performs automated static analysis of Android applications using Mobile Security Framework (MobSF) to identify hardcoded secrets, insecure permissions, vulnerable compon… | ya | installed |
| `performing-api-fuzzing-with-restler` | Uses Microsoft RESTler to perform stateful REST API fuzzing: compiles an OpenAPI/Swagger spec into a RESTler grammar, configures authentication, and runs test/fuzz-lean/… | ya | installed |
| `performing-arp-spoofing-attack-simulation` | Simulates ARP spoofing/cache-poisoning attacks in authorized lab or pentest environments using arpspoof, Ettercap, and Scapy to demonstrate man-in-the-middle risk and va… | ya | installed |
| `performing-authenticated-scan-with-openvas` | Configure and execute authenticated (credentialed) vulnerability scans using OpenVAS/Greenbone Vulnerability Management (GVM) with SSH, SMB, or ESXi credentials to detec… | ya | installed |
| `performing-authenticated-vulnerability-scan` | Plan and run authenticated (credentialed) vulnerability scans with scanners such as Nessus, Qualys, OpenVAS, or Rapid7 InsightVM, using SSH, SMB, WinRM, or SNMPv3 creden… | ya | installed |
| `performing-binary-exploitation-analysis` | Analyze ELF binaries for memory-corruption vulnerabilities and build proof-of-concept exploits using pwntools, checksec, and ROPgadget for buffer overflows and ROP chain… | ya | installed |
| `performing-brand-monitoring-for-impersonation` | Monitor for brand impersonation attacks across domains, social media, mobile apps, and dark web channels to detect phishing campaigns, fake sites, and unauthorized brand… | ya | installed |
| `performing-container-security-scanning-with-trivy` | Runs Trivy across every target type it supports - container images, filesystems, Git repositories, and Kubernetes clusters - for OS and dependency vulnerabilities, IaC m… | ya | installed |
| `performing-content-security-policy-bypass` | Analyze Content-Security-Policy headers and bypass them to achieve cross-site scripting by exploiting unsafe-inline/unsafe-eval, whitelisted JSONP endpoints, base-uri an… | ya | installed |
| `performing-dns-enumeration-and-zone-transfer` | Enumerates DNS records, attempts zone transfers, brute-forces subdomains, and maps DNS infrastructure during authorized reconnaissance to identify attack surface, miscon… | ya | installed |
| `performing-dynamic-analysis-of-android-app` | Performs runtime dynamic analysis of Android applications using Frida, Objection, and Android Debug Bridge to observe application behavior during execution, intercept fu… | ya | installed |
| `performing-external-network-penetration-test` | Conduct a comprehensive external network penetration test to identify vulnerabilities in internet-facing infrastructure using PTES methodology, reconnaissance, scanning,… | ya | installed |
| `performing-fuzzing-with-aflplusplus` | Performs coverage-guided fuzzing of compiled binaries with AFL++, instrumenting targets via afl-cc/afl-clang-fast, minimizing corpora with afl-cmin and afl-tmin, running… | ya | installed |
| `performing-hardware-security-module-integration` | Integrates Hardware Security Modules (HSMs) via the PKCS#11 interface using python-pkcs11, performing key generation, signing, encryption, verification, and token/slot q… | ya | installed |
| `performing-hash-cracking-with-hashcat` | Cracks password hashes with Hashcat, covering hash-type identification, dictionary/brute-force/rule-based attack modes, custom rule creation, GPU benchmarking, and passw… | ya | installed |
| `performing-http-parameter-pollution-attack` | Executes HTTP Parameter Pollution attacks that inject duplicate request parameters to bypass input validation, WAF rules, and other security controls when front-end and… | ya | installed |
| `performing-indicator-lifecycle-management` | Tracks IOCs through discovery, enrichment/validation (VirusTotal, Shodan, passive DNS), deployment to SIEM/IDS watchlists, hit-rate and false-positive monitoring, confid… | ya | installed |
| `performing-insider-threat-investigation` | Investigates insider threat incidents involving employees, contractors, or trusted partners who misuse authorized access to steal data, sabotage systems, or violate secu… | ya | installed |
| `performing-ios-app-security-assessment` | Performs comprehensive iOS application security assessments using Frida for dynamic instrumentation, Objection for runtime exploration, SSL pinning bypass for traffic in… | ya | installed |
| `performing-ip-reputation-analysis-with-shodan` | Analyze IP address reputation using the Shodan API to identify open ports, running services, known vulnerabilities, and hosting context for threat intelligence enrichmen… | ya | installed |
| `performing-jwt-none-algorithm-attack` | Execute and test the JWT none algorithm attack, crafting tokens with the alg header set to none using PyJWT and an intercepting proxy (Burp Suite/mitmproxy) to bypass si… | ya | installed |
| `performing-lateral-movement-detection` | Detects lateral movement techniques including Pass-the-Hash, PsExec, WMI execution, RDP pivoting, and SMB-based spreading by correlating Windows Security/Sysmon event lo… | ya | installed |
| `performing-mobile-app-certificate-pinning-bypass` | Bypasses SSL/TLS certificate pinning implementations in Android and iOS applications to enable traffic interception during authorized security assessments. Covers OkHttp… | ya | installed |
| `performing-network-packet-capture-analysis` | Perform forensic analysis of network packet captures (PCAP/PCAPNG) using Wireshark, tshark, and tcpdump to reconstruct network communications, extract transferred files,… | ya | installed |
| `performing-network-traffic-analysis-with-tshark` | Automate network traffic analysis using tshark (Wireshark CLI) and pyshark to compute protocol distribution statistics, detect suspicious flows such as port scans and be… | ya | installed |
| `performing-network-traffic-analysis-with-zeek` | Deploy Zeek (formerly Bro) as a passive network security monitor to generate structured logs of protocol metadata (HTTP, DNS, TLS, SSH, SMTP, FTP, and more), write custo… | ya | installed |
| `performing-ot-vulnerability-assessment-with-claroty` | Perform OT vulnerability assessments using the Claroty xDome platform for asset discovery, risk scoring, and vulnerability correlation, combining passive traffic-based i… | ya | installed |
| `performing-ot-vulnerability-scanning-safely` | Perform vulnerability scanning in OT/ICS environments safely using passive monitoring, native protocol queries, and carefully controlled active scanning with Tenable OT… | ya | installed |
| `performing-packet-injection-attack` | Crafts and injects custom network packets using Scapy, hping3, and Nemesis during authorized security assessments to test firewall rules, IDS detection, protocol handlin… | ya | installed |
| `performing-post-quantum-cryptography-migration` | Assesses organizational readiness for post-quantum cryptography migration per NIST FIPS 203/204/205 standards. Performs cryptographic inventory scanning to identify quan… | ya | installed |
| `performing-privileged-account-access-review` | Conducts systematic reviews of privileged accounts to validate access rights, identify excessive or stale permissions, and enforce least privilege across PAM infrastruct… | ya | installed |
| `performing-privileged-account-discovery` | Discovers and inventories privileged accounts across enterprise infrastructure, including domain admins, local admins, service accounts, database admins, cloud IAM roles… | ya | installed |
| `performing-service-account-audit` | Audit service accounts across enterprise infrastructure to identify orphaned, over-privileged, and non-compliant accounts. This skill covers discovery of service account… | ya | installed |
| `performing-service-account-credential-rotation` | Automates credential rotation for service accounts across Active Directory, cloud platforms, and application databases to eliminate stale secrets and reduce compromise r… | ya | installed |
| `performing-sqlite-database-forensics` | Performs forensic analysis of SQLite databases by examining B-tree page structures, recovering deleted records from freelist pages and Write-Ahead Log (WAL) files, decod… | ya | installed |
| `performing-ssrf-vulnerability-exploitation` | Tests web application URL parameters for Server-Side Request Forgery by probing cloud metadata endpoints (AWS/GCP/Azure at 169.254.169.254), internal network services, a… | ya | installed |
| `performing-subdomain-enumeration-with-subfinder` | Enumerate subdomains of target domains using ProjectDiscovery's Subfinder passive reconnaissance tool to map the attack surface during security assessments. | ya | installed |
| `performing-thick-client-application-penetration-test` | Conduct a thick client application penetration test to identify insecure local storage, hardcoded credentials, DLL hijacking, memory manipulation, and insecure API commu… | ya | installed |
| `performing-vulnerability-scanning-with-nessus` | Performs authenticated and unauthenticated vulnerability scanning using Tenable Nessus to identify known vulnerabilities, misconfigurations, default credentials, and mis… | ya | installed |
| `performing-web-application-scanning-with-nikto` | Runs Nikto, an open-source web server and web application scanner, to test over 7,000 potentially dangerous files/programs, check for outdated versions across 1,250+ ser… | ya | installed |
| `performing-web-application-vulnerability-triage` | Triages web application vulnerability findings from DAST/SAST scanners such as Burp Suite and ZAP, using the OWASP Risk Rating Methodology to confirm true positives, dis… | ya | installed |
| `performing-windows-artifact-analysis-with-eric-zimmerman-tools` | Performs comprehensive Windows forensic artifact analysis using Eric Zimmerman's open-source EZ Tools suite (KAPE, MFTECmd, PECmd, LECmd, JLECmd, Timeline Explorer) to p… | ya | installed |
| `performing-wireless-network-penetration-test` | Execute a wireless network penetration test to assess WiFi security by capturing handshakes, cracking WPA2/WPA3 keys, detecting rogue access points, and testing wireless… | ya | installed |
| `reverse-engineering-ios-app-with-frida` | Reverse engineers iOS applications using Frida dynamic instrumentation to understand internal logic, extract encryption keys, bypass security controls, and discover hidd… | ya | installed |
| `scanning-container-images-with-grype` | Scans container images, filesystems, and SBOMs for known CVEs with Anchore Grype, matching Syft-generated SBOM packages against NVD, GitHub Advisories, and OS-specific f… | ya | installed |
| `scanning-containers-with-trivy-in-cicd` | Integrates Aqua Security's Trivy scanner into CI/CD pipelines to detect OS package and application dependency CVEs, Dockerfile misconfigurations, and issues in filesyste… | ya | installed |
| `scanning-docker-images-with-trivy` | Scans a Docker image with Trivy for vulnerabilities in OS packages and language dependencies, misconfiguration, exposed secrets, and licence violations, emitting SARIF,… | ya | installed |
| `scanning-iac-and-images-with-trivy` | Scans container images, Infrastructure-as-Code (Terraform, CloudFormation, Kubernetes manifests, Dockerfile, Helm), filesystems, git repos, and SBOMs with Trivy's vuln,… | ya | installed |
| `scanning-infrastructure-with-nessus` | Tenable Nessus is the industry-leading vulnerability scanner used to identify security weaknesses across network infrastructure including servers, workstations, network… | ya | installed |
| `scanning-kubernetes-manifests-with-kubesec` | Scores Kubernetes resource manifests with Kubesec to flag misconfiguration and privilege-escalation risk before deployment, mapping each finding back to the securityCont… | ya | installed |
| `scanning-network-with-nmap-advanced` | Performs advanced network recon using Nmap's Scripting Engine (NSE), timing controls, firewall/IDS evasion, and structured output parsing to discover hosts, enumerate se… | ya | installed |
| `testing-api-authentication-weaknesses` | Tests API authentication mechanisms for weaknesses including broken token validation, missing authentication on endpoints, weak password policies, credential stuffing su… | ya | installed |
| `testing-api-for-mass-assignment-vulnerability` | Tests APIs for mass assignment (auto-binding), OWASP API3:2023, by identifying writable endpoints, adding undocumented fields to request bodies (role, isAdmin, price, ba… | ya | installed |
| `testing-for-email-header-injection` | Tests web application email functionality (contact forms, password reset, newsletter subscriptions) for CRLF/SMTP header injection using Burp Suite and OWASP ZAP, checki… | ya | installed |
| `testing-for-json-web-token-vulnerabilities` | Tests JWT implementations for algorithm confusion, "none" algorithm bypass, kid/jku parameter injection, and weak secret exploitation using jwt_tool and Burp Suite's JWT… | ya | installed |
| `testing-jwt-token-security` | Assessing JSON Web Token implementations for cryptographic weaknesses, algorithm confusion attacks, and authorization bypass vulnerabilities during security engagements. | ya | installed |
| `testing-mobile-api-authentication` | Tests authentication and authorization mechanisms in mobile application APIs to identify broken authentication, insecure token management, session fixation, privilege es… | ya | installed |
| `testing-ransomware-recovery-procedures` | Tests and validates ransomware recovery procedures - backup restore operations (e.g. with Restic), RTO/RPO target verification, recovery sequencing, and clean-restore va… | ya | installed |
| `validating-backup-integrity-for-recovery` | Validates backup integrity through cryptographic hash verification, automated restore testing, corruption detection, and recoverability checks to confirm backups are rel… | ya | installed |

## 11. Frontend & Web Engineering — 20 skill

**Kategori:** frontend  ·  **Terpasang:** 7 / 20  ·  **Documented-only:** 13  

**Ringkasan:** Building and reviewing user interfaces: Next.js, Tailwind, responsive layout, accessibility, and design systems.

**Tema:** `nextjs-app-router`, `css-design-systems`, `accessibility-a11y`, `responsive-layout`, `design-review`, `react-performance`

| Skill | Kegunaan | Terpasang | Status |
|---|---|---|---|
| `accessibility-wcag` | Web accessibility patterns for WCAG 2.2 compliance including ARIA, keyboard navigation, screen readers, and testing | ya | installed |
| `architecture-diagram` | Dark-themed SVG architecture/cloud/infra diagrams as HTML. | tidak | documented-only |
| `baoyu-infographic` | Infographics: 21 layouts x 21 styles (信息图, 可视化). | tidak | documented-only |
| `claude-design` | Design one-off HTML artifacts (landing, deck, prototype). | tidak | documented-only |
| `design-md` | Author/validate/export Google's DESIGN.md token spec files. | tidak | documented-only |
| `frontend-design` | Guidance for distinctive, intentional visual design when building new UI or reshaping an existing one. Helps with aesthetic direction, typography, and making choices tha… | ya | installed |
| `frontend-feature-suggest` | Suggest frontend features from codebase gaps. | tidak | documented-only |
| `mobile-tunnel-preview` | Use when previewing localhost on a phone via tunnel. | tidak | documented-only |
| `nextjs` | Next.js 16 App Router performance optimization guidelines (formerly nextjs-16-app-router). This skill should be used when writing Next.js 16 code, configuring caching, i… | ya | installed |
| `nextjs-app-audit` | Audit and patch Next.js App Router codebases. | tidak | documented-only |
| `nextjs-disk-job-queue` | Background download jobs in Next.js without Redis. | tidak | documented-only |
| `nextjs-secure-delivery` | Use when patching a Next.js app. | tidak | documented-only |
| `nextjs-viewport-a11y-check` | Audit Next.js viewport layout and a11y, DOM-first. | tidak | documented-only |
| `popular-web-designs` | 54 real design systems (Stripe, Linear, Vercel) as HTML/CSS. | tidak | documented-only |
| `responsive-design` | Implement modern responsive layouts using container queries, fluid typography, CSS Grid, and mobile-first breakpoint strategies. Use when building adaptive interfaces, i… | ya | installed |
| `semantic-html` | Write well-considered semantic HTML that serves all users. Use when creating components, page structures, or reviewing markup. Emphasizes native HTML elements over ARIA.… | ya | installed |
| `tailwind-v4-combined` | Tailwind v4: @theme, responsive, dark mode, components. | tidak | documented-only |
| `tailwind-v4-grader` | Grade a Tailwind v4 codebase for best practices compliance. Trigger when the user asks to audit, review, grade, score, or evaluate their Tailwind CSS v4 project — even i… | tidak | documented-only |
| `vercel-react-best-practices` | React and Next.js performance optimization guidelines from Vercel Engineering. This skill should be used when writing, reviewing, or refactoring React/Next.js code to en… | ya | installed |
| `web-design-guidelines` | Review UI code for Web Interface Guidelines compliance. Use when asked to "review my UI", "check accessibility", "audit design", "review UX", or "check my site against b… | ya | installed |

## 12. Software Development & Tooling — 29 skill

**Kategori:** software-development  ·  **Terpasang:** 3 / 29  ·  **Documented-only:** 26  

**Ringkasan:** Day-to-day engineering practice: refactoring, debugging, testing, code review, language-specific tooling, and bot/service development.

**Tema:** `code-refactoring`, `testing-and-qa`, `debugging`, `whatsapp-bot-development`, `github-workflow`, `project-tooling`

| Skill | Kegunaan | Terpasang | Status |
|---|---|---|---|
| `clean-code` | Refactor any codebase using Fowler's catalog (refactoring.guru). Use when asked to refactor, clean up, simplify, improve readability/maintainability, or reduce code smel… | tidak | documented-only |
| `code-refactoring` | Practical, language-agnostic guidance for behavior-preserving refactoring in existing codebases. Use when identifying code smells, planning incremental cleanup, selectin… | tidak | documented-only |
| `dogfood` | Exploratory QA of web apps: find bugs, evidence, reports. | tidak | documented-only |
| `github` | GitHub via gh CLI: PRs, issues, reviews, repos, auth. | tidak | documented-only |
| `hermaguard` | Adversarial bug-hunting code review with deterministic pre-scan + 3 parallel specialist subagents and a consolidator. Finds what's broken, not what looks nice. Read-only… | tidak | documented-only |
| `hermes-agent-skill-authoring` | Author in-repo SKILL.md files: frontmatter and structure. | tidak | documented-only |
| `inspecting-hermes-desktop-dom` | Read the live Hermes desktop DOM/CSS over CDP. | tidak | documented-only |
| `node-inspect-debugger` | Debug Node.js via --inspect + Chrome DevTools Protocol CLI. | tidak | documented-only |
| `python-debugpy` | Debug Python: pdb REPL + debugpy remote (DAP). | tidak | documented-only |
| `rebranding-forked-project` | Use when renaming or republishing a forked OSS project. | tidak | documented-only |
| `refactoring-code` | Coordinates consent-gated, evidence-isolated, behavior-preserving simplification refactors. Use when simplifying, splitting, renaming, moving, deduplicating, or clarifyi… | ya | installed |
| `refactoring-specialist` | Code refactoring expert for improving code structure, readability, and maintainability. Use when user asks to refactor, clean up, or improve code quality. | ya | installed |
| `requesting-code-review` | Pre-commit review: security scan, quality gates, auto-fix. | tidak | documented-only |
| `secure-download-service` | Use when building download features with yt-dlp disk jobs. | tidak | documented-only |
| `securing-github-actions-workflows` | Hardens GitHub Actions workflows against supply chain attacks, credential theft, and privilege escalation: pinning actions to SHA digests, minimizing GITHUB_TOKEN permis… | ya | installed |
| `simplify-code` | Parallel 4-agent cleanup of recent code changes. | tidak | documented-only |
| `spike` | Throwaway experiments to validate an idea before build. | tidak | documented-only |
| `sqlite-prisma-ops` | Operasi aman untuk Prisma + SQLite (better-sqlite3): migrasi schema, backup/restore, error database terkunci, WAL, dan cek .env. Pakai saat mengubah schema.prisma, menja… | tidak | documented-only |
| `systematic-debugging` | 4-phase root cause debugging: understand bugs before fixing. | tidak | documented-only |
| `test-driven-development` | TDD: enforce RED-GREEN-REFACTOR, tests before code. | tidak | documented-only |
| `wa-whatsmeow-session-doctor` | Diagnosa bot WhatsApp berbasis whatsmeow (Go): QR atau pairing gagal, reconnect loop, StreamReplaced, LoggedOut, client outdated, store SQLite terkunci atau rusak, pesan… | tidak | documented-only |
| `whatsapp-group-admin` | Use when adding WhatsApp kick/promote/demote commands. | tidak | documented-only |
| `whatsapp-interactive-buttons` | Use when sending WhatsApp button or list messages. | tidak | documented-only |
| `whatsapp-interactive-debugging` | Use when debugging WhatsApp interactive messages. | tidak | documented-only |
| `whatsapp-interactive-delivery` | Use when sending WhatsApp bot buttons, lists, or cards. | tidak | documented-only |
| `whatsapp-render-failure-debug` | Use when WhatsApp sends ack but device renders wrong. | tidak | documented-only |
| `whatsapp-sticker-media` | Use when making or fixing WhatsApp stickers. | tidak | documented-only |
| `whatsapp-ts-bot` | Build or debug a TypeScript WhatsApp bot. | tidak | documented-only |
| `yuerouter-provider-integration` | Add or modify LLM providers in the YUEROUTER proxy project. | tidak | documented-only |

## 13. Autonomous Agents & Hermes Platform — 6 skill

**Kategori:** agents  ·  **Terpasang:** 0 / 6  ·  **Documented-only:** 6  

**Ringkasan:** Orchestrating AI coding agents and operating the Hermes platform itself.

**Tema:** `coding-agents`, `agent-platform`, `desktop-automation`, `bot-fleet-operations`

| Skill | Kegunaan | Terpasang | Status |
|---|---|---|---|
| `claude-code` | Delegate coding to Claude Code CLI (features, PRs). | tidak | documented-only |
| `codex` | Delegate coding to OpenAI Codex CLI (features, PRs). | tidak | documented-only |
| `computer-use` | Drive the desktop background-first; escalate on signal. | tidak | documented-only |
| `hermes-agent` | Use, configure, theme, extend, and orchestrate Hermes Agent. | tidak | documented-only |
| `opencode` | Delegate coding to OpenCode CLI (features, PR review). | tidak | documented-only |
| `running-multiple-hermes-bots` | Use when running several Hermes bots as separate processes. | tidak | documented-only |

## 14. Productivity & Documents — 19 skill

**Kategori:** productivity  ·  **Terpasang:** 3 / 19  ·  **Documented-only:** 16  

**Ringkasan:** Creating and working with documents, notes, and business apps.

**Tema:** `document-creation`, `spreadsheet-and-data`, `note-taking`, `business-saas-automation`, `workspace-admin-security`, `meeting-and-review-workflow`

| Skill | Kegunaan | Terpasang | Status |
|---|---|---|---|
| `airtable` | Airtable REST API via curl. Records CRUD, filters, upserts. | tidak | documented-only |
| `box` | Box manages cloud files, sharing, search, and metadata. | tidak | documented-only |
| `document-to-action-items` | Extract cited obligations, deadlines, tasks from documents. | tidak | documented-only |
| `docx` | Create, read, edit, template, and review Word .docx files. | tidak | documented-only |
| `email-inbox-triage` | Triage an inbox: prioritize threads, draft replies safely. | tidak | documented-only |
| `google-workspace` | Gmail, Calendar, Drive, Docs, Sheets via gws CLI or Python. | tidak | documented-only |
| `implementing-google-workspace-admin-security` | Hardens a Google Workspace tenant via Admin Console configuration: phishing-resistant MFA enforcement, DLP policies, email authentication (SPF/DKIM/DMARC), OAuth third-p… | ya | installed |
| `implementing-google-workspace-phishing-protection` | Configures Google Workspace advanced phishing and malware protection settings in the Admin Console — pre-delivery message scanning, attachment protection, spoofing/imper… | ya | installed |
| `implementing-google-workspace-sso-configuration` | Configures SAML 2.0 single sign-on for Google Workspace against a third-party identity provider (Okta, Azure AD/Entra ID, ADFS), with Workspace as the Service Provider,… | ya | installed |
| `maps` | Geocode, POIs, routes, timezones via OpenStreetMap/OSRM. | tidak | documented-only |
| `meeting-action-items` | Turn meeting notes into cited decisions, owners, tickets. | tidak | documented-only |
| `notion` | Notion API + ntn CLI: pages, databases, markdown, Workers. | tidak | documented-only |
| `obsidian` | Read, search, create, and edit notes in the Obsidian vault. | tidak | documented-only |
| `pdf` | PDF files: create, read, merge, fill, OCR, edit text. | tidak | documented-only |
| `powerpoint` | Create, read, edit .pptx decks with python-pptx. | tidak | documented-only |
| `product-price-monitor` | Watch product, flight, or listing prices; alert on target. | tidak | documented-only |
| `teams-meeting-pipeline` | Teams meeting summaries, job replay, Graph subscriptions. | tidak | documented-only |
| `weekly-review-planning` | Weekly reset: commitments, stalled work, next-week plan. | tidak | documented-only |
| `xlsx` | Create, read, edit Excel .xlsx workbooks and CSVs. | tidak | documented-only |

## 15. Creative & Media — 8 skill

**Kategori:** creative  ·  **Terpasang:** 0 / 8  ·  **Documented-only:** 8  

**Ringkasan:** Generating visual, audio, and written creative work.

**Tema:** `generative-art`, `video-animation`, `audio-and-music`, `writing-style`, `content-repurposing`, `asset-search`

| Skill | Kegunaan | Terpasang | Status |
|---|---|---|---|
| `ascii-video` | ASCII video: convert video/audio to colored ASCII MP4/GIF. | tidak | documented-only |
| `gif-search` | Search/download GIFs from Tenor via curl + jq. | tidak | documented-only |
| `humanizer` | Humanize text: strip AI-isms and add real voice. | tidak | documented-only |
| `manim-video` | Manim CE animations: 3Blue1Brown math/algo videos. | tidak | documented-only |
| `p5js` | p5.js sketches: gen art, shaders, interactive, 3D. | tidak | documented-only |
| `songsee` | Audio spectrograms/features (mel, chroma, MFCC) via CLI. | tidak | documented-only |
| `songwriting-and-ai-music` | Songwriting craft and Suno AI music prompts. | tidak | documented-only |
| `youtube-content` | YouTube transcripts to summaries, threads, blogs. | tidak | documented-only |

## 16. Research — 3 skill

**Kategori:** research  ·  **Terpasang:** 0 / 3  ·  **Documented-only:** 3  

**Ringkasan:** Academic and market research, citation grounding, and knowledge bases.

**Tema:** `academic-search`, `competitive-intelligence`, `citation-grounding`

| Skill | Kegunaan | Terpasang | Status |
|---|---|---|---|
| `arxiv` | Search arXiv papers by keyword, author, category, or ID. | tidak | documented-only |
| `competitor-news-monitor` | Watch named companies for material news; cited digests. | tidak | documented-only |
| `grounded-citations` | Ground answers and documents in cited, verifiable sources. | tidak | documented-only |

## 17. Social Media — 2 skill

**Kategori:** social  ·  **Terpasang:** 0 / 2  ·  **Documented-only:** 2  

**Ringkasan:** Posting, searching, and monitoring social platforms.

**Tema:** `x-twitter-cli`, `social-media-scraping`, `social-posting`

| Skill | Kegunaan | Terpasang | Status |
|---|---|---|---|
| `social-media-scraping` | Scrape media from social sites via their own CDN. | tidak | documented-only |
| `xurl` | X/Twitter via xurl CLI: raw post search, posting, DM, media. | tidak | documented-only |

## 18. Email — 1 skill

**Kategori:** email  ·  **Terpasang:** 0 / 1  ·  **Documented-only:** 1  

**Ringkasan:** Sending, triaging, and managing email.

**Tema:** `email-cli`, `imap-smtp`, `email-operations`

| Skill | Kegunaan | Terpasang | Status |
|---|---|---|---|
| `himalaya` | Himalaya CLI: IMAP/SMTP email from terminal. | tidak | documented-only |

## 19. Blocked Page Recovery — 1 skill

**Kategori:** blocked-page  ·  **Terpasang:** 0 / 1  ·  **Documented-only:** 1  

**Ringkasan:** Recovering content from pages that block direct fetching.

**Tema:** `web-fetch-resilience`, `anti-bot-workaround`, `content-retrieval`

| Skill | Kegunaan | Terpasang | Status |
|---|---|---|---|
| `blocked-page-recovery` | Use when a fetch fails: 403/429, paywall, WAF, bot wall. | tidak | documented-only |

---

## Catatan

- **Elipsis `…` = kondisi sumber.** 810 deskripsi terpotong upstream pada
  160–170 karakter. Tidak ada versi penuhnya; jangan karang kelengkapan.
- **Satu baris memuat karakter `|`** (`performing-alert-triage-with-elastic-siem`,
  deskripsi sumber berisi `ES|QL`). Di file Markdown ini karakter itu ditulis
  sebagai **`ES\|QL`** — backslash adalah escape Markdown, **bukan** bagian dari
  nilai aslinya, dan hanya dipakai supaya baris tabel 4 kolom tak terpecah jadi
  5 sel saat dirender. Nilai aslinya **tanpa** backslash tetap dipertahankan
  **persis** seperti sumber di `references/catalog.index.json` (dan di
  snapshot `docs/skill/` yang kini diarsipkan). Aturan praktis: **pembaca
  Markdown melihat `ES\|QL`; pembaca JSON melihat `ES|QL`.** Yang otoritatif
  adalah `references/catalog.index.json`.

  Nilai aslinya (verbatim, tanpa escape) juga ditulis ulang di bawah agar
  tidak hilang dari file ini:

  > `Perform systematic alert triage in Elastic Security SIEM—classifying, prioritizing, and investigating alerts using Kibana, ES|QL queries, and ECS-normalized data—to driv…`

  Kalau kamu menyalin nilai ini ke tabel Markdown lain, tulis `ES\|QL`
  supaya tabelmu tak terpecah.
- **Machine-readable:** `references/catalog.index.json` (schema_version 1).
  Gunakan untuk `jq`/filter, bukan meng-grep file ini.

```bash
# semua skill terpasang di satu kategori
jq -r '.skills[] | select(.category=="appsec" and .installed) | .id' \
  references/catalog.index.json

# cari skill berdasarkan tema
jq -r '.skills[] | select(.themes | index("supply-chain")) | .id' \
  references/catalog.index.json

# hanya skill yang tidak terpasang
jq -r '.documented_only[]' references/catalog.index.json
```

---

## Cara menambah skill

Katalog boleh bertambah. Cara tercepat: **suruh AI** — "tambahkan skill X ke
katalog". Bila kamu yang mengerjakan, ikuti urutan berikut supaya L2 dan L3
tidak pernah berbeda.

1. **Tentukan entri.** `id` kebab-case ASCII lowercase, unik; `category` salah
   satu dari 19 kategori di atas; `themes` dari daftar tema kategori itu;
   `description` satu kalimat; `source` = repo asal; `installed` =
   ada di `skills-lock.json`?; `callable` = benar-benar terpasang di disk?
   Default `callable: false` — jangan menandai `true` tanpa bukti `ls`.
2. **Tulis ke L2** (`references/catalog.index.json`) — entri baru di
   `.skills` (urutan = urutan tampil di L3), `description` **verbatim** tanpa
   elipsis buatan, plus `source` di blok `source`.
3. **Tulis ke L3** (`references/catalog.md`) — baris tabel 4 kolom di dalam
   blok kategori yang tepat:

   ```markdown
   | `id-skill` | Deskripsi satu kalimat. | ya | installed |
   ```

   Kolom `Terpasang` = `ya`/`tidak`; kolom `Status` = `installed`/
   `documented-only`. Kalau deskripsi memuat `|` harfiah, tulis `\|`.
4. **Sinkronkan `skills-lock.json`** bila sumbernya benar-benar ter-install
   (`npx skills add <repo>`). Bila tidak, masukkan id-nya ke
   `.documented_only` — jangan pretend installed.
5. **Naikkan counter** di blok `source`: `total_documented`,
   `total_installed`, `total_documented_only`, dan `count` /
   `installed_count` pada kategori yang berubah.
6. **Verifikasi** (semua harus benar):

   ```bash
   jq '.skills | length' references/catalog.index.json   # naik 1
   jq '.documented_only | length' references/catalog.index.json
   grep -cE '^\| `[^`]+` \|' references/catalog.md       # naik 1
   ```

   Lalu jalankan probe QA: `node qa/qa-orchestra-verify.mjs` — semua gate
   harus hijau.

**Aturan:** deskripsi **lama** yang sudah terpotong elipsis `…` **jangan**
diluruskan, diterjemahkan, atau dilengkapi (lihat § Catatan). Deskripsi
**baru** boleh lengkap. `callable` hanya `true` bila skill benar-benar ada di
disk.
