import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/widgets/forms/app_search_bar.dart';
import '../../../shared/widgets/states/app_empty.dart';

import '../../../data/database/providers/database_provider.dart';

import '../providers/product_provider.dart';
import '../widgets/product_grid.dart';
import '../dialogs/add_product_dialog.dart';

class ProductsPage extends ConsumerStatefulWidget {
  const ProductsPage({super.key});

  @override
  ConsumerState<ProductsPage> createState() =>
      _ProductsPageState();
}

class _ProductsPageState
    extends ConsumerState<ProductsPage> {
  final _searchController =
      TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productsAsync =
        ref.watch(productProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Məhsullar"),
      ),

      floatingActionButton:
          FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) =>
                const AddProductDialog(),
          );
        },
        child: const Icon(Icons.add),
      ),

      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.all(16),
            child: AppSearchBar(
              controller: _searchController,
              onChanged: (_) {
                setState(() {});
              },
            ),
          ),

          Expanded(
            child: productsAsync.when(
              loading: () => const Center(
                child:
                    CircularProgressIndicator(),
              ),

              error: (e, _) =>
                  Center(child: Text("$e")),

              data: (products) {
                final query =
                    _searchController.text
                        .toLowerCase();

                final filtered =
                    products.where((p) {
                  return p.name
                      .toLowerCase()
                      .contains(query);
                }).toList();

                if (filtered.isEmpty) {
                  return const AppEmpty(
                    title:
                        "Məhsul tapılmadı",
                  );
                }

                return ProductGrid(
                  products: filtered,

                  onDelete:
                      (product) async {
                    final result =
                        await showDialog<
                            bool>(
                      context: context,
                      builder: (_) =>
                          AlertDialog(
                        title: const Text(
                            "Məhsulu sil"),
                        content: Text(
                          "${product.name} silinsin?",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () =>
                                Navigator.pop(
                                    context,
                                    false),
                            child: const Text(
                                "Xeyr"),
                          ),
                          FilledButton(
                            onPressed: () =>
                                Navigator.pop(
                                    context,
                                    true),
                            child:
                                const Text(
                                    "Sil"),
                          ),
                        ],
                      ),
                    );

                    if (result == true) {
                      final repository =
                          ref.read(
                        productRepositoryProvider,
                      );

                      await repository.delete(
                        product.id,
                      );
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