import 'package:hemend/object_controllers/data_snap_handler/data_snap_handler.dart';

import '../../base_contract.dart';

enum DataSourceType {
  network,
  asset,
  localStorage,
  sensor,
}

abstract class IIsolatedDataSourceRequestHandler<R, D> extends Contract {
  ///name of RequestHandler
  String get name;

  ///make request
  Future<DataSnapHandler<D>> invoke(
    R request,
  );
  DataSourceType get source;
  @override
  String toString() {
    return '$name works on ${source.name}';
  }
}
