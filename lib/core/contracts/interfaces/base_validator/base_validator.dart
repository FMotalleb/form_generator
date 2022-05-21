import '../../base_contract.dart';

abstract class IValidator<T, IT> implements IContract {
  const IValidator();
  String get name;
  bool validate(IT input) {
    return extractValue(input) != null;
  }

  T? extractValue(IT input);
}
