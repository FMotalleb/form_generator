import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'core/models_and_entities/database_models/isar/isar_form_models/field_model.dart';
import 'core/models_and_entities/database_models/isar/isar_form_models/form_model.dart';
import 'core/services/io/database/isar/isar_db_data_source.dart';
// import 'core/services/io/web/request_handlers/http_request_handler.dart';

Future<void> registerDependencies() async {
  // const baseUrl = 'http://0.0.0.0:3000';
  // const bypassHttps = false;
  // const headers = <String, String>{};
  // const testApiUrl = '/api_test_zone/api_moke.php';

  // final httpRequestHandler = HttpRequestHandler(
  //   baseUrl: baseUrl,
  // );
  // GetIt.I.registerSingleton(httpRequestHandler);

  final isarDbSchemas = [
    IsarFormFieldSchema,
    IsarFormModelSchema,
  ];
  if (kIsWeb) {
    final isar = await Isar.open(
      schemas: isarDbSchemas,
    );

    GetIt.I.registerSingleton(IsarDbDataSource(isar: isar));
  } else {
    final dir = await path_provider.getApplicationSupportDirectory();
    final isar = await Isar.open(
      schemas: isarDbSchemas,
      directory: dir.path,
    );
    GetIt.I.registerSingleton(IsarDbDataSource(isar: isar));
  }
}
