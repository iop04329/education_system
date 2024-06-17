import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson.freezed.dart';
part 'lesson.g.dart';

enum weekNumEnum {
  @JsonValue('每週一')
  Mon('每週一', 1),
  @JsonValue('每週二')
  Tue('每週二', 2),
  @JsonValue('每週三')
  Wed('每週三', 3),
  @JsonValue('每週四')
  Thu('每週四', 4),
  @JsonValue('每週五')
  Fri('每週五', 5),
  @JsonValue('每週六')
  Sat('每週六', 6),
  @JsonValue('每週日')
  Sun('每週日', 7);

  final String name;
  final int ind;
  const weekNumEnum(this.name, this.ind);
}

@freezed
class lessonData with _$lessonData {
  factory lessonData({
    int? fid,
    required int teacherId,
    @Default('') String lessonName,
    required weekNumEnum weekNumber,
    required DateTime startTime,
    required DateTime endTime,
    @Default('') String lessonContent,
  }) = _lessonData;

  factory lessonData.fromJson(Map<String, dynamic> json) => _$lessonDataFromJson(json);
}
