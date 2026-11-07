# R5 · Audit Dark Pattern
# Pertanyaan uji ini dijalankan pada setiap rilis milestone

| Pola | Pertanyaan Uji | Harapan di Aplikasi Kami |
|------|----------------|--------------------------|
| Pre-selected options | Adakah opsi yang sudah tercentang demi kepentingan kita? | Semua sakelar opsional (mis. pengingat obat) default MATI |
| Trick questions | Bisakah kalimat opsi dibaca dua arah? | Kalimat positif tunggal: "Izinkan pengingat obat?" |
| Roach motel | Apakah keluar/hapus lebih sulit daripada masuk? | Hapus akun ≤ 2 ketukan; ajukan pembatalan booking ≤ 2 ketukan dengan status terlihat |
| Confirmshaming | Apakah tombol "tidak" mempermalukan pengguna? | Teks netral: "Tidak sekarang" |
| Privacy zuckering | Apakah pengaturan privasi tersebar atau rumit? | Satu layar "Privasi & Data" |
| Akses tersembunyi (khas klinik) | Apakah pasien tahu siapa yang dapat melihat rekam medisnya? | Layar Privasi menjelaskan akses Dokter dan Admin |
| Urgensi palsu (khas klinik) | Apakah ada hitung mundur/kelangkaan slot yang menekan pasien? | Tidak ada; hanya ketersediaan slot apa adanya |

## Requirement yang Lahir dari Register Ini
- UX-01: Lulus audit dark pattern pada setiap rilis
- UX-02: Fitur opsional default MATI; persetujuan bisa ditarik
- UX-03: Teks ≥ 14sp, kontras AA, label aksesibilitas pada kontrol utama
