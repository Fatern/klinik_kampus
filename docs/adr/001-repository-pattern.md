# ADR-001: Repository, AppConfig, dan Design Tokens

Status: diterima (M01) · Tanggal: 7 November 2026

## Konteks
M04 membangun UI sebelum Firebase siap; M05 menyambungkan Firestore. Tanpa pemisahan, layar harus ditulis ulang.

## Keputusan
1. **BookingRepository** (lib/repositories/): UI hanya memanggil antarmuka. M04 memakai `InMemoryBookingRepository`; M05 mengganti dengan implementasi Firestore (klaim slot lewat transaksi) di satu baris `main.dart`. Antarmuka tidak mengimpor Firebase.
2. **AppConfig** (lib/core/): sakelar `ENV` dan `USE_REMOTE` lewat `--dart-define`. Nilai ini tertanam di APK, jadi bukan tempat secret.
3. **AppTheme / design tokens** (lib/core/): nama token sama dengan Figma (`color.primary`, `space.md`) agar handoff M03→M04 tanpa tebakan.

## Konsekuensi
Model `Booking` sengaja minimal (sesuai PRV-01). Entitas lain (rekam medis, resep, surat) ditambahkan di M02–M04 mengikuti R1.
Penyimpanan Firestore (M05) harus menjaga invarian satu slot satu pasien yang sudah ditegakkan implementasi in-memory.
