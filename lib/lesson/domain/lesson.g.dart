// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$lessonDataImpl _$$lessonDataImplFromJson(Map<String, dynamic> json) =>
    _$lessonDataImpl(
      fid: (json['fid'] as num?)?.toInt(),
      teacherId: (json['teacherId'] as num).toInt(),
      lessonName: json['lessonName'] as String? ?? '',
      weekNumber: $enumDecode(_$weekNumEnumEnumMap, json['weekNumber']),
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      lessonContent: json['lessonContent'] as String? ?? '',
    );

Map<String, dynamic> _$$lessonDataImplToJson(_$lessonDataImpl instance) =>
    <String, dynamic>{
      'fid': instance.fid,
      'teacherId': instance.teacherId,
      'lessonName': instance.lessonName,
      'weekNumber': _$weekNumEnumEnumMap[instance.weekNumber]!,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'lessonContent': instance.lessonContent,
    };

const _$weekNumEnumEnumMap = {
  weekNumEnum.Mon: '每週一',
  weekNumEnum.Tue: '每週二',
  weekNumEnum.Wed: '每週三',
  weekNumEnum.Thu: '每週四',
  weekNumEnum.Fri: '每週五',
  weekNumEnum.Sat: '每週六',
  weekNumEnum.Sun: '每週日',
};
