// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrentUserDtoImpl _$$CurrentUserDtoImplFromJson(Map<String, dynamic> json) =>
    _$CurrentUserDtoImpl(
      userId: json['user_id'] as int?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      countryCode: json['country_code'] as String?,
      phone: json['phone'] as int?,
      isEmailVerified: json['is_email_verified'] as bool?,
      isMobileVerified: json['is_mobile_verified'] as bool?,
      role: json['role'] as int?,
      rememberToken: json['remember_token'] as String?,
    );

Map<String, dynamic> _$$CurrentUserDtoImplToJson(
        _$CurrentUserDtoImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'country_code': instance.countryCode,
      'phone': instance.phone,
      'is_email_verified': instance.isEmailVerified,
      'is_mobile_verified': instance.isMobileVerified,
      'role': instance.role,
      'remember_token': instance.rememberToken,
    };
