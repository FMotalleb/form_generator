import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_generator/core/contracts/typedefs/form_enums/field_types.dart';
import 'package:form_generator/core/models_and_entities/entities/form_entities/field_entity.dart';
import 'package:form_generator/core/models_and_entities/entities/form_entities/form_entity.dart';
import 'package:form_generator/features/add_form_page/data/repositories/form_manager_repo.dart';
import 'package:form_generator/features/add_form_page/presentation/bloc/add_form_page.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'blocs_test.mocks.dart';

final mockedFormManager = MockFormManagerRepo();
AddFormBloc get addFormBloc => AddFormBloc(formManager: mockedFormManager, initialLoad: false);
@GenerateMocks([FormManagerRepo])
void main() {
  group("Testing Add Form Page's bloc", () {
    late FormFieldEntity fieldSample;
    late FormEntity formSample;
    // ignore: prefer_function_declarations_over_variables

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
    final formsList = [formSample];
    when(
      mockedFormManager.getAllForms(),
    ).thenAnswer((realInvocation) async => formsList);
    when(
      mockedFormManager.addForm(argThat(const TypeMatcher<FormEntity>())),
    ).thenAnswer((realInvocation) async {
      formsList.add(realInvocation.positionalArguments[0] as FormEntity);
    });

    blocTest(
      'check first state',
      // setUp: prerun,
      build: () => addFormBloc,
      expect: () => [],
    );

    blocTest(
      'check data loading from data source',
      build: () => addFormBloc,
      act: (AddFormBloc bloc) => bloc.add(const LoadDataFromDataBaseEvent()),
      expect: () => [
        const AddFormPageStateInitial(),
        AddFormPageStateValue(forms: formsList),
      ],
    );
    blocTest(
      'check add data to from data source',
      build: () => addFormBloc,
      act: (AddFormBloc bloc) async {
        bloc.add(const LoadDataFromDataBaseEvent());
        await Future.delayed(const Duration(milliseconds: 150), () {
          bloc.add(const AddNewFormEvent());
        });
      },
      verify: (AddFormBloc bloc) {},
      expect: () => [
        const AddFormPageStateInitial(),
        AddFormPageStateValue(forms: List.from(formsList)..removeLast()),
        AddFormPageStateValue(forms: formsList),
      ],
    );
  });
}
