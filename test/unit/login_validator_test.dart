import 'package:flutter_test/flutter_test.dart';
import 'package:app_testing/login_validator.dart';

void main() {
  group("LoginValidator", () {
    test("Email tidak boleh kosong", () {
      final result = LoginValidator.validateEmail("");
      print("[TEST] Input: '' → Output: $result");
      expect(result, "Email tidak boleh kosong");
    });

    test("Email harus valid", () {
      final result = LoginValidator.validateEmail("abc");
      print("[TEST] Input: 'abc' → Output: $result");
      expect(result, "Email tidak valid");
    });

    test("Password minimal 6 karakter", () {
      final result = LoginValidator.validatePassword("123");
      print("[TEST] Input: '123' → Output: $result");
      expect(result, "Password minimal 6 karakter");
    });

    test("Email & Password valid return null", () {
      final emailResult = LoginValidator.validateEmail("test@mail.com");
      final passwordResult = LoginValidator.validatePassword("123456");

      print("[TEST] Input Email: 'test@mail.com' → Output: $emailResult");
      print("[TEST] Input Password: '123456' → Output: $passwordResult");

      expect(emailResult, null);
      expect(passwordResult, null);
    });
  });
}
