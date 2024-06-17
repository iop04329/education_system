import 'package:education_system/account/data/accountRepository.dart';
import 'package:education_system/account/domain/account.dart';
import 'package:education_system/lesson/domain/lesson.dart';
import 'package:education_system/lesson/domain/teacherLesson.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:education_system/sql/sqlTool.dart';

final lessonRepoProvider = Provider<lessonRepo>((ref) {
  return lessonRepo();
});

class lessonRepo extends baseRepository<lessonData> {
  late Database db;
  static String dbName = 'lessons';
  static String get lessonPath => 'dblesson.db';
  static String get lessonCreateSql => """
      create table $dbName(
        fid integer primary key autoincrement not null,
        teacherId integer not null default 0,
        lessonName Text not null default '',
        weekNumber Integer not null default 0,
        startTime text not null default getDate,
        endTime text not null default getDate,
        lessonContent Text not null default ''
      )
      """;
  lessonRepo() {
    initRepo();
  }

  initRepo() async {
    db = await sqlTool.db(lessonCreateSql, lessonPath);
  }

  @override
  Future<bool> delete(int id) async {
    int res = await db.delete(dbName, where: 'fid = ?', whereArgs: [id]);
    return res == 0 ? false : true;
  }

  @override
  Future<bool> edit(lessonData data) async {
    int res = await db.update(dbName, data.toJson(), where: 'fid = ?', whereArgs: [data.fid]);

    return res == 0 ? false : true;
  }

  @override
  Future<lessonData?> fetch(int fid) async {
    final jsons = await db.query(dbName, where: 'fid = ?', whereArgs: [fid]);
    final datas = jsons.map((e) => lessonData.fromJson(e)).toList();
    return datas.isEmpty ? null : datas.first;
  }

  @override
  Future<List<lessonData>> fetchList() async {
    final jsons = await db.query(dbName, orderBy: 'fid');
    final datas = jsons.map((e) => lessonData.fromJson(e)).toList();
    return datas.isEmpty ? [] : datas;
  }

  @override
  Future<bool> insert(lessonData data) async {
    int id = await db.insert(
      dbName,
      data.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id == 0 ? false : true;
  }

  Future<List<teacherLesson>> fetchTeacherLessonList() async {
    final List<Map<String, dynamic>> queryResults = await db.rawQuery('''
      ac.fid as teacherId,
      ac.name,
      ac.identity,
      ls.fid,
      ls.teacherId,
      ls.lessonName,
      ls.weekNumber,
      ls.startTime,
      ls.endTime,
      ls.lessonContent,
      FROM $dbName as ls
      LEFT JOIN accounts ac on ls.teacherId = ac.fid
      ''');
    final Map<int, teacherLesson> teacherMap = {};
    for (final row in queryResults) {
      final int teacherId = row['teacherId'];
      final String name = row['name'];
      final identityEnum identity = identityEnum.values.firstWhere((e) => e.toString().split('.').last == row['identity']);

      if (!teacherMap.containsKey(teacherId)) {
        teacherMap[teacherId] = teacherLesson(
          teacherId: teacherId,
          name: name,
          identity: identity,
          lessons: [],
        );
      }

      if (row['fid'] != null) {
        final lesson = lessonData(
          fid: row['fid'],
          teacherId: teacherId,
          lessonName: row['lessonName'],
          weekNumber: row['weekNumber'],
          startTime: DateTime.parse(row['startTime'] as String),
          endTime: DateTime.parse(row['endTime'] as String),
          lessonContent: row['lessonContent'],
        );

        teacherMap[teacherId]!.lessons.add(lesson);
      }
    }
    return teacherMap.values.toList();
  }
}
