// Mocks generated by Mockito 5.1.0 from annotations
// in form_generator/test/features/add_form_page/domain/usecases_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:form_generator/core/contracts/interfaces/base_usecases/base_usecase.dart'
    as _i6;
import 'package:form_generator/core/models_and_entities/entities/form_entities/form_entity.dart'
    as _i5;
import 'package:form_generator/features/add_form_page/data/repositories/form_manager_repo.dart'
    as _i3;
import 'package:hemend/object_controllers/data_snap_handler/data_snap_handler.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeDataSnapHandler_0<T> extends _i1.Fake
    implements _i2.DataSnapHandler<T> {}

/// A class which mocks [FormManagerRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockFormManagerRepository extends _i1.Mock
    implements _i3.FormManagerRepository {
  MockFormManagerRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get moduleName =>
      (super.noSuchMethod(Invocation.getter(#moduleName), returnValue: '')
          as String);
  @override
  _i4.Future<void> addForm(_i5.FormEntity? form) =>
      (super.noSuchMethod(Invocation.method(#addForm, [form]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> deleteForm(_i5.FormEntity? form) =>
      (super.noSuchMethod(Invocation.method(#deleteForm, [form]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<List<_i5.FormEntity>?> getAllForms() =>
      (super.noSuchMethod(Invocation.method(#getAllForms, []),
              returnValue: Future<List<_i5.FormEntity>?>.value())
          as _i4.Future<List<_i5.FormEntity>?>);
  @override
  _i4.Future<_i5.FormEntity?> getFormById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getFormById, [id]),
              returnValue: Future<_i5.FormEntity?>.value())
          as _i4.Future<_i5.FormEntity?>);
  @override
  _i4.Future<void> updateForm(_i5.FormEntity? form) =>
      (super.noSuchMethod(Invocation.method(#updateForm, [form]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> deleteAllForms() =>
      (super.noSuchMethod(Invocation.method(#deleteAllForms, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<_i2.DataSnapHandler<T>> executeRequest<T, R>(
          _i6.IUsecase<T, R>? usecase, R? params) =>
      (super.noSuchMethod(Invocation.method(#executeRequest, [usecase, params]),
              returnValue: Future<_i2.DataSnapHandler<T>>.value(
                  _FakeDataSnapHandler_0<T>()))
          as _i4.Future<_i2.DataSnapHandler<T>>);
}
