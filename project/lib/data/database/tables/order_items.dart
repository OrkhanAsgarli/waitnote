import 'package:drift/drift.dart';

import '../enums.dart';
import 'orders.dart';
import 'products.dart';

class OrderItems extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get orderId =>
      integer().references(Orders, #id)();

  IntColumn get productId =>
      integer().references(Products, #id)();

  IntColumn get quantity =>
      integer().withDefault(const Constant(1))();

  /// Qiymət qəpiklə saxlanılır.
  IntColumn get unitPrice => integer()();

  TextColumn get note => text().nullable()();

  IntColumn get status =>
    intEnum<OrderItemStatus>().withDefault(const Constant(0))();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();
}