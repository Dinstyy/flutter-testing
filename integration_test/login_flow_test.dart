import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:app_testing/login_page.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("Login Flow Integration Test", () {
    testWidgets("Login Flow - sukses", (tester) async {
      print("=== [INTEGRATION TEST] MULAI SKENARIO LOGIN SUKSES ===");

      await tester.pumpWidget(const MaterialApp(home: LoginPage()));
      print("[STEP] Render LoginPage selesai");

      await tester.enterText(find.byKey(const Key("emailField")), "user@mail.com");
      print("[STEP] Input email: user@mail.com");

      await tester.enterText(find.byKey(const Key("passwordField")), "123456");
      print("[STEP] Input password: 123456");

      await tester.tap(find.byKey(const Key("loginButton")));
      await tester.pumpAndSettle();
      print("[STEP] Tombol login ditekan, menunggu SnackBar");

      expect(find.text("Login berhasil untuk user@mail.com"), findsOneWidget);
      print("[RESULT] Pesan sukses ditemukan: 'Login berhasil untuk user@mail.com'");

      print("=== [INTEGRATION TEST] SKENARIO LOGIN SUKSES SELESAI ===");
    });

    testWidgets("Login Flow - reset form", (tester) async {
      print("=== [INTEGRATION TEST] MULAI SKENARIO RESET FORM ===");

      await tester.pumpWidget(const MaterialApp(home: LoginPage()));
      print("[STEP] Render LoginPage selesai");

      await tester.enterText(find.byKey(const Key("emailField")), "user@mail.com");
      await tester.enterText(find.byKey(const Key("passwordField")), "123456");
      print("[STEP] Input email dan password");

      await tester.tap(find.byKey(const Key("resetButton")));
      await tester.pumpAndSettle();
      print("[STEP] Tombol reset ditekan");

      expect(find.text("user@mail.com"), findsNothing);
      expect(find.text("123456"), findsNothing);
      print("[RESULT] Form berhasil direset");

      print("=== [INTEGRATION TEST] SKENARIO RESET FORM SELESAI ===");
    });
  });
}