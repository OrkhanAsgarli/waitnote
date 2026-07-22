// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_dao.dart';

// ignore_for_file: type=lint
mixin _$TableDaoMixin on DatabaseAccessor<AppDatabase> {
  $RestaurantTablesTable get restaurantTables =>
      attachedDatabase.restaurantTables;
  TableDaoManager get managers => TableDaoManager(this);
}

class TableDaoManager {
  final _$TableDaoMixin _db;
  TableDaoManager(this._db);
  $$RestaurantTablesTableTableManager get restaurantTables =>
      $$RestaurantTablesTableTableManager(
        _db.attachedDatabase,
        _db.restaurantTables,
      );
}
