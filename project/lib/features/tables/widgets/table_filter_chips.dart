import 'package:flutter/material.dart';

enum TableFilter {
  all,
  available,
  occupied,
  reserved,
}

class TableFilterChips extends StatelessWidget {
  final TableFilter selectedFilter;
  final ValueChanged<TableFilter> onSelected;

  const TableFilterChips({
    super.key,
    required this.selectedFilter,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _chip(
          label: "Hamısı",
          value: TableFilter.all,
        ),
        _chip(
          label: "Boş",
          value: TableFilter.available,
        ),
        _chip(
          label: "Dolu",
          value: TableFilter.occupied,
        ),
        _chip(
          label: "Rezerv",
          value: TableFilter.reserved,
        ),
      ],
    );
  }

  Widget _chip({
    required String label,
    required TableFilter value,
  }) {
    return FilterChip(
      label: Text(label),
      selected: selectedFilter == value,
      showCheckmark: false,
      onSelected: (_) => onSelected(value),
    );
  }
}