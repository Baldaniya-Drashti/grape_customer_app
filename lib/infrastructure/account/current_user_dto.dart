// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grape_customer_app/domain/account/account.dart';

part 'current_user_dto.freezed.dart';
part 'current_user_dto.g.dart';

@freezed
class CurrentUserDto with _$CurrentUserDto {
  const CurrentUserDto._();
  const factory CurrentUserDto({
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    String? email,
    @JsonKey(name: 'country_code') String? countryCode,
    int? phone,
    @JsonKey(name: 'is_email_verified') bool? isEmailVerified,
    @JsonKey(name: 'is_mobile_verified') bool? isMobileVerified,
    int? role,
    @JsonKey(name: 'remember_token') String? rememberToken,
  }) = _CurrentUserDto;
  Account toDomain() {
    return Account(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      email: email,
      countryCode: countryCode,
      phone: phone,
      isEmailVerified: isEmailVerified,
      isMobileVerified: isMobileVerified,
      role: role,
      rememberToken: rememberToken,
    );
  }

  factory CurrentUserDto.fromDomain(Account account) {
    return CurrentUserDto(
      userId: account.userId,
      firstName: account.firstName,
      lastName: account.lastName,
      email: account.email,
      countryCode: account.countryCode,
      phone: account.phone,
      isEmailVerified: account.isEmailVerified,
      isMobileVerified: account.isMobileVerified,
      role: account.role,
      rememberToken: account.rememberToken,
    );
  }
  factory CurrentUserDto.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserDtoFromJson(json);
}
