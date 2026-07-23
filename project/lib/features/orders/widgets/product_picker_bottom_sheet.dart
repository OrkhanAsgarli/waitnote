import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/products/providers/product_provider.dart';

class ProductPickerBottomSheet extends ConsumerWidget {
  const ProductPickerBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productProvider);

    return SafeArea(
      child: SizedBox(
        height: 500,
        child: productsAsync.when(
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),

          error: (e, _) => Center(
            child: Text(e.toString()),
          ),

          data: (products) {
            if (products.isEmpty) {
              return const Center(
                child: Text(
                  "Məhsul yoxdur",
                ),
              );
            }

            return ListView.separated(
              itemCount: products.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1),
              itemBuilder: (context, index) {
                final product = products[index];

                return ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.restaurant_menu),
                  ),

                  title: Text(product.name),

                  subtitle: Text(
                    "${(product.price / 100).toStringAsFixed(2)} ₼",
                  ),

                  trailing: const Icon(
                    Icons.add_circle_outline,
                  ),

                  onTap: () {
                    Navigator.pop(
                      context,
                      product,
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}