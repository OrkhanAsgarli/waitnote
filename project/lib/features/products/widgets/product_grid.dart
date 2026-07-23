import 'package:flutter/material.dart';

import '../../../data/database/app_database.dart';
import '../../../shared/widgets/layouts/responsive_grid.dart';
import 'product_card.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> products;

  final void Function(Product product)? onTap;
  final void Function(Product product)? onDelete;

  const ProductGrid({
    super.key,
    required this.products,
    this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveGrid(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];

        return ProductCard(
          product: product,
          onTap: () => onTap?.call(product),
          onDelete: () => onDelete?.call(product),
        );
      },
    );
  }
}