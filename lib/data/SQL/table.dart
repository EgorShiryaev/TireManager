import 'package:tire_manager/data/models/model.dart';

abstract class Table<T extends Model> {
  String get _title;

  List<String> get _columns;

  List<String> get _columnsTypes;

  String get createTableQuery {
    List<String> columnsWithTypes = [];
    for (var i = 0; i < _columns.length; i++) {
      columnsWithTypes.add([_columns[i], _columnsTypes[i]].join(' '));
    }
    String columnsForQuery = columnsWithTypes.join(', ');

    return 'CREATE TABLE $_title (id INTEGER PRIMARY KEY, $columnsForQuery)';
  }

  String createRawQuery(T entity) {
    return 'INSERT INTO $_title (${_columns.join(', ')}) VALUES (${entity.valuesForSql.join(', ')})';
  }

  String get readAllQuery => 'SELECT * FROM $_title';

  String updateRawQuery(T entity) {
    List<String> columnsWithValues = [];
    for (var i = 0; i < _columns.length; i++) {
      columnsWithValues.add([_columns[i], entity.valuesForSql[i]].join(' = '));
    }
    String columnsForQuery = columnsWithValues.join(', ');

    return 'UPDATE $_title SET $columnsForQuery WHERE id = ${entity.id}';
  }

  String deleteQuery(int id) {
    return 'DELETE FROM $_title WHERE id = $id';
  }
}
