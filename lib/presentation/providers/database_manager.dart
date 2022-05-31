import 'package:sqflite/sqflite.dart';
import '../../data/SQL/table.dart';

class DatabaseManager {
  static const dbFileName = 'TireManager.db';

  static const List<Table> tables = [];

  static Future<Database> initDB() async {
    String databasePath = await getDatabasesPath();
    String path = '$databasePath/$dbFileName';
    return openDatabase(
      path,
      onCreate: (db, version) => tables.map(
        (e) => db.execute(e.createTableQuery),
      ),
    ).then((db) => db);
  }

  final Database? _database;

  DatabaseManager({required Database database}) : _database = database;

  Future<int> create(String sqlQuery) async {
    return _database!.rawInsert(sqlQuery);
  }

  Future<List<Map<String, Object?>>> read(String sqlQuery) async {
    return _database!.rawQuery(sqlQuery);
  }

  Future<int> update(String sqlQuery) async {
    return _database!.rawUpdate(sqlQuery);
  }

  Future<int> delete(String sqlQuery) async {
    return _database!.rawDelete(sqlQuery);
  }
}
