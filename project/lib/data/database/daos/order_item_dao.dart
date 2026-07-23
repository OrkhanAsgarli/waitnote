import 'package:drift/drift.dart';
import '../tables/order_items.dart';
import '../app_database.dart';
import '../tables/products.dart';
import '../../models/order_item_with_product.dart';
part 'order_item_dao.g.dart';


@DriftAccessor(
  tables: [
    OrderItems,
    Products,
    ],
 )
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
  Future<OrderItem?> findByOrderAndProduct(
  int orderId,
  int productId,
) {
  return (select(orderItems)
        ..where(
          (t) =>
              t.orderId.equals(orderId) &
              t.productId.equals(productId),
        ))
      .getSingleOrNull();
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
  Stream<List<OrderItemWithProduct>> watchByOrderWithProducts(
  int orderId,
) {
  final query = select(orderItems).join([
    innerJoin(
      products,
      products.id.equalsExp(orderItems.productId),
    ),
  ])
    ..where(orderItems.orderId.equals(orderId));

  return query.watch().map((rows) {
    return rows.map((row) {
      return OrderItemWithProduct(
        item: row.readTable(orderItems),
        product: row.readTable(products),
      );
    }).toList();
  });
}

  Future<int> deleteByOrder(int orderId) {
    return (delete(orderItems)
          ..where((t) => t.orderId.equals(orderId)))
        .go();
  }
}