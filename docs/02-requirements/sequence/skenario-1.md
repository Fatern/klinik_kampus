# Sequence Diagram — Skenario 1: Booking Slot Dokter Sukses

**Topik:** M2S Klinik Kampus
**Skenario:** Happy path — pasien dengan profil lengkap berhasil memesan satu slot dokter yang tersedia tanpa double booking
**Requirement:** FR-01, US-01, ADD-02, UX-05

```mermaid
sequenceDiagram
    actor P as Pasien
    participant SC as BookingScreen
    participant BP as BookingProvider
    participant BR as InMemoryBookingRepository

    Note over P,BR: Skenario 1 — Booking Slot Dokter Sukses (FR-01, UX-05)

    P ->> SC : pilih dokter, tanggal, slot, lalu ketuk Konfirmasi Booking
    SC ->> SC : validasi profil lengkap (ADD-02) & input form

    alt profil lengkap dan slot masih tersedia
        SC ->> BP : createBooking(booking)
        activate BP
        BP ->> BR : add(booking)
        Note right of BR: Klaim atomik 1 slot = 1 pasien (M05 via transaksi Firestore)
        BR -->> BP : Future~void~ resolved
        BP ->> BP : notifyListeners()
        deactivate BP
        BP -->> SC : Consumer rebuild (daftar booking & status Menunggu)
        SC -->> P : SnackBar "Booking berhasil dikonfirmasi" + nomor antrean
    else profil belum lengkap atau slot sudah diklaim
        SC -->> P : tampilkan pesan gagal & arahkan lengkapi profil / pilih slot lain
    end
```

## Analisis Relasi Diagram → Kode

| Pesan dalam diagram | Method Dart yang akan dibuat | File |
|---|---|---|
| `SC ->> BP : createBooking(booking)` | `BookingProvider.createBooking()` | `lib/providers/booking_provider.dart` |
| `BP ->> BR : add(booking)` | `InMemoryBookingRepository.add()` | `lib/repositories/in_memory_booking_repository.dart` |
| `BP ->> BP : notifyListeners()` | Dipanggil setelah setiap mutasi data booking | `lib/providers/booking_provider.dart` |
