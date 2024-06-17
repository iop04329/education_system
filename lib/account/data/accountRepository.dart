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
  static String tableName = 'accounts';
  static String get accountCreateSql => """
      create table $tableName(
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
    db = await sqlTool.open(sqlTool.dbName);
  }

  @override
  insert(accountData data) async {
    int id = await db.insert(
      tableName,
      data.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id == 0 ? false : true;
  }

  @override
  Future<accountData?> fetch(int fid) async {
    final jsons = await db.query(tableName, where: 'fid = ?', whereArgs: [fid]);
    final datas = jsons.map((e) => accountData.fromJson(e)).toList();
    return datas.isEmpty ? null : datas.first;
  }

  @override
  Future<accountData?> login({String? account, String? password}) async {
    final jsons = await db.query(tableName, where: 'account = ? and password = ?', whereArgs: [account, password]);
    final datas = jsons.map((e) => accountData.fromJson(e)).toList();
    return datas.isEmpty ? null : datas.first;
  }

  @override
  Future<List<accountData>> fetchList() async {
    final jsons = await db.query(tableName, orderBy: 'fid');
    final datas = jsons.map((e) => accountData.fromJson(e)).toList();
    return datas.isEmpty ? [] : datas;
  }

  @override
  edit(accountData data) async {
    int res = await db.update(tableName, data.toJson(), where: 'fid = ?', whereArgs: [data.fid]);

    return res == 0 ? false : true;
  }

  @override
  delete(int id) async {
    int res = await db.delete(tableName, where: 'fid = ?', whereArgs: [id]);
    return res == 0 ? false : true;
  }
}
