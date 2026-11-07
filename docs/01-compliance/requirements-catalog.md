# Katalog Requirement Kepatuhan — M2S Klinik Kampus

## Privasi & UX (PRV-xx, UX-xx)
| ID | Requirement | Sumber | Milestone |
|----|-------------|--------|-----------|
| PRV-01 | Hanya data di R1 yang dikumpulkan; GPS, kontak, kamera, ID perangkat TIDAK dikumpulkan | R1 | M04 |
| PRV-02 | Tidak ada SDK pihak ketiga pengumpul data selain Firebase yang diperlukan | R1 | M01–M05 |
| PRV-03 | Hapus akun/profil ≤ 2 ketukan; masa simpan rekam medis dijelaskan | UU PDP Ps. 8 | M04 |
| PRV-04 | Ekspor profil dan unduh surat ke format portabel (PDF/JSON) | UU PDP Ps. 7 | M04 |
| PRV-05 | Kebijakan privasi bisa dibuka dari aplikasi | UU PDP Ps. 5 | M03–M04 |
| PRV-06 | Pasien dapat mengoreksi profil | UU PDP Ps. 6 | M04 |
| PRV-07 | Admin non-medis hanya membaca ringkasan administratif; akses rekam medis dibatasi dan dicatat | Permenkes 24/2022; R2 | M05 |
| UX-01 | Lulus audit dark pattern R5 tiap rilis | R5 | M03–M05 |
| UX-02 | Fitur opsional (pengingat obat) default MATI; persetujuan bisa ditarik | UU PDP Ps. 9 | M05 |
| UX-03 | Teks ≥ 14sp, kontras AA, label aksesibilitas | R5 | M03–M05 |
| UX-04 | Teks notifikasi obat generik (tanpa nama penyakit/obat sensitif) | R2 | M04–M05 |
| UX-05 | Booking dinyatakan berhasil hanya setelah transaksi sukses; kegagalan/offline ditampilkan jelas | R2 | M04–M05 |

## Keamanan (SEC-xx)
| ID | Requirement | Sumber | Milestone |
|----|-------------|--------|-----------|
| SEC-01 | Data sensitif lokal di secure storage, bukan SharedPreferences | OWASP M9 | M01 |
| SEC-02 | PIN di-hash dengan KDF (PBKDF2) + salt acak; batas percobaan | OWASP M1/M3/M10 | M01 |
| SEC-03 | allowBackup=false; tanpa print di production (lint avoid_print) | OWASP M8 | M01 |
| SEC-04 | Tanpa secret di repo; .gitignore dan pemindaian git grep | OWASP M1 | M01 |
| SEC-05 | Semua jaringan HTTPS; cleartext dilarang | OWASP M5 | M01·M05 |
| SEC-06 | Izin minimal: tanpa INTERNET pada build release sampai M05 | OWASP M5/M6 | M01·M05 |
| SEC-07 | Firestore Security Rules default-deny, berbasis role dan kepemilikan, diuji di emulator | OWASP M3 | M05 |
| SEC-08 | Password hanya di Firebase Auth; tidak ada password/hash di Firestore | OWASP M1 | M05 |
