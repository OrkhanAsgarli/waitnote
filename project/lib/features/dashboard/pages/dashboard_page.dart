import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/dashboard_provider.dart';
import '../widgets/stats_grid.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(dashboardProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: statsAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (e, _) => Center(
          child: Text(e.toString()),
        ),
        data: (stats) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StatsGrid(stats: stats),

                const SizedBox(height: 24),

                const Text(
                  "Açıq qalan masalar",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                if (stats.activeOrders.isEmpty)
                  const Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "Hazırda açıq masa yoxdur",
                      ),
                    ),
                  )
                else
                  ...stats.activeOrders.map(
                    (item) => Card(
                      child: ListTile(
                        leading: const Icon(
                          Icons.table_restaurant,
                        ),
                        title: Text(
                          "Masa ${item.table.name}",
                        ),
                        subtitle: Text(
                          "#${item.order.orderNumber}",
                        ),
                        trailing: const Icon(
                          Icons.chevron_right,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}