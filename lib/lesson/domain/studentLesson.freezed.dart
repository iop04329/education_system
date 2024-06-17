// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'studentLesson.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

studentLesson _$studentLessonFromJson(Map<String, dynamic> json) {
  return _studentLesson.fromJson(json);
}

/// @nodoc
mixin _$studentLesson {
  int? get fid => throw _privateConstructorUsedError;
  int get studentId => throw _privateConstructorUsedError;
  int get lessonId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $studentLessonCopyWith<studentLesson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $studentLessonCopyWith<$Res> {
  factory $studentLessonCopyWith(
          studentLesson value, $Res Function(studentLesson) then) =
      _$studentLessonCopyWithImpl<$Res, studentLesson>;
  @useResult
  $Res call({int? fid, int studentId, int lessonId});
}

/// @nodoc
class _$studentLessonCopyWithImpl<$Res, $Val extends studentLesson>
    implements $studentLessonCopyWith<$Res> {
  _$studentLessonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fid = freezed,
    Object? studentId = null,
    Object? lessonId = null,
  }) {
    return _then(_value.copyWith(
      fid: freezed == fid
          ? _value.fid
          : fid // ignore: cast_nullable_to_non_nullable
              as int?,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int,
      lessonId: null == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$studentLessonImplCopyWith<$Res>
    implements $studentLessonCopyWith<$Res> {
  factory _$$studentLessonImplCopyWith(
          _$studentLessonImpl value, $Res Function(_$studentLessonImpl) then) =
      __$$studentLessonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? fid, int studentId, int lessonId});
}

/// @nodoc
class __$$studentLessonImplCopyWithImpl<$Res>
    extends _$studentLessonCopyWithImpl<$Res, _$studentLessonImpl>
    implements _$$studentLessonImplCopyWith<$Res> {
  __$$studentLessonImplCopyWithImpl(
      _$studentLessonImpl _value, $Res Function(_$studentLessonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fid = freezed,
    Object? studentId = null,
    Object? lessonId = null,
  }) {
    return _then(_$studentLessonImpl(
      fid: freezed == fid
          ? _value.fid
          : fid // ignore: cast_nullable_to_non_nullable
              as int?,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int,
      lessonId: null == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$studentLessonImpl implements _studentLesson {
  _$studentLessonImpl(
      {this.fid, required this.studentId, required this.lessonId});

  factory _$studentLessonImpl.fromJson(Map<String, dynamic> json) =>
      _$$studentLessonImplFromJson(json);

  @override
  final int? fid;
  @override
  final int studentId;
  @override
  final int lessonId;

  @override
  String toString() {
    return 'studentLesson(fid: $fid, studentId: $studentId, lessonId: $lessonId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$studentLessonImpl &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.lessonId, lessonId) ||
                other.lessonId == lessonId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fid, studentId, lessonId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$studentLessonImplCopyWith<_$studentLessonImpl> get copyWith =>
      __$$studentLessonImplCopyWithImpl<_$studentLessonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$studentLessonImplToJson(
      this,
    );
  }
}

abstract class _studentLesson implements studentLesson {
  factory _studentLesson(
      {final int? fid,
      required final int studentId,
      required final int lessonId}) = _$studentLessonImpl;

  factory _studentLesson.fromJson(Map<String, dynamic> json) =
      _$studentLessonImpl.fromJson;

  @override
  int? get fid;
  @override
  int get studentId;
  @override
  int get lessonId;
  @override
  @JsonKey(ignore: true)
  _$$studentLessonImplCopyWith<_$studentLessonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
