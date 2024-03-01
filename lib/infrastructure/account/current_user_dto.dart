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
    String? profile,
    @JsonKey(name: 'remember_token') String? rememberToken,
    @JsonKey(name: 'auth') AuthDto? authDto,
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
      profile: profile,
      auth: authDto?.toDomain(),
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
      profile: account.profile,
      rememberToken: account.rememberToken,
      authDto: account.auth != null ? AuthDto.fromDomain(account.auth!) : null,
    );
  }
  factory CurrentUserDto.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserDtoFromJson(json);
}

@freezed
class AuthDto with _$AuthDto {
  const AuthDto._();
  const factory AuthDto({
    @JsonKey(name: 'token_type') String? tokenType,
    @JsonKey(name: 'expires_in') int? expiresIn,
    @JsonKey(name: 'access_token') String? accessToken,
    @JsonKey(name: 'refresh_token') String? refreshToken,
  }) = _AuthDto;
  Auth toDomain() {
    return Auth(
      accessToken: accessToken,
      expiresIn: expiresIn,
      refreshToken: refreshToken,
      tokenType: tokenType,
    );
  }

  factory AuthDto.fromDomain(Auth auth) {
    return AuthDto(
      tokenType: auth.tokenType,
      accessToken: auth.accessToken,
      expiresIn: auth.expiresIn,
      refreshToken: auth.refreshToken,
    );
  }
  factory AuthDto.fromJson(Map<String, dynamic> json) =>
      _$AuthDtoFromJson(json);
}
