import 'package:flutter_test/flutter_test.dart';
import 'package:form_generator/core/models_and_entities/entities/form_entities/form_entity.dart';
import 'package:form_generator/features/add_form_page/data/repositories/form_manager_repo.dart';
import 'package:form_generator/features/add_form_page/domain/usecases/add_new_form_usecase.dart';
import 'package:form_generator/features/add_form_page/domain/usecases/delete_all_forms_usecase.dart';
import 'package:form_generator/features/add_form_page/domain/usecases/delete_form_usecase.dart';
import 'package:form_generator/features/add_form_page/domain/usecases/edit_form_usecase.dart';
import 'package:form_generator/features/add_form_page/domain/usecases/get_all_forms_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'usecases_test.mocks.dart';

@GenerateMocks([FormManagerRepository])
void main() {
  group('Testing usecases', () {
    final _formManager = MockFormManagerRepository();
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
      _deleteAllFormsUseCases.invoke();
      verify(_formManager.deleteAllForms());
    });
    test('add new form', () {
      final _addNewFormUseCases = AddNewFormUseCase(_formManager);
      _addNewFormUseCases.invoke(_dataSample);
      verify(_formManager.addForm(argThat(isNotNull)));
    });
    test('delete specific forms', () {
      final _deleteFormUsecases = DeleteFormUsecase(_formManager);
      _deleteFormUsecases.invoke(_dataSample);
      verify(_formManager.deleteForm(argThat(isNotNull)));
    });
    test('edit form usecases', () {
      final _editFormUsecases = EditFormUseCase(_formManager);
      _editFormUsecases.invoke(_dataSample);
      verify(_formManager.updateForm(argThat(isNotNull)));
    });
    test('get all forms', () {
      final _editFormUsecases = GetAllItemsUsecase(_formManager);
      _editFormUsecases.invoke();
      verify(_formManager.getAllForms());
    });

    test('add new form (error handling test)', () async {
      final _addNewFormUseCases = AddNewFormUseCase(_formManager);
      final _executionResult = await _addNewFormUseCases.invoke();
      expect(_executionResult.hasException, true);
      verifyNever(_formManager.addForm(argThat(isNotNull)));
    });
    test('delete specific forms (error handling test)', () async {
      final _deleteFormUsecases = DeleteFormUsecase(_formManager);
      final _executionResult = await _deleteFormUsecases.invoke();
      expect(_executionResult.hasException, true);
      verifyNever(_formManager.deleteForm(argThat(isNotNull)));
    });
    test('edit form usecases (error handling test)', () async {
      final _editFormUsecases = EditFormUseCase(_formManager);
      _editFormUsecases.invoke();
      final _executionResult = await _editFormUsecases.invoke();
      expect(_executionResult.hasException, true);
      verifyNever(_formManager.updateForm(argThat(isNotNull)));
    });
  });
}
