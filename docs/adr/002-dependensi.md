# ADR-002: Dependensi dan Tinjauan `flutter pub outdated`

Status: selesai (M01) · Tanggal: 8 November 2026

| Paket | Versi di pubspec.lock | Alasan | Catatan hasil `flutter pub outdated` |
|-------|----------------------|--------|--------------------------------------|
| intl | 0.20.3 | Format tanggal/jam booking | Terkini |
| flutter_secure_storage | 11.2.0 | Flag/hash PIN (SEC-01) | Terkini |
| cryptography | 2.9.0 | PBKDF2 untuk PIN (SEC-02) | Terkini |
| provider | 6.1.5+1 | State management M04 | Terkini |

Paket lain yang ditandai `flutter pub outdated` hanyalah dependensi bawaan template: cupertino_icons (1.0.9, tersedia 2.0.0), material_color_utilities (0.13.0, tersedia 0.13.1), dan test_api (0.7.12, tersedia 0.7.15). Tidak ada yang berisiko; ditinjau ulang di M05.

Paket Firebase, flutter_local_notifications, dan printing ditambahkan di M05/M04 sesuai Laporan Tugas 1.