import 'package:flutter/material.dart';

import '../../../data/database/app_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/order_items_with_product_provider.dart';
import '../widgets/product_picker_bottom_sheet.dart';
import '../../../data/database/providers/database_provider.dart';
import 'package:drift/drift.dart' hide Column;

class OrderPage extends ConsumerWidget {
  final RestaurantTable table;
  final Order order;
  
  

  const OrderPage({
    super.key,
    required this.table,
    required this.order,
  });
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsAsync = ref.watch(
  orderItemsWithProductProvider(order.id)
);
    return Scaffold(
      appBar: AppBar(
        title: Text(table.name),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                "#${order.orderNumber}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: itemsAsync.when(
  loading: () => const Center(
    child: CircularProgressIndicator(),
  ),

  error: (e, _) => Center(
    child: Text(e.toString()),
  ),

data: (items) {
  final grandTotal = items.fold<int>(
    0,
    (sum, row) =>
        sum + row.item.unitPrice * row.item.quantity,
  );

  if (items.isEmpty) {
    return const Center(
      child: Text(
        "Bu masa üçün hələ məhsul əlavə edilməyib.",
      ),
    );
  }
    
return Column(
  children: [
    Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final row = items[index];

          final total =
              row.item.unitPrice * row.item.quantity;

        final repository = ref.read(orderItemRepositoryProvider);

return Card(
  margin: const EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 6,
  ),
  child: Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          row.product.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 12),

        Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.remove_circle,
                color: Colors.red,
              ),
              onPressed: () async {
                await repository.decreaseQuantity(
                  row.item,
                );
              },
            ),

            Text(
              "${row.item.quantity}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            IconButton(
              icon: const Icon(
                Icons.add_circle,
                color: Colors.green,
              ),
              onPressed: () async {
                await repository.increaseQuantity(
                  row.item,
                );
              },
            ),

            const Spacer(),

            Text(
              "${(total / 100).toStringAsFixed(2)} ₼",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    ),
  ),
);
        },
      ),
    ),

    Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: const Border(
          top: BorderSide(color: Colors.black12),
        ),
        color: Theme.of(context).cardColor,
      ),
      child: Row(
        children: [
          const Text(
            "Ümumi",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Text(
            "${(grandTotal / 100).toStringAsFixed(2)} ₼",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ],
      ),
    ),
  ],
);

  },
),
      floatingActionButton: FloatingActionButton(
       onPressed: () async {
  final product = await showModalBottomSheet<Product>(
    context: context,
    isScrollControlled: true,
    builder: (_) => const ProductPickerBottomSheet(),
  );

  if (product == null) return;

  final repository = ref.read(orderItemRepositoryProvider);

final existing = await repository.findByOrderAndProduct(
  order.id,
  product.id,
);

if (existing == null) {
  await repository.insert(
    OrderItemsCompanion.insert(
      orderId: order.id,
      productId: product.id,
      quantity: const Value(1),
      unitPrice: product.price,
    ),
  );
} else {
  await repository.update(
    existing.copyWith(
      quantity: existing.quantity + 1,
    ),
  );
}
},
        child: const Icon(Icons.add),
      ),
    );
  }
}