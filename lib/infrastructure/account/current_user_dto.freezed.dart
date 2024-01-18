// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current_user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CurrentUserDto _$CurrentUserDtoFromJson(Map<String, dynamic> json) {
  return _CurrentUserDto.fromJson(json);
}

/// @nodoc
mixin _$CurrentUserDto {
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_code')
  String? get countryCode => throw _privateConstructorUsedError;
  int? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_email_verified')
  bool? get isEmailVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_mobile_verified')
  bool? get isMobileVerified => throw _privateConstructorUsedError;
  int? get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'remember_token')
  String? get rememberToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrentUserDtoCopyWith<CurrentUserDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentUserDtoCopyWith<$Res> {
  factory $CurrentUserDtoCopyWith(
          CurrentUserDto value, $Res Function(CurrentUserDto) then) =
      _$CurrentUserDtoCopyWithImpl<$Res, CurrentUserDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      String? email,
      @JsonKey(name: 'country_code') String? countryCode,
      int? phone,
      @JsonKey(name: 'is_email_verified') bool? isEmailVerified,
      @JsonKey(name: 'is_mobile_verified') bool? isMobileVerified,
      int? role,
      @JsonKey(name: 'remember_token') String? rememberToken});
}

/// @nodoc
class _$CurrentUserDtoCopyWithImpl<$Res, $Val extends CurrentUserDto>
    implements $CurrentUserDtoCopyWith<$Res> {
  _$CurrentUserDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? countryCode = freezed,
    Object? phone = freezed,
    Object? isEmailVerified = freezed,
    Object? isMobileVerified = freezed,
    Object? role = freezed,
    Object? rememberToken = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as int?,
      isEmailVerified: freezed == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMobileVerified: freezed == isMobileVerified
          ? _value.isMobileVerified
          : isMobileVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as int?,
      rememberToken: freezed == rememberToken
          ? _value.rememberToken
          : rememberToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrentUserDtoImplCopyWith<$Res>
    implements $CurrentUserDtoCopyWith<$Res> {
  factory _$$CurrentUserDtoImplCopyWith(_$CurrentUserDtoImpl value,
          $Res Function(_$CurrentUserDtoImpl) then) =
      __$$CurrentUserDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      String? email,
      @JsonKey(name: 'country_code') String? countryCode,
      int? phone,
      @JsonKey(name: 'is_email_verified') bool? isEmailVerified,
      @JsonKey(name: 'is_mobile_verified') bool? isMobileVerified,
      int? role,
      @JsonKey(name: 'remember_token') String? rememberToken});
}

/// @nodoc
class __$$CurrentUserDtoImplCopyWithImpl<$Res>
    extends _$CurrentUserDtoCopyWithImpl<$Res, _$CurrentUserDtoImpl>
    implements _$$CurrentUserDtoImplCopyWith<$Res> {
  __$$CurrentUserDtoImplCopyWithImpl(
      _$CurrentUserDtoImpl _value, $Res Function(_$CurrentUserDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? countryCode = freezed,
    Object? phone = freezed,
    Object? isEmailVerified = freezed,
    Object? isMobileVerified = freezed,
    Object? role = freezed,
    Object? rememberToken = freezed,
  }) {
    return _then(_$CurrentUserDtoImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as int?,
      isEmailVerified: freezed == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMobileVerified: freezed == isMobileVerified
          ? _value.isMobileVerified
          : isMobileVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as int?,
      rememberToken: freezed == rememberToken
          ? _value.rememberToken
          : rememberToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrentUserDtoImpl extends _CurrentUserDto {
  const _$CurrentUserDtoImpl(
      {@JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      this.email,
      @JsonKey(name: 'country_code') this.countryCode,
      this.phone,
      @JsonKey(name: 'is_email_verified') this.isEmailVerified,
      @JsonKey(name: 'is_mobile_verified') this.isMobileVerified,
      this.role,
      @JsonKey(name: 'remember_token') this.rememberToken})
      : super._();

  factory _$CurrentUserDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrentUserDtoImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  final String? email;
  @override
  @JsonKey(name: 'country_code')
  final String? countryCode;
  @override
  final int? phone;
  @override
  @JsonKey(name: 'is_email_verified')
  final bool? isEmailVerified;
  @override
  @JsonKey(name: 'is_mobile_verified')
  final bool? isMobileVerified;
  @override
  final int? role;
  @override
  @JsonKey(name: 'remember_token')
  final String? rememberToken;

  @override
  String toString() {
    return 'CurrentUserDto(userId: $userId, firstName: $firstName, lastName: $lastName, email: $email, countryCode: $countryCode, phone: $phone, isEmailVerified: $isEmailVerified, isMobileVerified: $isMobileVerified, role: $role, rememberToken: $rememberToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentUserDtoImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.isEmailVerified, isEmailVerified) ||
                other.isEmailVerified == isEmailVerified) &&
            (identical(other.isMobileVerified, isMobileVerified) ||
                other.isMobileVerified == isMobileVerified) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.rememberToken, rememberToken) ||
                other.rememberToken == rememberToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      firstName,
      lastName,
      email,
      countryCode,
      phone,
      isEmailVerified,
      isMobileVerified,
      role,
      rememberToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentUserDtoImplCopyWith<_$CurrentUserDtoImpl> get copyWith =>
      __$$CurrentUserDtoImplCopyWithImpl<_$CurrentUserDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrentUserDtoImplToJson(
      this,
    );
  }
}

abstract class _CurrentUserDto extends CurrentUserDto {
  const factory _CurrentUserDto(
          {@JsonKey(name: 'user_id') final int? userId,
          @JsonKey(name: 'first_name') final String? firstName,
          @JsonKey(name: 'last_name') final String? lastName,
          final String? email,
          @JsonKey(name: 'country_code') final String? countryCode,
          final int? phone,
          @JsonKey(name: 'is_email_verified') final bool? isEmailVerified,
          @JsonKey(name: 'is_mobile_verified') final bool? isMobileVerified,
          final int? role,
          @JsonKey(name: 'remember_token') final String? rememberToken}) =
      _$CurrentUserDtoImpl;
  const _CurrentUserDto._() : super._();

  factory _CurrentUserDto.fromJson(Map<String, dynamic> json) =
      _$CurrentUserDtoImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  String? get email;
  @override
  @JsonKey(name: 'country_code')
  String? get countryCode;
  @override
  int? get phone;
  @override
  @JsonKey(name: 'is_email_verified')
  bool? get isEmailVerified;
  @override
  @JsonKey(name: 'is_mobile_verified')
  bool? get isMobileVerified;
  @override
  int? get role;
  @override
  @JsonKey(name: 'remember_token')
  String? get rememberToken;
  @override
  @JsonKey(ignore: true)
  _$$CurrentUserDtoImplCopyWith<_$CurrentUserDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
