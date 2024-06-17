// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacherLesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$teacherLessonImpl _$$teacherLessonImplFromJson(Map<String, dynamic> json) =>
    _$teacherLessonImpl(
      teacherId: (json['teacherId'] as num).toInt(),
      name: json['name'] as String,
      identity: $enumDecode(_$identityEnumEnumMap, json['identity']),
      lessons: (json['lessons'] as List<dynamic>)
          .map((e) => lessonData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$teacherLessonImplToJson(_$teacherLessonImpl instance) =>
    <String, dynamic>{
      'teacherId': instance.teacherId,
      'name': instance.name,
      'identity': _$identityEnumEnumMap[instance.identity]!,
      'lessons': instance.lessons,
    };

const _$identityEnumEnumMap = {
  identityEnum.teacher: '老師',
  identityEnum.student: '學生',
};
