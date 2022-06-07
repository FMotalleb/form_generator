import 'package:hive/hive.dart';

import '../../../../core/contracts/interfaces/data_source/db_data_source_base.dart';
import '../../../../core/models_and_entities/database_models/hive/hive_form_models/form_model.dart';
import '../../../../core/models_and_entities/models/form_models/form_model.dart';

class HiveFormDataSource implements IDataSource<FormModel> {
  final Box<HiveFormModel> hive;

  HiveFormDataSource(this.hive);
  @override
  String get moduleName => 'hive forms dataSource';

  @override
  Future<void> deleteAllItems() {
    return hive.deleteAll(hive.keys);
  }

  @override
  Future<void> deleteItem(FormModel input) {
    final formItem = hive.values.firstWhere((element) => element.id == input.id);
    return hive.delete(formItem.key);
  }

  @override
  Future<List<FormModel>?> getAllItems() async {
    return hive.values.map((e) => e).toList();
  }

  @override
  Future<FormModel?> getItemById(int id) async {
    return hive.values.firstWhere((element) => element.id == id);
  }

  @override
  Future<void> update(FormModel input) {
    final oldItem = hive.values.firstWhere((element) => element.id == input.id);
    return hive.put(oldItem.key, input.castToHiveModel());
  }

  @override
  Future<void> write(FormModel input) {
    return hive.add(input.castToHiveModel());
  }
}
