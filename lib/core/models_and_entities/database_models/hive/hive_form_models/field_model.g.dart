// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveFormFieldAdapter extends TypeAdapter<HiveFormField> {
  @override
  final int typeId = 1;

  @override
  HiveFormField read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveFormField(
      id: fields[0] as int,
      index: fields[1] as int,
      type: fields[3] as FieldType,
      label: fields[4] as String,
      hint: fields[5] as String,
      error: fields[6] as String,
      internalValidators: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveFormField obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.index)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.label)
      ..writeByte(5)
      ..write(obj.hint)
      ..writeByte(6)
      ..write(obj.error)
      ..writeByte(7)
      ..write(obj.internalValidators);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveFormFieldAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
