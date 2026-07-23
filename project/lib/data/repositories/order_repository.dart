import '../database/app_database.dart';
import '../database/daos/order_dao.dart';
import 'table_repository.dart';
import '../database/enums.dart';
import '../models/order_with_table.dart';

class OrderRepository {
final OrderDao _dao;
final TableRepository _tableRepository;

OrderRepository(
  this._dao,
  this._tableRepository,
);

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

final lastOrder = await _dao.getLastOrder();

final nextNumber =
    (lastOrder?.orderNumber ?? 0) + 1;

final orderId = await _dao.insert(
  OrdersCompanion.insert(
    orderNumber: nextNumber,
    tableId: table.id,
  ),
);

await _tableRepository.updateStatus(
  table.id,
  TableStatus.occupied,
);

return (await _dao.getById(orderId))!;
}
Future<bool> closeOrder(int orderId) async {
  final order = await _dao.getById(orderId);

  if (order == null) {
    return false;
  }

  final success = await _dao.closeOrder(orderId);

  if (success) {
    await _tableRepository.updateStatus(
      order.tableId,
      TableStatus.available,
    );
  }

  return success;
}
Stream<List<OrderWithTable>> watchAllWithTables() {
  return _dao.watchAllWithTables();
}
}

