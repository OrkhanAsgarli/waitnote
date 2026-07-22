import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/database/app_database.dart';
import '../../../data/repositories/table_repository.dart';
import '../../../data/database/providers/database_provider.dart';

final tableProvider =
    StreamProvider<List<RestaurantTable>>((ref) {
  final repository = ref.watch(tableRepositoryProvider);
  return repository.watchAll();
});