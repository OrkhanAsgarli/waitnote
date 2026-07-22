import 'package:flutter/material.dart';

import '../../../shared/widgets/layouts/responsive_grid.dart';
import '../data/mock_tables.dart';
import 'table_card.dart';

class TableGrid extends StatelessWidget {
  final List<MockTable> tables;

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
          totalAmount: table.total,
          onTap: () {
            // TODO: Open Order Screen
          },
        );
      },
    );
  }
}