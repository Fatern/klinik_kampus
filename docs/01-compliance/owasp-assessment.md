# R4 · Penilaian OWASP Mobile Top 10 (2024)
# Aplikasi: M2S Klinik Kampus  Topik: Klinik

| # | Risiko | Status M01 | Kontrol / Rencana |
|---|--------|------------|-------------------|
| M1 | Kredensial tidak aman | Mitigasi | SEC-04: tanpa secret di repo, .gitignore; kredensial pengguna di Firebase Auth (SEC-08) |
| M2 | Supply chain | Mitigasi sebagian | pubspec.lock ter-commit; `flutter pub outdated` dicatat di ADR-002 |
| M3 | Autentikasi / otorisasi | Direncanakan | PIN lokal + batas percobaan (SEC-02); Security Rules per role di M05 (SEC-07) |
| M4 | Validasi input/output | Direncanakan | Validator form profil dan booking di M04; validasi data di rules |
| M5 | Komunikasi tidak aman | Konfigurasi | cleartext dilarang (SEC-05); HTTPS via Firebase SDK di M05 |
| M6 | Kontrol privasi | Perlu tindakan | PRV-01..PRV-07; layar Privasi & Data di M04 |
| M7 | Perlindungan binary | Direncanakan | build release dengan `--obfuscate --split-debug-info` |
| M8 | Konfigurasi salah | Mitigasi | allowBackup=false, tanpa print (lint), debug off di release (SEC-03) |
| M9 | Penyimpanan tidak aman | Mitigasi | secure storage untuk PIN (SEC-01); tidak menyimpan data medis di SharedPreferences |
| M10 | Kriptografi lemah | Mitigasi | PBKDF2 120k iterasi + salt acak; tanpa MD5/SHA1 (SEC-02) |

## Risiko Khas Topik Ini (tambahan)
- M6/M9: rekam medis dan alergi = data kesehatan; akses Admin dibatasi ringkasan (PRV-07); cache offline Firestore dinonaktifkan atau dipertimbangkan untuk koleksi medis.
- M3: kebocoran rules (mis. `allow read: if request.auth != null`) membuka semua data; wajib default-deny dan uji emulator (SEC-07).
- M8: teks notifikasi obat harus generik (tanpa nama penyakit) karena tampil di layar kunci.
