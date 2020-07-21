import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DbHelper {
  static Future<void> insert(Map<String, Object> data) async {
    final dbPath = await sql.getDatabasesPath();
    final sqlDb = await sql.openDatabase(
      path.join(dbPath, 'todo.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE TODO (id INTEGER PRIMARY KEY, title TEXT, isCompleted TEXT)');
      },
      version: 1,
    );

    await sqlDb.insert('TODO', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getTodo() async {
    final dbPath = await sql.getDatabasesPath();
    final sqlDb = await sql.openDatabase(
      path.join(dbPath, 'todo.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE TODO (id INTEGER PRIMARY KEY, title TEXT, isCompleted TEXT)');
      },
      version: 1,
    );

    return await sqlDb.query('TODO');
  }
}
