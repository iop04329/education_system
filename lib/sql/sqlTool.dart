import 'package:sqflite/sqflite.dart';

class sqlTool {
  static Future<void> createTables(Database database, String sql) async {
    await database.execute(sql);
  }

  static Future<Database> db(String sql, String path) async {
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) => createTables(db, sql),
    );
  }
}
