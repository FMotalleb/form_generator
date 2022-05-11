// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';

import 'package:hemend/crash_handler/crash_handler.dart';
import 'package:http/http.dart' as _client;

import '../../../../contracts/interfaces/http_request_handler/https_request_handler.dart' show IWebRequestHandler;
import '../../../../contracts/typedefs/sub_map_types.dart' show Json, ResponseJson, StringMap;

class HttpRequestHandler extends IWebRequestHandler {
  ///can be list or jsonObject
  static dynamic _jsonParser(dynamic data) {
    final result = data as String;
    return jsonDecode(result);
  }

  final String baseUrl;
  final bool bypassHttps;
  final StringMap headers;
  HttpRequestHandler({
    this.baseUrl = '',
    this.headers = const {},
    this.bypassHttps = false,
  }) : assert(
          () {
            log('using http request interface');
            return true;
          }(),
        );
  @override
  Future<ResponseJson> get(
    String path, {
    StringMap params = const {},
  }) async {
    return await CrashHandler.instance.tryThis<dynamic>(() async {
      final uri = Uri.parse(
        IWebRequestHandler.joinToUrl(
          [baseUrl, path],
          httpFlag: bypassHttps,
        ),
      );
      uri.replace(queryParameters: params);
      final response = await _client.get(uri, headers: headers);
      return _jsonParser(response.body);
    });
  }

  @override
  Future<ResponseJson> delete(
    String path, {
    Json data = const {},
    StringMap params = const {},
  }) async {
    return await CrashHandler.instance.tryThis<dynamic>(() async {
      final uri = Uri.parse(
        IWebRequestHandler.joinToUrl(
          [baseUrl, path],
          httpFlag: bypassHttps,
        ),
      );
      uri.replace(queryParameters: params);
      final response = await _client.delete(
        uri,
        body: data,
        headers: headers,
      );
      return _jsonParser(response.body);
    });
  }

  @override
  Future<ResponseJson> post(
    String path, {
    Json data = const {},
    StringMap params = const {},
  }) async {
    return await CrashHandler.instance.tryThis<dynamic>(() async {
      final uri = Uri.parse(
        IWebRequestHandler.joinToUrl(
          [baseUrl, path],
          httpFlag: bypassHttps,
        ),
      );
      uri.replace(queryParameters: params);
      final response = await _client.post(
        uri,
        body: data,
        headers: headers,
      );
      return _jsonParser(
        response.body,
      );
    });
  }

  @override
  Future<ResponseJson> put(
    String path, {
    Json data = const {},
    StringMap params = const {},
  }) async {
    return await CrashHandler.instance.tryThis<dynamic>(() async {
      final uri = Uri.parse(
        IWebRequestHandler.joinToUrl(
          [baseUrl, path],
          httpFlag: bypassHttps,
        ),
      );
      uri.replace(queryParameters: params);
      final response = await _client.put(
        uri,
        body: data,
        headers: headers,
      );
      return _jsonParser(response.body);
    });
  }

  @override
  String get modelName => 'HttpRequestHandler';
}
