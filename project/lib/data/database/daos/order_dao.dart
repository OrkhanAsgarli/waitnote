import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/orders.dart';

part 'order_dao.g.dart';

@DriftAccessor(tables: [Orders])
class OrderDao extends DatabaseAccessor<AppDatabase>
    with _$OrderDaoMixin {
  OrderDao(AppDatabase db) : super(db);

  Stream<List<Order>> watchAll() {
    return (select(orders)
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .watch();
  }

  Future<List<Order>> getAll() {
    return (select(orders)
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .get();
  }

  Future<Order?> getById(int id) {
    return (select(orders)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  /// Aktiv sifarişi qaytarır
  Future<Order?> getActiveOrder(int tableId) {
    return (select(orders)
          ..where((o) =>
              o.tableId.equals(tableId) &
              o.isClosed.equals(false)))
        .getSingleOrNull();
  }

  Future<int> insert(OrdersCompanion order) {
    return into(orders).insert(order);
  }

  Future<bool> updateOrder(Order order) {
    return update(orders).replace(order);
  }

  Future<int> deleteById(int id) {
    return (delete(orders)
          ..where((t) => t.id.equals(id)))
        .go();
  }
}