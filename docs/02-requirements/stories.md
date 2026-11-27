# User Stories — M2S Klinik Kampus

**Versi:** 1.0
**Terakhir diperbarui:** 2026-11-27

---

## US-01 · Booking Slot Dokter dan Status Antrean

**Prioritas:** Must
**Req ID:** FR-01

> Sebagai **pasien klinik kampus**,
> saya ingin **memilih dokter, memesan slot jadwal yang tersedia, dan memantau status antrean saya**,
> agar **saya mendapatkan jadwal pemeriksaan tanpa antre lama dan tanpa bentrok jadwal**.

**Acceptance Criteria:**

```gherkin
Given pasien membuka halaman Booking dari Beranda
When pasien memilih dokter, memilih tanggal serta slot waktu yang tersedia, dan mengetuk Konfirmasi Booking
Then pemesanan berhasil tersimpan dan muncul di daftar booking dengan nomor serta status antrean
  And slot yang telah dipesan tidak lagi tersedia untuk pasien lain
  And muncul notifikasi singkat "Booking berhasil dikonfirmasi"
```

---

## US-02 · Pencatatan dan Riwayat Rekam Medis

**Prioritas:** Must
**Req ID:** FR-02

> Sebagai **dokter dan pasien klinik kampus**,
> saya ingin **dokter dapat mencatat keluhan, diagnosis, dan tindakan pemeriksaan, serta pasien dapat melihat riwayat rekam medis miliknya sendiri**,
> agar **riwayat kesehatan tercatat rapi dan hanya dapat diakses oleh pihak yang berwenang**.

**Acceptance Criteria:**

```gherkin
Given dokter telah menyelesaikan pemeriksaan pasien pada jadwal booking aktif
When dokter mengisi keluhan utama, diagnosis, dan tindakan lalu mengetuk Simpan Rekam Medis
Then data rekam medis tersimpan pada riwayat kunjungan pasien terkait
  And pasien yang bersangkutan dapat melihat ringkasan rekam medis tersebut di menu Riwayat
  And pengguna lain yang tidak berwenang tidak dapat membuka detail klinis tersebut
```

---

## US-03 · Penerbitan dan Akses Surat Rujukan Digital

**Prioritas:** Must
**Req ID:** FR-03

> Sebagai **pasien klinik kampus**,
> saya ingin **menerima dan melihat surat rujukan digital yang diterbitkan dokter setelah pemeriksaan**,
> agar **saya dapat menunjukkan rujukan ke fasilitas kesehatan lanjutan dengan cepat tanpa takut dokumen hilang**.

**Acceptance Criteria:**

```gherkin
Given dokter menerbitkan surat rujukan untuk pasien dari halaman pemeriksaan
When pasien membuka menu Dokumen Digital dan memilih surat rujukan terkait
Then sistem menampilkan detail surat rujukan lengkap (identitas pasien, tujuan rujukan, alasan medis, dan tanggal terbit)
  And surat rujukan dapat disimpan atau diunduh untuk keperluan lanjutan
```

---

## US-04 · Pengingat Jadwal Minum Obat Lokal

**Prioritas:** Must
**Req ID:** FR-04

> Sebagai **pasien klinik kampus**,
> saya ingin **mengaktifkan pengingat jadwal minum obat berdasarkan resep dokter dengan tampilan notifikasi yang generik**,
> agar **saya minum obat tepat waktu tanpa informasi penyakit atau nama obat sensitif terbaca orang lain di layar kunci**.

**Acceptance Criteria:**

```gherkin
Given pasien memiliki resep aktif dan fitur pengingat obat dalam kondisi nonaktif secara bawaan
When pasien mengaktifkan pengingat obat dan mengatur jadwal minum obat
Then notifikasi pengingat muncul sesuai jadwal dengan teks generik (tanpa nama penyakit atau obat sensitif)
  And pengingat tetap aktif meskipun perangkat dimulai ulang
  And pasien dapat menonaktifkan pengingat kapan saja
```

---

## US-05 · Penerbitan dan Unduh Surat Keterangan Sakit PDF

**Prioritas:** Must
**Req ID:** FR-05

> Sebagai **pasien klinik kampus**,
> saya ingin **mengunduh surat keterangan sakit dalam format PDF yang diterbitkan oleh dokter**,
> agar **saya dapat langsung menyerahkannya sebagai bukti izin sakit ke dosen atau unit kampus**.

**Acceptance Criteria:**

```gherkin
Given dokter telah menerbitkan surat keterangan sakit beserta lama istirahat untuk pasien
When pasien membuka detail surat keterangan sakit dan mengetuk Unduh PDF
Then sistem menghasilkan berkas PDF surat keterangan sakit yang rapi dan siap dibagikan
  And muncul notifikasi bahwa berkas PDF berhasil diunduh
```

---

## US-06 · Pengelolaan Jadwal Dokter dan Antrean oleh Admin

**Prioritas:** Must
**Req ID:** FR-06

> Sebagai **admin non-medis klinik kampus**,
> saya ingin **mengelola jadwal praktik dokter dan memperbarui status antrean kunjungan tanpa membuka isi klinis rekam medis**,
> agar **operasional antrean klinik berjalan tertib sekaligus menjaga kerahasiaan data kesehatan pasien**.

**Acceptance Criteria:**

```gherkin
Given admin membuka halaman Manajemen Jadwal dan Antrean
When admin menambah atau mengubah slot jadwal dokter serta memperbarui status antrean pasien
Then perubahan jadwal dan status antrean langsung tercermin pada daftar booking pasien
  And tampilan admin hanya menampilkan ringkasan administratif tanpa detail keluhan, diagnosis, atau tindakan medis
```

---

## US-PRV-03 · Hapus Semua Data (WAJIB)

**Prioritas:** Must
**Req ID:** PRV-03

> Sebagai **pasien klinik kampus**,
> saya ingin **menghapus semua data profil dan data lokal saya dari aplikasi dalam maksimal dua ketukan dengan konfirmasi**,
> agar **data pribadi saya tidak lagi tersimpan di perangkat ketika saya tidak ingin menggunakannya lagi**.

**Acceptance Criteria:**

```gherkin
Given pasien membuka menu Privasi & Data
When pasien memilih "Hapus Semua Data" dan mengetuk Konfirmasi Hapus
Then seluruh data lokal pengguna (profil, riwayat dummy, pengingat, dan kunci aplikasi) terhapus permanen
  And sistem menampilkan informasi singkat bahwa rekam medis tertentu dapat wajib disimpan sesuai aturan klinik
  And aplikasi kembali ke kondisi awal serta menampilkan notifikasi "Semua data berhasil dihapus"
```

---

## US-PRV-04 · Ekspor Profil dan Riwayat Kesehatan

**Prioritas:** Should
**Req ID:** PRV-04

> Sebagai **pasien klinik kampus**,
> saya ingin **mengunduh salinan data profil, riwayat kesehatan, dan surat digital saya dalam format portabel**,
> agar **saya memiliki arsip pribadi yang dapat disimpan atau digunakan di luar aplikasi**.

**Acceptance Criteria:**

```gherkin
Given pasien membuka menu Privasi & Data
When pasien memilih "Ekspor Data"
Then sistem menghasilkan berkas portabel (JSON untuk profil/riwayat dan PDF untuk surat digital)
  And berkas tersedia untuk diunduh atau dibagikan oleh pasien
```
