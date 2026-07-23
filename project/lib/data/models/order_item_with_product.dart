import '../database/app_database.dart';

class OrderItemWithProduct {
  final OrderItem item;
  final Product product;

  const OrderItemWithProduct({
    required this.item,
    required this.product,
  });
}