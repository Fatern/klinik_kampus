# Traceability Matrix — M2S Klinik Kampus

**Versi:** 1.0
**Tanggal:** 2026-11-27

---

## Tabel 1: Kebutuhan Fungsional

| ID FR | Deskripsi Singkat | User Story / Sumber | Use Case | Layar (Figma) | Status M04 | Test ID |
|---|---|---|---|---|---|---|
| FR-01 | Booking slot dokter (atomik, 1 slot 1 pasien), status antrean (`Menunggu` → `Diperiksa` → `Selesai`/`Batal`), dan pengajuan pembatalan | US-01, ADD-02, ADD-03 | UC-01, UC-09 | TBD M03 | Belum | T-01 |
| FR-02 | Pencatatan dan pembacaan rekam medis sesuai role & kepemilikan (Admin non-medis terbatas ringkasan administratif) | US-02, PRV-07 | UC-02, UC-10 | TBD M03 | Belum | T-02 |
| FR-03 | Penerbitan, tampilan, unduhan, dan cetak surat rekomendasi/rujukan digital | US-03 | UC-03 | TBD M03 | Belum | T-03 |
| FR-04 | Input resep obat oleh Dokter & pengaturan pengingat obat lokal (default mati, notifikasi generik, tahan restart) | US-04, UX-02, UX-04 | UC-04 | TBD M03 | Belum | T-04 |
| FR-05 | Penerbitan dan unduh/cetak surat keterangan sakit dalam format PDF | US-05 | UC-03 | TBD M03 | Belum | T-05 |
| FR-06 | Pengelolaan jadwal dokter, pemantauan antrean, dan persetujuan pembatalan oleh Admin non-medis | US-06, ADD-04 | UC-05, UC-10 | TBD M03 | Belum | T-06 |
| FR-07 | Autentikasi email–kata sandi berbasis role (Pasien/Dokter/Admin) dan validasi kelengkapan profil pasien sebelum booking | Charter Must, ADD-01, ADD-02 | UC-09, UC-10 | TBD M03 | Belum | T-07 |
| FR-08 | Hapus semua data lokal pengguna ≤ 2 ketukan + konfirmasi & keterangan retensi rekam medis | US-PRV-03 | UC-06 | TBD M03 | Belum | T-08 |
| FR-09 | Ekspor profil & riwayat kesehatan ke JSON serta unduh surat digital ke PDF | US-PRV-04 | UC-07 | TBD M03 | Belum | T-09 |

> Kolom "Layar (Figma)" diisi di M03. Kolom "Status M04" diisi di M04.

---

## Tabel 2: Kebutuhan Non-Fungsional Kritis

| ID NFR | Kategori | Deskripsi | Cara Verifikasi | Berlaku di | Status |
|---|---|---|---|---|---|
| PRV-01 | Privasi | Hanya data pada tabel R1 yang dikumpulkan; tanpa GPS, kontak, kamera, ID perangkat | Audit form input & izin manifest | M04 | Belum |
| PRV-02 | Privasi | Tanpa SDK pihak ketiga pengumpul data selain Firebase yang diperlukan | Audit `pubspec.yaml` & `pubspec.lock` | M01–M05 | ✅ M01 (pantau M04–M05) |
| PRV-03 | Privasi | Hapus akun/profil & data lokal ≤ 2 ketukan + konfirmasi; masa simpan rekam medis dijelaskan | Uji manual: Privasi & Data → Hapus Semua Data → Konfirmasi | M04 | Belum |
| PRV-04 | Privasi | Ekspor profil/riwayat ke JSON dan unduh surat digital ke PDF | Uji manual: berkas JSON & PDF ter-generate dan dapat dibuka | M04 | Belum |
| PRV-05 | Privasi | Kebijakan privasi dapat dibuka langsung dari aplikasi | Uji manual: buka menu Kebijakan Privasi (`UC-08`) | M03–M04 | Belum |
| PRV-06 | Privasi | Pasien dapat mengoreksi data profil miliknya | Uji manual: ubah dan simpan profil pasien | M04 | Belum |
| PRV-07 | Privasi | Admin non-medis hanya membaca ringkasan administratif; akses rekam medis dibatasi dan dicatat | Uji skenario role Admin pada UI & Firestore Security Rules | M05 | Belum |
| UX-01 | UX | Lulus audit dark pattern R5 pada setiap rilis | Checklist audit R5 pada prototipe & build rilis | M03–M05 | Belum |
| UX-02 | UX | Pengingat obat bersifat opsional (default MATI) dan dapat dimatikan kapan saja | Uji manual: verifikasi status awal toggle = nonaktif | M05 | Belum |
| UX-03 | UX | Teks ≥ 14sp, kontras AA, dan label aksesibilitas | Inspeksi Figma tokens (M03) & widget/contrast check (M04) | M03–M05 | Belum |
| UX-04 | UX | Teks notifikasi pengingat obat generik (tanpa nama penyakit/obat sensitif) | Uji perangkat Android nyata pada layar kunci | M04–M05 | Belum |
| UX-05 | UX | Booking berhasil hanya setelah transaksi sukses; gagal/offline ditampilkan jelas | Uji skenario gagal/offline & klaim slot bersamaan | M04–M05 | Belum |
| SEC-01 | Keamanan | Data sensitif lokal disimpan di `flutter_secure_storage`, bukan `SharedPreferences` | Bukti `sec-01-shared-prefs.png` & review `SecureStorageService` | ✅ M01 | Selesai |
| SEC-02 | Keamanan | PIN di-hash dengan PBKDF2 + salt acak dan batas percobaan | Code review `PinService` | ✅ M01 | Selesai |
| SEC-03 | Keamanan | `allowBackup=false` dan tanpa `print` di production (`avoid_print`) | Bukti `sec-03-lint.txt`, `sec-03-print.txt`, dan manifest | ✅ M01 | Selesai |
| SEC-04 | Keamanan | Tanpa secret di repo; `.gitignore` dan pemindaian `git grep` | Bukti `sec-04-secrets.txt` dan `sec-04-outdated.txt` | ✅ M01 | Selesai |
| SEC-05 | Keamanan | Semua jaringan HTTPS; cleartext dilarang | Verifikasi `network_security_config.xml` | M01 · M05 | ✅ M01 (ulang M05) |
| SEC-06 | Keamanan | Izin minimal: tanpa `INTERNET` pada build release sampai M05 | Bukti `sec-06-permissions.txt` pada APK release | M01 · M05 | ✅ M01 (ulang M05) |
| SEC-07 | Keamanan | Firestore Security Rules default-deny, berbasis role dan kepemilikan | Uji 100% matriks hak akses pada Firebase Emulator | M05 | Belum |
| SEC-08 | Keamanan | Password hanya dikelola Firebase Auth; tidak ada password/hash di Firestore | Audit skema koleksi Firestore & Security Rules | M05 | Belum |

---

## Tabel 3: Sequence Diagram → Method

| Skenario | Pesan dalam diagram | Method Dart yang akan dibuat | File |
|---|---|---|---|
| Skenario 1 | `SC ->> BP : createBooking(booking)` | `BookingProvider.createBooking()` | `lib/providers/booking_provider.dart` |
| Skenario 1 | `BP ->> BR : add(booking)` | `InMemoryBookingRepository.add()` | `lib/repositories/in_memory_booking_repository.dart` |
| Skenario 1 | `BP ->> BP : notifyListeners()` | Dipanggil setelah setiap mutasi data booking | `lib/providers/booking_provider.dart` |
| Skenario 2 | `MS ->> MP : loadRecords(patientId, role)` | `MedicalProvider.loadRecords()` | `lib/providers/medical_provider.dart` |
| Skenario 2 | `MP ->> MR : getAll()` | `InMemoryMedicalRepository.getAll()` | `lib/repositories/in_memory_medical_repository.dart` |
| Skenario 2 | `MP ->> AL : logDeniedAccess(...)` | `AccessAuditService.logDeniedAccess()` | `lib/services/access_audit_service.dart` |
