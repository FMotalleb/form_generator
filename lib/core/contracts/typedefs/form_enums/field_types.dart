import 'package:flutter/material.dart';

enum FieldType {
  int(Icons.onetwothree_rounded),
  double(Icons.onetwothree_rounded),
  select(Icons.radio_button_off),
  string(Icons.abc_rounded),
  // ignore: constant_identifier_names
  NULL(Icons.new_label);

  const FieldType(this.icon);
  factory FieldType.fromMap(String item) {
    return FieldType.values.singleWhere(
      (element) => element.name == item,
      orElse: () => FieldType.NULL,
    );
  }
  String toMap() => name;
  final IconData icon;
}
