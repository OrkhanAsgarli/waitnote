import 'package:flutter/material.dart';

import '../../../data/database/app_database.dart';
import '../../../shared/widgets/layouts/responsive_grid.dart';
import 'table_card.dart';

class TableGrid extends StatelessWidget {
  final List<RestaurantTable> tables;
  final void Function(RestaurantTable table)? onDelete;
  final void Function(RestaurantTable table)? onEdit;
  final void Function(RestaurantTable table)? onTap;

  const TableGrid({
    super.key,
    required this.tables,
    this.onDelete,
    this.onEdit,
    this.onTap,
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
  onEdit: () => onEdit?.call(table),
  onDelete: () => onDelete?.call(table),
  totalAmount: 0,
  onTap: () => onTap?.call(table),
);
      },
    );
  }
}