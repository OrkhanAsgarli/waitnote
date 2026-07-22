import 'package:project/data/database/app_database.dart';
import 'package:project/data/database/daos/table_dao.dart';

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
}