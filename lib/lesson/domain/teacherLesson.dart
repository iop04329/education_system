import 'package:education_system/account/domain/account.dart';
import 'package:education_system/lesson/domain/lesson.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'teacherLesson.freezed.dart';
part 'teacherLesson.g.dart';

@freezed
class teacherLesson with _$teacherLesson {
  factory teacherLesson({
    required int teacherId,
    required String name,
    required identityEnum identity,
    required List<lessonData> lessons,
  }) = _teacherLesson;

  factory teacherLesson.fromJson(Map<String, dynamic> json) => _$teacherLessonFromJson(json);
}
