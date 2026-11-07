# Charter — M2S Klinik Kampus (Mugi-Mugi Sehat)
# Topik: Klinik
# Kelompok: M2S — Jovan Prasetyo Wibisono, Rachmad Eka Putra Ramadhan, Faturahman Dwi Saputra, Muhammad Annaafi Putra Sya'bani

## Visi
Aplikasi mobile Klinik Kampus yang memudahkan pasien memesan slot dokter dan menerima dokumen serta pengingat obat, dengan data kesehatan yang hanya bisa dibuka oleh pihak yang berwenang.

## Tujuan Terukur
1. Pasien menyelesaikan booking slot dokter ≤ 60 detik dan ≤ 5 ketukan dari Beranda (ukur: uji 5 pasien dummy).
2. 0 double booking pada 20 percobaan klaim slot bersamaan (ukur: uji dua perangkat/emulator, transaksi Firestore).
3. 100% skenario akses pada matriks hak akses (Pasien/Dokter/Admin x data) lulus uji Security Rules (ukur: Firebase Emulator).
4. Pengingat obat muncul ±1 menit dari jadwal, juga setelah perangkat restart (ukur: 1 perangkat Android nyata).

## Pengguna Sasaran
Pasien (mahasiswa/staf), Dokter, Admin non-medis klinik kampus. Estimasi 20–50 pasien/hari. Android lebih dulu (Flutter).

## Scope
### Must (wajib ada)
- Autentikasi + role, profil pasien, booking slot (FR-01), status booking/antrean
- Rekam medis (FR-02), surat rujukan (FR-03), pengingat obat lokal (FR-04), surat keterangan sakit PDF (FR-05)
- Pengelolaan jadwal/antrean oleh Admin; akses Admin ke rekam medis terbatas dan tercatat
### Won't (tidak dikerjakan sekarang)
- Pembayaran, live chat, GPS/geofencing, biometrik, inventaris apotek
- Dashboard admin desktop/web responsif, push notification dari server, rilis iOS
- REST API/server buatan sendiri

## Batasan & Asumsi
Flutter/Dart; Firebase Auth + Cloud Firestore (paket no-cost); tanpa server sendiri; data dummy saja; 4 anggota; satu semester. Booking butuh koneksi internet. Akun Dokter/Admin dibuat manual lewat Firebase Console.

## Risiko Awal
- Akses tidak sah ke rekam medis (data kesehatan = data spesifik UU PDP): dampak kebocoran data. Mitigasi: default-deny + uji rules.
- Dasar akses baca Admin non-medis ke rekam medis belum jelas: perlu arahan pengelola klinik/dosen.
- Dua pasien klaim slot sama: double booking. Mitigasi: transaksi Firestore.

## Kriteria Sukses
Empat tujuan terukur tercapai; semua requirement PRV/SEC/UX pada katalog terverifikasi; prototipe diuji pengguna dummy tanpa data kesehatan nyata.
