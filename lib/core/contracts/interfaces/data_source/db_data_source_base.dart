abstract class BaseDataSource<T> {
  Future<void> write(T input);
  Future<void> update(T input);
  Future<void> deleteItem(int id);
  Future<void> deleteAllItems();
  Future<List<T>> getAllItems();
  Future<T?> getItemById(int id);
}
