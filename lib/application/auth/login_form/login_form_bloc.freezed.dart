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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String counryCode)? selectCountryCode,
    TResult? Function()? loginPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String counryCode)? selectCountryCode,
    TResult Function()? loginPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(LoginPressed value) loginPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(LoginPressed value)? loginPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(LoginPressed value)? loginPressed,
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
  }) {
    return mobileNumberChanged(mobileNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String counryCode)? selectCountryCode,
    TResult? Function()? loginPressed,
  }) {
    return mobileNumberChanged?.call(mobileNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String counryCode)? selectCountryCode,
    TResult Function()? loginPressed,
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
  }) {
    return mobileNumberChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(LoginPressed value)? loginPressed,
  }) {
    return mobileNumberChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(LoginPressed value)? loginPressed,
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
  }) {
    return selectCountryCode(counryCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String counryCode)? selectCountryCode,
    TResult? Function()? loginPressed,
  }) {
    return selectCountryCode?.call(counryCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String counryCode)? selectCountryCode,
    TResult Function()? loginPressed,
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
  }) {
    return selectCountryCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(LoginPressed value)? loginPressed,
  }) {
    return selectCountryCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(LoginPressed value)? loginPressed,
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
  }) {
    return loginPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String counryCode)? selectCountryCode,
    TResult? Function()? loginPressed,
  }) {
    return loginPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String counryCode)? selectCountryCode,
    TResult Function()? loginPressed,
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
  }) {
    return loginPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(LoginPressed value)? loginPressed,
  }) {
    return loginPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(LoginPressed value)? loginPressed,
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
mixin _$LoginFormState {
  MobileNumber get mobileNumber => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  String get selectedCountrycode => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption =>
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
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption});
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
      authFailureOrSuccessOption: null == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
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
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption});
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
      authFailureOrSuccessOption: null == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
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
  final Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'LoginFormState(mobileNumber: $mobileNumber, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, selectedCountrycode: $selectedCountrycode, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
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
            (identical(other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption) ||
                other.authFailureOrSuccessOption ==
                    authFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mobileNumber, showErrorMessages,
      isSubmitting, selectedCountrycode, authFailureOrSuccessOption);

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
      required final Option<Either<AuthFailure, Unit>>
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
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$LoginFormStateImplCopyWith<_$LoginFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
