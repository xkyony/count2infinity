abstract class Repository<T> {
  Future<int> get fetchCount;
  Stream<List<T>> get watchList;
  Future<void> add(T model);
  Future<void> addAll(List<T> items);
  Future<void> delete(String id);
  Future<void> deleteAll();
  Future<T?> fetch(String id);
  Future<List<T>> fetchAll();
  Future<void> modify(T model);
  Future<void> seed(List<T> items);
  Stream<T?> watch(String id);
}
