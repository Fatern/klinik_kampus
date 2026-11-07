# R1 · Inventaris Data Pribadi
# Aplikasi: M2S Klinik Kampus  Topik: Klinik  Kelompok: M2S

Catatan: M01–M04 memakai data dummy di memori perangkat. Mulai M05 data disimpan di Cloud Firestore; kolom "Lokasi" menunjukkan target akhir.

| Data | Kategori UU PDP | Tujuan | Lokasi simpan | Retensi | Perlindungan |
|------|-----------------|--------|---------------|---------|--------------|
| Email, UID, role | Umum | Login dan penentuan hak akses | Firebase Auth + Firestore `users` | Selama akun aktif | Firebase Auth; rules per role |
| Nama, NIM/NIP, fakultas/unit | Umum | Identifikasi pasien | Firestore `patient_profiles` | Selama akun aktif (TENTUKAN dgn klinik) | Rules: milik sendiri + dokter/admin berwenang |
| Riwayat alergi, golongan darah | Spesifik (kesehatan) | Keselamatan pemeriksaan | Firestore `patient_profiles` | Selama akun aktif (TENTUKAN) | Rules; akses dicatat |
| Booking (dokter, slot, status) | Spesifik (kesehatan, karena menunjukkan kunjungan ke klinik) | Antrean dan jadwal | Firestore `bookings`, `doctor_schedules` | TENTUKAN | Rules; transaksi atomik |
| Keluhan, diagnosis, tindakan | Spesifik (kesehatan) | Rekam medis | Firestore `medical_records` | Mengikuti ketentuan rekam medis (verifikasi Permenkes 24/2022 dengan klinik) | Rules; Admin hanya ringkasan |
| Resep (obat, dosis, anjuran) | Spesifik (kesehatan) | Pengingat obat | Firestore `prescriptions` + jadwal notifikasi lokal | TENTUKAN | Rules; teks notifikasi generik |
| Surat rujukan, surat sakit | Spesifik (kesehatan) | Dokumen digital | Firestore `referrals`, `medical_certificates` | Mengikuti rekam medis | Rules |
| Flag PIN aplikasi + hash PIN | Umum | Kunci aplikasi lokal | Secure storage perangkat | Sampai PIN dihapus/data dihapus | PBKDF2 + salt acak |

## Tidak Dikumpulkan (konfirmasi eksplisit)
- [x] Lokasi GPS
- [x] ID perangkat / iklan
- [x] Kontak
- [x] Kamera/galeri
- [x] Biometrik
- [x] Password (dikelola Firebase Auth, tidak disimpan di Firestore)

## Requirement yang Lahir dari Register Ini
- PRV-01: Hanya data pada tabel R1 yang dikumpulkan; data lain tidak diminta.
- PRV-02: Tanpa SDK analytics/iklan pihak ketiga; hanya SDK Firebase yang diperlukan.
- PRV-07: Dokumen yang dibaca Admin hanya berisi ringkasan administratif, bukan isi klinis lengkap.
