// lib/core/app_config.dart
class AppConfig {
  static const env = String.fromEnvironment('ENV', defaultValue: 'dev');

  // Sakelar ini diaktifkan di M05 saat menghubungkan Firebase.
  static const useRemote = bool.fromEnvironment('USE_REMOTE', defaultValue: false);

  static bool get isProd => env == 'prod';
}

// Cara menjalankan:
// flutter run --dart-define=ENV=dev
// flutter build apk --release --dart-define=ENV=prod --dart-define=USE_REMOTE=true
//
// Nilai --dart-define tertanam di APK: ini mencegah secret masuk git,
// bukan menyembunyikannya. Secret sungguhan tidak boleh ada di klien.
