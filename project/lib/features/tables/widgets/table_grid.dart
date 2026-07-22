import 'package:flutter/material.dart';

import '../../../data/database/app_database.dart';
import '../../../shared/widgets/layouts/responsive_grid.dart';
import 'table_card.dart';

class TableGrid extends StatelessWidget {
  final List<RestaurantTable> tables;

  const TableGrid({
    super.key,
    required this.tables,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveGrid(
      itemCount: tables.length,
      itemBuilder: (context, index) {
        final table = tables[index];

        return TableCard(
          tableName: table.name,
          capacity: table.capacity,
          status: table.status,
          totalAmount: 0, // hələlik
          onTap: () {
            // TODO: Open Order Screen
          },
        );
      },
    );
  }
}