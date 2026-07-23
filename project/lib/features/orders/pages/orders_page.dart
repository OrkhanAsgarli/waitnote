import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/orders_provider.dart';
import '../widgets/order_card.dart';

class OrdersPage extends ConsumerWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersAsync = ref.watch(ordersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sifarişlər"),
      ),

      body: ordersAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),

        error: (e, _) => Center(
          child: Text(e.toString()),
        ),

        data: (orders) {
          if (orders.isEmpty) {
            return const Center(
              child: Text(
                "Hələ sifariş yoxdur",
              ),
            );
          }

          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final item = orders[index];

              return OrderCard(
                data: item,
                onTap: () {
                  // Sonra OrderPage açacağıq
                },
              );
            },
          );
        },
      ),
    );
  }
}