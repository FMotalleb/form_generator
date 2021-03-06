import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_generator/core/contracts/enums/form_enums/field_types.dart';

import 'package:form_generator/core/models_and_entities/entities/form_entities/field_entity.dart';
import 'package:form_generator/core/models_and_entities/entities/form_entities/form_entity.dart';
import 'package:form_generator/core/models_and_entities/models/form_models/form_model.dart';
import 'package:form_generator/features/add_form_page/data/repositories/form_manager_repo.dart';
import 'package:form_generator/features/add_form_page/presentation/bloc/add_form_page.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'blocs_high_level_test.mocks.dart';

@GenerateMocks([FormManagerRepository])
void main() {
  ///it will test bloc's events and states flow + usecases down to formManagerRepository and not the dataSource since it has it's own unit tests
  group("Testing AddFormPage's bloc", () {
    final mockedFormManager = MockFormManagerRepository();
    AddFormBloc addFormBlocBuilder() => AddFormBloc(
          formManager: mockedFormManager,
          initialLoad: false,
        );

    late FormFieldEntity fieldSample;
    late FormEntity formSample;
    final addedForms = <FormEntity>[];
    // ignore: prefer_function_declarations_over_variables
    late List<FormEntity> getForms;
    void register() {
      fieldSample = FormFieldEntity(
        id: 0,
        index: 0,
        error: 'test error',
        hint: 'test hint',
        internalValidators: '',
        type: FieldType.string,
        label: 'test label',
      );
      formSample = FormEntity(
        id: 0,
        index: 0,
        title: 'test title',
        description: 'test description',
        fields: [fieldSample],
      );
      getForms = [formSample];
      when(
        mockedFormManager.getAllForms(),
      ).thenAnswer((realInvocation) async => getForms);

      when(
        mockedFormManager.addForm(argThat(const TypeMatcher<FormEntity>())),
      ).thenAnswer((realInvocation) async {
        final form = realInvocation.positionalArguments[0] as FormEntity;
        getForms.add(form);
        addedForms.add(form);
      });

      when(
        mockedFormManager.deleteAllForms(),
      ).thenAnswer((realInvocation) async {
        getForms.clear();
      });

      when(
        mockedFormManager.updateForm(argThat(const TypeMatcher<FormEntity>())),
      ).thenAnswer((realInvocation) async {
        final passedForm = realInvocation.positionalArguments[0] as FormEntity;
        getForms[getForms.indexWhere((element) => element.id == passedForm.id)] = passedForm;
      });
      when(
        mockedFormManager.deleteForm(argThat(const TypeMatcher<FormEntity>())),
      ).thenAnswer((realInvocation) async {
        final passedForm = realInvocation.positionalArguments[0] as FormEntity;
        getForms.removeWhere((element) => element.id == passedForm.id);
      });
    }

    blocTest(
      'first state',
      setUp: register,
      build: addFormBlocBuilder,
      expect: () => [],
    );

    blocTest(
      'data loading from data source',
      build: addFormBlocBuilder,
      setUp: register,
      act: (AddFormBloc bloc) => bloc.add(const LoadDataFromDataBaseEvent()),
      expect: () => [
        const AddFormPageStateInitial(),
        AddFormPageStateValue(forms: getForms),
      ],
    );
    blocTest(
      'add data to from data source',
      build: addFormBlocBuilder,
      setUp: register,
      act: (AddFormBloc bloc) async {
        bloc.add(const LoadDataFromDataBaseEvent());
        await Future.delayed(const Duration(milliseconds: 150), () {
          bloc.add(const AddNewFormEvent());
        });
      },
      verify: (AddFormBloc bloc) {},
      expect: () => [
        const AddFormPageStateInitial(),
        AddFormPageStateValue(forms: [formSample]),
        AddFormPageStateValue(forms: getForms),
      ],
    );
    blocTest(
      'removing all forms from sources',
      build: addFormBlocBuilder,
      setUp: register,
      act: (AddFormBloc bloc) async {
        bloc.add(const LoadDataFromDataBaseEvent());
        await Future.delayed(const Duration(milliseconds: 150), () {
          bloc.add(const DeleteDataBaseEvent());
        });
        bloc.add(const LoadDataFromDataBaseEvent());
      },
      verify: (AddFormBloc bloc) {},
      expect: () => [
        const AddFormPageStateInitial(),
        AddFormPageStateValue(forms: [formSample]),
        const AddFormPageStateInitial(),
      ],
    );
    blocTest(
      'editing the data',
      build: addFormBlocBuilder,
      setUp: register,
      act: (AddFormBloc bloc) async {
        bloc.add(const LoadDataFromDataBaseEvent());
        await Future.delayed(const Duration(milliseconds: 150), () {
          final test = FormModel.fromEntity(formSample).copyWith(title: 'test title2');
          bloc.add(EditFormEvent(test));
        });
        bloc.add(const LoadDataFromDataBaseEvent());
      },
      expect: () => [
        const AddFormPageStateInitial(),
        AddFormPageStateValue(forms: [formSample]),
        const AddFormPageStateInitial(),
        AddFormPageStateValue(forms: getForms),
      ],
    );
    blocTest(
      'removing a form',
      build: addFormBlocBuilder,
      setUp: register,
      act: (AddFormBloc bloc) async {
        bloc.add(const LoadDataFromDataBaseEvent());
        await Future.delayed(const Duration(milliseconds: 150), () {
          bloc.add(RemoveSpecifiedFormEvent(formSample, forced: true));
        });
        bloc.add(const LoadDataFromDataBaseEvent());
      },
      expect: () => [
        const AddFormPageStateInitial(),
        AddFormPageStateValue(forms: [formSample]),
        const AddFormPageStateInitial(),
      ],
    );
  });
}
