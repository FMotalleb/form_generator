import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'field_types.g.dart';

@HiveType(typeId: 101)
enum FieldType {
  @HiveField(0)
  number(Icons.onetwothree_rounded),
  @HiveField(1)
  select(Icons.radio_button_off),
  @HiveField(2)
  string(Icons.abc_rounded),
  @HiveField(3)
  // ignore: constant_identifier_names
  NULL(Icons.text_snippet_outlined);

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
