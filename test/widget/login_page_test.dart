import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_testing/login_page.dart';

void main() {
  testWidgets("Tampilkan error jika email kosong", (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));
    print("[WIDGET TEST] Render LoginPage");

    await tester.tap(find.byKey(const Key("loginButton")));
    await tester.pumpAndSettle();
    print("[WIDGET TEST] Tombol login ditekan tanpa input");

    expect(find.text("Email tidak boleh kosong"), findsOneWidget);
    print("[WIDGET TEST] Pesan error muncul: 'Email tidak boleh kosong'");
  });

  testWidgets("Login berhasil dengan input valid", (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));
    print("[WIDGET TEST] Render LoginPage");

    await tester.enterText(find.byKey(const Key("emailField")), "user@mail.com");
    await tester.enterText(find.byKey(const Key("passwordField")), "123456");
    print("[WIDGET TEST] Input Email: user@mail.com, Password: 123456");

    await tester.tap(find.byKey(const Key("loginButton")));
    await tester.pumpAndSettle();
    print("[WIDGET TEST] Tombol login ditekan");

    expect(find.textContaining("Login berhasil"), findsOneWidget);
    print("[WIDGET TEST] Pesan sukses muncul: 'Login berhasil'");
  });
}
