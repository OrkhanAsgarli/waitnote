import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/database/providers/database_provider.dart';

final orderProvider =
    StreamProvider((ref) {
  final repository =
      ref.watch(orderRepositoryProvider);

  return repository.watchAll();
});