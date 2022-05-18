import '../contracts/interfaces/base_validator/base_validator.dart';

class NumNumberValidator extends IValidator<num, dynamic> {
  const NumNumberValidator() : super();
  @override
  String get name => 'Num Number Validator';

  @override
  num? extractValue(dynamic input) {
    if (input is num) {
      return input;
    }
    if (input is String) {
      final numValue = num.tryParse(input);
      return numValue;
    }
    return null;
  }
}
