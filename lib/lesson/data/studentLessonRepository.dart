import 'package:education_system/account/data/accountRepository.dart';
import 'package:education_system/lesson/domain/studentLesson.dart';
import 'package:education_system/lesson/domain/teacherLesson.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:education_system/sql/sqlTool.dart';

final studentLessonRepoProvider = Provider<studentLessonRepo>((ref) {
  return studentLessonRepo();
});

class studentLessonRepo extends baseRepository<studentLesson> {
  late Database db;
  static String dbName = 'studentLesson';
  static String get studentLessonPath => 'dbstudentLesson.db';
  static String get studentLessonCreateSql => """
      create table $dbName(
        fid integer primary key autoincrement not null,
        studentId integer not null default 0,
        lessonId integer not null default 0,
      )
      """;
  studentLessonRepo() {
    initRepo();
  }

  initRepo() async {
    db = await sqlTool.db(studentLessonCreateSql, studentLessonPath);
  }

  @override
  Future<bool> delete(int id) async {
    int res = await db.delete(dbName, where: 'fid = ?', whereArgs: [id]);
    return res == 0 ? false : true;
  }

  @override
  Future<bool> edit(studentLesson data) async {
    int res = await db.update(dbName, data.toJson(), where: 'fid = ?', whereArgs: [data.fid]);
    return res == 0 ? false : true;
  }

  @override
  Future<studentLesson?> fetch(int fid) async {
    final jsons = await db.query(dbName, where: 'fid = ?', whereArgs: [fid]);
    final datas = jsons.map((e) => studentLesson.fromJson(e)).toList();
    return datas.isEmpty ? null : datas.first;
  }

  @override
  Future<List<studentLesson>> fetchList() async {
    final jsons = await db.query(dbName, orderBy: 'fid');
    final datas = jsons.map((e) => studentLesson.fromJson(e)).toList();
    return datas.isEmpty ? [] : datas;
  }

  @override
  Future<bool> insert(studentLesson data) async {
    int id = await db.insert(
      dbName,
      data.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id == 0 ? false : true;
  }
}
