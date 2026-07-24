import 'package:flutter/material.dart';

import '../../../data/models/order_with_table.dart';

class OrderCard extends StatelessWidget {
  final OrderWithTable data;
  final VoidCallback? onTap;

  const OrderCard({
    super.key,
    required this.data,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final order = data.order;
    final table = data.table;

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      child: ListTile(
        onTap: onTap,

        leading: CircleAvatar(
          child: Text(order.orderNumber.toString()),
        ),

        title: Text(
          "Masa ${table.name}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text("#${order.orderNumber}"),
            Text(
              order.isClosed
                  ? "⚫ Bağlanıb"
                  : "🟢 Açıq",
            ),
          ],
        ),

        trailing: Icon(
          order.isClosed
              ? Icons.check_circle
              : Icons.timelapse,
          color: order.isClosed
              ? Colors.green
              : Colors.orange,
        ),
      ),
    );
  }
}