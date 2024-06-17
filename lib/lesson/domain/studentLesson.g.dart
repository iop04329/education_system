// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'studentLesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$studentLessonImpl _$$studentLessonImplFromJson(Map<String, dynamic> json) =>
    _$studentLessonImpl(
      fid: (json['fid'] as num?)?.toInt(),
      studentId: (json['studentId'] as num).toInt(),
      lessonId: (json['lessonId'] as num).toInt(),
    );

Map<String, dynamic> _$$studentLessonImplToJson(_$studentLessonImpl instance) =>
    <String, dynamic>{
      'fid': instance.fid,
      'studentId': instance.studentId,
      'lessonId': instance.lessonId,
    };
