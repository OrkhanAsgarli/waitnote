import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';

import '../providers/category_providers.dart';
import '../dialogs/add_category_dialog.dart';
import '../../../data/database/app_database.dart';
class CategoriesPage extends ConsumerWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoriesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Kateqoriyalar"),
      ),
      body: categories.when(
        data: (items) {
          if (items.isEmpty) {
            return const Center(
              child: Text("Hələ kateqoriya yoxdur"),
            );
          }

          return ListView.separated(
            itemCount: items.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final category = items[index];

              return ListTile(
                leading: const Icon(Icons.category),
                title: Text(category.name),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit_outlined),
                      onPressed: () {
                        // TODO: Edit dialog
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () {
                        // TODO: Delete dialog
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: Text(error.toString()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
  final name = await showDialog<String>(
    context: context,
    builder: (_) => const AddCategoryDialog(),
  );

  if (name == null || name.isEmpty) return;

  final repository = ref.read(categoryRepositoryProvider);

  await repository.insert(
    CategoriesCompanion.insert(
      name: name,
    ),
  );

  if (context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Kateqoriya əlavə olundu"),
      ),
    );
  }
},
        child: const Icon(Icons.add),
      ),
    );
  }
}