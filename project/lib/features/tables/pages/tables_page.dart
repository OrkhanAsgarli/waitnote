import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/widgets/forms/app_search_bar.dart';
import '../../../shared/widgets/states/app_empty.dart';
import '../data/mock_tables.dart';
import '../widgets/table_filter_chips.dart';
import '../widgets/table_grid.dart';
import '../dialogs/add_table_dialog.dart';

import '../providers/table_provider.dart';
import '../../../data/database/enums.dart';

class TablesPage extends ConsumerStatefulWidget {
  const TablesPage({super.key});

  @override
  ConsumerState<TablesPage> createState() => _TablesPageState();
}

class _TablesPageState extends ConsumerState<TablesPage> {
  final TextEditingController _searchController = TextEditingController();

  TableFilter _filter = TableFilter.all;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

List<MockTable> get filteredTables {
  final tables = ref.watch(tableProvider);
  final query = _searchController.text.toLowerCase();

  return tables.where((table) {
    final matchesSearch =
        table.name.toLowerCase().contains(query);

    final matchesFilter = switch (_filter) {
      TableFilter.all => true,
      TableFilter.available =>
          table.status == TableStatus.available,
      TableFilter.occupied =>
          table.status == TableStatus.occupied,
      TableFilter.reserved =>
          table.status == TableStatus.reserved,
    };

    return matchesSearch && matchesFilter;
  }).toList();
}

  @override
  Widget build(BuildContext context) {
    final tables = filteredTables;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Masalar"),
        centerTitle: false,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
  showDialog(
    context: context,
    builder: (_) => const AddTableDialog(),
  );
},
        child: const Icon(Icons.add),
      ),

      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.fromLTRB(
              16,
              16,
              16,
              8,
            ),
            child: AppSearchBar(
  controller: _searchController,
  onChanged: (_) {
    setState(() {});
  },
),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: TableFilterChips(
              selectedFilter: _filter,
              onSelected: (value) {
                setState(() {
                  _filter = value;
                });
              },
            ),
          ),

          const SizedBox(height: 16),

          Expanded(
            child: tables.isEmpty
                ? const AppEmpty(
                    title: "Masa tapılmadı",
                  )
                : TableGrid(
                    tables: tables,
                  ),
          ),
        ],
      ),
    );
  }
}