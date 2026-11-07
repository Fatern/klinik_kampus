# R2 · Matriks Etika
# Kode etik yang digunakan: ACM Code of Ethics (2018) dan IEEE-CS/ACM Software Engineering Code of Ethics

| Sumber | Prinsip | Risiko di Aplikasi Kami | Kontrol (ID) |
|--------|---------|------------------------|--------------|
| ACM 1.6 | Hormati privasi | Data kesehatan pasien terbaca pihak tak berwenang, termasuk Admin non-medis | PRV-01, PRV-07, SEC-07 |
| ACM 1.7 | Jaga kerahasiaan | Isi rekam medis bocor lewat notifikasi, log, atau screenshot data uji | PRV-02, SEC-03, UX-04 |
| ACM 1.3 | Jujur dan tepercaya | Booking terlihat berhasil padahal transaksi gagal (offline); klaim "aman" tidak sesuai kenyataan | PRV-05, UX-05 |
| ACM 1.2 | Hindari bahaya | Double booking atau pengingat obat tidak muncul mengganggu penanganan pasien | FR-01 (M02), UX-05 |
| ACM 2.5 | Evaluasi menyeluruh | Security Rules tidak diuji sehingga celah akses lolos | SEC-03, SEC-07 |
| IEEE-CS/ACM SE Code, Prinsip 1 (Public) | Bertindak demi kepentingan publik | Fitur Admin membaca rekam medis tanpa dasar dan tanpa audit | PRV-07 |
| IEEE-CS/ACM SE Code, Prinsip 3 (Product) | Produk memenuhi standar profesional tertinggi | Kualitas dan keamanan tidak dibuktikan (tanpa evidence) | SEC-01..SEC-08 |

## Catatan: Risiko Khas Topik Ini
- Klinik: data medis tunduk pada UU PDP (data spesifik), UU 17/2023 tentang Kesehatan, dan Permenkes 24/2022 tentang Rekam Medis (triple regulation).
- Akses baca Admin non-medis ke rekam medis butuh dasar (persetujuan pasien/kebijakan klinik) sebelum penggunaan nyata.
- Hak hapus (UU PDP) dapat berbenturan dengan kewajiban menyimpan rekam medis; tanyakan batasnya ke klinik/dosen.
