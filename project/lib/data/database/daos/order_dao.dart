import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/orders.dart';
import '../../models/order_with_table.dart';
import '../tables/restaurant_tables.dart';

part 'order_dao.g.dart';

@DriftAccessor(
  tables: [
    Orders,
    RestaurantTables,
    ],
    )
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
  Future<bool> closeOrder(int orderId) {
  return (update(orders)
        ..where((o) => o.id.equals(orderId)))
      .write(
        OrdersCompanion(
          isClosed: const Value(true),
          finishedAt: Value(DateTime.now()),
          updatedAt: Value(DateTime.now()),
        ),
      )
      .then((rows) => rows > 0);
}

Stream<List<OrderWithTable>> watchAllWithTables() {
  final query = select(orders).join([
    innerJoin(
      restaurantTables,
      restaurantTables.id.equalsExp(orders.tableId),
    ),
  ])
    ..orderBy([
      OrderingTerm.desc(orders.createdAt),
    ]);

  return query.watch().map((rows) {
    return rows.map((row) {
      return OrderWithTable(
        order: row.readTable(orders),
        table: row.readTable(restaurantTables),
      );
    }).toList();
  });
}
Future<Order?> getLastOrder() {
  return (select(orders)
        ..orderBy([
          (o) => OrderingTerm.desc(o.orderNumber),
        ])
        ..limit(1))
      .getSingleOrNull();
}
}