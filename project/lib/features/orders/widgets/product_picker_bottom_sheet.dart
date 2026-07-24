import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/products/providers/product_provider.dart';
import '../../../data/database/app_database.dart';

class ProductPickerBottomSheet extends ConsumerStatefulWidget {
  const ProductPickerBottomSheet({super.key});

  @override
  ConsumerState<ProductPickerBottomSheet> createState() =>
      _ProductPickerBottomSheetState();
}

class _ProductPickerBottomSheetState
    extends ConsumerState<ProductPickerBottomSheet> {
  final TextEditingController _searchController =
      TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productsAsync = ref.watch(productProvider);

    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .80,
        child: Column(
          children: [
            const SizedBox(height: 12),

            Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(100),
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              "Məhsul seç",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _searchController,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: "Məhsul axtar...",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),

            Expanded(
              child: productsAsync.when(
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),

                error: (e, _) => Center(
                  child: Text(e.toString()),
                ),

                data: (products) {
                  final query = _searchController.text
                      .trim()
                      .toLowerCase();

                  final filtered = products.where((p) {
                    return p.name
                        .toLowerCase()
                        .contains(query);
                  }).toList();

                  if (filtered.isEmpty) {
                    return const Center(
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 70,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 12),
                          Text(
                            "Məhsul tapılmadı",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.only(
                      bottom: 20,
                    ),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final Product product =
                          filtered[index];

                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        elevation: 0,
                        child: ListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          leading: CircleAvatar(
                            radius: 24,
                            backgroundColor:
                                Colors.orange.shade100,
                            child: const Icon(
                              Icons.fastfood,
                              color: Colors.orange,
                            ),
                          ),
                          title: Text(
                            product.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Padding(
                            padding:
                                const EdgeInsets.only(
                              top: 4,
                            ),
                            child: Text(
                              "${(product.price / 100).toStringAsFixed(2)} ₼",
                              style: const TextStyle(
                                color: Colors.green,
                                fontWeight:
                                    FontWeight.w600,
                              ),
                            ),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                          ),
                          onTap: () {
                            Navigator.pop(
                              context,
                              product,
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}