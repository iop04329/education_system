// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacherLesson.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

teacherLesson _$teacherLessonFromJson(Map<String, dynamic> json) {
  return _teacherLesson.fromJson(json);
}

/// @nodoc
mixin _$teacherLesson {
  int get teacherId => throw _privateConstructorUsedError;
  set teacherId(int value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  String? get InternetPhoto => throw _privateConstructorUsedError;
  set InternetPhoto(String? value) => throw _privateConstructorUsedError;
  identityEnum get identity => throw _privateConstructorUsedError;
  set identity(identityEnum value) => throw _privateConstructorUsedError;
  List<lessonData> get lessons => throw _privateConstructorUsedError;
  set lessons(List<lessonData> value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $teacherLessonCopyWith<teacherLesson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $teacherLessonCopyWith<$Res> {
  factory $teacherLessonCopyWith(
          teacherLesson value, $Res Function(teacherLesson) then) =
      _$teacherLessonCopyWithImpl<$Res, teacherLesson>;
  @useResult
  $Res call(
      {int teacherId,
      String name,
      String? InternetPhoto,
      identityEnum identity,
      List<lessonData> lessons});
}

/// @nodoc
class _$teacherLessonCopyWithImpl<$Res, $Val extends teacherLesson>
    implements $teacherLessonCopyWith<$Res> {
  _$teacherLessonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teacherId = null,
    Object? name = null,
    Object? InternetPhoto = freezed,
    Object? identity = null,
    Object? lessons = null,
  }) {
    return _then(_value.copyWith(
      teacherId: null == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      InternetPhoto: freezed == InternetPhoto
          ? _value.InternetPhoto
          : InternetPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      identity: null == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as identityEnum,
      lessons: null == lessons
          ? _value.lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<lessonData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$teacherLessonImplCopyWith<$Res>
    implements $teacherLessonCopyWith<$Res> {
  factory _$$teacherLessonImplCopyWith(
          _$teacherLessonImpl value, $Res Function(_$teacherLessonImpl) then) =
      __$$teacherLessonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int teacherId,
      String name,
      String? InternetPhoto,
      identityEnum identity,
      List<lessonData> lessons});
}

/// @nodoc
class __$$teacherLessonImplCopyWithImpl<$Res>
    extends _$teacherLessonCopyWithImpl<$Res, _$teacherLessonImpl>
    implements _$$teacherLessonImplCopyWith<$Res> {
  __$$teacherLessonImplCopyWithImpl(
      _$teacherLessonImpl _value, $Res Function(_$teacherLessonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teacherId = null,
    Object? name = null,
    Object? InternetPhoto = freezed,
    Object? identity = null,
    Object? lessons = null,
  }) {
    return _then(_$teacherLessonImpl(
      teacherId: null == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      InternetPhoto: freezed == InternetPhoto
          ? _value.InternetPhoto
          : InternetPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      identity: null == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as identityEnum,
      lessons: null == lessons
          ? _value.lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<lessonData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$teacherLessonImpl implements _teacherLesson {
  _$teacherLessonImpl(
      {required this.teacherId,
      required this.name,
      this.InternetPhoto = '',
      required this.identity,
      required this.lessons});

  factory _$teacherLessonImpl.fromJson(Map<String, dynamic> json) =>
      _$$teacherLessonImplFromJson(json);

  @override
  int teacherId;
  @override
  String name;
  @override
  @JsonKey()
  String? InternetPhoto;
  @override
  identityEnum identity;
  @override
  List<lessonData> lessons;

  @override
  String toString() {
    return 'teacherLesson(teacherId: $teacherId, name: $name, InternetPhoto: $InternetPhoto, identity: $identity, lessons: $lessons)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$teacherLessonImplCopyWith<_$teacherLessonImpl> get copyWith =>
      __$$teacherLessonImplCopyWithImpl<_$teacherLessonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$teacherLessonImplToJson(
      this,
    );
  }
}

abstract class _teacherLesson implements teacherLesson {
  factory _teacherLesson(
      {required int teacherId,
      required String name,
      String? InternetPhoto,
      required identityEnum identity,
      required List<lessonData> lessons}) = _$teacherLessonImpl;

  factory _teacherLesson.fromJson(Map<String, dynamic> json) =
      _$teacherLessonImpl.fromJson;

  @override
  int get teacherId;
  set teacherId(int value);
  @override
  String get name;
  set name(String value);
  @override
  String? get InternetPhoto;
  set InternetPhoto(String? value);
  @override
  identityEnum get identity;
  set identity(identityEnum value);
  @override
  List<lessonData> get lessons;
  set lessons(List<lessonData> value);
  @override
  @JsonKey(ignore: true)
  _$$teacherLessonImplCopyWith<_$teacherLessonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
