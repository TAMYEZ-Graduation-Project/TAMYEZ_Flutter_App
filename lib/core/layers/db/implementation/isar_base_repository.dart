import 'package:isar_community/isar.dart'
    show Isar, IsarCollection, QueryExecute, QueryBuilder, QWhere;

import '../contracts/db_base_repository.dart';

abstract class IsarBaseRepository<T> implements DbBaseRepository<T> {
  late final Isar isar;
  late final IsarCollection<T> localCollection;

  IsarBaseRepository(this.isar, this.localCollection);

  // --- Create ---
  @override
  Future<List<int>> create(List<T> models) async {
    return isar.writeTxn(() async {
      return localCollection.putAll(models);
    });
  }

  // --- Read ---
  @override
  Future<T?> findById(int id) async => localCollection.get(id);

  @override
  Future<List<T>> findAll() async => localCollection.where().findAll();

  Future<List<T>> query(
    QueryBuilder<T, T, QWhere> Function(QueryBuilder<T, T, QWhere>) builder,
  ) async {
    final qb = builder(localCollection.where());
    return qb.findAll();
  }

  // --- Update (partial by id) ---
  @override
  Future<bool> updateById(int id, void Function(T current) mutate) async {
    return isar.writeTxn(() async {
      final current = await localCollection.get(id);
      if (current == null) return false;
      mutate(current);
      localCollection.put(current);
      return true;
    });
  }

  @override
  Future<int> updateManyByIds(
    List<int> ids,
    void Function(T current) mutate,
  ) async {
    return isar.writeTxn(() async {
      final items = await localCollection.getAll(ids);
      int updated = 0;
      for (final item in items) {
        if (item == null) continue;
        mutate(item);
        updated++;
      }
      if (updated > 0) {
        localCollection.putAll(items.whereType<T>().toList());
      }
      return updated;
    });
  }

  // --- Delete ---
  @override
  Future<bool> delete(int id) async {
    return isar.writeTxn(() async {
      return localCollection.delete(id);
    });
  }

  @override
  Future<int> deleteAll() async {
    return isar.writeTxn(() async {
      return localCollection.where().deleteAll();
    });
  }
}
