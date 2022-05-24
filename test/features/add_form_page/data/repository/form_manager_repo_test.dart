import 'package:flutter_test/flutter_test.dart';
import 'package:form_generator/core/contracts/interfaces/data_source/db_data_source_base.dart';
import 'package:form_generator/core/models_and_entities/entities/form_entities/form_entity.dart';
import 'package:form_generator/core/models_and_entities/models/form_models/form_model.dart';
import 'package:form_generator/features/add_form_page/data/repositories/form_manager_repo.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'form_manager_repo_test.mocks.dart';

@GenerateMocks([IDataSource])
void main() {
  ///we need to verify method calls and we don't care about data
  group('Testing FormManager repository', () {
    final _dataSample = FormEntity(id: 0, index: 0);
    final _formDbDataSource = MockIDataSource<FormModel>();
    final _formManagerRepo = FormManagerRepository(_formDbDataSource);
    setUp(() {
      when(
        _formDbDataSource.getAllItems(),
      ).thenAnswer(
        (realInvocation) async => [],
      );
      when(
        _formDbDataSource.getItemById(argThat(const TypeMatcher<int>())),
      ).thenAnswer(
        (realInvocation) async => FormModel.fromEntity(_dataSample),
      );
    });
    test('checking addForm method', () async {
      await _formManagerRepo.addForm(_dataSample);
      verify(
        _formDbDataSource.write(
          argThat(isNotNull),
        ),
      );
    });

    test('checking deleteForm method', () async {
      await _formManagerRepo.deleteForm(_dataSample);
      verify(_formDbDataSource.deleteItem(argThat(isNotNull)));
    });
    test('checking getAllForms method', () async {
      await _formManagerRepo.getAllForms();
      verify(_formDbDataSource.getAllItems());
    });
    test('checking getFormById method', () async {
      await _formManagerRepo.getFormById(0);
      verify(_formDbDataSource.getItemById(argThat(isNotNull)));
    });
    test('checking updateForm method', () async {
      await _formManagerRepo.updateForm(_dataSample);
      verify(_formDbDataSource.update(argThat(isNotNull)));
    });
    test('checking deleteAll method', () async {
      await _formManagerRepo.deleteAllForms();
      verify(_formDbDataSource.deleteAllItems());
    });
  });
}
