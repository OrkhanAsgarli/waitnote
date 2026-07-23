import '../database/app_database.dart';
import '../database/daos/order_item_dao.dart';
import '../models/order_item_with_product.dart';

class OrderItemRepository {
  final OrderItemDao _dao;

  OrderItemRepository(this._dao);

  Stream<List<OrderItem>> watchAll() {
    return _dao.watchAll();
  }

  Stream<List<OrderItem>> watchByOrder(int orderId) {
    return _dao.watchByOrder(orderId);
  }

  Future<List<OrderItem>> getByOrder(int orderId) {
    return _dao.getByOrder(orderId);
  }

  Future<int> insert(OrderItemsCompanion item) {
    return _dao.insert(item);
  }

  Future<bool> update(OrderItem item) {
    return _dao.updateItem(item);
  }

  Future<int> delete(int id) {
    return _dao.deleteById(id);
  }

  Future<int> deleteByOrder(int orderId) {
    return _dao.deleteByOrder(orderId);
  }
  Stream<List<OrderItemWithProduct>> watchByOrderWithProducts(
  int orderId,
) {
  return _dao.watchByOrderWithProducts(orderId);
}
Future<OrderItem?> findByOrderAndProduct(
  int orderId,
  int productId,
) {
  return _dao.findByOrderAndProduct(
    orderId,
    productId,
  );
}
Future<void> increaseQuantity(OrderItem item) async {
  await update(
    item.copyWith(
      quantity: item.quantity + 1,
    ),
  );
}

Future<void> decreaseQuantity(OrderItem item) async {
  if (item.quantity <= 1) {
    await delete(item.id);
    return;
  }

  await update(
    item.copyWith(
      quantity: item.quantity - 1,
    ),
  );
}
}
