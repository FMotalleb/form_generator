import 'package:flutter_test/flutter_test.dart';
import 'package:form_generator/core/validators/num_number_validator.dart';
import 'package:hemend/external_libraries/http_requests/dio.dart';

void main() {
  group('Testing number validator', () {
    test('checking correct string', () {
      final check = const NumNumberValidator().validate('55');
      expect(check, true);
    });
    test('checking correct string (floating point)', () {
      final check = const NumNumberValidator().validate('55.55');
      expect(check, true);
    });
    test('checking correct string (hex)', () {
      final check = const NumNumberValidator().validate('0x88');
      expect(check, true);
    });
    test('checking wrong string (wrong hex)', () {
      final check = const NumNumberValidator().validate('0xzz');
      expect(check, isNot(true));
    });
    test('checking wrong string (not a number)', () {
      final check = const NumNumberValidator().validate('abc');
      expect(check, isNot(true));
    });
    test('checking correct Double in dynamic', () {
      // ignore: prefer_final_locals
      dynamic value = 55;
      final check = const NumNumberValidator().validate(value);
      expect(check, true);
    });
    test('checking wrong number', () {
      // ignore: prefer_final_locals
      dynamic value = 55.55;
      final check = const NumNumberValidator().validate(value);
      expect(check, true);
    });
    test('checking wrong dynamic object', () {
      // ignore: prefer_final_locals
      dynamic value = Dio();
      final check = const NumNumberValidator().validate(value);
      expect(check, isNot(true));
    });
  });
}
