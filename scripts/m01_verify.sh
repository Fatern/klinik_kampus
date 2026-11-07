#!/usr/bin/env bash
# Jalankan di Git Bash dari root repo: bash scripts/m01_verify.sh
# Menghasilkan bukti SEC-03/04/06 di docs/01-compliance/evidence/
set -u
EVID=docs/01-compliance/evidence
mkdir -p "$EVID"

echo "== flutter analyze (SEC-03)"
flutter analyze > "$EVID/sec-03-lint.txt" 2>&1; tail -3 "$EVID/sec-03-lint.txt"

echo "== print() di lib (SEC-03) — kosong = aman"
git grep -n 'print(' -- lib > "$EVID/sec-03-print.txt" || true
wc -l < "$EVID/sec-03-print.txt"

echo "== pemindaian secret (SEC-04) — periksa manual: hanya nama variabel, bukan nilai"
git grep -niE 'secret|api.?key|password' -- . ':!pubspec.lock' ':!docs' ':!scripts' > "$EVID/sec-04-secrets.txt" || true
cat "$EVID/sec-04-secrets.txt"

echo "== flutter pub outdated (SEC / ADR-002)"
flutter pub outdated > "$EVID/sec-04-outdated.txt" 2>&1

echo "== build release (SEC-06)"
flutter build apk --release --dart-define=ENV=prod || { echo "BUILD GAGAL"; exit 1; }

SDK="${ANDROID_HOME:-${ANDROID_SDK_ROOT:-}}"
AAPT="$(ls "$SDK"/build-tools/*/aapt.exe "$SDK"/build-tools/*/aapt 2>/dev/null | tail -1)"
if [ -z "$AAPT" ]; then echo "aapt tidak ditemukan; set ANDROID_HOME ke folder Android SDK"; exit 1; fi
"$AAPT" dump permissions build/app/outputs/flutter-apk/app-release.apk > "$EVID/sec-06-permissions.txt" 2>&1
cat "$EVID/sec-06-permissions.txt"
if grep -q "android.permission.INTERNET" "$EVID/sec-06-permissions.txt"; then
  echo "PERINGATAN: INTERNET ada di build release (SEC-06 gagal)"
else
  echo "OK: tidak ada izin INTERNET di build release"
fi
