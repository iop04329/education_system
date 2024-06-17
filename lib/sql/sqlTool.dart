import 'package:education_system/account/data/accountRepository.dart';
import 'package:education_system/lesson/data/lessonRepository.dart';
import 'package:education_system/lesson/data/studentLessonRepository.dart';
import 'package:sqflite/sqflite.dart';

class sqlTool {
  // static Future<Database> get db async => await open(dbName);
  static String get dbName => 'dbeducation.db';

  static Future<void> createTables(Database database, String sql) async {
    await database.execute(sql);
  }

  static Future<Database> open(String dbName) async {
    String path = '${await getDatabasesPath()}/$dbName';
    print(path);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(accountRepo.accountCreateSql);
        await db.execute(lessonRepo.lessonCreateSql);
        await db.execute(studentLessonRepo.studentLessonCreateSql);
        // createTables(db, accountRepo.accountCreateSql);
        // createTables(db, lessonRepo.lessonCreateSql);
        // createTables(db, studentLessonRepo.studentLessonCreateSql);
      },
    );
  }
}
