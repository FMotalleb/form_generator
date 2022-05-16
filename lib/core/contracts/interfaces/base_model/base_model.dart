// ignore_for_file: avoid_unused_constructor_parameters

import '../base_entity/base_entity.dart';

abstract class BaseModel extends BaseEntity {
  BaseModel get asIsarModel;
  BaseEntity castToEntity();
  BaseModel();
  Map<String, dynamic> toMap();
  String toJson();
  factory BaseModel.fromMap(Map<String, dynamic> map) {
    throw UnimplementedError();
  }
  factory BaseModel.fromJson(String source) {
    throw UnimplementedError();
  }
  factory BaseModel.fromEntity(BaseEntity entity) {
    throw UnimplementedError();
  }
}
