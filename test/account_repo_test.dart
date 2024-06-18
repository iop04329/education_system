import 'package:education_system/account/data/accountRepoTest.dart';
import 'package:education_system/account/domain/account.dart';
import 'package:education_system/lesson/domain/lesson.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  // 使用 sqflite_ffi 初始化数据库
  sqfliteFfiInit();
  final databaseFactory = databaseFactoryFfi;

  late accountTestRepo repository;
  setUp(() async {
    final path = join('./', 'education_system.db');

    repository = accountTestRepo();
    repository.db = await databaseFactory.openDatabase(
      path,
      options: OpenDatabaseOptions(
        version: 1,
        onCreate: (db, version) async {
          await db.execute(accountTestRepo.accountCreateSql);
        },
      ),
    );
  });
  tearDown(() async {
    // final path = join('./', 'education_system.db');
    // await deleteDatabase(path);
  });

  test('Insert account data', () async {
    final account = accountData(
      fid: 2,
      InternetPhoto: '',
      name: 'Tim',
      account: 'Tim',
      password: 'password123',
      identity: identityEnum.teacher,
      gender: genderEnum.female,
      mail: 'Tim@example.com',
    );

    final result = await repository.insert(account);
    expect(result, true);
  });

  test('fetch accounts data', () async {
    final result = await repository.fetchList();
    print(result.length);
    expect(result.isNotEmpty, true);
  });

  test('model data test', () {
    final data = lessonData.fromJson({
      'teacherId': 1,
      'lessonName': 'ggg',
      'weekNumber': '每週六',
      'startTime': DateTime.now().toString(),
      'endTime': DateTime.now().toString(),
      'lessonContent': 'hhh',
    });
    print(data.toJson());
    expect(data.teacherId, 1);
  });
}
