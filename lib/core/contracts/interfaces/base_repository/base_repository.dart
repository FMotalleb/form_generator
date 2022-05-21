import 'package:hemend/object_controllers/data_snap_handler/data_snap_handler.dart';

import '../../base_contract.dart';
import '../base_usecases/base_usecase.dart';

abstract class IRepository implements IContract {
  Future<DataSnapHandler<T>> executeRequest<T, R>(IUsecase<T, R> usecase, R params);
}
