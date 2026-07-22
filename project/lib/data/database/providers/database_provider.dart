import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/data/database/daos/table_dao.dart';

import '../app_database.dart';
import '../../repositories/table_repository.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

final tableDaoProvider = Provider<TableDao>((ref) {
  return ref.watch(databaseProvider).tableDao;
});

final tableRepositoryProvider = Provider<TableRepository>((ref) {
  return TableRepository(ref.watch(tableDaoProvider));
});