import '../database/app_database.dart';

class OrderSummary {
  final Order order;

  final RestaurantTable table;

  final int totalItems;

  final double totalAmount;

  const OrderSummary({
    required this.order,
    required this.table,
    required this.totalItems,
    required this.totalAmount,
  });
}