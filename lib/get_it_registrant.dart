import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'core/contracts/enums/data_source_type/data_source_type.dart';
import 'core/contracts/interfaces/data_source/db_data_source_base.dart';
import 'core/models_and_entities/database_models/isar/isar_form_models/field_model.dart';
import 'core/models_and_entities/database_models/isar/isar_form_models/form_model.dart';
import 'core/models_and_entities/models/form_models/form_model.dart';
import 'core/services/state/theme_handler.dart';
import 'features/add_form_page/data/datasources/isar_form_db_data_source.dart';
import 'features/add_form_page/data/repositories/form_manager_repo.dart';
import 'features/add_form_page/domain/repositories/form_manager_interface.dart';
import 'generated/l10n.dart';

Future<void> registerDependencies() async {
  final localFormsDataSource = await createFormsDataSource();
  final formManagerRepo = FormManagerRepository(localFormsDataSource);
  final navigatorKey = createNavigatorKey();
  GetIt.I.registerSingleton(createThemeInstance());
  GetIt.I.registerSingleton<IDataSource<FormModel>>(
    localFormsDataSource,
    instanceName: DataSourceType.database.name,
  );
  GetIt.I.registerSingleton<FormManagerInterface>(
    formManagerRepo,
  );
  GetIt.I.registerFactory<GlobalKey<NavigatorState>>(() => navigatorKey);
  GetIt.I.registerFactory<BuildContext>(() => getCurrentContextOf(navigatorKey));
}

S get appLocalization => S.of(GetIt.I.get<BuildContext>());
BuildContext getCurrentContextOf(GlobalKey<NavigatorState> navigatorKey) => navigatorKey.currentState!.overlay!.context;
GlobalKey<NavigatorState> createNavigatorKey() => GlobalKey<NavigatorState>();
ThemeCubit createThemeInstance() => ThemeCubit();

Future<IDataSource<FormModel>> createFormsDataSource() async {
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
ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackbar(
  SnackBar snackBar, {
  BuildContext? context,
  bool removeIfExists = true,
}) {
  final currentContext = context ?? GetIt.I.get<BuildContext>();
  final scaffoldMessenger = ScaffoldMessenger.of(currentContext);
  if (removeIfExists) {
    scaffoldMessenger.hideCurrentSnackBar(reason: SnackBarClosedReason.remove);
  }
  return scaffoldMessenger.showSnackBar(snackBar);
}
