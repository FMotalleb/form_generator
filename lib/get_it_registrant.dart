import 'package:get_it/get_it.dart';

import 'core/services/io/web/request_handlers/http_request_handler.dart';

Future<void> registerDependencies() async {
  const baseUrl = 'http://0.0.0.0:3000';
  // const bypassHttps = false;
  // const headers = <String, String>{};
  const testApiUrl = '/api_test_zone/api_moke.php';

  final httpRequestHandler = HttpRequestHandler(
    baseUrl: baseUrl,
  );
  GetIt.I.registerSingleton(httpRequestHandler);
}
