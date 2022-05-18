import 'package:flutter_test/flutter_test.dart';
import 'package:form_generator/core/contracts/typedefs/form_enums/field_types.dart';
import 'package:form_generator/core/models_and_entities/entities/form_entities/field_entity.dart';
import 'package:form_generator/core/models_and_entities/entities/form_entities/form_entity.dart';
import 'package:form_generator/core/models_and_entities/models/form_models/field_model.dart';
import 'package:form_generator/core/models_and_entities/models/form_models/form_model.dart';

void main() {
  group('Testing Form/Field casters', () {
    late FormFieldEntity fieldSample;
    late FormEntity formSample;
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
      formSample = FormEntity(
        id: 0,
        index: 0,
        title: 'test title',
        description: 'test description',
        fields: {fieldSample},
      );
    });

    test('field casting', () {
      final fieldCasted = FormFieldModel.fromEntity(fieldSample).castToEntity();
      expect(fieldCasted, fieldSample);
      final isarFieldModel = FormFieldModel.fromEntity(fieldSample).castToIsarModel();
      expect(fieldSample, isarFieldModel.castToModel().castToEntity());
    });
    test('form casting', () {
      final formCasted = FormModel.fromEntity(formSample).castToEntity();
      expect(formCasted, formSample);
      final isarFormModel = FormModel.fromEntity(formSample).castToIsarModel();
      expect(formSample, isarFormModel.castToEntity());
    });

    test('field serializer', () {
      final serialized = FormFieldModel.fromEntity(fieldSample).toJson();
      final deserialized = FormFieldModel.fromJson(serialized).castToEntity();
      expect(deserialized, fieldSample);
    });
    test('form serializer', () {
      final serialized = FormModel.fromEntity(formSample).toJson();
      final deserialized = FormModel.fromJson(serialized).castToEntity();
      expect(formSample, deserialized);
    });
  });
}
