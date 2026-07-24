import 'order_with_table.dart';

class DashboardStats {
  final int totalTables;

  final int availableTables;

  final int occupiedTables;

  final int activeOrdersCount;

  final int closedOrdersCount;

  final List<OrderWithTable> activeOrders;

  const DashboardStats({
    required this.totalTables,
    required this.availableTables,
    required this.occupiedTables,
    required this.activeOrdersCount,
    required this.closedOrdersCount,
    required this.activeOrders,
  });
}