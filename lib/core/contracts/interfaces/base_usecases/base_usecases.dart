import 'package:equatable/equatable.dart';
import 'package:hemend/object_controllers/data_snap_handler/data_snap_handler.dart';

import '../base_repository/base_repository.dart';

abstract class IUsecases<T, R> implements Equatable {
  IRepository get repository;
  Future<DataSnapHandler<T>> execute([R params]);
}
