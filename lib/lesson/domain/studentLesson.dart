import 'package:freezed_annotation/freezed_annotation.dart';

part 'studentLesson.freezed.dart';
part 'studentLesson.g.dart';

@freezed
class studentLesson with _$studentLesson {
  factory studentLesson({
    int? fid,
    required int studentId,
    required int lessonId,
  }) = _studentLesson;

  factory studentLesson.fromJson(Map<String, dynamic> json) => _$studentLessonFromJson(json);
}
