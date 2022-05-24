import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'core/contracts/enums/data_source_type/data_source_type.dart';
import 'core/contracts/interfaces/data_source/db_data_source_base.dart';
import 'core/models_and_entities/database_models/isar/isar_form_models/field_model.dart';
import 'core/models_and_entities/database_models/isar/isar_form_models/form_model.dart';
import 'core/models_and_entities/models/form_models/form_model.dart';
import 'core/services/state/theme_handler.dart';
import 'features/add_form_page/data/datasources/isar_form_db_data_source.dart';
import 'features/add_form_page/data/datasources/sqflite_form_data_source.dart';
import 'features/add_form_page/data/repositories/form_manager_repo.dart';
import 'features/add_form_page/domain/repositories/form_manager_interface.dart';

Future<void> registerDependencies() async {
  final localFormsDataSource = await _createSqfLiteFormsDataSource();
  final formManagerRepo = FormManagerRepository(localFormsDataSource);
  final navigatorKey = _createNavigatorKey();
  final themeQubit = _createThemeInstance();
  GetIt.I.registerSingleton<ThemeCubit>(
    themeQubit,
  );
  GetIt.I.registerSingleton<IDataSource<FormModel>>(
    localFormsDataSource,
    instanceName: DataSourceType.database.name,
  );
  GetIt.I.registerSingleton<IFormManager>(
    formManagerRepo,
  );
  GetIt.I.registerSingleton<GlobalKey<NavigatorState>>(
    navigatorKey,
  );
  GetIt.I.registerFactory<BuildContext>(
    () => _getCurrentContextOf(navigatorKey),
  );
  GetIt.I.registerFactory<NavigatorState>(
    () => Navigator.of(GetIt.I.get<BuildContext>()),
  );
}

BuildContext _getCurrentContextOf(GlobalKey<NavigatorState> navigatorKey) =>
    navigatorKey.currentState!.overlay!.context;
GlobalKey<NavigatorState> _createNavigatorKey() => GlobalKey<NavigatorState>();
ThemeCubit _createThemeInstance() => ThemeCubit();

Future<IDataSource<FormModel>> _createIsarFormsDataSource() async {
  final isarDbSchemas = [
    IsarFormFieldSchema,
    IsarFormModelSchema,
  ];
  if (kIsWeb) {
    final isar = await Isar.open(
      schemas: isarDbSchemas,
      relaxedDurability: false,
    );

    return IsarFormDbDataSource(isar: isar);
  } else {
    final dir = await path_provider.getApplicationSupportDirectory();
    final isar = await Isar.open(
      schemas: isarDbSchemas,
      directory: dir.path,
    );
    return IsarFormDbDataSource(isar: isar);
  }
}

Future<IDataSource<FormModel>> _createSqfLiteFormsDataSource() async {
  final databaseFactory = databaseFactoryFfi;
  final db = await databaseFactory.openDatabase('test.db');
  try {
    await db.execute(
      '''
CREATE TABLE forms (
    id INTEGER PRIMARY KEY,
    item_index INTEGER,
    title TEXT,
    description TEXT,
    form_id INTEGER
)
''',
    );
  } catch (e) {}
  try {
    await db.execute(
      '''
CREATE TABLE fields (
    id INTEGER PRIMARY KEY,
    item_index INTEGER,
    key TEXT,
    label TEXT,
    hint TEXT,
    error TEXT,
    internalValidators TEXT,
    type TEXT,
    form_id INTEGER
)
''',
    );
  } catch (e) {}

  // await db.close();
  return SqfLiteFormDataSource(db);
}
