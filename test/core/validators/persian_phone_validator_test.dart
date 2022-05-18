import 'package:flutter_test/flutter_test.dart';
import 'package:form_generator/core/validators/persian_phone_validator.dart';
import 'package:hemend/external_libraries/http_requests/dio.dart';

void main() {
  group('Testing persian number validator', () {
    final combinations = ['', '0', '98', '+98', '+980', '0098', '098', '00980'];
    for (final i in combinations) {
      test('checking correct number with prefix : "$i"', () {
        final check = const PersianPhoneValidator().validate('${i}9111234431');
        expect(check, true);
      });
    }
    test('checking correct number as int', () {
      final check = const PersianPhoneValidator().validate(9351555555);
      expect(check, true);
    });

    final fails = [
      {
        'reason': 'length less than 10',
        'value': '0911223',
      },
      {
        'reason': 'char inside number',
        'value': '09112a34431',
      },
      {
        'reason': 'wrong string',
        'value': 'aabbsaafafs',
      },
      {
        'reason': 'wrong type',
        'value': Dio(),
      },
    ];
    for (final i in fails) {
      test('checking wrong string with ${i['reason']}', () {
        final check = const PersianPhoneValidator().validate(i['value']);
        expect(check, isNot(true));
      });
    }
  });
}
