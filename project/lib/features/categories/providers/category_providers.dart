import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/database/app_database.dart';
import '../../../data/repositories/category_repository.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return CategoryRepository(db.categoryDao);
});

final categoriesProvider = StreamProvider<List<Category>>((ref) {
  final repository = ref.watch(categoryRepositoryProvider);
  return repository.watchAll();
});
final categoryControllerProvider = Provider((ref) {
  return ref.watch(categoryRepositoryProvider);
});