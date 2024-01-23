// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String counryCode) selectCountryCode,
    required TResult Function() loginPressed,
    required TResult Function() startCountdown,
    required TResult Function() decrementTimer,
    required TResult Function() resendOtp,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function() verifyOtp,
    required TResult Function(String otp) changeOTP,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String counryCode)? selectCountryCode,
    TResult? Function()? loginPressed,
    TResult? Function()? startCountdown,
    TResult? Function()? decrementTimer,
    TResult? Function()? resendOtp,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function()? verifyOtp,
    TResult? Function(String otp)? changeOTP,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String counryCode)? selectCountryCode,
    TResult Function()? loginPressed,
    TResult Function()? startCountdown,
    TResult Function()? decrementTimer,
    TResult Function()? resendOtp,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function()? verifyOtp,
    TResult Function(String otp)? changeOTP,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(LoginPressed value) loginPressed,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(DecrementTimer value) decrementTimer,
    required TResult Function(ResendOtp value) resendOtp,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ChangeOTP value) changeOTP,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(LoginPressed value)? loginPressed,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(DecrementTimer value)? decrementTimer,
    TResult? Function(ResendOtp value)? resendOtp,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ChangeOTP value)? changeOTP,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(LoginPressed value)? loginPressed,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(DecrementTimer value)? decrementTimer,
    TResult Function(ResendOtp value)? resendOtp,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ChangeOTP value)? changeOTP,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginFormEventCopyWith<$Res> {
  factory $LoginFormEventCopyWith(
          LoginFormEvent value, $Res Function(LoginFormEvent) then) =
      _$LoginFormEventCopyWithImpl<$Res, LoginFormEvent>;
}

/// @nodoc
class _$LoginFormEventCopyWithImpl<$Res, $Val extends LoginFormEvent>
    implements $LoginFormEventCopyWith<$Res> {
  _$LoginFormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
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
    extends _$LoginFormEventCopyWithImpl<$Res, _$MobileNumberChangedImpl>
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
    return 'LoginFormEvent.mobileNumberChanged(mobileNumber: $mobileNumber)';
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
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String counryCode) selectCountryCode,
    required TResult Function() loginPressed,
    required TResult Function() startCountdown,
    required TResult Function() decrementTimer,
    required TResult Function() resendOtp,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function() verifyOtp,
    required TResult Function(String otp) changeOTP,
  }) {
    return mobileNumberChanged(mobileNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String counryCode)? selectCountryCode,
    TResult? Function()? loginPressed,
    TResult? Function()? startCountdown,
    TResult? Function()? decrementTimer,
    TResult? Function()? resendOtp,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function()? verifyOtp,
    TResult? Function(String otp)? changeOTP,
  }) {
    return mobileNumberChanged?.call(mobileNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String counryCode)? selectCountryCode,
    TResult Function()? loginPressed,
    TResult Function()? startCountdown,
    TResult Function()? decrementTimer,
    TResult Function()? resendOtp,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function()? verifyOtp,
    TResult Function(String otp)? changeOTP,
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
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(LoginPressed value) loginPressed,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(DecrementTimer value) decrementTimer,
    required TResult Function(ResendOtp value) resendOtp,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ChangeOTP value) changeOTP,
  }) {
    return mobileNumberChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(LoginPressed value)? loginPressed,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(DecrementTimer value)? decrementTimer,
    TResult? Function(ResendOtp value)? resendOtp,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ChangeOTP value)? changeOTP,
  }) {
    return mobileNumberChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(LoginPressed value)? loginPressed,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(DecrementTimer value)? decrementTimer,
    TResult Function(ResendOtp value)? resendOtp,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ChangeOTP value)? changeOTP,
    required TResult orElse(),
  }) {
    if (mobileNumberChanged != null) {
      return mobileNumberChanged(this);
    }
    return orElse();
  }
}

abstract class MobileNumberChanged implements LoginFormEvent {
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
    extends _$LoginFormEventCopyWithImpl<$Res, _$SelectCountryCodeImpl>
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
    return 'LoginFormEvent.selectCountryCode(counryCode: $counryCode)';
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
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String counryCode) selectCountryCode,
    required TResult Function() loginPressed,
    required TResult Function() startCountdown,
    required TResult Function() decrementTimer,
    required TResult Function() resendOtp,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function() verifyOtp,
    required TResult Function(String otp) changeOTP,
  }) {
    return selectCountryCode(counryCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String counryCode)? selectCountryCode,
    TResult? Function()? loginPressed,
    TResult? Function()? startCountdown,
    TResult? Function()? decrementTimer,
    TResult? Function()? resendOtp,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function()? verifyOtp,
    TResult? Function(String otp)? changeOTP,
  }) {
    return selectCountryCode?.call(counryCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String counryCode)? selectCountryCode,
    TResult Function()? loginPressed,
    TResult Function()? startCountdown,
    TResult Function()? decrementTimer,
    TResult Function()? resendOtp,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function()? verifyOtp,
    TResult Function(String otp)? changeOTP,
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
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(LoginPressed value) loginPressed,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(DecrementTimer value) decrementTimer,
    required TResult Function(ResendOtp value) resendOtp,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ChangeOTP value) changeOTP,
  }) {
    return selectCountryCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(LoginPressed value)? loginPressed,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(DecrementTimer value)? decrementTimer,
    TResult? Function(ResendOtp value)? resendOtp,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ChangeOTP value)? changeOTP,
  }) {
    return selectCountryCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(LoginPressed value)? loginPressed,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(DecrementTimer value)? decrementTimer,
    TResult Function(ResendOtp value)? resendOtp,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ChangeOTP value)? changeOTP,
    required TResult orElse(),
  }) {
    if (selectCountryCode != null) {
      return selectCountryCode(this);
    }
    return orElse();
  }
}

abstract class SelectCountryCode implements LoginFormEvent {
  const factory SelectCountryCode(final String counryCode) =
      _$SelectCountryCodeImpl;

  String get counryCode;
  @JsonKey(ignore: true)
  _$$SelectCountryCodeImplCopyWith<_$SelectCountryCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginPressedImplCopyWith<$Res> {
  factory _$$LoginPressedImplCopyWith(
          _$LoginPressedImpl value, $Res Function(_$LoginPressedImpl) then) =
      __$$LoginPressedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginPressedImplCopyWithImpl<$Res>
    extends _$LoginFormEventCopyWithImpl<$Res, _$LoginPressedImpl>
    implements _$$LoginPressedImplCopyWith<$Res> {
  __$$LoginPressedImplCopyWithImpl(
      _$LoginPressedImpl _value, $Res Function(_$LoginPressedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginPressedImpl implements LoginPressed {
  const _$LoginPressedImpl();

  @override
  String toString() {
    return 'LoginFormEvent.loginPressed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginPressedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String counryCode) selectCountryCode,
    required TResult Function() loginPressed,
    required TResult Function() startCountdown,
    required TResult Function() decrementTimer,
    required TResult Function() resendOtp,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function() verifyOtp,
    required TResult Function(String otp) changeOTP,
  }) {
    return loginPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String counryCode)? selectCountryCode,
    TResult? Function()? loginPressed,
    TResult? Function()? startCountdown,
    TResult? Function()? decrementTimer,
    TResult? Function()? resendOtp,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function()? verifyOtp,
    TResult? Function(String otp)? changeOTP,
  }) {
    return loginPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String counryCode)? selectCountryCode,
    TResult Function()? loginPressed,
    TResult Function()? startCountdown,
    TResult Function()? decrementTimer,
    TResult Function()? resendOtp,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function()? verifyOtp,
    TResult Function(String otp)? changeOTP,
    required TResult orElse(),
  }) {
    if (loginPressed != null) {
      return loginPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(LoginPressed value) loginPressed,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(DecrementTimer value) decrementTimer,
    required TResult Function(ResendOtp value) resendOtp,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ChangeOTP value) changeOTP,
  }) {
    return loginPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(LoginPressed value)? loginPressed,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(DecrementTimer value)? decrementTimer,
    TResult? Function(ResendOtp value)? resendOtp,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ChangeOTP value)? changeOTP,
  }) {
    return loginPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(LoginPressed value)? loginPressed,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(DecrementTimer value)? decrementTimer,
    TResult Function(ResendOtp value)? resendOtp,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ChangeOTP value)? changeOTP,
    required TResult orElse(),
  }) {
    if (loginPressed != null) {
      return loginPressed(this);
    }
    return orElse();
  }
}

abstract class LoginPressed implements LoginFormEvent {
  const factory LoginPressed() = _$LoginPressedImpl;
}

/// @nodoc
abstract class _$$StartCountdownImplCopyWith<$Res> {
  factory _$$StartCountdownImplCopyWith(_$StartCountdownImpl value,
          $Res Function(_$StartCountdownImpl) then) =
      __$$StartCountdownImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartCountdownImplCopyWithImpl<$Res>
    extends _$LoginFormEventCopyWithImpl<$Res, _$StartCountdownImpl>
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
    return 'LoginFormEvent.startCountdown()';
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
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String counryCode) selectCountryCode,
    required TResult Function() loginPressed,
    required TResult Function() startCountdown,
    required TResult Function() decrementTimer,
    required TResult Function() resendOtp,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function() verifyOtp,
    required TResult Function(String otp) changeOTP,
  }) {
    return startCountdown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String counryCode)? selectCountryCode,
    TResult? Function()? loginPressed,
    TResult? Function()? startCountdown,
    TResult? Function()? decrementTimer,
    TResult? Function()? resendOtp,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function()? verifyOtp,
    TResult? Function(String otp)? changeOTP,
  }) {
    return startCountdown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String counryCode)? selectCountryCode,
    TResult Function()? loginPressed,
    TResult Function()? startCountdown,
    TResult Function()? decrementTimer,
    TResult Function()? resendOtp,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function()? verifyOtp,
    TResult Function(String otp)? changeOTP,
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
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(LoginPressed value) loginPressed,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(DecrementTimer value) decrementTimer,
    required TResult Function(ResendOtp value) resendOtp,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ChangeOTP value) changeOTP,
  }) {
    return startCountdown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(LoginPressed value)? loginPressed,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(DecrementTimer value)? decrementTimer,
    TResult? Function(ResendOtp value)? resendOtp,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ChangeOTP value)? changeOTP,
  }) {
    return startCountdown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(LoginPressed value)? loginPressed,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(DecrementTimer value)? decrementTimer,
    TResult Function(ResendOtp value)? resendOtp,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ChangeOTP value)? changeOTP,
    required TResult orElse(),
  }) {
    if (startCountdown != null) {
      return startCountdown(this);
    }
    return orElse();
  }
}

abstract class StartCountdown implements LoginFormEvent {
  const factory StartCountdown() = _$StartCountdownImpl;
}

/// @nodoc
abstract class _$$DecrementTimerImplCopyWith<$Res> {
  factory _$$DecrementTimerImplCopyWith(_$DecrementTimerImpl value,
          $Res Function(_$DecrementTimerImpl) then) =
      __$$DecrementTimerImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DecrementTimerImplCopyWithImpl<$Res>
    extends _$LoginFormEventCopyWithImpl<$Res, _$DecrementTimerImpl>
    implements _$$DecrementTimerImplCopyWith<$Res> {
  __$$DecrementTimerImplCopyWithImpl(
      _$DecrementTimerImpl _value, $Res Function(_$DecrementTimerImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DecrementTimerImpl implements DecrementTimer {
  const _$DecrementTimerImpl();

  @override
  String toString() {
    return 'LoginFormEvent.decrementTimer()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DecrementTimerImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String counryCode) selectCountryCode,
    required TResult Function() loginPressed,
    required TResult Function() startCountdown,
    required TResult Function() decrementTimer,
    required TResult Function() resendOtp,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function() verifyOtp,
    required TResult Function(String otp) changeOTP,
  }) {
    return decrementTimer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String counryCode)? selectCountryCode,
    TResult? Function()? loginPressed,
    TResult? Function()? startCountdown,
    TResult? Function()? decrementTimer,
    TResult? Function()? resendOtp,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function()? verifyOtp,
    TResult? Function(String otp)? changeOTP,
  }) {
    return decrementTimer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String counryCode)? selectCountryCode,
    TResult Function()? loginPressed,
    TResult Function()? startCountdown,
    TResult Function()? decrementTimer,
    TResult Function()? resendOtp,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function()? verifyOtp,
    TResult Function(String otp)? changeOTP,
    required TResult orElse(),
  }) {
    if (decrementTimer != null) {
      return decrementTimer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(LoginPressed value) loginPressed,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(DecrementTimer value) decrementTimer,
    required TResult Function(ResendOtp value) resendOtp,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ChangeOTP value) changeOTP,
  }) {
    return decrementTimer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(LoginPressed value)? loginPressed,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(DecrementTimer value)? decrementTimer,
    TResult? Function(ResendOtp value)? resendOtp,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ChangeOTP value)? changeOTP,
  }) {
    return decrementTimer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(LoginPressed value)? loginPressed,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(DecrementTimer value)? decrementTimer,
    TResult Function(ResendOtp value)? resendOtp,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ChangeOTP value)? changeOTP,
    required TResult orElse(),
  }) {
    if (decrementTimer != null) {
      return decrementTimer(this);
    }
    return orElse();
  }
}

abstract class DecrementTimer implements LoginFormEvent {
  const factory DecrementTimer() = _$DecrementTimerImpl;
}

/// @nodoc
abstract class _$$ResendOtpImplCopyWith<$Res> {
  factory _$$ResendOtpImplCopyWith(
          _$ResendOtpImpl value, $Res Function(_$ResendOtpImpl) then) =
      __$$ResendOtpImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResendOtpImplCopyWithImpl<$Res>
    extends _$LoginFormEventCopyWithImpl<$Res, _$ResendOtpImpl>
    implements _$$ResendOtpImplCopyWith<$Res> {
  __$$ResendOtpImplCopyWithImpl(
      _$ResendOtpImpl _value, $Res Function(_$ResendOtpImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResendOtpImpl implements ResendOtp {
  const _$ResendOtpImpl();

  @override
  String toString() {
    return 'LoginFormEvent.resendOtp()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResendOtpImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String counryCode) selectCountryCode,
    required TResult Function() loginPressed,
    required TResult Function() startCountdown,
    required TResult Function() decrementTimer,
    required TResult Function() resendOtp,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function() verifyOtp,
    required TResult Function(String otp) changeOTP,
  }) {
    return resendOtp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String counryCode)? selectCountryCode,
    TResult? Function()? loginPressed,
    TResult? Function()? startCountdown,
    TResult? Function()? decrementTimer,
    TResult? Function()? resendOtp,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function()? verifyOtp,
    TResult? Function(String otp)? changeOTP,
  }) {
    return resendOtp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String counryCode)? selectCountryCode,
    TResult Function()? loginPressed,
    TResult Function()? startCountdown,
    TResult Function()? decrementTimer,
    TResult Function()? resendOtp,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function()? verifyOtp,
    TResult Function(String otp)? changeOTP,
    required TResult orElse(),
  }) {
    if (resendOtp != null) {
      return resendOtp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(LoginPressed value) loginPressed,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(DecrementTimer value) decrementTimer,
    required TResult Function(ResendOtp value) resendOtp,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ChangeOTP value) changeOTP,
  }) {
    return resendOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(LoginPressed value)? loginPressed,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(DecrementTimer value)? decrementTimer,
    TResult? Function(ResendOtp value)? resendOtp,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ChangeOTP value)? changeOTP,
  }) {
    return resendOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(LoginPressed value)? loginPressed,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(DecrementTimer value)? decrementTimer,
    TResult Function(ResendOtp value)? resendOtp,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ChangeOTP value)? changeOTP,
    required TResult orElse(),
  }) {
    if (resendOtp != null) {
      return resendOtp(this);
    }
    return orElse();
  }
}

abstract class ResendOtp implements LoginFormEvent {
  const factory ResendOtp() = _$ResendOtpImpl;
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
    extends _$LoginFormEventCopyWithImpl<$Res, _$GetPrefilledPhoneNumberImpl>
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
    return 'LoginFormEvent.getPrefilledPhoneNumber(countryCode: $countryCode, phoneNumber: $phoneNumber)';
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
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String counryCode) selectCountryCode,
    required TResult Function() loginPressed,
    required TResult Function() startCountdown,
    required TResult Function() decrementTimer,
    required TResult Function() resendOtp,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function() verifyOtp,
    required TResult Function(String otp) changeOTP,
  }) {
    return getPrefilledPhoneNumber(countryCode, phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String counryCode)? selectCountryCode,
    TResult? Function()? loginPressed,
    TResult? Function()? startCountdown,
    TResult? Function()? decrementTimer,
    TResult? Function()? resendOtp,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function()? verifyOtp,
    TResult? Function(String otp)? changeOTP,
  }) {
    return getPrefilledPhoneNumber?.call(countryCode, phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String counryCode)? selectCountryCode,
    TResult Function()? loginPressed,
    TResult Function()? startCountdown,
    TResult Function()? decrementTimer,
    TResult Function()? resendOtp,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function()? verifyOtp,
    TResult Function(String otp)? changeOTP,
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
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(LoginPressed value) loginPressed,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(DecrementTimer value) decrementTimer,
    required TResult Function(ResendOtp value) resendOtp,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ChangeOTP value) changeOTP,
  }) {
    return getPrefilledPhoneNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(LoginPressed value)? loginPressed,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(DecrementTimer value)? decrementTimer,
    TResult? Function(ResendOtp value)? resendOtp,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ChangeOTP value)? changeOTP,
  }) {
    return getPrefilledPhoneNumber?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(LoginPressed value)? loginPressed,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(DecrementTimer value)? decrementTimer,
    TResult Function(ResendOtp value)? resendOtp,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ChangeOTP value)? changeOTP,
    required TResult orElse(),
  }) {
    if (getPrefilledPhoneNumber != null) {
      return getPrefilledPhoneNumber(this);
    }
    return orElse();
  }
}

abstract class GetPrefilledPhoneNumber implements LoginFormEvent {
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
abstract class _$$VerifyOtpImplCopyWith<$Res> {
  factory _$$VerifyOtpImplCopyWith(
          _$VerifyOtpImpl value, $Res Function(_$VerifyOtpImpl) then) =
      __$$VerifyOtpImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VerifyOtpImplCopyWithImpl<$Res>
    extends _$LoginFormEventCopyWithImpl<$Res, _$VerifyOtpImpl>
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
    return 'LoginFormEvent.verifyOtp()';
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
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String counryCode) selectCountryCode,
    required TResult Function() loginPressed,
    required TResult Function() startCountdown,
    required TResult Function() decrementTimer,
    required TResult Function() resendOtp,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function() verifyOtp,
    required TResult Function(String otp) changeOTP,
  }) {
    return verifyOtp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String counryCode)? selectCountryCode,
    TResult? Function()? loginPressed,
    TResult? Function()? startCountdown,
    TResult? Function()? decrementTimer,
    TResult? Function()? resendOtp,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function()? verifyOtp,
    TResult? Function(String otp)? changeOTP,
  }) {
    return verifyOtp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String counryCode)? selectCountryCode,
    TResult Function()? loginPressed,
    TResult Function()? startCountdown,
    TResult Function()? decrementTimer,
    TResult Function()? resendOtp,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function()? verifyOtp,
    TResult Function(String otp)? changeOTP,
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
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(LoginPressed value) loginPressed,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(DecrementTimer value) decrementTimer,
    required TResult Function(ResendOtp value) resendOtp,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ChangeOTP value) changeOTP,
  }) {
    return verifyOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(LoginPressed value)? loginPressed,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(DecrementTimer value)? decrementTimer,
    TResult? Function(ResendOtp value)? resendOtp,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ChangeOTP value)? changeOTP,
  }) {
    return verifyOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(LoginPressed value)? loginPressed,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(DecrementTimer value)? decrementTimer,
    TResult Function(ResendOtp value)? resendOtp,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ChangeOTP value)? changeOTP,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(this);
    }
    return orElse();
  }
}

abstract class VerifyOtp implements LoginFormEvent {
  const factory VerifyOtp() = _$VerifyOtpImpl;
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
    extends _$LoginFormEventCopyWithImpl<$Res, _$ChangeOTPImpl>
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
    return 'LoginFormEvent.changeOTP(otp: $otp)';
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
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String counryCode) selectCountryCode,
    required TResult Function() loginPressed,
    required TResult Function() startCountdown,
    required TResult Function() decrementTimer,
    required TResult Function() resendOtp,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function() verifyOtp,
    required TResult Function(String otp) changeOTP,
  }) {
    return changeOTP(otp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String counryCode)? selectCountryCode,
    TResult? Function()? loginPressed,
    TResult? Function()? startCountdown,
    TResult? Function()? decrementTimer,
    TResult? Function()? resendOtp,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function()? verifyOtp,
    TResult? Function(String otp)? changeOTP,
  }) {
    return changeOTP?.call(otp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String counryCode)? selectCountryCode,
    TResult Function()? loginPressed,
    TResult Function()? startCountdown,
    TResult Function()? decrementTimer,
    TResult Function()? resendOtp,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function()? verifyOtp,
    TResult Function(String otp)? changeOTP,
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
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(LoginPressed value) loginPressed,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(DecrementTimer value) decrementTimer,
    required TResult Function(ResendOtp value) resendOtp,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ChangeOTP value) changeOTP,
  }) {
    return changeOTP(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(LoginPressed value)? loginPressed,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(DecrementTimer value)? decrementTimer,
    TResult? Function(ResendOtp value)? resendOtp,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ChangeOTP value)? changeOTP,
  }) {
    return changeOTP?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(LoginPressed value)? loginPressed,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(DecrementTimer value)? decrementTimer,
    TResult Function(ResendOtp value)? resendOtp,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ChangeOTP value)? changeOTP,
    required TResult orElse(),
  }) {
    if (changeOTP != null) {
      return changeOTP(this);
    }
    return orElse();
  }
}

abstract class ChangeOTP implements LoginFormEvent {
  const factory ChangeOTP(final String otp) = _$ChangeOTPImpl;

  String get otp;
  @JsonKey(ignore: true)
  _$$ChangeOTPImplCopyWith<_$ChangeOTPImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LoginFormState {
  MobileNumber get mobileNumber => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  String get selectedCountrycode => throw _privateConstructorUsedError;
  OTPText get enteredOTP => throw _privateConstructorUsedError;
  int get secondsRemaining => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, String>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginFormStateCopyWith<LoginFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginFormStateCopyWith<$Res> {
  factory $LoginFormStateCopyWith(
          LoginFormState value, $Res Function(LoginFormState) then) =
      _$LoginFormStateCopyWithImpl<$Res, LoginFormState>;
  @useResult
  $Res call(
      {MobileNumber mobileNumber,
      bool showErrorMessages,
      bool isSubmitting,
      String selectedCountrycode,
      OTPText enteredOTP,
      int secondsRemaining,
      Option<Either<AuthFailure, String>> authFailureOrSuccessOption});
}

/// @nodoc
class _$LoginFormStateCopyWithImpl<$Res, $Val extends LoginFormState>
    implements $LoginFormStateCopyWith<$Res> {
  _$LoginFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mobileNumber = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? selectedCountrycode = null,
    Object? enteredOTP = null,
    Object? secondsRemaining = null,
    Object? authFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
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
              as Option<Either<AuthFailure, String>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginFormStateImplCopyWith<$Res>
    implements $LoginFormStateCopyWith<$Res> {
  factory _$$LoginFormStateImplCopyWith(_$LoginFormStateImpl value,
          $Res Function(_$LoginFormStateImpl) then) =
      __$$LoginFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MobileNumber mobileNumber,
      bool showErrorMessages,
      bool isSubmitting,
      String selectedCountrycode,
      OTPText enteredOTP,
      int secondsRemaining,
      Option<Either<AuthFailure, String>> authFailureOrSuccessOption});
}

/// @nodoc
class __$$LoginFormStateImplCopyWithImpl<$Res>
    extends _$LoginFormStateCopyWithImpl<$Res, _$LoginFormStateImpl>
    implements _$$LoginFormStateImplCopyWith<$Res> {
  __$$LoginFormStateImplCopyWithImpl(
      _$LoginFormStateImpl _value, $Res Function(_$LoginFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mobileNumber = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? selectedCountrycode = null,
    Object? enteredOTP = null,
    Object? secondsRemaining = null,
    Object? authFailureOrSuccessOption = null,
  }) {
    return _then(_$LoginFormStateImpl(
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
              as Option<Either<AuthFailure, String>>,
    ));
  }
}

/// @nodoc

class _$LoginFormStateImpl implements _LoginFormState {
  const _$LoginFormStateImpl(
      {required this.mobileNumber,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.selectedCountrycode,
      required this.enteredOTP,
      required this.secondsRemaining,
      required this.authFailureOrSuccessOption});

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
  final Option<Either<AuthFailure, String>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'LoginFormState(mobileNumber: $mobileNumber, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, selectedCountrycode: $selectedCountrycode, enteredOTP: $enteredOTP, secondsRemaining: $secondsRemaining, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginFormStateImpl &&
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
  _$$LoginFormStateImplCopyWith<_$LoginFormStateImpl> get copyWith =>
      __$$LoginFormStateImplCopyWithImpl<_$LoginFormStateImpl>(
          this, _$identity);
}

abstract class _LoginFormState implements LoginFormState {
  const factory _LoginFormState(
      {required final MobileNumber mobileNumber,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final String selectedCountrycode,
      required final OTPText enteredOTP,
      required final int secondsRemaining,
      required final Option<Either<AuthFailure, String>>
          authFailureOrSuccessOption}) = _$LoginFormStateImpl;

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
  Option<Either<AuthFailure, String>> get authFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$LoginFormStateImplCopyWith<_$LoginFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
