import 'dart:convert';

import 'package:education_system/account/domain/account.dart';
import 'package:education_system/sql/sqlTool.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';

final accountRepoProvider = Provider<accountRepo>((ref) {
  return accountRepo();
});

//藍圖
abstract class baseRepository<T> {
  Future<bool> insert(T data);
  Future<T?> fetch(int fid);
  Future<List<T>> fetchList();
  Future<bool> edit(T data);
  Future<bool> delete(int id);
}

class accountRepo extends baseRepository<accountData> {
  late Database db;
  static String dbName = 'accounts';
  static String get accountPath => 'dbaccount.db';
  static String get accountCreateSql => """
      create table $dbName(
        fid integer primary key autoincrement not null,
        InternetPhoto Text not null default '',
        name Text not null default '',
        account Text not null default '',
        password Text not null default '',
        identity Text not null default '',
        gender Text not null default '',
        mail Text not null default ''
      )
      """;
  accountRepo() {
    initRepo();
  }
  initRepo() async {
    db = await sqlTool.db(accountCreateSql, accountPath);
  }

  @override
  insert(accountData data) async {
    int id = await db.insert(
      dbName,
      data.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id == 0 ? false : true;
  }

  @override
  Future<accountData?> fetch(int fid) async {
    final jsons = await db.query(dbName, where: 'fid = ?', whereArgs: [fid]);
    final datas = jsons.map((e) => accountData.fromJson(e)).toList();
    return datas.isEmpty ? null : datas.first;
  }

  @override
  Future<List<accountData>> fetchList() async {
    final jsons = await db.query(dbName, orderBy: 'fid');
    final datas = jsons.map((e) => accountData.fromJson(e)).toList();
    return datas.isEmpty ? [] : datas;
  }

  @override
  edit(accountData data) async {
    int res = await db.update(dbName, data.toJson(), where: 'fid = ?', whereArgs: [data.fid]);

    return res == 0 ? false : true;
  }

  @override
  delete(int id) async {
    int res = await db.delete(dbName, where: 'fid = ?', whereArgs: [id]);
    return res == 0 ? false : true;
  }
}
