// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function(String lastName) lastNameChanged,
    required TResult Function(String firstName) firstNameChanged,
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String counryCode) selectCountryCode,
    required TResult Function(String otp) changeOTP,
    required TResult Function() registerPressed,
    required TResult Function() startCountdown,
    required TResult Function() stopCountdown,
    required TResult Function() verifyOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function(String lastName)? lastNameChanged,
    TResult? Function(String firstName)? firstNameChanged,
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String counryCode)? selectCountryCode,
    TResult? Function(String otp)? changeOTP,
    TResult? Function()? registerPressed,
    TResult? Function()? startCountdown,
    TResult? Function()? stopCountdown,
    TResult? Function()? verifyOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String counryCode)? selectCountryCode,
    TResult Function(String otp)? changeOTP,
    TResult Function()? registerPressed,
    TResult Function()? startCountdown,
    TResult Function()? stopCountdown,
    TResult Function()? verifyOtp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(LastNameChanged value) lastNameChanged,
    required TResult Function(FirstNameChanged value) firstNameChanged,
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(ChangeOTP value) changeOTP,
    required TResult Function(RegisterPressed value) registerPressed,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(StopCountdown value) stopCountdown,
    required TResult Function(VerifyOtp value) verifyOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(LastNameChanged value)? lastNameChanged,
    TResult? Function(FirstNameChanged value)? firstNameChanged,
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(ChangeOTP value)? changeOTP,
    TResult? Function(RegisterPressed value)? registerPressed,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(StopCountdown value)? stopCountdown,
    TResult? Function(VerifyOtp value)? verifyOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(LastNameChanged value)? lastNameChanged,
    TResult Function(FirstNameChanged value)? firstNameChanged,
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(ChangeOTP value)? changeOTP,
    TResult Function(RegisterPressed value)? registerPressed,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(StopCountdown value)? stopCountdown,
    TResult Function(VerifyOtp value)? verifyOtp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterFormEventCopyWith<$Res> {
  factory $RegisterFormEventCopyWith(
          RegisterFormEvent value, $Res Function(RegisterFormEvent) then) =
      _$RegisterFormEventCopyWithImpl<$Res, RegisterFormEvent>;
}

/// @nodoc
class _$RegisterFormEventCopyWithImpl<$Res, $Val extends RegisterFormEvent>
    implements $RegisterFormEventCopyWith<$Res> {
  _$RegisterFormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EmailChangedImplCopyWith<$Res> {
  factory _$$EmailChangedImplCopyWith(
          _$EmailChangedImpl value, $Res Function(_$EmailChangedImpl) then) =
      __$$EmailChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$EmailChangedImplCopyWithImpl<$Res>
    extends _$RegisterFormEventCopyWithImpl<$Res, _$EmailChangedImpl>
    implements _$$EmailChangedImplCopyWith<$Res> {
  __$$EmailChangedImplCopyWithImpl(
      _$EmailChangedImpl _value, $Res Function(_$EmailChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$EmailChangedImpl(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmailChangedImpl implements EmailChanged {
  const _$EmailChangedImpl(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'RegisterFormEvent.emailChanged(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailChangedImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailChangedImplCopyWith<_$EmailChangedImpl> get copyWith =>
      __$$EmailChangedImplCopyWithImpl<_$EmailChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function(String lastName) lastNameChanged,
    required TResult Function(String firstName) firstNameChanged,
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String counryCode) selectCountryCode,
    required TResult Function(String otp) changeOTP,
    required TResult Function() registerPressed,
    required TResult Function() startCountdown,
    required TResult Function() stopCountdown,
    required TResult Function() verifyOtp,
  }) {
    return emailChanged(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function(String lastName)? lastNameChanged,
    TResult? Function(String firstName)? firstNameChanged,
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String counryCode)? selectCountryCode,
    TResult? Function(String otp)? changeOTP,
    TResult? Function()? registerPressed,
    TResult? Function()? startCountdown,
    TResult? Function()? stopCountdown,
    TResult? Function()? verifyOtp,
  }) {
    return emailChanged?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String counryCode)? selectCountryCode,
    TResult Function(String otp)? changeOTP,
    TResult Function()? registerPressed,
    TResult Function()? startCountdown,
    TResult Function()? stopCountdown,
    TResult Function()? verifyOtp,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(LastNameChanged value) lastNameChanged,
    required TResult Function(FirstNameChanged value) firstNameChanged,
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(ChangeOTP value) changeOTP,
    required TResult Function(RegisterPressed value) registerPressed,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(StopCountdown value) stopCountdown,
    required TResult Function(VerifyOtp value) verifyOtp,
  }) {
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(LastNameChanged value)? lastNameChanged,
    TResult? Function(FirstNameChanged value)? firstNameChanged,
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(ChangeOTP value)? changeOTP,
    TResult? Function(RegisterPressed value)? registerPressed,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(StopCountdown value)? stopCountdown,
    TResult? Function(VerifyOtp value)? verifyOtp,
  }) {
    return emailChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(LastNameChanged value)? lastNameChanged,
    TResult Function(FirstNameChanged value)? firstNameChanged,
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(ChangeOTP value)? changeOTP,
    TResult Function(RegisterPressed value)? registerPressed,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(StopCountdown value)? stopCountdown,
    TResult Function(VerifyOtp value)? verifyOtp,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class EmailChanged implements RegisterFormEvent {
  const factory EmailChanged(final String email) = _$EmailChangedImpl;

  String get email;
  @JsonKey(ignore: true)
  _$$EmailChangedImplCopyWith<_$EmailChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetPrefilledPhoneNumberImplCopyWith<$Res> {
  factory _$$GetPrefilledPhoneNumberImplCopyWith(
          _$GetPrefilledPhoneNumberImpl value,
          $Res Function(_$GetPrefilledPhoneNumberImpl) then) =
      __$$GetPrefilledPhoneNumberImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String countryCode, String phoneNumber});
}

/// @nodoc
class __$$GetPrefilledPhoneNumberImplCopyWithImpl<$Res>
    extends _$RegisterFormEventCopyWithImpl<$Res, _$GetPrefilledPhoneNumberImpl>
    implements _$$GetPrefilledPhoneNumberImplCopyWith<$Res> {
  __$$GetPrefilledPhoneNumberImplCopyWithImpl(
      _$GetPrefilledPhoneNumberImpl _value,
      $Res Function(_$GetPrefilledPhoneNumberImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryCode = null,
    Object? phoneNumber = null,
  }) {
    return _then(_$GetPrefilledPhoneNumberImpl(
      null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetPrefilledPhoneNumberImpl implements GetPrefilledPhoneNumber {
  const _$GetPrefilledPhoneNumberImpl(this.countryCode, this.phoneNumber);

  @override
  final String countryCode;
  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'RegisterFormEvent.getPrefilledPhoneNumber(countryCode: $countryCode, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPrefilledPhoneNumberImpl &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, countryCode, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetPrefilledPhoneNumberImplCopyWith<_$GetPrefilledPhoneNumberImpl>
      get copyWith => __$$GetPrefilledPhoneNumberImplCopyWithImpl<
          _$GetPrefilledPhoneNumberImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function(String lastName) lastNameChanged,
    required TResult Function(String firstName) firstNameChanged,
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String counryCode) selectCountryCode,
    required TResult Function(String otp) changeOTP,
    required TResult Function() registerPressed,
    required TResult Function() startCountdown,
    required TResult Function() stopCountdown,
    required TResult Function() verifyOtp,
  }) {
    return getPrefilledPhoneNumber(countryCode, phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function(String lastName)? lastNameChanged,
    TResult? Function(String firstName)? firstNameChanged,
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String counryCode)? selectCountryCode,
    TResult? Function(String otp)? changeOTP,
    TResult? Function()? registerPressed,
    TResult? Function()? startCountdown,
    TResult? Function()? stopCountdown,
    TResult? Function()? verifyOtp,
  }) {
    return getPrefilledPhoneNumber?.call(countryCode, phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String counryCode)? selectCountryCode,
    TResult Function(String otp)? changeOTP,
    TResult Function()? registerPressed,
    TResult Function()? startCountdown,
    TResult Function()? stopCountdown,
    TResult Function()? verifyOtp,
    required TResult orElse(),
  }) {
    if (getPrefilledPhoneNumber != null) {
      return getPrefilledPhoneNumber(countryCode, phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(LastNameChanged value) lastNameChanged,
    required TResult Function(FirstNameChanged value) firstNameChanged,
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(ChangeOTP value) changeOTP,
    required TResult Function(RegisterPressed value) registerPressed,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(StopCountdown value) stopCountdown,
    required TResult Function(VerifyOtp value) verifyOtp,
  }) {
    return getPrefilledPhoneNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(LastNameChanged value)? lastNameChanged,
    TResult? Function(FirstNameChanged value)? firstNameChanged,
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(ChangeOTP value)? changeOTP,
    TResult? Function(RegisterPressed value)? registerPressed,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(StopCountdown value)? stopCountdown,
    TResult? Function(VerifyOtp value)? verifyOtp,
  }) {
    return getPrefilledPhoneNumber?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(LastNameChanged value)? lastNameChanged,
    TResult Function(FirstNameChanged value)? firstNameChanged,
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(ChangeOTP value)? changeOTP,
    TResult Function(RegisterPressed value)? registerPressed,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(StopCountdown value)? stopCountdown,
    TResult Function(VerifyOtp value)? verifyOtp,
    required TResult orElse(),
  }) {
    if (getPrefilledPhoneNumber != null) {
      return getPrefilledPhoneNumber(this);
    }
    return orElse();
  }
}

abstract class GetPrefilledPhoneNumber implements RegisterFormEvent {
  const factory GetPrefilledPhoneNumber(
          final String countryCode, final String phoneNumber) =
      _$GetPrefilledPhoneNumberImpl;

  String get countryCode;
  String get phoneNumber;
  @JsonKey(ignore: true)
  _$$GetPrefilledPhoneNumberImplCopyWith<_$GetPrefilledPhoneNumberImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LastNameChangedImplCopyWith<$Res> {
  factory _$$LastNameChangedImplCopyWith(_$LastNameChangedImpl value,
          $Res Function(_$LastNameChangedImpl) then) =
      __$$LastNameChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String lastName});
}

/// @nodoc
class __$$LastNameChangedImplCopyWithImpl<$Res>
    extends _$RegisterFormEventCopyWithImpl<$Res, _$LastNameChangedImpl>
    implements _$$LastNameChangedImplCopyWith<$Res> {
  __$$LastNameChangedImplCopyWithImpl(
      _$LastNameChangedImpl _value, $Res Function(_$LastNameChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastName = null,
  }) {
    return _then(_$LastNameChangedImpl(
      null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LastNameChangedImpl implements LastNameChanged {
  const _$LastNameChangedImpl(this.lastName);

  @override
  final String lastName;

  @override
  String toString() {
    return 'RegisterFormEvent.lastNameChanged(lastName: $lastName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LastNameChangedImpl &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lastName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LastNameChangedImplCopyWith<_$LastNameChangedImpl> get copyWith =>
      __$$LastNameChangedImplCopyWithImpl<_$LastNameChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function(String lastName) lastNameChanged,
    required TResult Function(String firstName) firstNameChanged,
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String counryCode) selectCountryCode,
    required TResult Function(String otp) changeOTP,
    required TResult Function() registerPressed,
    required TResult Function() startCountdown,
    required TResult Function() stopCountdown,
    required TResult Function() verifyOtp,
  }) {
    return lastNameChanged(lastName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function(String lastName)? lastNameChanged,
    TResult? Function(String firstName)? firstNameChanged,
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String counryCode)? selectCountryCode,
    TResult? Function(String otp)? changeOTP,
    TResult? Function()? registerPressed,
    TResult? Function()? startCountdown,
    TResult? Function()? stopCountdown,
    TResult? Function()? verifyOtp,
  }) {
    return lastNameChanged?.call(lastName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String counryCode)? selectCountryCode,
    TResult Function(String otp)? changeOTP,
    TResult Function()? registerPressed,
    TResult Function()? startCountdown,
    TResult Function()? stopCountdown,
    TResult Function()? verifyOtp,
    required TResult orElse(),
  }) {
    if (lastNameChanged != null) {
      return lastNameChanged(lastName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(LastNameChanged value) lastNameChanged,
    required TResult Function(FirstNameChanged value) firstNameChanged,
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(ChangeOTP value) changeOTP,
    required TResult Function(RegisterPressed value) registerPressed,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(StopCountdown value) stopCountdown,
    required TResult Function(VerifyOtp value) verifyOtp,
  }) {
    return lastNameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(LastNameChanged value)? lastNameChanged,
    TResult? Function(FirstNameChanged value)? firstNameChanged,
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(ChangeOTP value)? changeOTP,
    TResult? Function(RegisterPressed value)? registerPressed,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(StopCountdown value)? stopCountdown,
    TResult? Function(VerifyOtp value)? verifyOtp,
  }) {
    return lastNameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(LastNameChanged value)? lastNameChanged,
    TResult Function(FirstNameChanged value)? firstNameChanged,
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(ChangeOTP value)? changeOTP,
    TResult Function(RegisterPressed value)? registerPressed,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(StopCountdown value)? stopCountdown,
    TResult Function(VerifyOtp value)? verifyOtp,
    required TResult orElse(),
  }) {
    if (lastNameChanged != null) {
      return lastNameChanged(this);
    }
    return orElse();
  }
}

abstract class LastNameChanged implements RegisterFormEvent {
  const factory LastNameChanged(final String lastName) = _$LastNameChangedImpl;

  String get lastName;
  @JsonKey(ignore: true)
  _$$LastNameChangedImplCopyWith<_$LastNameChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FirstNameChangedImplCopyWith<$Res> {
  factory _$$FirstNameChangedImplCopyWith(_$FirstNameChangedImpl value,
          $Res Function(_$FirstNameChangedImpl) then) =
      __$$FirstNameChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String firstName});
}

/// @nodoc
class __$$FirstNameChangedImplCopyWithImpl<$Res>
    extends _$RegisterFormEventCopyWithImpl<$Res, _$FirstNameChangedImpl>
    implements _$$FirstNameChangedImplCopyWith<$Res> {
  __$$FirstNameChangedImplCopyWithImpl(_$FirstNameChangedImpl _value,
      $Res Function(_$FirstNameChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
  }) {
    return _then(_$FirstNameChangedImpl(
      null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FirstNameChangedImpl implements FirstNameChanged {
  const _$FirstNameChangedImpl(this.firstName);

  @override
  final String firstName;

  @override
  String toString() {
    return 'RegisterFormEvent.firstNameChanged(firstName: $firstName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirstNameChangedImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, firstName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FirstNameChangedImplCopyWith<_$FirstNameChangedImpl> get copyWith =>
      __$$FirstNameChangedImplCopyWithImpl<_$FirstNameChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function(String lastName) lastNameChanged,
    required TResult Function(String firstName) firstNameChanged,
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String counryCode) selectCountryCode,
    required TResult Function(String otp) changeOTP,
    required TResult Function() registerPressed,
    required TResult Function() startCountdown,
    required TResult Function() stopCountdown,
    required TResult Function() verifyOtp,
  }) {
    return firstNameChanged(firstName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function(String lastName)? lastNameChanged,
    TResult? Function(String firstName)? firstNameChanged,
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String counryCode)? selectCountryCode,
    TResult? Function(String otp)? changeOTP,
    TResult? Function()? registerPressed,
    TResult? Function()? startCountdown,
    TResult? Function()? stopCountdown,
    TResult? Function()? verifyOtp,
  }) {
    return firstNameChanged?.call(firstName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String counryCode)? selectCountryCode,
    TResult Function(String otp)? changeOTP,
    TResult Function()? registerPressed,
    TResult Function()? startCountdown,
    TResult Function()? stopCountdown,
    TResult Function()? verifyOtp,
    required TResult orElse(),
  }) {
    if (firstNameChanged != null) {
      return firstNameChanged(firstName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(LastNameChanged value) lastNameChanged,
    required TResult Function(FirstNameChanged value) firstNameChanged,
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(ChangeOTP value) changeOTP,
    required TResult Function(RegisterPressed value) registerPressed,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(StopCountdown value) stopCountdown,
    required TResult Function(VerifyOtp value) verifyOtp,
  }) {
    return firstNameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(LastNameChanged value)? lastNameChanged,
    TResult? Function(FirstNameChanged value)? firstNameChanged,
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(ChangeOTP value)? changeOTP,
    TResult? Function(RegisterPressed value)? registerPressed,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(StopCountdown value)? stopCountdown,
    TResult? Function(VerifyOtp value)? verifyOtp,
  }) {
    return firstNameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(LastNameChanged value)? lastNameChanged,
    TResult Function(FirstNameChanged value)? firstNameChanged,
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(ChangeOTP value)? changeOTP,
    TResult Function(RegisterPressed value)? registerPressed,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(StopCountdown value)? stopCountdown,
    TResult Function(VerifyOtp value)? verifyOtp,
    required TResult orElse(),
  }) {
    if (firstNameChanged != null) {
      return firstNameChanged(this);
    }
    return orElse();
  }
}

abstract class FirstNameChanged implements RegisterFormEvent {
  const factory FirstNameChanged(final String firstName) =
      _$FirstNameChangedImpl;

  String get firstName;
  @JsonKey(ignore: true)
  _$$FirstNameChangedImplCopyWith<_$FirstNameChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MobileNumberChangedImplCopyWith<$Res> {
  factory _$$MobileNumberChangedImplCopyWith(_$MobileNumberChangedImpl value,
          $Res Function(_$MobileNumberChangedImpl) then) =
      __$$MobileNumberChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String mobileNumber});
}

/// @nodoc
class __$$MobileNumberChangedImplCopyWithImpl<$Res>
    extends _$RegisterFormEventCopyWithImpl<$Res, _$MobileNumberChangedImpl>
    implements _$$MobileNumberChangedImplCopyWith<$Res> {
  __$$MobileNumberChangedImplCopyWithImpl(_$MobileNumberChangedImpl _value,
      $Res Function(_$MobileNumberChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mobileNumber = null,
  }) {
    return _then(_$MobileNumberChangedImpl(
      null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MobileNumberChangedImpl implements MobileNumberChanged {
  const _$MobileNumberChangedImpl(this.mobileNumber);

  @override
  final String mobileNumber;

  @override
  String toString() {
    return 'RegisterFormEvent.mobileNumberChanged(mobileNumber: $mobileNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MobileNumberChangedImpl &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mobileNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MobileNumberChangedImplCopyWith<_$MobileNumberChangedImpl> get copyWith =>
      __$$MobileNumberChangedImplCopyWithImpl<_$MobileNumberChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function(String lastName) lastNameChanged,
    required TResult Function(String firstName) firstNameChanged,
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String counryCode) selectCountryCode,
    required TResult Function(String otp) changeOTP,
    required TResult Function() registerPressed,
    required TResult Function() startCountdown,
    required TResult Function() stopCountdown,
    required TResult Function() verifyOtp,
  }) {
    return mobileNumberChanged(mobileNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function(String lastName)? lastNameChanged,
    TResult? Function(String firstName)? firstNameChanged,
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String counryCode)? selectCountryCode,
    TResult? Function(String otp)? changeOTP,
    TResult? Function()? registerPressed,
    TResult? Function()? startCountdown,
    TResult? Function()? stopCountdown,
    TResult? Function()? verifyOtp,
  }) {
    return mobileNumberChanged?.call(mobileNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String counryCode)? selectCountryCode,
    TResult Function(String otp)? changeOTP,
    TResult Function()? registerPressed,
    TResult Function()? startCountdown,
    TResult Function()? stopCountdown,
    TResult Function()? verifyOtp,
    required TResult orElse(),
  }) {
    if (mobileNumberChanged != null) {
      return mobileNumberChanged(mobileNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(LastNameChanged value) lastNameChanged,
    required TResult Function(FirstNameChanged value) firstNameChanged,
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(ChangeOTP value) changeOTP,
    required TResult Function(RegisterPressed value) registerPressed,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(StopCountdown value) stopCountdown,
    required TResult Function(VerifyOtp value) verifyOtp,
  }) {
    return mobileNumberChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(LastNameChanged value)? lastNameChanged,
    TResult? Function(FirstNameChanged value)? firstNameChanged,
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(ChangeOTP value)? changeOTP,
    TResult? Function(RegisterPressed value)? registerPressed,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(StopCountdown value)? stopCountdown,
    TResult? Function(VerifyOtp value)? verifyOtp,
  }) {
    return mobileNumberChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(LastNameChanged value)? lastNameChanged,
    TResult Function(FirstNameChanged value)? firstNameChanged,
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(ChangeOTP value)? changeOTP,
    TResult Function(RegisterPressed value)? registerPressed,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(StopCountdown value)? stopCountdown,
    TResult Function(VerifyOtp value)? verifyOtp,
    required TResult orElse(),
  }) {
    if (mobileNumberChanged != null) {
      return mobileNumberChanged(this);
    }
    return orElse();
  }
}

abstract class MobileNumberChanged implements RegisterFormEvent {
  const factory MobileNumberChanged(final String mobileNumber) =
      _$MobileNumberChangedImpl;

  String get mobileNumber;
  @JsonKey(ignore: true)
  _$$MobileNumberChangedImplCopyWith<_$MobileNumberChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectCountryCodeImplCopyWith<$Res> {
  factory _$$SelectCountryCodeImplCopyWith(_$SelectCountryCodeImpl value,
          $Res Function(_$SelectCountryCodeImpl) then) =
      __$$SelectCountryCodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String counryCode});
}

/// @nodoc
class __$$SelectCountryCodeImplCopyWithImpl<$Res>
    extends _$RegisterFormEventCopyWithImpl<$Res, _$SelectCountryCodeImpl>
    implements _$$SelectCountryCodeImplCopyWith<$Res> {
  __$$SelectCountryCodeImplCopyWithImpl(_$SelectCountryCodeImpl _value,
      $Res Function(_$SelectCountryCodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counryCode = null,
  }) {
    return _then(_$SelectCountryCodeImpl(
      null == counryCode
          ? _value.counryCode
          : counryCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SelectCountryCodeImpl implements SelectCountryCode {
  const _$SelectCountryCodeImpl(this.counryCode);

  @override
  final String counryCode;

  @override
  String toString() {
    return 'RegisterFormEvent.selectCountryCode(counryCode: $counryCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectCountryCodeImpl &&
            (identical(other.counryCode, counryCode) ||
                other.counryCode == counryCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, counryCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectCountryCodeImplCopyWith<_$SelectCountryCodeImpl> get copyWith =>
      __$$SelectCountryCodeImplCopyWithImpl<_$SelectCountryCodeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function(String lastName) lastNameChanged,
    required TResult Function(String firstName) firstNameChanged,
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String counryCode) selectCountryCode,
    required TResult Function(String otp) changeOTP,
    required TResult Function() registerPressed,
    required TResult Function() startCountdown,
    required TResult Function() stopCountdown,
    required TResult Function() verifyOtp,
  }) {
    return selectCountryCode(counryCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function(String lastName)? lastNameChanged,
    TResult? Function(String firstName)? firstNameChanged,
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String counryCode)? selectCountryCode,
    TResult? Function(String otp)? changeOTP,
    TResult? Function()? registerPressed,
    TResult? Function()? startCountdown,
    TResult? Function()? stopCountdown,
    TResult? Function()? verifyOtp,
  }) {
    return selectCountryCode?.call(counryCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String counryCode)? selectCountryCode,
    TResult Function(String otp)? changeOTP,
    TResult Function()? registerPressed,
    TResult Function()? startCountdown,
    TResult Function()? stopCountdown,
    TResult Function()? verifyOtp,
    required TResult orElse(),
  }) {
    if (selectCountryCode != null) {
      return selectCountryCode(counryCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(LastNameChanged value) lastNameChanged,
    required TResult Function(FirstNameChanged value) firstNameChanged,
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(ChangeOTP value) changeOTP,
    required TResult Function(RegisterPressed value) registerPressed,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(StopCountdown value) stopCountdown,
    required TResult Function(VerifyOtp value) verifyOtp,
  }) {
    return selectCountryCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(LastNameChanged value)? lastNameChanged,
    TResult? Function(FirstNameChanged value)? firstNameChanged,
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(ChangeOTP value)? changeOTP,
    TResult? Function(RegisterPressed value)? registerPressed,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(StopCountdown value)? stopCountdown,
    TResult? Function(VerifyOtp value)? verifyOtp,
  }) {
    return selectCountryCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(LastNameChanged value)? lastNameChanged,
    TResult Function(FirstNameChanged value)? firstNameChanged,
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(ChangeOTP value)? changeOTP,
    TResult Function(RegisterPressed value)? registerPressed,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(StopCountdown value)? stopCountdown,
    TResult Function(VerifyOtp value)? verifyOtp,
    required TResult orElse(),
  }) {
    if (selectCountryCode != null) {
      return selectCountryCode(this);
    }
    return orElse();
  }
}

abstract class SelectCountryCode implements RegisterFormEvent {
  const factory SelectCountryCode(final String counryCode) =
      _$SelectCountryCodeImpl;

  String get counryCode;
  @JsonKey(ignore: true)
  _$$SelectCountryCodeImplCopyWith<_$SelectCountryCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeOTPImplCopyWith<$Res> {
  factory _$$ChangeOTPImplCopyWith(
          _$ChangeOTPImpl value, $Res Function(_$ChangeOTPImpl) then) =
      __$$ChangeOTPImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String otp});
}

/// @nodoc
class __$$ChangeOTPImplCopyWithImpl<$Res>
    extends _$RegisterFormEventCopyWithImpl<$Res, _$ChangeOTPImpl>
    implements _$$ChangeOTPImplCopyWith<$Res> {
  __$$ChangeOTPImplCopyWithImpl(
      _$ChangeOTPImpl _value, $Res Function(_$ChangeOTPImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = null,
  }) {
    return _then(_$ChangeOTPImpl(
      null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeOTPImpl implements ChangeOTP {
  const _$ChangeOTPImpl(this.otp);

  @override
  final String otp;

  @override
  String toString() {
    return 'RegisterFormEvent.changeOTP(otp: $otp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeOTPImpl &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, otp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeOTPImplCopyWith<_$ChangeOTPImpl> get copyWith =>
      __$$ChangeOTPImplCopyWithImpl<_$ChangeOTPImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function(String lastName) lastNameChanged,
    required TResult Function(String firstName) firstNameChanged,
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String counryCode) selectCountryCode,
    required TResult Function(String otp) changeOTP,
    required TResult Function() registerPressed,
    required TResult Function() startCountdown,
    required TResult Function() stopCountdown,
    required TResult Function() verifyOtp,
  }) {
    return changeOTP(otp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function(String lastName)? lastNameChanged,
    TResult? Function(String firstName)? firstNameChanged,
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String counryCode)? selectCountryCode,
    TResult? Function(String otp)? changeOTP,
    TResult? Function()? registerPressed,
    TResult? Function()? startCountdown,
    TResult? Function()? stopCountdown,
    TResult? Function()? verifyOtp,
  }) {
    return changeOTP?.call(otp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String counryCode)? selectCountryCode,
    TResult Function(String otp)? changeOTP,
    TResult Function()? registerPressed,
    TResult Function()? startCountdown,
    TResult Function()? stopCountdown,
    TResult Function()? verifyOtp,
    required TResult orElse(),
  }) {
    if (changeOTP != null) {
      return changeOTP(otp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(LastNameChanged value) lastNameChanged,
    required TResult Function(FirstNameChanged value) firstNameChanged,
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(ChangeOTP value) changeOTP,
    required TResult Function(RegisterPressed value) registerPressed,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(StopCountdown value) stopCountdown,
    required TResult Function(VerifyOtp value) verifyOtp,
  }) {
    return changeOTP(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(LastNameChanged value)? lastNameChanged,
    TResult? Function(FirstNameChanged value)? firstNameChanged,
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(ChangeOTP value)? changeOTP,
    TResult? Function(RegisterPressed value)? registerPressed,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(StopCountdown value)? stopCountdown,
    TResult? Function(VerifyOtp value)? verifyOtp,
  }) {
    return changeOTP?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(LastNameChanged value)? lastNameChanged,
    TResult Function(FirstNameChanged value)? firstNameChanged,
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(ChangeOTP value)? changeOTP,
    TResult Function(RegisterPressed value)? registerPressed,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(StopCountdown value)? stopCountdown,
    TResult Function(VerifyOtp value)? verifyOtp,
    required TResult orElse(),
  }) {
    if (changeOTP != null) {
      return changeOTP(this);
    }
    return orElse();
  }
}

abstract class ChangeOTP implements RegisterFormEvent {
  const factory ChangeOTP(final String otp) = _$ChangeOTPImpl;

  String get otp;
  @JsonKey(ignore: true)
  _$$ChangeOTPImplCopyWith<_$ChangeOTPImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterPressedImplCopyWith<$Res> {
  factory _$$RegisterPressedImplCopyWith(_$RegisterPressedImpl value,
          $Res Function(_$RegisterPressedImpl) then) =
      __$$RegisterPressedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterPressedImplCopyWithImpl<$Res>
    extends _$RegisterFormEventCopyWithImpl<$Res, _$RegisterPressedImpl>
    implements _$$RegisterPressedImplCopyWith<$Res> {
  __$$RegisterPressedImplCopyWithImpl(
      _$RegisterPressedImpl _value, $Res Function(_$RegisterPressedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RegisterPressedImpl implements RegisterPressed {
  const _$RegisterPressedImpl();

  @override
  String toString() {
    return 'RegisterFormEvent.registerPressed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RegisterPressedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function(String lastName) lastNameChanged,
    required TResult Function(String firstName) firstNameChanged,
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String counryCode) selectCountryCode,
    required TResult Function(String otp) changeOTP,
    required TResult Function() registerPressed,
    required TResult Function() startCountdown,
    required TResult Function() stopCountdown,
    required TResult Function() verifyOtp,
  }) {
    return registerPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function(String lastName)? lastNameChanged,
    TResult? Function(String firstName)? firstNameChanged,
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String counryCode)? selectCountryCode,
    TResult? Function(String otp)? changeOTP,
    TResult? Function()? registerPressed,
    TResult? Function()? startCountdown,
    TResult? Function()? stopCountdown,
    TResult? Function()? verifyOtp,
  }) {
    return registerPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String counryCode)? selectCountryCode,
    TResult Function(String otp)? changeOTP,
    TResult Function()? registerPressed,
    TResult Function()? startCountdown,
    TResult Function()? stopCountdown,
    TResult Function()? verifyOtp,
    required TResult orElse(),
  }) {
    if (registerPressed != null) {
      return registerPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(LastNameChanged value) lastNameChanged,
    required TResult Function(FirstNameChanged value) firstNameChanged,
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(ChangeOTP value) changeOTP,
    required TResult Function(RegisterPressed value) registerPressed,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(StopCountdown value) stopCountdown,
    required TResult Function(VerifyOtp value) verifyOtp,
  }) {
    return registerPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(LastNameChanged value)? lastNameChanged,
    TResult? Function(FirstNameChanged value)? firstNameChanged,
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(ChangeOTP value)? changeOTP,
    TResult? Function(RegisterPressed value)? registerPressed,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(StopCountdown value)? stopCountdown,
    TResult? Function(VerifyOtp value)? verifyOtp,
  }) {
    return registerPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(LastNameChanged value)? lastNameChanged,
    TResult Function(FirstNameChanged value)? firstNameChanged,
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(ChangeOTP value)? changeOTP,
    TResult Function(RegisterPressed value)? registerPressed,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(StopCountdown value)? stopCountdown,
    TResult Function(VerifyOtp value)? verifyOtp,
    required TResult orElse(),
  }) {
    if (registerPressed != null) {
      return registerPressed(this);
    }
    return orElse();
  }
}

abstract class RegisterPressed implements RegisterFormEvent {
  const factory RegisterPressed() = _$RegisterPressedImpl;
}

/// @nodoc
abstract class _$$StartCountdownImplCopyWith<$Res> {
  factory _$$StartCountdownImplCopyWith(_$StartCountdownImpl value,
          $Res Function(_$StartCountdownImpl) then) =
      __$$StartCountdownImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartCountdownImplCopyWithImpl<$Res>
    extends _$RegisterFormEventCopyWithImpl<$Res, _$StartCountdownImpl>
    implements _$$StartCountdownImplCopyWith<$Res> {
  __$$StartCountdownImplCopyWithImpl(
      _$StartCountdownImpl _value, $Res Function(_$StartCountdownImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartCountdownImpl implements StartCountdown {
  const _$StartCountdownImpl();

  @override
  String toString() {
    return 'RegisterFormEvent.startCountdown()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartCountdownImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function(String lastName) lastNameChanged,
    required TResult Function(String firstName) firstNameChanged,
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String counryCode) selectCountryCode,
    required TResult Function(String otp) changeOTP,
    required TResult Function() registerPressed,
    required TResult Function() startCountdown,
    required TResult Function() stopCountdown,
    required TResult Function() verifyOtp,
  }) {
    return startCountdown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function(String lastName)? lastNameChanged,
    TResult? Function(String firstName)? firstNameChanged,
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String counryCode)? selectCountryCode,
    TResult? Function(String otp)? changeOTP,
    TResult? Function()? registerPressed,
    TResult? Function()? startCountdown,
    TResult? Function()? stopCountdown,
    TResult? Function()? verifyOtp,
  }) {
    return startCountdown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String counryCode)? selectCountryCode,
    TResult Function(String otp)? changeOTP,
    TResult Function()? registerPressed,
    TResult Function()? startCountdown,
    TResult Function()? stopCountdown,
    TResult Function()? verifyOtp,
    required TResult orElse(),
  }) {
    if (startCountdown != null) {
      return startCountdown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(LastNameChanged value) lastNameChanged,
    required TResult Function(FirstNameChanged value) firstNameChanged,
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(ChangeOTP value) changeOTP,
    required TResult Function(RegisterPressed value) registerPressed,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(StopCountdown value) stopCountdown,
    required TResult Function(VerifyOtp value) verifyOtp,
  }) {
    return startCountdown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(LastNameChanged value)? lastNameChanged,
    TResult? Function(FirstNameChanged value)? firstNameChanged,
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(ChangeOTP value)? changeOTP,
    TResult? Function(RegisterPressed value)? registerPressed,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(StopCountdown value)? stopCountdown,
    TResult? Function(VerifyOtp value)? verifyOtp,
  }) {
    return startCountdown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(LastNameChanged value)? lastNameChanged,
    TResult Function(FirstNameChanged value)? firstNameChanged,
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(ChangeOTP value)? changeOTP,
    TResult Function(RegisterPressed value)? registerPressed,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(StopCountdown value)? stopCountdown,
    TResult Function(VerifyOtp value)? verifyOtp,
    required TResult orElse(),
  }) {
    if (startCountdown != null) {
      return startCountdown(this);
    }
    return orElse();
  }
}

abstract class StartCountdown implements RegisterFormEvent {
  const factory StartCountdown() = _$StartCountdownImpl;
}

/// @nodoc
abstract class _$$StopCountdownImplCopyWith<$Res> {
  factory _$$StopCountdownImplCopyWith(
          _$StopCountdownImpl value, $Res Function(_$StopCountdownImpl) then) =
      __$$StopCountdownImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StopCountdownImplCopyWithImpl<$Res>
    extends _$RegisterFormEventCopyWithImpl<$Res, _$StopCountdownImpl>
    implements _$$StopCountdownImplCopyWith<$Res> {
  __$$StopCountdownImplCopyWithImpl(
      _$StopCountdownImpl _value, $Res Function(_$StopCountdownImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StopCountdownImpl implements StopCountdown {
  const _$StopCountdownImpl();

  @override
  String toString() {
    return 'RegisterFormEvent.stopCountdown()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StopCountdownImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function(String lastName) lastNameChanged,
    required TResult Function(String firstName) firstNameChanged,
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String counryCode) selectCountryCode,
    required TResult Function(String otp) changeOTP,
    required TResult Function() registerPressed,
    required TResult Function() startCountdown,
    required TResult Function() stopCountdown,
    required TResult Function() verifyOtp,
  }) {
    return stopCountdown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function(String lastName)? lastNameChanged,
    TResult? Function(String firstName)? firstNameChanged,
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String counryCode)? selectCountryCode,
    TResult? Function(String otp)? changeOTP,
    TResult? Function()? registerPressed,
    TResult? Function()? startCountdown,
    TResult? Function()? stopCountdown,
    TResult? Function()? verifyOtp,
  }) {
    return stopCountdown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String counryCode)? selectCountryCode,
    TResult Function(String otp)? changeOTP,
    TResult Function()? registerPressed,
    TResult Function()? startCountdown,
    TResult Function()? stopCountdown,
    TResult Function()? verifyOtp,
    required TResult orElse(),
  }) {
    if (stopCountdown != null) {
      return stopCountdown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(LastNameChanged value) lastNameChanged,
    required TResult Function(FirstNameChanged value) firstNameChanged,
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(ChangeOTP value) changeOTP,
    required TResult Function(RegisterPressed value) registerPressed,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(StopCountdown value) stopCountdown,
    required TResult Function(VerifyOtp value) verifyOtp,
  }) {
    return stopCountdown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(LastNameChanged value)? lastNameChanged,
    TResult? Function(FirstNameChanged value)? firstNameChanged,
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(ChangeOTP value)? changeOTP,
    TResult? Function(RegisterPressed value)? registerPressed,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(StopCountdown value)? stopCountdown,
    TResult? Function(VerifyOtp value)? verifyOtp,
  }) {
    return stopCountdown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(LastNameChanged value)? lastNameChanged,
    TResult Function(FirstNameChanged value)? firstNameChanged,
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(ChangeOTP value)? changeOTP,
    TResult Function(RegisterPressed value)? registerPressed,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(StopCountdown value)? stopCountdown,
    TResult Function(VerifyOtp value)? verifyOtp,
    required TResult orElse(),
  }) {
    if (stopCountdown != null) {
      return stopCountdown(this);
    }
    return orElse();
  }
}

abstract class StopCountdown implements RegisterFormEvent {
  const factory StopCountdown() = _$StopCountdownImpl;
}

/// @nodoc
abstract class _$$VerifyOtpImplCopyWith<$Res> {
  factory _$$VerifyOtpImplCopyWith(
          _$VerifyOtpImpl value, $Res Function(_$VerifyOtpImpl) then) =
      __$$VerifyOtpImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VerifyOtpImplCopyWithImpl<$Res>
    extends _$RegisterFormEventCopyWithImpl<$Res, _$VerifyOtpImpl>
    implements _$$VerifyOtpImplCopyWith<$Res> {
  __$$VerifyOtpImplCopyWithImpl(
      _$VerifyOtpImpl _value, $Res Function(_$VerifyOtpImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$VerifyOtpImpl implements VerifyOtp {
  const _$VerifyOtpImpl();

  @override
  String toString() {
    return 'RegisterFormEvent.verifyOtp()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VerifyOtpImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function(String lastName) lastNameChanged,
    required TResult Function(String firstName) firstNameChanged,
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String counryCode) selectCountryCode,
    required TResult Function(String otp) changeOTP,
    required TResult Function() registerPressed,
    required TResult Function() startCountdown,
    required TResult Function() stopCountdown,
    required TResult Function() verifyOtp,
  }) {
    return verifyOtp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function(String lastName)? lastNameChanged,
    TResult? Function(String firstName)? firstNameChanged,
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String counryCode)? selectCountryCode,
    TResult? Function(String otp)? changeOTP,
    TResult? Function()? registerPressed,
    TResult? Function()? startCountdown,
    TResult? Function()? stopCountdown,
    TResult? Function()? verifyOtp,
  }) {
    return verifyOtp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String counryCode)? selectCountryCode,
    TResult Function(String otp)? changeOTP,
    TResult Function()? registerPressed,
    TResult Function()? startCountdown,
    TResult Function()? stopCountdown,
    TResult Function()? verifyOtp,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(LastNameChanged value) lastNameChanged,
    required TResult Function(FirstNameChanged value) firstNameChanged,
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(ChangeOTP value) changeOTP,
    required TResult Function(RegisterPressed value) registerPressed,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(StopCountdown value) stopCountdown,
    required TResult Function(VerifyOtp value) verifyOtp,
  }) {
    return verifyOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(LastNameChanged value)? lastNameChanged,
    TResult? Function(FirstNameChanged value)? firstNameChanged,
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(ChangeOTP value)? changeOTP,
    TResult? Function(RegisterPressed value)? registerPressed,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(StopCountdown value)? stopCountdown,
    TResult? Function(VerifyOtp value)? verifyOtp,
  }) {
    return verifyOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(LastNameChanged value)? lastNameChanged,
    TResult Function(FirstNameChanged value)? firstNameChanged,
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(ChangeOTP value)? changeOTP,
    TResult Function(RegisterPressed value)? registerPressed,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(StopCountdown value)? stopCountdown,
    TResult Function(VerifyOtp value)? verifyOtp,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(this);
    }
    return orElse();
  }
}

abstract class VerifyOtp implements RegisterFormEvent {
  const factory VerifyOtp() = _$VerifyOtpImpl;
}

/// @nodoc
mixin _$RegisterFormState {
  EmailAddress get emailAddress => throw _privateConstructorUsedError;
  Username get firstName => throw _privateConstructorUsedError;
  Username get lastName => throw _privateConstructorUsedError;
  MobileNumber get mobileNumber => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  String get selectedCountrycode => throw _privateConstructorUsedError;
  OTPText get enteredOTP => throw _privateConstructorUsedError;
  int get secondsRemaining => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterFormStateCopyWith<RegisterFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterFormStateCopyWith<$Res> {
  factory $RegisterFormStateCopyWith(
          RegisterFormState value, $Res Function(RegisterFormState) then) =
      _$RegisterFormStateCopyWithImpl<$Res, RegisterFormState>;
  @useResult
  $Res call(
      {EmailAddress emailAddress,
      Username firstName,
      Username lastName,
      MobileNumber mobileNumber,
      bool showErrorMessages,
      bool isSubmitting,
      String selectedCountrycode,
      OTPText enteredOTP,
      int secondsRemaining,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class _$RegisterFormStateCopyWithImpl<$Res, $Val extends RegisterFormState>
    implements $RegisterFormStateCopyWith<$Res> {
  _$RegisterFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailAddress = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? mobileNumber = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? selectedCountrycode = null,
    Object? enteredOTP = null,
    Object? secondsRemaining = null,
    Object? authFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as Username,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as Username,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as MobileNumber,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedCountrycode: null == selectedCountrycode
          ? _value.selectedCountrycode
          : selectedCountrycode // ignore: cast_nullable_to_non_nullable
              as String,
      enteredOTP: null == enteredOTP
          ? _value.enteredOTP
          : enteredOTP // ignore: cast_nullable_to_non_nullable
              as OTPText,
      secondsRemaining: null == secondsRemaining
          ? _value.secondsRemaining
          : secondsRemaining // ignore: cast_nullable_to_non_nullable
              as int,
      authFailureOrSuccessOption: null == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterFormStateImplCopyWith<$Res>
    implements $RegisterFormStateCopyWith<$Res> {
  factory _$$RegisterFormStateImplCopyWith(_$RegisterFormStateImpl value,
          $Res Function(_$RegisterFormStateImpl) then) =
      __$$RegisterFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {EmailAddress emailAddress,
      Username firstName,
      Username lastName,
      MobileNumber mobileNumber,
      bool showErrorMessages,
      bool isSubmitting,
      String selectedCountrycode,
      OTPText enteredOTP,
      int secondsRemaining,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class __$$RegisterFormStateImplCopyWithImpl<$Res>
    extends _$RegisterFormStateCopyWithImpl<$Res, _$RegisterFormStateImpl>
    implements _$$RegisterFormStateImplCopyWith<$Res> {
  __$$RegisterFormStateImplCopyWithImpl(_$RegisterFormStateImpl _value,
      $Res Function(_$RegisterFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailAddress = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? mobileNumber = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? selectedCountrycode = null,
    Object? enteredOTP = null,
    Object? secondsRemaining = null,
    Object? authFailureOrSuccessOption = null,
  }) {
    return _then(_$RegisterFormStateImpl(
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as Username,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as Username,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as MobileNumber,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedCountrycode: null == selectedCountrycode
          ? _value.selectedCountrycode
          : selectedCountrycode // ignore: cast_nullable_to_non_nullable
              as String,
      enteredOTP: null == enteredOTP
          ? _value.enteredOTP
          : enteredOTP // ignore: cast_nullable_to_non_nullable
              as OTPText,
      secondsRemaining: null == secondsRemaining
          ? _value.secondsRemaining
          : secondsRemaining // ignore: cast_nullable_to_non_nullable
              as int,
      authFailureOrSuccessOption: null == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$RegisterFormStateImpl implements _RegisterFormState {
  const _$RegisterFormStateImpl(
      {required this.emailAddress,
      required this.firstName,
      required this.lastName,
      required this.mobileNumber,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.selectedCountrycode,
      required this.enteredOTP,
      required this.secondsRemaining,
      required this.authFailureOrSuccessOption});

  @override
  final EmailAddress emailAddress;
  @override
  final Username firstName;
  @override
  final Username lastName;
  @override
  final MobileNumber mobileNumber;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final String selectedCountrycode;
  @override
  final OTPText enteredOTP;
  @override
  final int secondsRemaining;
  @override
  final Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'RegisterFormState(emailAddress: $emailAddress, firstName: $firstName, lastName: $lastName, mobileNumber: $mobileNumber, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, selectedCountrycode: $selectedCountrycode, enteredOTP: $enteredOTP, secondsRemaining: $secondsRemaining, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterFormStateImpl &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.selectedCountrycode, selectedCountrycode) ||
                other.selectedCountrycode == selectedCountrycode) &&
            (identical(other.enteredOTP, enteredOTP) ||
                other.enteredOTP == enteredOTP) &&
            (identical(other.secondsRemaining, secondsRemaining) ||
                other.secondsRemaining == secondsRemaining) &&
            (identical(other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption) ||
                other.authFailureOrSuccessOption ==
                    authFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      emailAddress,
      firstName,
      lastName,
      mobileNumber,
      showErrorMessages,
      isSubmitting,
      selectedCountrycode,
      enteredOTP,
      secondsRemaining,
      authFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterFormStateImplCopyWith<_$RegisterFormStateImpl> get copyWith =>
      __$$RegisterFormStateImplCopyWithImpl<_$RegisterFormStateImpl>(
          this, _$identity);
}

abstract class _RegisterFormState implements RegisterFormState {
  const factory _RegisterFormState(
      {required final EmailAddress emailAddress,
      required final Username firstName,
      required final Username lastName,
      required final MobileNumber mobileNumber,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final String selectedCountrycode,
      required final OTPText enteredOTP,
      required final int secondsRemaining,
      required final Option<Either<AuthFailure, Unit>>
          authFailureOrSuccessOption}) = _$RegisterFormStateImpl;

  @override
  EmailAddress get emailAddress;
  @override
  Username get firstName;
  @override
  Username get lastName;
  @override
  MobileNumber get mobileNumber;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  String get selectedCountrycode;
  @override
  OTPText get enteredOTP;
  @override
  int get secondsRemaining;
  @override
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$RegisterFormStateImplCopyWith<_$RegisterFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
