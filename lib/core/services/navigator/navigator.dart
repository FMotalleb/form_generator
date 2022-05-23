import 'package:flutter/widgets.dart' show NavigatorState, RoutePredicate;
import 'package:get_it/get_it.dart';
import 'routes.dart' show AppRoutes;
export 'routes.dart' show AppRoutes;

abstract class AppRouteNavigator {
  static NavigatorState get _navigator => GetIt.I.get<NavigatorState>();

  static Future<T?> popAndPush<T extends Object?, TO extends Object?>(
    AppRoutes route, {
    TO? result,
    Object? arguments,
  }) =>
      _navigator.popAndPushNamed<T, TO>(
        route.pageRoute,
        arguments: arguments,
        result: result,
      );

  static Future<T?> push<T extends Object?>(
    AppRoutes route, {
    Object? arguments,
  }) =>
      _navigator.pushNamed(
        route.pageRoute,
        arguments: arguments,
      );

  static Future<T?> pushAndRemoveUntil<T extends Object?>(
    AppRoutes newRoute,
    RoutePredicate predicate, {
    Object? arguments,
  }) =>
      _navigator.pushNamedAndRemoveUntil(
        newRoute.pageRoute,
        predicate,
        arguments: arguments,
      );

  static Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    AppRoutes route, {
    TO? result,
    Object? arguments,
  }) =>
      _navigator.pushReplacementNamed(
        route.pageRoute,
        result: result,
        arguments: arguments,
      );

  static String restorablePopAndPush<T extends Object?, TO extends Object?>(
    AppRoutes route, {
    TO? result,
    Object? arguments,
  }) =>
      _navigator.restorablePopAndPushNamed(
        route.pageRoute,
        result: result,
        arguments: arguments,
      );

  static String restorablePush<T extends Object?>(
    AppRoutes route, {
    Object? arguments,
  }) =>
      _navigator.restorablePushNamed(
        route.pageRoute,
        arguments: arguments,
      );
  static String restorablePushAndRemoveUntil<T extends Object?>(
    AppRoutes newRoute,
    RoutePredicate predicate, {
    Object? arguments,
  }) =>
      _navigator.restorablePushNamedAndRemoveUntil(
        newRoute.pageRoute,
        predicate,
        arguments: arguments,
      );

  static String restorablePushReplacement<T extends Object?, TO extends Object?>(
    AppRoutes route, {
    TO? result,
    Object? arguments,
  }) =>
      _navigator.restorablePushReplacementNamed(
        route.pageRoute,
        result: result,
        arguments: arguments,
      );
}
