import 'package:equatable/equatable.dart';
import 'package:hemend/object_controllers/data_snap_handler/data_snap_handler.dart';

import '../../base_contract.dart';

abstract class IUsecase<T, R> implements Equatable, IContract {
  Future<DataSnapHandler<T>> invoke([R params]);
}
