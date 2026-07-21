import 'package:drift/drift.dart';

import '../enums.dart';

class RestaurantTables extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name =>
      text().withLength(min: 1, max: 50)();

  IntColumn get capacity =>
      integer().withDefault(const Constant(4))();

  IntColumn get displayOrder =>
      integer().withDefault(const Constant(0))();

  IntColumn get status =>
      intEnum<TableStatus>()
          .withDefault(const Constant(TableStatus.available))();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();
}