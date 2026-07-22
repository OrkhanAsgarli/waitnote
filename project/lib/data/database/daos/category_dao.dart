import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/categories.dart';
part 'category_dao.g.dart';

@DriftAccessor(tables: [Categories])
class CategoryDao extends DatabaseAccessor<AppDatabase>
    with _$CategoryDaoMixin {
  CategoryDao(AppDatabase db) : super(db);

  Stream<List<Category>> watchAll() {
    return (select(categories)
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .watch();
  }

  Future<List<Category>> getAll() {
    return (select(categories)
          ..orderBy([
            (t) => OrderingTerm.asc(t.name),
          ]))
        .get();
  }

  Future<Category?> getById(int id) {
    return (select(categories)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> insert(CategoriesCompanion category) {
    return into(categories).insert(category);
  }

  Future<bool> updateCategory(Category category) {
    return update(categories).replace(category);
  }

  Future<int> deleteById(int id) {
    return (delete(categories)
          ..where((t) => t.id.equals(id)))
        .go();
  }
}