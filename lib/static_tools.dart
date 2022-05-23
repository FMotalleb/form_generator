import 'package:flutter/material.dart'
    show
        BuildContext,
        Color,
        Colors,
        NavigatorState,
        Offset,
        RouteSettings,
        ScaffoldFeatureController,
        ScaffoldMessenger,
        SnackBar,
        SnackBarClosedReason,
        Widget,
        showDialog;
import 'package:get_it/get_it.dart' show GetIt;
import 'generated/l10n.dart' show S;

S get appLocalization => S.of(GetIt.I.get<BuildContext>());
NavigatorState get noContextNavigator => GetIt.I.get<NavigatorState>();
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
ScaffoldFeatureController<SnackBar, SnackBarClosedReason> noContextSnackbar(
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
