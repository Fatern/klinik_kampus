# Class Diagram — M2S Klinik Kampus

**Versi:** 1.0
**Tanggal:** 2026-11-27

```mermaid
classDiagram
    class UserRole {
        <<enumeration>>
        PASIEN
        DOKTER
        ADMIN_NON_MEDIS
    }

    class BookingStatus {
        <<enumeration>>
        MENUNGGU
        DIPERIKSA
        SELESAI
        BATAL
    }

    class PatientProfile {
        +String userId
        +String nama
        +String nimNip
        +String fakultas
        +String alergi
        +String golonganDarah
        +UserRole role
        +bool isComplete()
        +toJson() Map
    }

    class Booking {
        +String id
        +String patientId
        +String doctorId
        +String slotId
        +DateTime createdAt
        +BookingStatus status
        +bool cancellationRequest
        +toJson() Map
    }

    class MedicalRecord {
        +String id
        +String bookingId
        +String patientId
        +String doctorId
        +DateTime createdAt
        +String keluhan
        +String diagnosis
        +String tindakan
        +toJson() Map
    }

    class Prescription {
        +String id
        +String recordId
        +String patientId
        +String namaObat
        +String dosis
        +String anjuran
        +bool isActive
    }

    class BookingRepository {
        <<interface>>
        +getAll() Future~List~Booking~~
        +add(Booking booking) Future~void~
        +update(Booking booking) Future~void~
        +remove(String id) Future~void~
        +clear() Future~void~
    }

    class MedicalRepository {
        <<interface>>
        +getAll() Future~List~MedicalRecord~~
        +add(MedicalRecord record) Future~void~
        +update(MedicalRecord record) Future~void~
        +remove(String id) Future~void~
        +clear() Future~void~
    }

    class BookingProvider {
        -BookingRepository _repo
        -List~Booking~ _bookings
        +loadBookings() Future~void~
        +createBooking(Booking booking) Future~void~
        +requestCancellation(String id) Future~void~
        +clearAll() Future~void~
        +notifyListeners() void
    }

    class MedicalProvider {
        -MedicalRepository _repo
        -List~MedicalRecord~ _records
        +loadRecords(String patientId, UserRole role) Future~void~
        +addRecord(MedicalRecord record) Future~void~
        +clearAll() Future~void~
        +notifyListeners() void
    }

    PatientProfile "1" --> "1" UserRole
    PatientProfile "1" --> "0..*" Booking : membuat
    Booking "1" --> "1" BookingStatus
    Booking "1" --> "0..1" MedicalRecord : menghasilkan
    MedicalRecord "1" --> "0..*" Prescription : memuat
    BookingProvider "1" --> "1" BookingRepository : menggunakan
    MedicalProvider "1" --> "1" MedicalRepository : menggunakan
```

## Pemetaan Class ke File Dart (Target M04)

| Class Diagram (PascalCase) | File Dart (snake_case) | Keterangan |
|---|---|---|
| `UserRole`, `BookingStatus` | `lib/models/enums.dart` | Enum role pengguna & status antrean (`ADD-01`, `ADD-03`) |
| `PatientProfile` | `lib/models/patient_profile.dart` | Profil pasien & validasi kelengkapan sebelum booking (`ADD-02`) |
| `Booking` | `lib/models/booking.dart` | Model booking slot (fondasi sudah ada sejak M01) |
| `MedicalRecord` | `lib/models/medical_record.dart` | Model rekam medis klinis (`FR-02`) |
| `Prescription` | `lib/models/prescription.dart` | Model resep untuk pengingat obat lokal (`FR-04`) |
| `BookingRepository` | `lib/repositories/booking_repository.dart` | Interface repository booking (fondasi M01, implementasi in-memory & Firestore M05) |
| `MedicalRepository` | `lib/repositories/medical_repository.dart` | Interface repository rekam medis |
| `BookingProvider` | `lib/providers/booking_provider.dart` | `ChangeNotifier` untuk state booking & antrean |
| `MedicalProvider` | `lib/providers/medical_provider.dart` | `ChangeNotifier` untuk state rekam medis & hak hapus `PRV-03` |
