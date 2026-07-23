import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/database/providers/database_provider.dart';
import '../../../data/models/order_item_with_product.dart';

final orderItemsWithProductProvider =
    StreamProvider.family<List<OrderItemWithProduct>, int>(
  (ref, orderId) {
    final repository = ref.watch(orderItemRepositoryProvider);

    return repository.watchByOrderWithProducts(orderId);
  },
);