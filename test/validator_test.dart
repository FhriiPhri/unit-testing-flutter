import 'package:flutter_test/flutter_test.dart';
import 'package:tugas_flutter_testing/utils/validator.dart';

void main() {
  group('Email Validator', () {
    test('Email valid harus return true', () {
      expect(Validator.isValidEmail('test@example.com'), true);
    });

    test('Email invalid harus return false', () {
      expect(Validator.isValidEmail('invalid-email'), false);
      expect(Validator.isValidEmail('user@'), false);
      expect(Validator.isValidEmail('user@com'), false);
    });
  });
}