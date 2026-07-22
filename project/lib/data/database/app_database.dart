import 'package:drift/drift.dart';

import 'connection/database_connection.dart';
import 'enums.dart';
// Tables
import 'tables/categories.dart';
import 'tables/products.dart';
import 'tables/restaurant_tables.dart';
import 'tables/orders.dart';
import 'tables/order_items.dart';

// DAOs
import 'daos/category_dao.dart';
import 'daos/product_dao.dart';
import 'daos/table_dao.dart';
import 'daos/order_dao.dart';
import 'daos/order_item_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Categories,
    Products,
    RestaurantTables,
    Orders,
    OrderItems,
  ],
  daos: [
    CategoryDao,
    ProductDao,
    TableDao,
    OrderDao,
    OrderItemDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  @override
  int get schemaVersion => 1;

  // DAO Instances
  late final CategoryDao categoryDao = CategoryDao(this);
  late final ProductDao productDao = ProductDao(this);
  late final TableDao tableDao = TableDao(this);
  late final OrderDao orderDao = OrderDao(this);
  late final OrderItemDao orderItemDao = OrderItemDao(this);
}