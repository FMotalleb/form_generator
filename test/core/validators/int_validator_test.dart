import 'package:flutter_test/flutter_test.dart';
import 'package:form_generator/core/validators/int_number_validator.dart';

void main() {
  group('Testing integer number validator', () {
    test('checking correct string', () {
      final check = const IntNumberValidator().validate('055');
      expect(check, true);
    });
    test('checking wrong string (floating point)', () {
      final check = const IntNumberValidator().validate('55.55');
      expect(check, isNot(true));
    });
    test('checking wrong string (not a number)', () {
      final check = const IntNumberValidator().validate('abc');
      expect(check, isNot(true));
    });
    test('checking correct int in dynamic', () {
      // ignore: prefer_final_locals
      dynamic value = 55;
      final check = const IntNumberValidator().validate(value);
      expect(check, true);
    });
    test('checking wrong number', () {
      // ignore: prefer_final_locals
      dynamic value = 55.55;
      final check = const IntNumberValidator().validate(value);
      expect(check, isNot(true));
    });
  });
}
