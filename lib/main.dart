import 'package:flutter/material.dart';

import 'core/app_theme.dart';

void main() {
  runApp(const KlinikApp());
}

class KlinikApp extends StatelessWidget {
  const KlinikApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'M2S Klinik Kampus',
      theme: AppTheme.light,
      home: const _PlaceholderHome(),
    );
  }
}

// Placeholder M01. Layar nyata dibuat di M04.
// Di M04/M05, repository diinjeksi di sini (satu baris):
//   final BookingRepository repo = InMemoryBookingRepository();
class _PlaceholderHome extends StatelessWidget {
  const _PlaceholderHome();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('M2S Klinik Kampus')),
      body: const Center(child: Text('Fondasi M01 siap')),
    );
  }
}
