// lib/repositories/in_memory_booking_repository.dart
import '../models/booking.dart';
import 'booking_repository.dart';

class InMemoryBookingRepository implements BookingRepository {
  final _items = <String, Booking>{};

  @override
  Future<List<Booking>> getByPatient(String patientId) async =>
      _items.values.where((b) => b.patientId == patientId).toList();

  @override
  Future<Booking?> getById(String id) async => _items[id];

  @override
  Future<void> create(Booking booking) async {
    final taken = _items.values.any(
      (b) => b.slotId == booking.slotId && b.status != BookingStatus.batal,
    );
    if (taken) throw SlotAlreadyClaimedException(booking.slotId);
    _items[booking.id] = booking;
  }

  @override
  Future<void> updateStatus(String id, BookingStatus status) async {
    final current = _items[id];
    if (current != null) _items[id] = current.copyWith(status: status);
  }

  @override
  Future<void> clearForPatient(String patientId) async {
    _items.removeWhere((_, b) => b.patientId == patientId);
  }
}
