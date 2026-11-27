# Software Requirements Specification (Ringkas) — M2S Klinik Kampus

**Versi:** 1.1
**Tanggal:** 2026-11-27
**Kelompok:** M2S — Jovan Prasetyo Wibisono, Rachmad Eka Putra Ramadhan, Faturahman Dwi Saputra, Muhammad Annaafi Putra Sya'bani

---

## 1. Tujuan Dokumen

Dokumen ini mendefinisikan kebutuhan fungsional (FR) dan kebutuhan non-fungsional (NFR) aplikasi **M2S Klinik Kampus (Mugi-Mugi Sehat)** yang diselaraskan dengan Project Charter (M01), Register Kepatuhan M01, dan Laporan Analisis Kelayakan (Tugas 1 P02) sebagai dasar perancangan UI (M03), implementasi frontend Flutter (M04), dan integrasi Cloud Firestore (M05).

---

## 2. Kebutuhan Fungsional

| ID | Deskripsi | Sumber | Prioritas |
|---|---|---|---|
| FR-01 | Sistem menerima pemilihan dokter, tanggal, dan slot waktu dari Pasien (dengan syarat profil pasien telah lengkap), mengklaim satu slot untuk satu pasien secara atomik (mencegah double booking), mengelola alur status booking (`Menunggu` → `Diperiksa` → `Selesai` atau `Batal`), serta menerima pengajuan pembatalan oleh Pasien | US-01, ADD-02, ADD-03 | Must |
| FR-02 | Sistem menerima input keluhan utama, diagnosis, dan tindakan pemeriksaan dari Dokter, menyimpannya sebagai rekam medis, dan menampilkannya hanya kepada pasien pemilik serta dokter berwenang (Admin non-medis dibatasi pada ringkasan administratif dengan audit akses) | US-02, PRV-07 | Must |
| FR-03 | Sistem menyimpan surat rekomendasi/rujukan digital yang diterbitkan Dokter (berisi fasilitas kesehatan tujuan, keputusan dokter, nomor surat, dan tanggal terbit) serta memungkinkan Pasien melihat, mengunduh, dan mencetak dokumen | US-03 | Must |
| FR-04 | Sistem menerima input resep obat (nama obat, dosis, dan anjuran pakai) dari Dokter serta menyediakan penjadwalan pengingat minum obat lokal pada perangkat Pasien (default nonaktif, teks notifikasi generik tanpa nama penyakit/obat sensitif, pulih setelah restart, dan dapat dinonaktifkan kapan saja) | US-04, UX-02, UX-04 | Must |
| FR-05 | Sistem menyimpan surat keterangan sakit yang diterbitkan Dokter (identitas pasien, lama istirahat, tanggal berlaku, nomor surat, dan keterangan) serta menghasilkan berkas PDF yang dapat diunduh, dicetak, atau dibagikan oleh Pasien | US-05 | Must |
| FR-06 | Sistem menyediakan pengelolaan jadwal praktik dokter, pemantauan booking harian, pembaruan status antrean, dan persetujuan/penolakan permohonan pembatalan bagi Admin non-medis dengan tampilan terbatas pada ringkasan administratif | US-06, ADD-04 | Must |
| FR-07 | Sistem menyediakan registrasi mandiri dan login email–kata sandi untuk Pasien serta akses berbasis role (Pasien, Dokter, Admin non-medis; akun Dokter/Admin dibuat melalui Firebase Console), dan mewajibkan kelengkapan profil pasien (nama, NIM/NIP, fakultas/unit, riwayat alergi, golongan darah) sebelum booking | Charter Must, ADD-01, ADD-02 | Must |
| FR-08 | Sistem menghapus seluruh data lokal pengguna (profil, riwayat dummy, jadwal pengingat obat, dan kunci PIN) secara permanen setelah konfirmasi (≤ 2 ketukan), serta menampilkan informasi ketentuan masa simpan rekam medis | US-PRV-03 | Must |
| FR-09 | Sistem mengekspor salinan data profil dan riwayat kesehatan ke format JSON serta menyediakan unduhan dokumen surat digital dalam format PDF | US-PRV-04 | Should |

---

## 3. Kebutuhan Non-Fungsional

Disalin langsung dari `docs/01-compliance/requirements-catalog.md` (M01):

| ID | Kategori | Deskripsi | Cara Verifikasi | Status |
|---|---|---|---|---|
| PRV-01 | Privasi | Hanya data di R1 yang dikumpulkan; GPS, kontak, kamera, ID perangkat tidak dikumpulkan | Audit form & izin manifest (M04) | Belum |
| PRV-02 | Privasi | Tidak ada SDK pihak ketiga pengumpul data selain Firebase yang diperlukan | Audit `pubspec.yaml` & `pubspec.lock` | ✅ M01 (pantau M04–M05) |
| PRV-03 | Privasi | Hapus akun/profil ≤ 2 ketukan; masa simpan rekam medis dijelaskan | Uji manual: Privasi & Data → Hapus Semua Data → Konfirmasi | Belum |
| PRV-04 | Privasi | Ekspor profil dan unduh surat ke format portabel (PDF/JSON) | Uji manual: berkas JSON/PDF ter-generate dan dapat dibuka | Belum |
| PRV-05 | Privasi | Kebijakan privasi bisa dibuka dari aplikasi | Uji manual: akses menu Kebijakan Privasi di aplikasi | Belum |
| PRV-06 | Privasi | Pasien dapat mengoreksi profil | Uji manual: ubah dan simpan data profil pasien | Belum |
| PRV-07 | Privasi | Admin non-medis hanya membaca ringkasan administratif; akses rekam medis dibatasi dan dicatat | Uji skenario role Admin pada UI & Firestore Security Rules (M05) | Belum |
| UX-01 | UX | Lulus audit dark pattern R5 tiap rilis | Checklist audit R5 pada prototipe (M03) & build rilis (M04–M05) | Belum |
| UX-02 | UX | Fitur opsional (pengingat obat) default MATI; persetujuan bisa ditarik | Uji manual: cek status awal toggle pengingat = nonaktif dan bisa dimatikan | Belum |
| UX-03 | UX | Teks ≥ 14sp, kontras AA, label aksesibilitas | Inspeksi Figma tokens (M03) & widget/contrast check (M04) | Belum |
| UX-04 | UX | Teks notifikasi obat generik (tanpa nama penyakit/obat sensitif) | Uji perangkat nyata: periksa isi teks notifikasi di layar kunci | Belum |
| UX-05 | UX | Booking dinyatakan berhasil hanya setelah transaksi sukses; kegagalan/offline ditampilkan jelas | Uji skenario gagal/offline & transaksi atomik (M04–M05) | Belum |
| SEC-01 | Keamanan | Data sensitif lokal di secure storage, bukan SharedPreferences | Bukti `sec-01-shared-prefs.png` & code review `SecureStorageService` | ✅ M01 |
| SEC-02 | Keamanan | PIN di-hash dengan KDF (PBKDF2) + salt acak; batas percobaan | Code review `PinService` (PBKDF2 + salt acak + lockout) | ✅ M01 |
| SEC-03 | Keamanan | `allowBackup=false`; tanpa `print` di production (lint `avoid_print`) | Bukti `sec-03-lint.txt`, `sec-03-print.txt`, dan `AndroidManifest.xml` | ✅ M01 |
| SEC-04 | Keamanan | Tanpa secret di repo; `.gitignore` dan pemindaian `git grep` | Bukti `sec-04-secrets.txt` dan `sec-04-outdated.txt` | ✅ M01 |
| SEC-05 | Keamanan | Semua jaringan HTTPS; cleartext dilarang | Verifikasi `network_security_config.xml` (diuji ulang saat M05) | ✅ M01 (ulang M05) |
| SEC-06 | Keamanan | Izin minimal: tanpa `INTERNET` pada build release sampai M05 | Bukti `sec-06-permissions.txt` pada APK release (diperbarui M05) | ✅ M01 (ulang M05) |
| SEC-07 | Keamanan | Firestore Security Rules default-deny, berbasis role dan kepemilikan, diuji di emulator | Uji 100% matriks hak akses pada Firebase Emulator (M05) | Belum |
| SEC-08 | Keamanan | Password hanya di Firebase Auth; tidak ada password/hash di Firestore | Audit skema koleksi Firestore & Security Rules (M05) | Belum |

---

## 4. Batasan Sistem

- Satu aplikasi Flutter/Dart dengan antarmuka dan menu berbasis role (Pasien, Dokter, Admin non-medis), target utama Android (`id.ac.uad.klinik_kampus`); tidak mencakup rilis iOS maupun dashboard admin desktop/web responsif.
- Pada M01–M04, seluruh data bersifat dummy di memori perangkat dan secure storage lokal (`flutter_secure_storage`, `cryptography` untuk `PinService`); integrasi FlutterFire (`firebase_core`, `firebase_auth`, `cloud_firestore` paket no-cost) ditambahkan pada M05, sedangkan `flutter_local_notifications` dan `printing` disiapkan untuk fitur pengingat obat serta cetak/PDF surat.
- Sistem tidak membangun REST API atau server backend sendiri; akun Dokter dan Admin dibuat manual melalui Firebase Console (M05).
- Fitur pembayaran, live chat, GPS/geofencing, biometrik, inventaris apotek, dan push notification dari server berada di luar cakupan MVP.
- Pemesanan dan klaim slot pada tahap integrasi cloud (M05) memerlukan koneksi internet aktif karena transaksi Firestore tidak dapat dijalankan secara offline.

---

## 5. Asumsi

- Seluruh pengembangan dan pengujian selama satu semester hanya menggunakan data dummy/sintetis tanpa melibatkan data kesehatan pasien nyata.
- Klinik kampus melayani estimasi 20–50 pasien per hari dengan tiga peran pengguna: Pasien (mahasiswa/staf), Dokter, dan Admin non-medis.
- Pasien menggunakan perangkat Android pribadi dan memberikan izin notifikasi lokal apabila mengaktifkan fitur pengingat minum obat.
- Ketentuan masa simpan rekam medis (verifikasi Permenkes 24/2022) dan dasar akses baca Admin non-medis akan mengikuti arahan resmi pengelola klinik atau dosen sebelum penggunaan nyata.