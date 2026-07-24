import 'package:rxdart/rxdart.dart';

import '../data/database/enums.dart';
import '../data/models/dashboard_stats.dart';
import '../data/repositories/order_repository.dart';
import '../data/repositories/table_repository.dart';

class DashboardService {
  final TableRepository tableRepository;
  final OrderRepository orderRepository;

  DashboardService({
    required this.tableRepository,
    required this.orderRepository,
  });

  Stream<DashboardStats> watchDashboard() {
    return Rx.combineLatest2(
      tableRepository.watchAll(),
      orderRepository.watchAllWithTables(),
      (tables, orders) {
        final available = tables
            .where((e) => e.status == TableStatus.available)
            .length;

        final occupied = tables
            .where((e) => e.status == TableStatus.occupied)
            .length;

        final activeOrders = orders
            .where((e) => !e.order.isClosed)
            .toList();

        final closedOrders = orders
            .where((e) => e.order.isClosed)
            .length;

        return DashboardStats(
          totalTables: tables.length,
          availableTables: available,
          occupiedTables: occupied,
          activeOrdersCount: activeOrders.length,
          closedOrdersCount: closedOrders,
          activeOrders: activeOrders,
        );
      },
    );
  }
}