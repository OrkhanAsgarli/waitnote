import 'package:drift/drift.dart';

class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 100)();

  TextColumn get icon => text().withDefault(const Constant('fork_knife'))();

  IntColumn get color => integer().withDefault(const Constant(0xFF2196F3))();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();
}