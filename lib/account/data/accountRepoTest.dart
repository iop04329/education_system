import 'package:education_system/account/data/accountRepository.dart';
import 'package:education_system/account/domain/account.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class accountTestRepo extends baseRepository<accountData> {
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

  // accountTestRepo() {}

  @override
  Future<bool> insert(accountData data) async {
    int id = await db.insert(
      tableName,
      data.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id != 0;
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
  Future<bool> edit(accountData data) async {
    int res = await db.update(tableName, data.toJson(), where: 'fid = ?', whereArgs: [data.fid]);
    return res != 0;
  }

  @override
  Future<bool> delete(int id) async {
    int res = await db.delete(tableName, where: 'fid = ?', whereArgs: [id]);
    return res != 0;
  }
}
