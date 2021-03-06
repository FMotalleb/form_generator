import '../../base_contract.dart';

abstract class IDataSource<T> implements IContract {
  Future<void> write(T input);
  Future<void> update(T input);
  Future<void> deleteItem(T input);
  Future<void> deleteAllItems();
  Future<List<T>?> getAllItems();
  Future<T?> getItemById(int id);
}
