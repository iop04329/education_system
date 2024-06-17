// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

lessonData _$lessonDataFromJson(Map<String, dynamic> json) {
  return _lessonData.fromJson(json);
}

/// @nodoc
mixin _$lessonData {
  int? get fid => throw _privateConstructorUsedError;
  int get teacherId => throw _privateConstructorUsedError;
  String get lessonName => throw _privateConstructorUsedError;
  weekNumEnum get weekNumber => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  String get lessonContent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $lessonDataCopyWith<lessonData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $lessonDataCopyWith<$Res> {
  factory $lessonDataCopyWith(
          lessonData value, $Res Function(lessonData) then) =
      _$lessonDataCopyWithImpl<$Res, lessonData>;
  @useResult
  $Res call(
      {int? fid,
      int teacherId,
      String lessonName,
      weekNumEnum weekNumber,
      DateTime startTime,
      DateTime endTime,
      String lessonContent});
}

/// @nodoc
class _$lessonDataCopyWithImpl<$Res, $Val extends lessonData>
    implements $lessonDataCopyWith<$Res> {
  _$lessonDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fid = freezed,
    Object? teacherId = null,
    Object? lessonName = null,
    Object? weekNumber = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? lessonContent = null,
  }) {
    return _then(_value.copyWith(
      fid: freezed == fid
          ? _value.fid
          : fid // ignore: cast_nullable_to_non_nullable
              as int?,
      teacherId: null == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as int,
      lessonName: null == lessonName
          ? _value.lessonName
          : lessonName // ignore: cast_nullable_to_non_nullable
              as String,
      weekNumber: null == weekNumber
          ? _value.weekNumber
          : weekNumber // ignore: cast_nullable_to_non_nullable
              as weekNumEnum,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lessonContent: null == lessonContent
          ? _value.lessonContent
          : lessonContent // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$lessonDataImplCopyWith<$Res>
    implements $lessonDataCopyWith<$Res> {
  factory _$$lessonDataImplCopyWith(
          _$lessonDataImpl value, $Res Function(_$lessonDataImpl) then) =
      __$$lessonDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? fid,
      int teacherId,
      String lessonName,
      weekNumEnum weekNumber,
      DateTime startTime,
      DateTime endTime,
      String lessonContent});
}

/// @nodoc
class __$$lessonDataImplCopyWithImpl<$Res>
    extends _$lessonDataCopyWithImpl<$Res, _$lessonDataImpl>
    implements _$$lessonDataImplCopyWith<$Res> {
  __$$lessonDataImplCopyWithImpl(
      _$lessonDataImpl _value, $Res Function(_$lessonDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fid = freezed,
    Object? teacherId = null,
    Object? lessonName = null,
    Object? weekNumber = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? lessonContent = null,
  }) {
    return _then(_$lessonDataImpl(
      fid: freezed == fid
          ? _value.fid
          : fid // ignore: cast_nullable_to_non_nullable
              as int?,
      teacherId: null == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as int,
      lessonName: null == lessonName
          ? _value.lessonName
          : lessonName // ignore: cast_nullable_to_non_nullable
              as String,
      weekNumber: null == weekNumber
          ? _value.weekNumber
          : weekNumber // ignore: cast_nullable_to_non_nullable
              as weekNumEnum,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lessonContent: null == lessonContent
          ? _value.lessonContent
          : lessonContent // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$lessonDataImpl implements _lessonData {
  _$lessonDataImpl(
      {this.fid,
      required this.teacherId,
      this.lessonName = '',
      required this.weekNumber,
      required this.startTime,
      required this.endTime,
      this.lessonContent = ''});

  factory _$lessonDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$lessonDataImplFromJson(json);

  @override
  final int? fid;
  @override
  final int teacherId;
  @override
  @JsonKey()
  final String lessonName;
  @override
  final weekNumEnum weekNumber;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  @JsonKey()
  final String lessonContent;

  @override
  String toString() {
    return 'lessonData(fid: $fid, teacherId: $teacherId, lessonName: $lessonName, weekNumber: $weekNumber, startTime: $startTime, endTime: $endTime, lessonContent: $lessonContent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$lessonDataImpl &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.teacherId, teacherId) ||
                other.teacherId == teacherId) &&
            (identical(other.lessonName, lessonName) ||
                other.lessonName == lessonName) &&
            (identical(other.weekNumber, weekNumber) ||
                other.weekNumber == weekNumber) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.lessonContent, lessonContent) ||
                other.lessonContent == lessonContent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fid, teacherId, lessonName,
      weekNumber, startTime, endTime, lessonContent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$lessonDataImplCopyWith<_$lessonDataImpl> get copyWith =>
      __$$lessonDataImplCopyWithImpl<_$lessonDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$lessonDataImplToJson(
      this,
    );
  }
}

abstract class _lessonData implements lessonData {
  factory _lessonData(
      {final int? fid,
      required final int teacherId,
      final String lessonName,
      required final weekNumEnum weekNumber,
      required final DateTime startTime,
      required final DateTime endTime,
      final String lessonContent}) = _$lessonDataImpl;

  factory _lessonData.fromJson(Map<String, dynamic> json) =
      _$lessonDataImpl.fromJson;

  @override
  int? get fid;
  @override
  int get teacherId;
  @override
  String get lessonName;
  @override
  weekNumEnum get weekNumber;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  String get lessonContent;
  @override
  @JsonKey(ignore: true)
  _$$lessonDataImplCopyWith<_$lessonDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
