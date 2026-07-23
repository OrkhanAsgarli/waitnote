import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/data/database/daos/table_dao.dart';

import '../app_database.dart';
import '../../repositories/table_repository.dart';
import '../daos/order_dao.dart';
import '../../repositories/order_repository.dart';
import '../daos/order_item_dao.dart';
import '../../repositories/order_item_repository.dart';
import '../daos/product_dao.dart';
import '../../repositories/product_repository.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

final tableDaoProvider = Provider<TableDao>((ref) {
  return ref.watch(databaseProvider).tableDao;
});

final tableRepositoryProvider = Provider<TableRepository>((ref) {
  return TableRepository(ref.watch(tableDaoProvider));
});
final orderDaoProvider = Provider<OrderDao>((ref) {
  return ref.watch(databaseProvider).orderDao;
});

final orderRepositoryProvider =
    Provider<OrderRepository>((ref) {
  return OrderRepository(
    ref.watch(orderDaoProvider),
    ref.watch(tableRepositoryProvider),
  );
});
final orderItemDaoProvider = Provider<OrderItemDao>((ref) {
  return ref.watch(databaseProvider).orderItemDao;
});

final orderItemRepositoryProvider =
    Provider<OrderItemRepository>((ref) {
  return OrderItemRepository(
    ref.watch(orderItemDaoProvider),
  );
});
final productDaoProvider = Provider<ProductDao>((ref) {
  return ref.watch(databaseProvider).productDao;
});

final productRepositoryProvider =
    Provider<ProductRepository>((ref) {
  return ProductRepository(
    ref.watch(productDaoProvider),
  );
});