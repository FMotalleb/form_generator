// ignore_for_file: non_constant_identifier_names

import '../../base_contract.dart';
import '../../typedefs/request_result_types.dart';
import '../../typedefs/sub_map_types.dart';

abstract class IWebRequestHandler implements Contract {
  Future<ResponseJson> get(
    String path, {
    StringMap params,
  });
  Future<ResponseJson> post(
    String path, {
    Json data,
    StringMap params = const {},
  });
  Future<ResponseJson> put(
    String path, {
    Json data,
    StringMap params = const {},
  });
  Future<ResponseJson> delete(
    String path, {
    Json data,
    StringMap params = const {},
  });

  static String joinToUrl(List<String> items, {bool httpFlag = false}) {
    final buffer = StringBuffer();
    buffer.write(httpFlag ? 'http://' : 'https://');
    var isFirstRun = true;
    for (final i in items) {
      var holder = i.replaceAll('\\', '/');
      holder = holder.replaceAll('http://', '');
      holder = holder.replaceAll('https://', '');
      final spitted = holder.split('/');
      for (final s in spitted) {
        if (!isFirstRun && s.isNotEmpty) {
          buffer.write('/');
        } else {
          isFirstRun = false;
        }
        if (s.isNotEmpty) {
          buffer.write(s);
        }
      }
    }
    final result = buffer.toString();
    result.trimRight();
    return buffer.toString();
  }
}
