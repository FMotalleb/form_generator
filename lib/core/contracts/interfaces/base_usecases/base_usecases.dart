import 'package:equatable/equatable.dart';

import '../base_repository/base_repository.dart';

abstract class BaseUsecases<T, R> implements Equatable {
  BaseRepository get repository;
  Future<T> execute([R params]);
}
