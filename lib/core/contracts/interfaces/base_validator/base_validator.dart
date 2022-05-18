abstract class IValidator<T, IT> {
  const IValidator();
  String get name;
  bool validate(IT input) {
    return extractValue(input) != null;
  }

  T? extractValue(IT input);
}
