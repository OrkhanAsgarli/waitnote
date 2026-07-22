import 'package:drift/drift.dart';
import '../tables/restaurant_tables.dart';
import '../app_database.dart';
part 'table_dao.g.dart';
@DriftAccessor(tables: [RestaurantTables])
class TableDao extends DatabaseAccessor<AppDatabase>
    with _$TableDaoMixin {
  TableDao(AppDatabase db) : super(db);

  Stream<List<RestaurantTable>> watchAll() {
    return (select(restaurantTables)
          ..orderBy([(t) => OrderingTerm.asc(t.displayOrder)]))
        .watch();
  }

  Future<List<RestaurantTable>> getAll() {
    return (select(restaurantTables)
          ..orderBy([(t) => OrderingTerm.asc(t.displayOrder)]))
        .get();
  }

  Future<int> insert(RestaurantTablesCompanion table) {
    return into(restaurantTables).insert(table);
  }

  Future<bool> updateTable(RestaurantTable table) {
    return update(restaurantTables).replace(table);
  }

  Future<int> deleteById(int id) {
    return (delete(restaurantTables)
          ..where((t) => t.id.equals(id)))
        .go();
  }
}