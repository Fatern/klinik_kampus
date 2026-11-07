// lib/services/secure_storage_service.dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Penyimpanan aman (Keystore Android) untuk data sensitif LOKAL (SEC-01).
/// Kredensial login dikelola Firebase Auth (M05), bukan di sini.
class SecureStorageService {
  static final _instance = SecureStorageService._();
  factory SecureStorageService() => _instance;
  SecureStorageService._();

  final _store = const FlutterSecureStorage();

  static const _kPinEnabled = 'pin_enabled';

  Future<bool> isPinEnabled() async =>
      await _store.read(key: _kPinEnabled) == 'true';

  /// Hak penghapusan (PRV-03): hapus semua data aman di perangkat.
  Future<void> clearAll() => _store.deleteAll();
}
