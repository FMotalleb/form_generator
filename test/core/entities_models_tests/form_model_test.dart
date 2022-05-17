import 'package:flutter_test/flutter_test.dart';
import 'package:form_generator/core/contracts/typedefs/form_enums/field_types.dart';
import 'package:form_generator/core/models_and_entities/entities/form_entities/field_entity.dart';
import 'package:form_generator/core/models_and_entities/models/form_models/field_model.dart';
import 'package:form_generator/core/models_and_entities/models/form_models/form_model.dart';

void main() {
  group('Testing Form Models', () {
    late FormFieldEntity fieldSample;
    late FormModel dataSample;
    setUp(() {
      fieldSample = FormFieldEntity(
        id: 0,
        index: 0,
        error: 'test error',
        hint: 'test hint',
        internalValidators: '',
        type: FieldType.string,
        key: 'test key',
        label: 'test label',
      );
      dataSample = FormModel(
        id: 0,
        index: 0,
        title: 'Sample',
        fields: {fieldSample},
      );
    });
    test('testing field serializer', () {
      final serialized = FormFieldModel.fromEntity(fieldSample).toJson();
      final deserialized = FormFieldModel.fromJson(serialized).castToEntity();
      expect(deserialized, fieldSample);
    });
    test('testing form serializer', () {
      final serialized = dataSample.toJson();
      final deserialized = FormModel.fromJson(serialized);
      expect(deserialized, dataSample);
    });
  });
}
