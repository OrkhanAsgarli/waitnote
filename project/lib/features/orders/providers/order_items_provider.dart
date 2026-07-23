import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/database/app_database.dart';
import '../../../data/database/providers/database_provider.dart';

final orderItemsProvider =
    StreamProvider.family<List<OrderItem>, int>((ref, orderId) {
  final repository = ref.watch(orderItemRepositoryProvider);

  return repository.watchByOrder(orderId);
});