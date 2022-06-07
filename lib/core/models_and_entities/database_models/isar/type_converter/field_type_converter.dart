import 'package:isar/isar.dart';

import '../../../../contracts/enums/form_enums/field_types.dart';

class FieldTypeConverter extends TypeConverter<FieldType, int> {
  const FieldTypeConverter();

  @override
  FieldType fromIsar(int FieldTypeIndex) {
    return FieldType.values[FieldTypeIndex];
  }

  @override
  int toIsar(FieldType FieldType) {
    return FieldType.index;
  }
}
