import 'package:flutter_test/flutter_test.dart';

import 'package:klinik_kampus/main.dart';
import 'package:klinik_kampus/models/booking.dart';
import 'package:klinik_kampus/repositories/booking_repository.dart';
import 'package:klinik_kampus/repositories/in_memory_booking_repository.dart';

void main() {
  testWidgets('Aplikasi menampilkan placeholder M01', (tester) async {
    await tester.pumpWidget(const KlinikApp());
    expect(find.text('Fondasi M01 siap'), findsOneWidget);
  });

  test('Satu slot hanya bisa diklaim satu pasien (FR-01)', () async {
    final repo = InMemoryBookingRepository();
    Booking make(String id, String patient) => Booking(
          id: id,
          patientId: patient,
          doctorId: 'dokter-1',
          slotId: 'slot-1',
          createdAt: DateTime(2026, 11, 7),
        );

    await repo.create(make('b1', 'pasien-1'));
    expect(
      () => repo.create(make('b2', 'pasien-2')),
      throwsA(isA<SlotAlreadyClaimedException>()),
    );

    await repo.updateStatus('b1', BookingStatus.batal);
    await repo.create(make('b3', 'pasien-2')); // slot bebas setelah batal
    expect((await repo.getByPatient('pasien-2')).length, 1);
  });

  test('clearForPatient menghapus data pasien (PRV-03)', () async {
    final repo = InMemoryBookingRepository();
    await repo.create(Booking(
      id: 'b1',
      patientId: 'pasien-1',
      doctorId: 'dokter-1',
      slotId: 'slot-1',
      createdAt: DateTime(2026, 11, 7),
    ));
    await repo.clearForPatient('pasien-1');
    expect(await repo.getByPatient('pasien-1'), isEmpty);
  });
}
