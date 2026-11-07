// lib/models/booking.dart
// Model minimal (PRV-01): hanya referensi ID, tanpa data medis.

enum BookingStatus { menunggu, diperiksa, selesai, batal }

class Booking {
  const Booking({
    required this.id,
    required this.patientId,
    required this.doctorId,
    required this.slotId,
    required this.createdAt,
    this.status = BookingStatus.menunggu,
  });

  final String id;
  final String patientId;
  final String doctorId;
  final String slotId;
  final DateTime createdAt;
  final BookingStatus status;

  Booking copyWith({BookingStatus? status}) => Booking(
        id: id,
        patientId: patientId,
        doctorId: doctorId,
        slotId: slotId,
        createdAt: createdAt,
        status: status ?? this.status,
      );
}
