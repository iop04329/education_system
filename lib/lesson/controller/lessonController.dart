import 'package:education_system/lesson/data/lessonRepository.dart';
import 'package:education_system/lesson/domain/lesson.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final lessonCtrProvider = Provider.autoDispose<lessonController>((ref) {
  final _lessonRepo = ref.watch(lessonRepoProvider);
  return lessonController(_lessonRepo, ref);
});
// final lesson2Provider = Provider<lessonController>((ref) {
//   return lessonController(ref.watch(lessonRepoProvider), ref);
// });

class lessonController {
  final lessonRepo _lessonRepo;
  final Ref _ref;
  lessonController(this._lessonRepo, this._ref);

  Future<List<lessonData>> fetchs() async {
    final accounts = await _lessonRepo.fetchList();
    return accounts;
  }

  Future<bool> insert(lessonData data) async {
    return await _lessonRepo.insert(data);
  }

  Future<bool> edit(lessonData data) async {
    return await _lessonRepo.edit(data);
  }

  Future<bool> delete(int id) async {
    return await _lessonRepo.delete(id);
  }
}
