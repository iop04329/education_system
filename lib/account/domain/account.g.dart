// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$accountDataImpl _$$accountDataImplFromJson(Map<String, dynamic> json) =>
    _$accountDataImpl(
      fid: (json['fid'] as num?)?.toInt(),
      InternetPhoto: json['InternetPhoto'] as String? ?? '',
      name: json['name'] as String,
      account: json['account'] as String,
      password: json['password'] as String,
      identity: $enumDecode(_$identityEnumEnumMap, json['identity']),
      gender: $enumDecode(_$genderEnumEnumMap, json['gender']),
      mail: json['mail'] as String? ?? '',
    );

Map<String, dynamic> _$$accountDataImplToJson(_$accountDataImpl instance) =>
    <String, dynamic>{
      'fid': instance.fid,
      'InternetPhoto': instance.InternetPhoto,
      'name': instance.name,
      'account': instance.account,
      'password': instance.password,
      'identity': _$identityEnumEnumMap[instance.identity]!,
      'gender': _$genderEnumEnumMap[instance.gender]!,
      'mail': instance.mail,
    };

const _$identityEnumEnumMap = {
  identityEnum.teacher: '老師',
  identityEnum.student: '學生',
};

const _$genderEnumEnumMap = {
  genderEnum.male: '男',
  genderEnum.female: '女',
};
