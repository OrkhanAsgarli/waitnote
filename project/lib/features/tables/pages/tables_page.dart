import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/data/database/providers/database_provider.dart';

import '../../../shared/widgets/forms/app_search_bar.dart';
import '../../../shared/widgets/states/app_empty.dart';
import '../widgets/table_filter_chips.dart';
import '../widgets/table_grid.dart';
import '../dialogs/add_table_dialog.dart';
import '../../orders/pages/order_page.dart';

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



  @override
  Widget build(BuildContext context) {
    final tablesAsync = ref.watch(tableProvider);

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
  child: tablesAsync.when(
    loading: () => const Center(
      child: CircularProgressIndicator(),
    ),
    error: (e, _) => Center(
      child: Text(e.toString()),
    ),
    data: (tables) {
      final query = _searchController.text.toLowerCase();

      final filtered = tables.where((table) {
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

      if (filtered.isEmpty) {
        return const AppEmpty(
          title: "Masa tapılmadı",
        );
      }

      return TableGrid(
        tables: filtered,
          onEdit: (table) async {
    await showDialog(
      context: context,
      builder: (_) => AddTableDialog(
        table: table,
      ),
    );
  },
  onTap: (table) async {
  final repository = ref.read(orderRepositoryProvider);

  final order = await repository.openOrCreateOrder(
    table: table,
  );

  if (!context.mounted) return;

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => OrderPage(
        table: table,
        order: order,
      ),
    ),
  );
},
         onDelete: (table) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Masanı sil"),
        content: Text(
          "${table.name} silinsin?",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("Xeyr"),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text("Sil"),
          ),
        ],
      ),
    );

    if (result == true) {
      final repository =
          ref.read(tableRepositoryProvider);

      await repository.delete(table.id);
    }
  },
      );
    },
  ),
),
        ],
      ),
    );
  }
}