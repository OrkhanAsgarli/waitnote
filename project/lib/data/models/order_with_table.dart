import '../database/app_database.dart';

class OrderWithTable {
  final Order order;
  final RestaurantTable table;

  const OrderWithTable({
    required this.order,
    required this.table,
  });
}