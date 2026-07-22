// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_dao.dart';

// ignore_for_file: type=lint
mixin _$OrderItemDaoMixin on DatabaseAccessor<AppDatabase> {
  $RestaurantTablesTable get restaurantTables =>
      attachedDatabase.restaurantTables;
  $OrdersTable get orders => attachedDatabase.orders;
  $CategoriesTable get categories => attachedDatabase.categories;
  $ProductsTable get products => attachedDatabase.products;
  $OrderItemsTable get orderItems => attachedDatabase.orderItems;
  OrderItemDaoManager get managers => OrderItemDaoManager(this);
}

class OrderItemDaoManager {
  final _$OrderItemDaoMixin _db;
  OrderItemDaoManager(this._db);
  $$RestaurantTablesTableTableManager get restaurantTables =>
      $$RestaurantTablesTableTableManager(
        _db.attachedDatabase,
        _db.restaurantTables,
      );
  $$OrdersTableTableManager get orders =>
      $$OrdersTableTableManager(_db.attachedDatabase, _db.orders);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db.attachedDatabase, _db.categories);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db.attachedDatabase, _db.products);
  $$OrderItemsTableTableManager get orderItems =>
      $$OrderItemsTableTableManager(_db.attachedDatabase, _db.orderItems);
}
