import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'core/models_and_entities/database_models/isar/isar_form_models/field_model.dart';
import 'core/models_and_entities/database_models/isar/isar_form_models/form_model.dart';
import 'core/services/state/theme_handler.dart';
import 'features/add_form_page/data/datasources/isar_form_db_data_source.dart';
import 'features/add_form_page/data/repositories/form_manager_repo.dart';
import 'features/add_form_page/domain/repositories/form_manager_interface.dart';
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
  GetIt.I.registerSingleton(ThemeCubit());
  final isarDbSchemas = [
    IsarFormFieldSchema,
    IsarFormModelSchema,
  ];
  if (kIsWeb) {
    final isar = await Isar.open(
      schemas: isarDbSchemas,
      relaxedDurability: false,
    );

    GetIt.I.registerSingleton(IsarFormDbDataSource(isar: isar));
  } else {
    final dir = await path_provider.getApplicationSupportDirectory();
    final isar = await Isar.open(
      schemas: isarDbSchemas,
      directory: dir.path,
    );
    GetIt.I.registerSingleton(IsarFormDbDataSource(isar: isar));
  }
  // GetIt.I.registerSingleton(IsarFormDbDataSource(isar: GetIt.I.get<Isar>()));
  GetIt.I.registerSingleton<FormManagerInterface>(
    FormManagerRepo(GetIt.I.get<IsarFormDbDataSource>()),
  );
  GetIt.I.registerSingleton<GlobalKey<NavigatorState>>(GlobalKey<NavigatorState>());
  GetIt.I.registerFactory<BuildContext>(() => GetIt.I.get<GlobalKey<NavigatorState>>().currentState!.overlay!.context);
}

Future<T?> noContextDialog<T>({
  required Widget Function(BuildContext) builder,
  bool barrierDismissible = true,
  Color? barrierColor = Colors.black54,
  String? barrierLabel,
  bool useSafeArea = true,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
  Offset? anchorPoint,
}) =>
    showDialog<T>(
      context: GetIt.I.get<BuildContext>(),
      builder: builder,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      useSafeArea: useSafeArea,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      anchorPoint: anchorPoint,
    );
ScaffoldFeatureController<SnackBar, SnackBarClosedReason> noContextSnackBar(SnackBar snackBar) =>
    ScaffoldMessenger.of(GetIt.I.get<BuildContext>()).showSnackBar(snackBar);
