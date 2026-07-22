import 'package:drift/drift.dart';

import 'connection/database_connection.dart';

import 'tables/categories.dart';
import 'tables/products.dart';
import 'tables/restaurant_tables.dart';
import 'tables/orders.dart';
import 'tables/order_items.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Categories,
    Products,
    RestaurantTables,
    Orders,
    OrderItems,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  @override
  int get schemaVersion => 1;
}