import 'package:drift/drift.dart';
import '../tables/products.dart';
import '../app_database.dart';
part 'product_dao.g.dart';
@DriftAccessor(tables: [Products])
class ProductDao extends DatabaseAccessor<AppDatabase>
    with _$ProductDaoMixin {
  ProductDao(AppDatabase db) : super(db);

  Stream<List<Product>> watchAll() {
    return (select(products)
          ..orderBy([(t) => OrderingTerm.asc(t.name)]))
        .watch();
  }

  Future<List<Product>> getAll() {
    return (select(products)
          ..orderBy([(t) => OrderingTerm.asc(t.name)]))
        .get();
  }

  Future<Product?> getById(int id) {
    return (select(products)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> insert(ProductsCompanion product) {
    return into(products).insert(product);
  }

  Future<bool> updateProduct(Product product) {
    return update(products).replace(product);
  }

  Future<int> deleteById(int id) {
    return (delete(products)..where((t) => t.id.equals(id))).go();
  }
}