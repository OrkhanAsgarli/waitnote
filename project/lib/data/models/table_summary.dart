import '../database/app_database.dart';

class TableSummary {
  final RestaurantTable table;

  final Order? activeOrder;

  final int productCount;

  /// AZN olaraq saxlayırıq
  final double totalAmount;

  const TableSummary({
    required this.table,
    required this.activeOrder,
    required this.productCount,
    required this.totalAmount,
  });

  bool get isOccupied => activeOrder != null;
}