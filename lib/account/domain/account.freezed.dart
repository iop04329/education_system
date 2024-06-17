// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

accountData _$accountDataFromJson(Map<String, dynamic> json) {
  return _accountData.fromJson(json);
}

/// @nodoc
mixin _$accountData {
  int? get fid => throw _privateConstructorUsedError;
  String? get InternetPhoto => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get account => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  identityEnum get identity => throw _privateConstructorUsedError;
  genderEnum get gender => throw _privateConstructorUsedError;
  String? get mail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $accountDataCopyWith<accountData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $accountDataCopyWith<$Res> {
  factory $accountDataCopyWith(
          accountData value, $Res Function(accountData) then) =
      _$accountDataCopyWithImpl<$Res, accountData>;
  @useResult
  $Res call(
      {int? fid,
      String? InternetPhoto,
      String name,
      String account,
      String password,
      identityEnum identity,
      genderEnum gender,
      String? mail});
}

/// @nodoc
class _$accountDataCopyWithImpl<$Res, $Val extends accountData>
    implements $accountDataCopyWith<$Res> {
  _$accountDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fid = freezed,
    Object? InternetPhoto = freezed,
    Object? name = null,
    Object? account = null,
    Object? password = null,
    Object? identity = null,
    Object? gender = null,
    Object? mail = freezed,
  }) {
    return _then(_value.copyWith(
      fid: freezed == fid
          ? _value.fid
          : fid // ignore: cast_nullable_to_non_nullable
              as int?,
      InternetPhoto: freezed == InternetPhoto
          ? _value.InternetPhoto
          : InternetPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      identity: null == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as identityEnum,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as genderEnum,
      mail: freezed == mail
          ? _value.mail
          : mail // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$accountDataImplCopyWith<$Res>
    implements $accountDataCopyWith<$Res> {
  factory _$$accountDataImplCopyWith(
          _$accountDataImpl value, $Res Function(_$accountDataImpl) then) =
      __$$accountDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? fid,
      String? InternetPhoto,
      String name,
      String account,
      String password,
      identityEnum identity,
      genderEnum gender,
      String? mail});
}

/// @nodoc
class __$$accountDataImplCopyWithImpl<$Res>
    extends _$accountDataCopyWithImpl<$Res, _$accountDataImpl>
    implements _$$accountDataImplCopyWith<$Res> {
  __$$accountDataImplCopyWithImpl(
      _$accountDataImpl _value, $Res Function(_$accountDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fid = freezed,
    Object? InternetPhoto = freezed,
    Object? name = null,
    Object? account = null,
    Object? password = null,
    Object? identity = null,
    Object? gender = null,
    Object? mail = freezed,
  }) {
    return _then(_$accountDataImpl(
      fid: freezed == fid
          ? _value.fid
          : fid // ignore: cast_nullable_to_non_nullable
              as int?,
      InternetPhoto: freezed == InternetPhoto
          ? _value.InternetPhoto
          : InternetPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      identity: null == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as identityEnum,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as genderEnum,
      mail: freezed == mail
          ? _value.mail
          : mail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$accountDataImpl implements _accountData {
  _$accountDataImpl(
      {this.fid,
      this.InternetPhoto = '',
      required this.name,
      required this.account,
      required this.password,
      required this.identity,
      required this.gender,
      this.mail = ''});

  factory _$accountDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$accountDataImplFromJson(json);

  @override
  final int? fid;
  @override
  @JsonKey()
  final String? InternetPhoto;
  @override
  final String name;
  @override
  final String account;
  @override
  final String password;
  @override
  final identityEnum identity;
  @override
  final genderEnum gender;
  @override
  @JsonKey()
  final String? mail;

  @override
  String toString() {
    return 'accountData(fid: $fid, InternetPhoto: $InternetPhoto, name: $name, account: $account, password: $password, identity: $identity, gender: $gender, mail: $mail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$accountDataImpl &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.InternetPhoto, InternetPhoto) ||
                other.InternetPhoto == InternetPhoto) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.identity, identity) ||
                other.identity == identity) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.mail, mail) || other.mail == mail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fid, InternetPhoto, name,
      account, password, identity, gender, mail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$accountDataImplCopyWith<_$accountDataImpl> get copyWith =>
      __$$accountDataImplCopyWithImpl<_$accountDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$accountDataImplToJson(
      this,
    );
  }
}

abstract class _accountData implements accountData {
  factory _accountData(
      {final int? fid,
      final String? InternetPhoto,
      required final String name,
      required final String account,
      required final String password,
      required final identityEnum identity,
      required final genderEnum gender,
      final String? mail}) = _$accountDataImpl;

  factory _accountData.fromJson(Map<String, dynamic> json) =
      _$accountDataImpl.fromJson;

  @override
  int? get fid;
  @override
  String? get InternetPhoto;
  @override
  String get name;
  @override
  String get account;
  @override
  String get password;
  @override
  identityEnum get identity;
  @override
  genderEnum get gender;
  @override
  String? get mail;
  @override
  @JsonKey(ignore: true)
  _$$accountDataImplCopyWith<_$accountDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
