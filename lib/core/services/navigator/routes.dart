import 'package:flutter/material.dart';

import '../../../features/add_form_page/presentation/pages/add_form_page_view.dart';
import '../../../features/form_preview/presentation/pages/form_preview_main.dart';

enum AppRoutes {
  addFormPage(pageRoute: '/add_form_page', pageView: AddFormPage()),
  formPreview(pageRoute: '/add_form_page/preview_form', pageView: FormPreviewPage());

  const AppRoutes({required this.pageRoute, required this.pageView});
  final String pageRoute;
  final Widget pageView;

  @override
  String toString() {
    return pageRoute;
  }

  static AppRoutes initialRoute = AppRoutes.addFormPage;
}

final navigatorRoutes = Map.fromEntries(
  AppRoutes.values.map(
    (e) => MapEntry(
      e.pageRoute,
      (context) => e.pageView,
    ),
  ),
);
