// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_types.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FieldTypeAdapter extends TypeAdapter<FieldType> {
  @override
  final int typeId = 101;

  @override
  FieldType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return FieldType.number;
      case 1:
        return FieldType.select;
      case 2:
        return FieldType.string;
      case 3:
        return FieldType.NULL;
      default:
        return FieldType.number;
    }
  }

  @override
  void write(BinaryWriter writer, FieldType obj) {
    switch (obj) {
      case FieldType.number:
        writer.writeByte(0);
        break;
      case FieldType.select:
        writer.writeByte(1);
        break;
      case FieldType.string:
        writer.writeByte(2);
        break;
      case FieldType.NULL:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FieldTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
