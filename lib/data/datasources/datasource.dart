import 'package:tire_manager/data/models/model.dart';
import 'package:tire_manager/presentation/providers/database_manager.dart';

import '../SQL/table.dart';

abstract class Datasource<T extends Model> {
  final DatabaseManager manager;
  final Table table;

  Datasource({required this.manager, required this.table});

  Future<List<T>> getAll();

  Future<void> edit(T entity) async {
    final result = await manager.update(table.updateRawQuery(entity));
    if (result != entity.id){
      throw;
    }
  }
}
