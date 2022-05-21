import 'package:flutter_test/flutter_test.dart';
import 'package:form_generator/core/models_and_entities/entities/form_entities/form_entity.dart';
import 'package:form_generator/features/add_form_page/data/repositories/form_manager_repo.dart';
import 'package:form_generator/features/add_form_page/domain/usecases/add_new_form_usecases.dart';
import 'package:form_generator/features/add_form_page/domain/usecases/delete_all_forms_usecases.dart';
import 'package:form_generator/features/add_form_page/domain/usecases/delete_form_usecases.dart';
import 'package:form_generator/features/add_form_page/domain/usecases/edit_form_usecases.dart';
import 'package:form_generator/features/add_form_page/domain/usecases/get_all_forms_usecases.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../presentation/bloc/blocs_test.dart';
import 'usecases_test.mocks.dart';

@GenerateMocks([FormManagerRepo])
void main() {
  group('Testing usecases', () {
    final _formManager = MockFormManagerRepo();
    final _dataSample = FormEntity(id: 0, index: 0);
    setUp(() {
      when(
        _formManager.getAllForms(),
      ).thenAnswer(
        (realInvocation) async => [],
      );
      when(
        _formManager.getFormById(argThat(equals(0))),
      ).thenAnswer(
        (realInvocation) async => null,
      );
    });

    test('delete all forms', () {
      final _deleteAllFormsUseCases = DeleteAllFormsUsecases(_formManager);
      _deleteAllFormsUseCases.execute();
      verify(_formManager.deleteAllForms());
    });
    test('add new form', () {
      final _addNewFormUseCases = AddNewFormUseCases(_formManager);
      _addNewFormUseCases.execute(_dataSample);
      verify(_formManager.addForm(argThat(isNotNull)));
    });
    test('delete specific forms', () {
      final _deleteFormUsecases = DeleteFormUsecases(_formManager);
      _deleteFormUsecases.execute(_dataSample);
      verify(_formManager.deleteForm(argThat(isNotNull)));
    });
    test('edit form usecases', () {
      final _editFormUsecases = EditFormUseCases(_formManager);
      _editFormUsecases.execute(_dataSample);
      verify(_formManager.updateForm(argThat(isNotNull)));
    });
    test('get all forms', () {
      final _editFormUsecases = GetAllItemsUsecases(_formManager);
      _editFormUsecases.execute();
      verify(_formManager.getAllForms());
    });

    test('add new form (error handling test)', () async {
      final _addNewFormUseCases = AddNewFormUseCases(_formManager);
      final _executionResult = await _addNewFormUseCases.execute();
      expect(_executionResult.hasException, true);
      verifyNever(_formManager.addForm(argThat(isNotNull)));
    });
    test('delete specific forms (error handling test)', () async {
      final _deleteFormUsecases = DeleteFormUsecases(_formManager);
      final _executionResult = await _deleteFormUsecases.execute();
      expect(_executionResult.hasException, true);
      verifyNever(_formManager.deleteForm(argThat(isNotNull)));
    });
    test('edit form usecases (error handling test)', () async {
      final _editFormUsecases = EditFormUseCases(_formManager);
      _editFormUsecases.execute();
      final _executionResult = await _editFormUsecases.execute();
      expect(_executionResult.hasException, true);
      verifyNever(_formManager.updateForm(argThat(isNotNull)));
    });
  });
}
