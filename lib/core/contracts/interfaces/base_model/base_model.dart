// ignore_for_file: avoid_unused_constructor_parameters

import '../base_entity/base_entity.dart';

abstract class IModel extends IEntity {
  IModel castToIsarModel();
  IModel castToHiveModel();
  IEntity castToEntity();

  IModel();
  Map<String, dynamic> toMap();
  String toJson();

  factory IModel.fromMap(Map<String, dynamic> map) {
    throw UnimplementedError();
  }
  factory IModel.fromJson(String source) {
    throw UnimplementedError();
  }
  factory IModel.fromEntity(IEntity entity) {
    throw UnimplementedError();
  }
}
