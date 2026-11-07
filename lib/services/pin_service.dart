// lib/services/pin_service.dart
import 'dart:convert';
import 'dart:math';

import 'package:cryptography/cryptography.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum PinResult { ok, wrong, locked }

/// PIN aplikasi: PBKDF2 + salt acak (SEC-02) dan batas percobaan.
class PinService {
  final _store = const FlutterSecureStorage();
  final _kdf = Pbkdf2(
    macAlgorithm: Hmac.sha256(),
    iterations: 120000, // ukur kecepatan di perangkat target
    bits: 256,
  );

  static const _maxFreeAttempts = 5;

  Future<String> _hash(String pin, List<int> salt) async {
    final key = await _kdf.deriveKeyFromPassword(password: pin, nonce: salt);
    return base64Encode(await key.extractBytes());
  }

  Future<void> setPin(String pin) async {
    if (!RegExp(r'^\d{6}$').hasMatch(pin)) {
      throw ArgumentError('PIN harus 6 digit angka');
    }
    final rng = Random.secure();
    final salt = List<int>.generate(16, (_) => rng.nextInt(256));
    await _store.write(key: 'pin_salt', value: base64Encode(salt));
    await _store.write(key: 'pin_hash', value: await _hash(pin, salt));
    await _store.write(key: 'pin_enabled', value: 'true');
    await _resetAttempts();
  }

  Future<PinResult> verifyPin(String pin) async {
    final lockedUntil =
        int.tryParse(await _store.read(key: 'pin_locked_until') ?? '') ?? 0;
    if (DateTime.now().millisecondsSinceEpoch < lockedUntil) {
      return PinResult.locked;
    }

    final s = await _store.read(key: 'pin_salt');
    final h = await _store.read(key: 'pin_hash');
    if (s == null || h == null) return PinResult.wrong;

    final actual = await _hash(pin, base64Decode(s));
    if (_sameConstantTime(actual, h)) {
      await _resetAttempts();
      return PinResult.ok;
    }
    await _registerFailure();
    return PinResult.wrong;
  }

  Future<void> removePin() async {
    await _store.delete(key: 'pin_hash');
    await _store.delete(key: 'pin_salt');
    await _store.write(key: 'pin_enabled', value: 'false');
    await _resetAttempts();
  }

  Future<void> _registerFailure() async {
    final fails =
        (int.tryParse(await _store.read(key: 'pin_fail_count') ?? '') ?? 0) + 1;
    await _store.write(key: 'pin_fail_count', value: '$fails');
    final extra = fails - _maxFreeAttempts;
    if (extra >= 0) {
      final seconds = min(30 * (1 << min(extra, 5)), 900);
      final until = DateTime.now().millisecondsSinceEpoch + seconds * 1000;
      await _store.write(key: 'pin_locked_until', value: '$until');
    }
  }

  Future<void> _resetAttempts() async {
    await _store.delete(key: 'pin_fail_count');
    await _store.delete(key: 'pin_locked_until');
  }

  bool _sameConstantTime(String a, String b) {
    if (a.length != b.length) return false;
    var diff = 0;
    for (var i = 0; i < a.length; i++) {
      diff |= a.codeUnitAt(i) ^ b.codeUnitAt(i);
    }
    return diff == 0;
  }
}
