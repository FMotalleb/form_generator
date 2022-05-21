import '../contracts/interfaces/base_validator/base_validator.dart';

class IntNumberValidator extends IValidator<int, dynamic> {
  const IntNumberValidator() : super();

  @override
  String get name => 'Basic Number Validator';

  @override
  int? extractValue(dynamic input) {
    if (input is int) {
      return input;
    }
    if (input is String) {
      return int.tryParse(input);
    }
    return null;
  }

  @override
  String get moduleName => 'IntNumberValidator';
}
