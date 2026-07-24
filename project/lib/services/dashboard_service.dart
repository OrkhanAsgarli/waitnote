import '../data/models/dashboard_stats.dart';
import '../data/repositories/order_repository.dart';
import '../data/repositories/table_repository.dart';
import '../data/database/enums.dart';

class DashboardService {
  final TableRepository tableRepository;
  final OrderRepository orderRepository;

  DashboardService({
    required this.tableRepository,
    required this.orderRepository,
  });

Future<DashboardStats> load() async {
  final tables = await tableRepository.getAll();

  final orders = await orderRepository.getAll();

  final activeOrderList =
      await orderRepository.watchAllWithTables().first;

  final available =
      tables.where((e) => e.status == TableStatus.available).length;

  final occupied =
      tables.where((e) => e.status == TableStatus.occupied).length;

  final activeOrders =
      orders.where((e) => !e.isClosed).length;

  final closedOrders =
      orders.where((e) => e.isClosed).length;

  return DashboardStats(
    totalTables: tables.length,
    availableTables: available,
    occupiedTables: occupied,
    activeOrdersCount: activeOrders,
    closedOrdersCount: closedOrders,
    activeOrders: activeOrderList
        .where((e) => !e.order.isClosed)
        .toList(),
  );
}
}