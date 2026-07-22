import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/mock_tables.dart';

final tableProvider =
    StateNotifierProvider<TableNotifier, List<MockTable>>(
  (ref) => TableNotifier(),
);

class TableNotifier extends StateNotifier<List<MockTable>> {
  TableNotifier() : super(mockTables);

  void addTable(MockTable table) {
    state = [...state, table];
  }

  void removeTable(int id) {
    state = state.where((t) => t.id != id).toList();
  }

  void updateTable(MockTable table) {
    state = [
      for (final t in state)
        if (t.id == table.id) table else t,
    ];
  }
}