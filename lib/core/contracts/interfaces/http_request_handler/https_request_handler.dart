// ignore_for_file: non_constant_identifier_names

import '../../base_contract.dart';
import '../../typedefs/request_result_types.dart';
import '../../typedefs/sub_map_types.dart';

abstract class IWebRequestHandler implements IContract {
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
}
