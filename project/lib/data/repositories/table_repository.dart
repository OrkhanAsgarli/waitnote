import 'package:project/data/database/daos/table_dao.dart';
import '../database/enums.dart';
import '../database/app_database.dart';

class TableRepository {
  final TableDao _dao;

  TableRepository(this._dao);

  Stream<List<RestaurantTable>> watchAll() {
    return _dao.watchAll();
  }

  Future<List<RestaurantTable>> getAll() {
    return _dao.getAll();
  }

  Future<int> insert(RestaurantTablesCompanion table) {
    return _dao.insert(table);
  }

  Future<bool> update(RestaurantTable table) {
    return _dao.updateTable(table);
  }

  Future<int> delete(int id) {
    return _dao.deleteById(id);
  }
  
  Future<bool> updateStatus(
  int tableId,
  TableStatus status,
) {
  return _dao.updateStatus(
    tableId,
    status,
  );
}

}
