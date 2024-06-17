import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';
part 'account.g.dart';

enum identityEnum {
  @JsonValue('老師')
  teacher('老師'),
  @JsonValue('學生')
  student('學生');

  final String name;
  const identityEnum(this.name);
}

enum genderEnum {
  @JsonValue('男')
  male('男'),
  @JsonValue('女')
  female('女');

  final String name;
  const genderEnum(this.name);
}

@freezed
class accountData with _$accountData {
  factory accountData({
    int? fid,
    @Default('') String? InternetPhoto,
    required String name,
    required String account,
    required String password,
    required identityEnum identity,
    required genderEnum gender,
    @Default('') String? mail,
  }) = _accountData;

  factory accountData.fromJson(Map<String, dynamic> json) => _$accountDataFromJson(json);
}

class accountFn {
  static identityEnum getIdentityEnum(int index) {
    switch (index) {
      case 0:
        return identityEnum.teacher;
      case _:
        return identityEnum.student;
    }
  }

  static genderEnum getGenderEnum(int index) {
    switch (index) {
      case 0:
        return genderEnum.male;
      case _:
        return genderEnum.female;
    }
  }
}
