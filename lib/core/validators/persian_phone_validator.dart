import '../contracts/interfaces/base_validator/base_validator.dart';

class PersianPhoneValidator extends IValidator<String, dynamic> {
  const PersianPhoneValidator() : super();
  static const _persianNumberRegex = r'^(?:0|98|\+98|\+980|0098|098|00980)?(9\d{9})$';
  @override
  String? extractValue(dynamic input) {
    final stringValue = input.toString();
    if (stringValue.length >= 10) {
      if (RegExp(_persianNumberRegex).hasMatch(stringValue)) {
        final resultValue = stringValue.substring(stringValue.length - 10, stringValue.length);
        return '0$resultValue';
      }
    }
    return null;
  }

  @override
  String get name => 'Persian Phone Number Validator';
}
