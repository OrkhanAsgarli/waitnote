import 'package:drift/drift.dart';

import '../enums.dart';
import 'restaurant_tables.dart';

class Orders extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get orderNumber => integer()();

  IntColumn get tableId =>
      integer().references(RestaurantTables, #id)();

  TextColumn get note => text().nullable()();

  BoolColumn get isClosed =>
      boolean().withDefault(const Constant(false))();

  IntColumn get paymentStatus =>
    intEnum<PaymentStatus>().withDefault(const Constant(0))();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get finishedAt => dateTime().nullable()();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();
}