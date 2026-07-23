import '../database/app_database.dart';
import '../database/daos/order_dao.dart';

class OrderRepository {
  final OrderDao _dao;

  OrderRepository(this._dao);

  Stream<List<Order>> watchAll() {
    return _dao.watchAll();
  }

  Future<List<Order>> getAll() {
    return _dao.getAll();
  }

  Future<int> insert(OrdersCompanion order) {
    return _dao.insert(order);
  }

  Future<bool> update(Order order) {
    return _dao.updateOrder(order);
  }

  Future<int> delete(int id) {
    return _dao.deleteById(id);
  }
Future<Order?> getActiveOrder(int tableId) {
  return _dao.getActiveOrder(tableId);
}
Future<Order> openOrCreateOrder({
  required RestaurantTable table,
}) async {
  final active = await _dao.getActiveOrder(table.id);

  if (active != null) {
    return active;
  }

  final orderId = await _dao.insert(
    OrdersCompanion.insert(
      orderNumber: DateTime.now().millisecondsSinceEpoch,
      tableId: table.id,
    ),
  );

  return (await _dao.getById(orderId))!;
}
}