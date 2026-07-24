import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/database/providers/database_provider.dart';
import '../../../services/dashboard_service.dart';

final dashboardServiceProvider =
    Provider<DashboardService>((ref) {
  return DashboardService(
    tableRepository: ref.watch(tableRepositoryProvider),
    orderRepository: ref.watch(orderRepositoryProvider),
  );
});

final dashboardProvider =
    StreamProvider((ref) {
  return ref
      .watch(dashboardServiceProvider)
      .watchDashboard();
});