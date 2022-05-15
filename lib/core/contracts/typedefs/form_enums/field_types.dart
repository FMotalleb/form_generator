enum FieldType {
  int,
  double,
  select,
  string,
  // ignore: constant_identifier_names
  NULL;

  const FieldType();
  factory FieldType.fromMap(String item) {
    return FieldType.values.singleWhere(
      (element) => element.name == item,
      orElse: () => FieldType.NULL,
    );
  }
  String toMap() => name;
}
