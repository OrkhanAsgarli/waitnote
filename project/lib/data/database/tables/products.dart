import 'package:drift/drift.dart';

import 'categories.dart';

class Products extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get categoryId =>
      integer().references(Categories, #id)();

  TextColumn get name =>
      text().withLength(min: 1, max: 150)();

  IntColumn get price => integer()();

  TextColumn get imagePath => text().nullable()();

  TextColumn get description => text().nullable()();

  BoolColumn get isAvailable =>
      boolean().withDefault(const Constant(true))();

  BoolColumn get isFavorite =>
      boolean().withDefault(const Constant(false))();

  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  IntColumn get displayOrder =>
      integer().withDefault(const Constant(0))();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();
}