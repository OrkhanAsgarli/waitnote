import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import 'stat_card.dart';
import '../../../data/models/dashboard_stats.dart';

class StatsGrid extends StatelessWidget {
  final DashboardStats stats;

  const StatsGrid({
    super.key,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.25,
      children: [
        StatCard(
          title: "Masalar",
          value: stats.totalTables.toString(),
          icon: Icons.table_restaurant,
          color: Colors.blue,
        ),
        StatCard(
          title: "Boş",
          value: stats.availableTables.toString(),
          icon: Icons.check_circle,
          color: AppColors.success,
        ),
        StatCard(
          title: "Dolu",
          value: stats.occupiedTables.toString(),
          icon: Icons.restaurant,
          color: AppColors.error,
        ),
        StatCard(
          title: "Aktiv sifariş",
          value: stats.activeOrdersCount.toString(),
          icon: Icons.receipt_long,
          color: Colors.orange,
        ),
        StatCard(
          title: "Bağlanmış",
          value: stats.closedOrdersCount.toString(),
          icon: Icons.task_alt,
          color: Colors.green,
        ),
      ],
    );
  }
}