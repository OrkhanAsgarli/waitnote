import 'package:drift/drift.dart';
import '../tables/order_items.dart';
import '../app_database.dart';
part 'order_item_dao.g.dart';

@DriftAccessor(tables: [OrderItems])
class OrderItemDao extends DatabaseAccessor<AppDatabase>
    with _$OrderItemDaoMixin {
  OrderItemDao(AppDatabase db) : super(db);

  Stream<List<OrderItem>> watchAll() {
    return select(orderItems).watch();
  }

  Stream<List<OrderItem>> watchByOrder(int orderId) {
    return (select(orderItems)
          ..where((t) => t.orderId.equals(orderId)))
        .watch();
  }

  Future<List<OrderItem>> getByOrder(int orderId) {
    return (select(orderItems)
          ..where((t) => t.orderId.equals(orderId)))
        .get();
  }

  Future<int> insert(OrderItemsCompanion item) {
    return into(orderItems).insert(item);
  }

  Future<bool> updateItem(OrderItem item) {
    return update(orderItems).replace(item);
  }

  Future<int> deleteById(int id) {
    return (delete(orderItems)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  Future<int> deleteByOrder(int orderId) {
    return (delete(orderItems)
          ..where((t) => t.orderId.equals(orderId)))
        .go();
  }
}