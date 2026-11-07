// lib/repositories/booking_repository.dart
import '../models/booking.dart';

/// Dilempar saat slot sudah diklaim pasien lain (FR-01: satu slot satu pasien).
class SlotAlreadyClaimedException implements Exception {
  SlotAlreadyClaimedException(this.slotId);
  final String slotId;

  @override
  String toString() => 'Slot $slotId sudah diklaim';
}

/// Kontrak akses data booking. Jangan import Firebase atau storage apa pun di sini.
/// M04: InMemoryBookingRepository. M05: implementasi Firestore (transaksi atomik).
abstract class BookingRepository {
  Future<List<Booking>> getByPatient(String patientId);
  Future<Booking?> getById(String id);

  /// Membuat booking sekaligus mengklaim slot.
  /// Melempar [SlotAlreadyClaimedException] bila slot sudah diambil.
  Future<void> create(Booking booking);

  Future<void> updateStatus(String id, BookingStatus status);

  /// PRV-03: hak penghapusan data booking milik satu pasien.
  Future<void> clearForPatient(String patientId);
}
