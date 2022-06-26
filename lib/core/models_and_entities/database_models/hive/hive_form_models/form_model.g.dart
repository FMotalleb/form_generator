// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveFormModelAdapter extends TypeAdapter<HiveFormModel> {
  @override
  final int typeId = 0;

  @override
  HiveFormModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveFormModel(
      id: fields[0] as int,
      index: fields[1] as int,
      title: fields[2] as String,
      description: fields[3] as String,
      fields: (fields[4] as List).cast<FormFieldEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveFormModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.index)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.fields);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveFormModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
