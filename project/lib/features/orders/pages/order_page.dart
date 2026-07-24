import 'package:flutter/material.dart';

import '../../../data/database/app_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/database/enums.dart';
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
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.receipt_long,
            size: 70,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          const Text(
            "Bu masa üçün hələ məhsul əlavə edilməyib.",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),

          FilledButton.icon(
            icon: const Icon(Icons.add),
            label: const Text("Məhsul əlavə et"),
            onPressed: () async {
              final product = await showModalBottomSheet<Product>(
                context: context,
                isScrollControlled: true,
                builder: (_) => const ProductPickerBottomSheet(),
              );

              if (product == null) return;

              final repository =
                  ref.read(orderItemRepositoryProvider);

              final existing =
                  await repository.findByOrderAndProduct(
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
          ),
        ],
      ),
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
Row(
  children: [
    const CircleAvatar(
      radius: 22,
      child: Icon(Icons.fastfood),
    ),

    const SizedBox(width: 12),

    Expanded(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text(
            row.product.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            "${(row.item.unitPrice / 100).toStringAsFixed(2)} ₼ / ədəd",
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    ),
  ],
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

Container(
  padding: const EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 6,
  ),
  decoration: BoxDecoration(
    color: Colors.green.withOpacity(.1),
    borderRadius: BorderRadius.circular(10),
  ),
  child: Text(
    "${(total / 100).toStringAsFixed(2)} ₼",
    style: const TextStyle(
      color: Colors.green,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
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
  child: Column(
    children: [
      Row(
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

      const SizedBox(height: 16),
SizedBox(
  width: double.infinity,
  child: OutlinedButton.icon(
    icon: const Icon(Icons.add),
    label: const Text("Məhsul əlavə et"),
    onPressed: () async {
      final product =
          await showModalBottomSheet<Product>(
        context: context,
        isScrollControlled: true,
        builder: (_) =>
            const ProductPickerBottomSheet(),
      );

      if (product == null) return;

      final repository =
          ref.read(orderItemRepositoryProvider);

      final existing =
          await repository.findByOrderAndProduct(
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
  ),
),

const SizedBox(height: 12),
      SizedBox(
        width: double.infinity,
        child: FilledButton.icon(
          icon: const Icon(Icons.check_circle),
          label: const Text("Hesabı Bağla"),
          onPressed: () async {
            final orderRepository =
                ref.read(orderRepositoryProvider);

            final tableRepository =
                ref.read(tableRepositoryProvider);

            await orderRepository.closeOrder(order.id);

            await tableRepository.updateStatus(
              table.id,
              TableStatus.available,
            );

            if (context.mounted) {
              Navigator.pop(context);
            }
          },
        ),
      ),
    ],
  ),
)
  ],
);

  },
),
    );
  }
}