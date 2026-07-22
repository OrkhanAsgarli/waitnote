import '../database/app_database.dart';

class CategoryRepository {
  final CategoryDao _dao;

  CategoryRepository(this._dao);

  Stream<List<Category>> watchAll() {
    return _dao.watchAll();
  }

  Future<List<Category>> getAll() {
    return _dao.getAll();
  }

  Future<Category?> getById(int id) {
    return _dao.getById(id);
  }

  Future<int> insert(CategoriesCompanion category) {
    return _dao.insert(category);
  }

  Future<bool> update(Category category) {
    return _dao.updateCategory(category);
  }

  Future<int> delete(int id) {
    return _dao.deleteById(id);
  }
}