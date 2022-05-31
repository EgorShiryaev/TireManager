import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  final Database db;

  DatabaseManager({required this.db});

  Future<void> closeDB() async {
    await db.close();
  }
}
