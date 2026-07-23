import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/order_with_table.dart';
import '../../../data/database/providers/database_provider.dart';

final ordersProvider =
    StreamProvider<List<OrderWithTable>>((ref) {
  final repository = ref.watch(orderRepositoryProvider);

  return repository.watchAllWithTables();
});