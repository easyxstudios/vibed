import 'package:vibed/modules/onboarding/api/entities/user_info_entity.dart';

enum UserInfoKeys {
  genre,
  age,
}

enum Genre {
  male,
  female,
  none,
}

enum AgeRange {
  age18_30,
  age31_40,
  age41_50,
  age51_60,
  none,
}

abstract class UserInfoDetail<T> {
  final T value;

  UserInfoDetail(this.value);

  UserInfoEntity toEntity();

  
}

/// ======================================
/// user age info
/// ======================================
class UserAgeInfo extends UserInfoDetail<AgeRange> {
  UserAgeInfo(super.value);

  factory UserAgeInfo.fromEntity(UserInfoEntity entity) {
    final value = AgeRange.values.firstWhere(
      (element) => element.name == entity.value,
      orElse: () => AgeRange.none,
    );
    return UserAgeInfo(value);
  }

  factory UserAgeInfo.fromString(String value) {
    final sexe = AgeRange.values.firstWhere(
      (element) => element.name == value,
      orElse: () => AgeRange.none,
    );
    return UserAgeInfo(sexe);
  }

  @override
  UserInfoEntity toEntity() => UserInfoEntity(
        key: UserInfoKeys.age.name,
        value: value.name,
      );
  
  
}

/// ======================================
/// user genre info
/// ======================================
class UserSexeInfo extends UserInfoDetail<Genre> {
  UserSexeInfo(super.value);

  factory UserSexeInfo.fromEntity(UserInfoEntity entity) {
    final value = Genre.values.firstWhere(
      (element) => element.name == entity.value,
      orElse: () => Genre.none,
    );
    return UserSexeInfo(value);
  }

  factory UserSexeInfo.fromString(String value) {
    final genre = Genre.values.firstWhere(
      (element) => element.name == value,
      orElse: () => Genre.none,
    );
    return UserSexeInfo(genre);
  }

  @override
  UserInfoEntity toEntity() => UserInfoEntity(
        key: UserInfoKeys.genre.name,
        value: value.name,
      );
  
  
}
