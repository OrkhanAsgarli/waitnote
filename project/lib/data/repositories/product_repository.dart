import '../database/app_database.dart';
import '../database/daos/product_dao.dart';

class ProductRepository {
  final ProductDao _dao;

  ProductRepository(this._dao);

  Stream<List<Product>> watchAll() {
    return _dao.watchAll();
  }

  Future<List<Product>> getAll() {
    return _dao.getAll();
  }

  Future<Product?> getById(int id) {
    return _dao.getById(id);
  }

  Future<int> insert(ProductsCompanion product) {
    return _dao.insert(product);
  }

  Future<bool> update(Product product) {
    return _dao.updateProduct(product);
  }

  Future<int> delete(int id) {
    return _dao.deleteById(id);
  }
}