// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditProfileState {
  Option<Either<AccountFailure, List>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  Option<Either<AuthFailure, String>> get otpFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  String get selectImage => throw _privateConstructorUsedError;
  Username get firstName => throw _privateConstructorUsedError;
  Username get lastName => throw _privateConstructorUsedError;
  EmailAddress get emailAddress => throw _privateConstructorUsedError;
  MobileNumber get mobileNumber => throw _privateConstructorUsedError;
  String get countryCode => throw _privateConstructorUsedError;
  Account get currentUser => throw _privateConstructorUsedError;
  OTPText get enteredOTP => throw _privateConstructorUsedError;
  int get secondsRemaining => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditProfileStateCopyWith<EditProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileStateCopyWith<$Res> {
  factory $EditProfileStateCopyWith(
          EditProfileState value, $Res Function(EditProfileState) then) =
      _$EditProfileStateCopyWithImpl<$Res, EditProfileState>;
  @useResult
  $Res call(
      {Option<Either<AccountFailure, List>> authFailureOrSuccessOption,
      Option<Either<AuthFailure, String>> otpFailureOrSuccessOption,
      bool showErrorMessages,
      bool isSubmitting,
      String selectImage,
      Username firstName,
      Username lastName,
      EmailAddress emailAddress,
      MobileNumber mobileNumber,
      String countryCode,
      Account currentUser,
      OTPText enteredOTP,
      int secondsRemaining});

  $AccountCopyWith<$Res> get currentUser;
}

/// @nodoc
class _$EditProfileStateCopyWithImpl<$Res, $Val extends EditProfileState>
    implements $EditProfileStateCopyWith<$Res> {
  _$EditProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authFailureOrSuccessOption = null,
    Object? otpFailureOrSuccessOption = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? selectImage = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? emailAddress = null,
    Object? mobileNumber = null,
    Object? countryCode = null,
    Object? currentUser = null,
    Object? enteredOTP = null,
    Object? secondsRemaining = null,
  }) {
    return _then(_value.copyWith(
      authFailureOrSuccessOption: null == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AccountFailure, List>>,
      otpFailureOrSuccessOption: null == otpFailureOrSuccessOption
          ? _value.otpFailureOrSuccessOption
          : otpFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, String>>,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      selectImage: null == selectImage
          ? _value.selectImage
          : selectImage // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as Username,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as Username,
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as MobileNumber,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      currentUser: null == currentUser
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as Account,
      enteredOTP: null == enteredOTP
          ? _value.enteredOTP
          : enteredOTP // ignore: cast_nullable_to_non_nullable
              as OTPText,
      secondsRemaining: null == secondsRemaining
          ? _value.secondsRemaining
          : secondsRemaining // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res> get currentUser {
    return $AccountCopyWith<$Res>(_value.currentUser, (value) {
      return _then(_value.copyWith(currentUser: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EditProfileStateImplCopyWith<$Res>
    implements $EditProfileStateCopyWith<$Res> {
  factory _$$EditProfileStateImplCopyWith(_$EditProfileStateImpl value,
          $Res Function(_$EditProfileStateImpl) then) =
      __$$EditProfileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Option<Either<AccountFailure, List>> authFailureOrSuccessOption,
      Option<Either<AuthFailure, String>> otpFailureOrSuccessOption,
      bool showErrorMessages,
      bool isSubmitting,
      String selectImage,
      Username firstName,
      Username lastName,
      EmailAddress emailAddress,
      MobileNumber mobileNumber,
      String countryCode,
      Account currentUser,
      OTPText enteredOTP,
      int secondsRemaining});

  @override
  $AccountCopyWith<$Res> get currentUser;
}

/// @nodoc
class __$$EditProfileStateImplCopyWithImpl<$Res>
    extends _$EditProfileStateCopyWithImpl<$Res, _$EditProfileStateImpl>
    implements _$$EditProfileStateImplCopyWith<$Res> {
  __$$EditProfileStateImplCopyWithImpl(_$EditProfileStateImpl _value,
      $Res Function(_$EditProfileStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authFailureOrSuccessOption = null,
    Object? otpFailureOrSuccessOption = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? selectImage = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? emailAddress = null,
    Object? mobileNumber = null,
    Object? countryCode = null,
    Object? currentUser = null,
    Object? enteredOTP = null,
    Object? secondsRemaining = null,
  }) {
    return _then(_$EditProfileStateImpl(
      authFailureOrSuccessOption: null == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AccountFailure, List>>,
      otpFailureOrSuccessOption: null == otpFailureOrSuccessOption
          ? _value.otpFailureOrSuccessOption
          : otpFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, String>>,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      selectImage: null == selectImage
          ? _value.selectImage
          : selectImage // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as Username,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as Username,
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as MobileNumber,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      currentUser: null == currentUser
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as Account,
      enteredOTP: null == enteredOTP
          ? _value.enteredOTP
          : enteredOTP // ignore: cast_nullable_to_non_nullable
              as OTPText,
      secondsRemaining: null == secondsRemaining
          ? _value.secondsRemaining
          : secondsRemaining // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$EditProfileStateImpl implements _EditProfileState {
  const _$EditProfileStateImpl(
      {required this.authFailureOrSuccessOption,
      required this.otpFailureOrSuccessOption,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.selectImage,
      required this.firstName,
      required this.lastName,
      required this.emailAddress,
      required this.mobileNumber,
      required this.countryCode,
      required this.currentUser,
      required this.enteredOTP,
      required this.secondsRemaining});

  @override
  final Option<Either<AccountFailure, List>> authFailureOrSuccessOption;
  @override
  final Option<Either<AuthFailure, String>> otpFailureOrSuccessOption;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final String selectImage;
  @override
  final Username firstName;
  @override
  final Username lastName;
  @override
  final EmailAddress emailAddress;
  @override
  final MobileNumber mobileNumber;
  @override
  final String countryCode;
  @override
  final Account currentUser;
  @override
  final OTPText enteredOTP;
  @override
  final int secondsRemaining;

  @override
  String toString() {
    return 'EditProfileState(authFailureOrSuccessOption: $authFailureOrSuccessOption, otpFailureOrSuccessOption: $otpFailureOrSuccessOption, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, selectImage: $selectImage, firstName: $firstName, lastName: $lastName, emailAddress: $emailAddress, mobileNumber: $mobileNumber, countryCode: $countryCode, currentUser: $currentUser, enteredOTP: $enteredOTP, secondsRemaining: $secondsRemaining)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditProfileStateImpl &&
            (identical(other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption) ||
                other.authFailureOrSuccessOption ==
                    authFailureOrSuccessOption) &&
            (identical(other.otpFailureOrSuccessOption,
                    otpFailureOrSuccessOption) ||
                other.otpFailureOrSuccessOption == otpFailureOrSuccessOption) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.selectImage, selectImage) ||
                other.selectImage == selectImage) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.currentUser, currentUser) ||
                other.currentUser == currentUser) &&
            (identical(other.enteredOTP, enteredOTP) ||
                other.enteredOTP == enteredOTP) &&
            (identical(other.secondsRemaining, secondsRemaining) ||
                other.secondsRemaining == secondsRemaining));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      authFailureOrSuccessOption,
      otpFailureOrSuccessOption,
      showErrorMessages,
      isSubmitting,
      selectImage,
      firstName,
      lastName,
      emailAddress,
      mobileNumber,
      countryCode,
      currentUser,
      enteredOTP,
      secondsRemaining);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditProfileStateImplCopyWith<_$EditProfileStateImpl> get copyWith =>
      __$$EditProfileStateImplCopyWithImpl<_$EditProfileStateImpl>(
          this, _$identity);
}

abstract class _EditProfileState implements EditProfileState {
  const factory _EditProfileState(
      {required final Option<Either<AccountFailure, List>>
          authFailureOrSuccessOption,
      required final Option<Either<AuthFailure, String>>
          otpFailureOrSuccessOption,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final String selectImage,
      required final Username firstName,
      required final Username lastName,
      required final EmailAddress emailAddress,
      required final MobileNumber mobileNumber,
      required final String countryCode,
      required final Account currentUser,
      required final OTPText enteredOTP,
      required final int secondsRemaining}) = _$EditProfileStateImpl;

  @override
  Option<Either<AccountFailure, List>> get authFailureOrSuccessOption;
  @override
  Option<Either<AuthFailure, String>> get otpFailureOrSuccessOption;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  String get selectImage;
  @override
  Username get firstName;
  @override
  Username get lastName;
  @override
  EmailAddress get emailAddress;
  @override
  MobileNumber get mobileNumber;
  @override
  String get countryCode;
  @override
  Account get currentUser;
  @override
  OTPText get enteredOTP;
  @override
  int get secondsRemaining;
  @override
  @JsonKey(ignore: true)
  _$$EditProfileStateImplCopyWith<_$EditProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EditProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String imagePath) changeProfilePicture,
    required TResult Function(String firstName) firstNameChanged,
    required TResult Function(String lastName) lastNameChanged,
    required TResult Function(String email) emailAddressChanged,
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String countryCode) countryCodeChanged,
    required TResult Function() saveButtonPressed,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function() verifyOtp,
    required TResult Function(String otp) changeOTP,
    required TResult Function() startCountdown,
    required TResult Function() decrementTimer,
    required TResult Function() resendOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String imagePath)? changeProfilePicture,
    TResult? Function(String firstName)? firstNameChanged,
    TResult? Function(String lastName)? lastNameChanged,
    TResult? Function(String email)? emailAddressChanged,
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String countryCode)? countryCodeChanged,
    TResult? Function()? saveButtonPressed,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function()? verifyOtp,
    TResult? Function(String otp)? changeOTP,
    TResult? Function()? startCountdown,
    TResult? Function()? decrementTimer,
    TResult? Function()? resendOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String imagePath)? changeProfilePicture,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function(String email)? emailAddressChanged,
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String countryCode)? countryCodeChanged,
    TResult Function()? saveButtonPressed,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function()? verifyOtp,
    TResult Function(String otp)? changeOTP,
    TResult Function()? startCountdown,
    TResult Function()? decrementTimer,
    TResult Function()? resendOtp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeProfilePicture value) changeProfilePicture,
    required TResult Function(FirstNameChanged value) firstNameChanged,
    required TResult Function(LastNameChanged value) lastNameChanged,
    required TResult Function(EmailAddressChanged value) emailAddressChanged,
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(CountryCodeChanged value) countryCodeChanged,
    required TResult Function(SaveButtonPressed value) saveButtonPressed,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ChangeOTP value) changeOTP,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(DecrementTimer value) decrementTimer,
    required TResult Function(ResendOtp value) resendOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeProfilePicture value)? changeProfilePicture,
    TResult? Function(FirstNameChanged value)? firstNameChanged,
    TResult? Function(LastNameChanged value)? lastNameChanged,
    TResult? Function(EmailAddressChanged value)? emailAddressChanged,
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(CountryCodeChanged value)? countryCodeChanged,
    TResult? Function(SaveButtonPressed value)? saveButtonPressed,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ChangeOTP value)? changeOTP,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(DecrementTimer value)? decrementTimer,
    TResult? Function(ResendOtp value)? resendOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeProfilePicture value)? changeProfilePicture,
    TResult Function(FirstNameChanged value)? firstNameChanged,
    TResult Function(LastNameChanged value)? lastNameChanged,
    TResult Function(EmailAddressChanged value)? emailAddressChanged,
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(CountryCodeChanged value)? countryCodeChanged,
    TResult Function(SaveButtonPressed value)? saveButtonPressed,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ChangeOTP value)? changeOTP,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(DecrementTimer value)? decrementTimer,
    TResult Function(ResendOtp value)? resendOtp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileEventCopyWith<$Res> {
  factory $EditProfileEventCopyWith(
          EditProfileEvent value, $Res Function(EditProfileEvent) then) =
      _$EditProfileEventCopyWithImpl<$Res, EditProfileEvent>;
}

/// @nodoc
class _$EditProfileEventCopyWithImpl<$Res, $Val extends EditProfileEvent>
    implements $EditProfileEventCopyWith<$Res> {
  _$EditProfileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ChangeProfilePictureImplCopyWith<$Res> {
  factory _$$ChangeProfilePictureImplCopyWith(_$ChangeProfilePictureImpl value,
          $Res Function(_$ChangeProfilePictureImpl) then) =
      __$$ChangeProfilePictureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String imagePath});
}

/// @nodoc
class __$$ChangeProfilePictureImplCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res, _$ChangeProfilePictureImpl>
    implements _$$ChangeProfilePictureImplCopyWith<$Res> {
  __$$ChangeProfilePictureImplCopyWithImpl(_$ChangeProfilePictureImpl _value,
      $Res Function(_$ChangeProfilePictureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePath = null,
  }) {
    return _then(_$ChangeProfilePictureImpl(
      null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeProfilePictureImpl implements _ChangeProfilePicture {
  const _$ChangeProfilePictureImpl(this.imagePath);

  @override
  final String imagePath;

  @override
  String toString() {
    return 'EditProfileEvent.changeProfilePicture(imagePath: $imagePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeProfilePictureImpl &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imagePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeProfilePictureImplCopyWith<_$ChangeProfilePictureImpl>
      get copyWith =>
          __$$ChangeProfilePictureImplCopyWithImpl<_$ChangeProfilePictureImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String imagePath) changeProfilePicture,
    required TResult Function(String firstName) firstNameChanged,
    required TResult Function(String lastName) lastNameChanged,
    required TResult Function(String email) emailAddressChanged,
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String countryCode) countryCodeChanged,
    required TResult Function() saveButtonPressed,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function() verifyOtp,
    required TResult Function(String otp) changeOTP,
    required TResult Function() startCountdown,
    required TResult Function() decrementTimer,
    required TResult Function() resendOtp,
  }) {
    return changeProfilePicture(imagePath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String imagePath)? changeProfilePicture,
    TResult? Function(String firstName)? firstNameChanged,
    TResult? Function(String lastName)? lastNameChanged,
    TResult? Function(String email)? emailAddressChanged,
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String countryCode)? countryCodeChanged,
    TResult? Function()? saveButtonPressed,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function()? verifyOtp,
    TResult? Function(String otp)? changeOTP,
    TResult? Function()? startCountdown,
    TResult? Function()? decrementTimer,
    TResult? Function()? resendOtp,
  }) {
    return changeProfilePicture?.call(imagePath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String imagePath)? changeProfilePicture,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function(String email)? emailAddressChanged,
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String countryCode)? countryCodeChanged,
    TResult Function()? saveButtonPressed,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function()? verifyOtp,
    TResult Function(String otp)? changeOTP,
    TResult Function()? startCountdown,
    TResult Function()? decrementTimer,
    TResult Function()? resendOtp,
    required TResult orElse(),
  }) {
    if (changeProfilePicture != null) {
      return changeProfilePicture(imagePath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeProfilePicture value) changeProfilePicture,
    required TResult Function(FirstNameChanged value) firstNameChanged,
    required TResult Function(LastNameChanged value) lastNameChanged,
    required TResult Function(EmailAddressChanged value) emailAddressChanged,
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(CountryCodeChanged value) countryCodeChanged,
    required TResult Function(SaveButtonPressed value) saveButtonPressed,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ChangeOTP value) changeOTP,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(DecrementTimer value) decrementTimer,
    required TResult Function(ResendOtp value) resendOtp,
  }) {
    return changeProfilePicture(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeProfilePicture value)? changeProfilePicture,
    TResult? Function(FirstNameChanged value)? firstNameChanged,
    TResult? Function(LastNameChanged value)? lastNameChanged,
    TResult? Function(EmailAddressChanged value)? emailAddressChanged,
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(CountryCodeChanged value)? countryCodeChanged,
    TResult? Function(SaveButtonPressed value)? saveButtonPressed,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ChangeOTP value)? changeOTP,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(DecrementTimer value)? decrementTimer,
    TResult? Function(ResendOtp value)? resendOtp,
  }) {
    return changeProfilePicture?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeProfilePicture value)? changeProfilePicture,
    TResult Function(FirstNameChanged value)? firstNameChanged,
    TResult Function(LastNameChanged value)? lastNameChanged,
    TResult Function(EmailAddressChanged value)? emailAddressChanged,
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(CountryCodeChanged value)? countryCodeChanged,
    TResult Function(SaveButtonPressed value)? saveButtonPressed,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ChangeOTP value)? changeOTP,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(DecrementTimer value)? decrementTimer,
    TResult Function(ResendOtp value)? resendOtp,
    required TResult orElse(),
  }) {
    if (changeProfilePicture != null) {
      return changeProfilePicture(this);
    }
    return orElse();
  }
}

abstract class _ChangeProfilePicture implements EditProfileEvent {
  const factory _ChangeProfilePicture(final String imagePath) =
      _$ChangeProfilePictureImpl;

  String get imagePath;
  @JsonKey(ignore: true)
  _$$ChangeProfilePictureImplCopyWith<_$ChangeProfilePictureImpl>
      get copyWith => throw _privateConstructorUsedError;
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
    extends _$EditProfileEventCopyWithImpl<$Res, _$FirstNameChangedImpl>
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
    return 'EditProfileEvent.firstNameChanged(firstName: $firstName)';
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
    required TResult Function(String imagePath) changeProfilePicture,
    required TResult Function(String firstName) firstNameChanged,
    required TResult Function(String lastName) lastNameChanged,
    required TResult Function(String email) emailAddressChanged,
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String countryCode) countryCodeChanged,
    required TResult Function() saveButtonPressed,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function() verifyOtp,
    required TResult Function(String otp) changeOTP,
    required TResult Function() startCountdown,
    required TResult Function() decrementTimer,
    required TResult Function() resendOtp,
  }) {
    return firstNameChanged(firstName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String imagePath)? changeProfilePicture,
    TResult? Function(String firstName)? firstNameChanged,
    TResult? Function(String lastName)? lastNameChanged,
    TResult? Function(String email)? emailAddressChanged,
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String countryCode)? countryCodeChanged,
    TResult? Function()? saveButtonPressed,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function()? verifyOtp,
    TResult? Function(String otp)? changeOTP,
    TResult? Function()? startCountdown,
    TResult? Function()? decrementTimer,
    TResult? Function()? resendOtp,
  }) {
    return firstNameChanged?.call(firstName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String imagePath)? changeProfilePicture,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function(String email)? emailAddressChanged,
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String countryCode)? countryCodeChanged,
    TResult Function()? saveButtonPressed,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function()? verifyOtp,
    TResult Function(String otp)? changeOTP,
    TResult Function()? startCountdown,
    TResult Function()? decrementTimer,
    TResult Function()? resendOtp,
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
    required TResult Function(_ChangeProfilePicture value) changeProfilePicture,
    required TResult Function(FirstNameChanged value) firstNameChanged,
    required TResult Function(LastNameChanged value) lastNameChanged,
    required TResult Function(EmailAddressChanged value) emailAddressChanged,
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(CountryCodeChanged value) countryCodeChanged,
    required TResult Function(SaveButtonPressed value) saveButtonPressed,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ChangeOTP value) changeOTP,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(DecrementTimer value) decrementTimer,
    required TResult Function(ResendOtp value) resendOtp,
  }) {
    return firstNameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeProfilePicture value)? changeProfilePicture,
    TResult? Function(FirstNameChanged value)? firstNameChanged,
    TResult? Function(LastNameChanged value)? lastNameChanged,
    TResult? Function(EmailAddressChanged value)? emailAddressChanged,
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(CountryCodeChanged value)? countryCodeChanged,
    TResult? Function(SaveButtonPressed value)? saveButtonPressed,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ChangeOTP value)? changeOTP,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(DecrementTimer value)? decrementTimer,
    TResult? Function(ResendOtp value)? resendOtp,
  }) {
    return firstNameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeProfilePicture value)? changeProfilePicture,
    TResult Function(FirstNameChanged value)? firstNameChanged,
    TResult Function(LastNameChanged value)? lastNameChanged,
    TResult Function(EmailAddressChanged value)? emailAddressChanged,
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(CountryCodeChanged value)? countryCodeChanged,
    TResult Function(SaveButtonPressed value)? saveButtonPressed,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ChangeOTP value)? changeOTP,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(DecrementTimer value)? decrementTimer,
    TResult Function(ResendOtp value)? resendOtp,
    required TResult orElse(),
  }) {
    if (firstNameChanged != null) {
      return firstNameChanged(this);
    }
    return orElse();
  }
}

abstract class FirstNameChanged implements EditProfileEvent {
  const factory FirstNameChanged(final String firstName) =
      _$FirstNameChangedImpl;

  String get firstName;
  @JsonKey(ignore: true)
  _$$FirstNameChangedImplCopyWith<_$FirstNameChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$EditProfileEventCopyWithImpl<$Res, _$LastNameChangedImpl>
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
    return 'EditProfileEvent.lastNameChanged(lastName: $lastName)';
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
    required TResult Function(String imagePath) changeProfilePicture,
    required TResult Function(String firstName) firstNameChanged,
    required TResult Function(String lastName) lastNameChanged,
    required TResult Function(String email) emailAddressChanged,
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String countryCode) countryCodeChanged,
    required TResult Function() saveButtonPressed,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function() verifyOtp,
    required TResult Function(String otp) changeOTP,
    required TResult Function() startCountdown,
    required TResult Function() decrementTimer,
    required TResult Function() resendOtp,
  }) {
    return lastNameChanged(lastName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String imagePath)? changeProfilePicture,
    TResult? Function(String firstName)? firstNameChanged,
    TResult? Function(String lastName)? lastNameChanged,
    TResult? Function(String email)? emailAddressChanged,
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String countryCode)? countryCodeChanged,
    TResult? Function()? saveButtonPressed,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function()? verifyOtp,
    TResult? Function(String otp)? changeOTP,
    TResult? Function()? startCountdown,
    TResult? Function()? decrementTimer,
    TResult? Function()? resendOtp,
  }) {
    return lastNameChanged?.call(lastName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String imagePath)? changeProfilePicture,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function(String email)? emailAddressChanged,
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String countryCode)? countryCodeChanged,
    TResult Function()? saveButtonPressed,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function()? verifyOtp,
    TResult Function(String otp)? changeOTP,
    TResult Function()? startCountdown,
    TResult Function()? decrementTimer,
    TResult Function()? resendOtp,
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
    required TResult Function(_ChangeProfilePicture value) changeProfilePicture,
    required TResult Function(FirstNameChanged value) firstNameChanged,
    required TResult Function(LastNameChanged value) lastNameChanged,
    required TResult Function(EmailAddressChanged value) emailAddressChanged,
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(CountryCodeChanged value) countryCodeChanged,
    required TResult Function(SaveButtonPressed value) saveButtonPressed,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ChangeOTP value) changeOTP,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(DecrementTimer value) decrementTimer,
    required TResult Function(ResendOtp value) resendOtp,
  }) {
    return lastNameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeProfilePicture value)? changeProfilePicture,
    TResult? Function(FirstNameChanged value)? firstNameChanged,
    TResult? Function(LastNameChanged value)? lastNameChanged,
    TResult? Function(EmailAddressChanged value)? emailAddressChanged,
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(CountryCodeChanged value)? countryCodeChanged,
    TResult? Function(SaveButtonPressed value)? saveButtonPressed,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ChangeOTP value)? changeOTP,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(DecrementTimer value)? decrementTimer,
    TResult? Function(ResendOtp value)? resendOtp,
  }) {
    return lastNameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeProfilePicture value)? changeProfilePicture,
    TResult Function(FirstNameChanged value)? firstNameChanged,
    TResult Function(LastNameChanged value)? lastNameChanged,
    TResult Function(EmailAddressChanged value)? emailAddressChanged,
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(CountryCodeChanged value)? countryCodeChanged,
    TResult Function(SaveButtonPressed value)? saveButtonPressed,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ChangeOTP value)? changeOTP,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(DecrementTimer value)? decrementTimer,
    TResult Function(ResendOtp value)? resendOtp,
    required TResult orElse(),
  }) {
    if (lastNameChanged != null) {
      return lastNameChanged(this);
    }
    return orElse();
  }
}

abstract class LastNameChanged implements EditProfileEvent {
  const factory LastNameChanged(final String lastName) = _$LastNameChangedImpl;

  String get lastName;
  @JsonKey(ignore: true)
  _$$LastNameChangedImplCopyWith<_$LastNameChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmailAddressChangedImplCopyWith<$Res> {
  factory _$$EmailAddressChangedImplCopyWith(_$EmailAddressChangedImpl value,
          $Res Function(_$EmailAddressChangedImpl) then) =
      __$$EmailAddressChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$EmailAddressChangedImplCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res, _$EmailAddressChangedImpl>
    implements _$$EmailAddressChangedImplCopyWith<$Res> {
  __$$EmailAddressChangedImplCopyWithImpl(_$EmailAddressChangedImpl _value,
      $Res Function(_$EmailAddressChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$EmailAddressChangedImpl(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmailAddressChangedImpl implements EmailAddressChanged {
  const _$EmailAddressChangedImpl(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'EditProfileEvent.emailAddressChanged(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailAddressChangedImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailAddressChangedImplCopyWith<_$EmailAddressChangedImpl> get copyWith =>
      __$$EmailAddressChangedImplCopyWithImpl<_$EmailAddressChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String imagePath) changeProfilePicture,
    required TResult Function(String firstName) firstNameChanged,
    required TResult Function(String lastName) lastNameChanged,
    required TResult Function(String email) emailAddressChanged,
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String countryCode) countryCodeChanged,
    required TResult Function() saveButtonPressed,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function() verifyOtp,
    required TResult Function(String otp) changeOTP,
    required TResult Function() startCountdown,
    required TResult Function() decrementTimer,
    required TResult Function() resendOtp,
  }) {
    return emailAddressChanged(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String imagePath)? changeProfilePicture,
    TResult? Function(String firstName)? firstNameChanged,
    TResult? Function(String lastName)? lastNameChanged,
    TResult? Function(String email)? emailAddressChanged,
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String countryCode)? countryCodeChanged,
    TResult? Function()? saveButtonPressed,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function()? verifyOtp,
    TResult? Function(String otp)? changeOTP,
    TResult? Function()? startCountdown,
    TResult? Function()? decrementTimer,
    TResult? Function()? resendOtp,
  }) {
    return emailAddressChanged?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String imagePath)? changeProfilePicture,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function(String email)? emailAddressChanged,
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String countryCode)? countryCodeChanged,
    TResult Function()? saveButtonPressed,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function()? verifyOtp,
    TResult Function(String otp)? changeOTP,
    TResult Function()? startCountdown,
    TResult Function()? decrementTimer,
    TResult Function()? resendOtp,
    required TResult orElse(),
  }) {
    if (emailAddressChanged != null) {
      return emailAddressChanged(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeProfilePicture value) changeProfilePicture,
    required TResult Function(FirstNameChanged value) firstNameChanged,
    required TResult Function(LastNameChanged value) lastNameChanged,
    required TResult Function(EmailAddressChanged value) emailAddressChanged,
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(CountryCodeChanged value) countryCodeChanged,
    required TResult Function(SaveButtonPressed value) saveButtonPressed,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ChangeOTP value) changeOTP,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(DecrementTimer value) decrementTimer,
    required TResult Function(ResendOtp value) resendOtp,
  }) {
    return emailAddressChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeProfilePicture value)? changeProfilePicture,
    TResult? Function(FirstNameChanged value)? firstNameChanged,
    TResult? Function(LastNameChanged value)? lastNameChanged,
    TResult? Function(EmailAddressChanged value)? emailAddressChanged,
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(CountryCodeChanged value)? countryCodeChanged,
    TResult? Function(SaveButtonPressed value)? saveButtonPressed,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ChangeOTP value)? changeOTP,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(DecrementTimer value)? decrementTimer,
    TResult? Function(ResendOtp value)? resendOtp,
  }) {
    return emailAddressChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeProfilePicture value)? changeProfilePicture,
    TResult Function(FirstNameChanged value)? firstNameChanged,
    TResult Function(LastNameChanged value)? lastNameChanged,
    TResult Function(EmailAddressChanged value)? emailAddressChanged,
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(CountryCodeChanged value)? countryCodeChanged,
    TResult Function(SaveButtonPressed value)? saveButtonPressed,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ChangeOTP value)? changeOTP,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(DecrementTimer value)? decrementTimer,
    TResult Function(ResendOtp value)? resendOtp,
    required TResult orElse(),
  }) {
    if (emailAddressChanged != null) {
      return emailAddressChanged(this);
    }
    return orElse();
  }
}

abstract class EmailAddressChanged implements EditProfileEvent {
  const factory EmailAddressChanged(final String email) =
      _$EmailAddressChangedImpl;

  String get email;
  @JsonKey(ignore: true)
  _$$EmailAddressChangedImplCopyWith<_$EmailAddressChangedImpl> get copyWith =>
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
    extends _$EditProfileEventCopyWithImpl<$Res, _$MobileNumberChangedImpl>
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
    return 'EditProfileEvent.mobileNumberChanged(mobileNumber: $mobileNumber)';
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
    required TResult Function(String imagePath) changeProfilePicture,
    required TResult Function(String firstName) firstNameChanged,
    required TResult Function(String lastName) lastNameChanged,
    required TResult Function(String email) emailAddressChanged,
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String countryCode) countryCodeChanged,
    required TResult Function() saveButtonPressed,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function() verifyOtp,
    required TResult Function(String otp) changeOTP,
    required TResult Function() startCountdown,
    required TResult Function() decrementTimer,
    required TResult Function() resendOtp,
  }) {
    return mobileNumberChanged(mobileNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String imagePath)? changeProfilePicture,
    TResult? Function(String firstName)? firstNameChanged,
    TResult? Function(String lastName)? lastNameChanged,
    TResult? Function(String email)? emailAddressChanged,
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String countryCode)? countryCodeChanged,
    TResult? Function()? saveButtonPressed,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function()? verifyOtp,
    TResult? Function(String otp)? changeOTP,
    TResult? Function()? startCountdown,
    TResult? Function()? decrementTimer,
    TResult? Function()? resendOtp,
  }) {
    return mobileNumberChanged?.call(mobileNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String imagePath)? changeProfilePicture,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function(String email)? emailAddressChanged,
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String countryCode)? countryCodeChanged,
    TResult Function()? saveButtonPressed,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function()? verifyOtp,
    TResult Function(String otp)? changeOTP,
    TResult Function()? startCountdown,
    TResult Function()? decrementTimer,
    TResult Function()? resendOtp,
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
    required TResult Function(_ChangeProfilePicture value) changeProfilePicture,
    required TResult Function(FirstNameChanged value) firstNameChanged,
    required TResult Function(LastNameChanged value) lastNameChanged,
    required TResult Function(EmailAddressChanged value) emailAddressChanged,
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(CountryCodeChanged value) countryCodeChanged,
    required TResult Function(SaveButtonPressed value) saveButtonPressed,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ChangeOTP value) changeOTP,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(DecrementTimer value) decrementTimer,
    required TResult Function(ResendOtp value) resendOtp,
  }) {
    return mobileNumberChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeProfilePicture value)? changeProfilePicture,
    TResult? Function(FirstNameChanged value)? firstNameChanged,
    TResult? Function(LastNameChanged value)? lastNameChanged,
    TResult? Function(EmailAddressChanged value)? emailAddressChanged,
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(CountryCodeChanged value)? countryCodeChanged,
    TResult? Function(SaveButtonPressed value)? saveButtonPressed,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ChangeOTP value)? changeOTP,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(DecrementTimer value)? decrementTimer,
    TResult? Function(ResendOtp value)? resendOtp,
  }) {
    return mobileNumberChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeProfilePicture value)? changeProfilePicture,
    TResult Function(FirstNameChanged value)? firstNameChanged,
    TResult Function(LastNameChanged value)? lastNameChanged,
    TResult Function(EmailAddressChanged value)? emailAddressChanged,
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(CountryCodeChanged value)? countryCodeChanged,
    TResult Function(SaveButtonPressed value)? saveButtonPressed,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ChangeOTP value)? changeOTP,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(DecrementTimer value)? decrementTimer,
    TResult Function(ResendOtp value)? resendOtp,
    required TResult orElse(),
  }) {
    if (mobileNumberChanged != null) {
      return mobileNumberChanged(this);
    }
    return orElse();
  }
}

abstract class MobileNumberChanged implements EditProfileEvent {
  const factory MobileNumberChanged(final String mobileNumber) =
      _$MobileNumberChangedImpl;

  String get mobileNumber;
  @JsonKey(ignore: true)
  _$$MobileNumberChangedImplCopyWith<_$MobileNumberChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CountryCodeChangedImplCopyWith<$Res> {
  factory _$$CountryCodeChangedImplCopyWith(_$CountryCodeChangedImpl value,
          $Res Function(_$CountryCodeChangedImpl) then) =
      __$$CountryCodeChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String countryCode});
}

/// @nodoc
class __$$CountryCodeChangedImplCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res, _$CountryCodeChangedImpl>
    implements _$$CountryCodeChangedImplCopyWith<$Res> {
  __$$CountryCodeChangedImplCopyWithImpl(_$CountryCodeChangedImpl _value,
      $Res Function(_$CountryCodeChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryCode = null,
  }) {
    return _then(_$CountryCodeChangedImpl(
      null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CountryCodeChangedImpl implements CountryCodeChanged {
  const _$CountryCodeChangedImpl(this.countryCode);

  @override
  final String countryCode;

  @override
  String toString() {
    return 'EditProfileEvent.countryCodeChanged(countryCode: $countryCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryCodeChangedImpl &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, countryCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryCodeChangedImplCopyWith<_$CountryCodeChangedImpl> get copyWith =>
      __$$CountryCodeChangedImplCopyWithImpl<_$CountryCodeChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String imagePath) changeProfilePicture,
    required TResult Function(String firstName) firstNameChanged,
    required TResult Function(String lastName) lastNameChanged,
    required TResult Function(String email) emailAddressChanged,
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String countryCode) countryCodeChanged,
    required TResult Function() saveButtonPressed,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function() verifyOtp,
    required TResult Function(String otp) changeOTP,
    required TResult Function() startCountdown,
    required TResult Function() decrementTimer,
    required TResult Function() resendOtp,
  }) {
    return countryCodeChanged(countryCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String imagePath)? changeProfilePicture,
    TResult? Function(String firstName)? firstNameChanged,
    TResult? Function(String lastName)? lastNameChanged,
    TResult? Function(String email)? emailAddressChanged,
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String countryCode)? countryCodeChanged,
    TResult? Function()? saveButtonPressed,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function()? verifyOtp,
    TResult? Function(String otp)? changeOTP,
    TResult? Function()? startCountdown,
    TResult? Function()? decrementTimer,
    TResult? Function()? resendOtp,
  }) {
    return countryCodeChanged?.call(countryCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String imagePath)? changeProfilePicture,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function(String email)? emailAddressChanged,
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String countryCode)? countryCodeChanged,
    TResult Function()? saveButtonPressed,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function()? verifyOtp,
    TResult Function(String otp)? changeOTP,
    TResult Function()? startCountdown,
    TResult Function()? decrementTimer,
    TResult Function()? resendOtp,
    required TResult orElse(),
  }) {
    if (countryCodeChanged != null) {
      return countryCodeChanged(countryCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeProfilePicture value) changeProfilePicture,
    required TResult Function(FirstNameChanged value) firstNameChanged,
    required TResult Function(LastNameChanged value) lastNameChanged,
    required TResult Function(EmailAddressChanged value) emailAddressChanged,
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(CountryCodeChanged value) countryCodeChanged,
    required TResult Function(SaveButtonPressed value) saveButtonPressed,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ChangeOTP value) changeOTP,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(DecrementTimer value) decrementTimer,
    required TResult Function(ResendOtp value) resendOtp,
  }) {
    return countryCodeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeProfilePicture value)? changeProfilePicture,
    TResult? Function(FirstNameChanged value)? firstNameChanged,
    TResult? Function(LastNameChanged value)? lastNameChanged,
    TResult? Function(EmailAddressChanged value)? emailAddressChanged,
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(CountryCodeChanged value)? countryCodeChanged,
    TResult? Function(SaveButtonPressed value)? saveButtonPressed,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ChangeOTP value)? changeOTP,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(DecrementTimer value)? decrementTimer,
    TResult? Function(ResendOtp value)? resendOtp,
  }) {
    return countryCodeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeProfilePicture value)? changeProfilePicture,
    TResult Function(FirstNameChanged value)? firstNameChanged,
    TResult Function(LastNameChanged value)? lastNameChanged,
    TResult Function(EmailAddressChanged value)? emailAddressChanged,
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(CountryCodeChanged value)? countryCodeChanged,
    TResult Function(SaveButtonPressed value)? saveButtonPressed,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ChangeOTP value)? changeOTP,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(DecrementTimer value)? decrementTimer,
    TResult Function(ResendOtp value)? resendOtp,
    required TResult orElse(),
  }) {
    if (countryCodeChanged != null) {
      return countryCodeChanged(this);
    }
    return orElse();
  }
}

abstract class CountryCodeChanged implements EditProfileEvent {
  const factory CountryCodeChanged(final String countryCode) =
      _$CountryCodeChangedImpl;

  String get countryCode;
  @JsonKey(ignore: true)
  _$$CountryCodeChangedImplCopyWith<_$CountryCodeChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SaveButtonPressedImplCopyWith<$Res> {
  factory _$$SaveButtonPressedImplCopyWith(_$SaveButtonPressedImpl value,
          $Res Function(_$SaveButtonPressedImpl) then) =
      __$$SaveButtonPressedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SaveButtonPressedImplCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res, _$SaveButtonPressedImpl>
    implements _$$SaveButtonPressedImplCopyWith<$Res> {
  __$$SaveButtonPressedImplCopyWithImpl(_$SaveButtonPressedImpl _value,
      $Res Function(_$SaveButtonPressedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SaveButtonPressedImpl implements SaveButtonPressed {
  const _$SaveButtonPressedImpl();

  @override
  String toString() {
    return 'EditProfileEvent.saveButtonPressed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SaveButtonPressedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String imagePath) changeProfilePicture,
    required TResult Function(String firstName) firstNameChanged,
    required TResult Function(String lastName) lastNameChanged,
    required TResult Function(String email) emailAddressChanged,
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String countryCode) countryCodeChanged,
    required TResult Function() saveButtonPressed,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function() verifyOtp,
    required TResult Function(String otp) changeOTP,
    required TResult Function() startCountdown,
    required TResult Function() decrementTimer,
    required TResult Function() resendOtp,
  }) {
    return saveButtonPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String imagePath)? changeProfilePicture,
    TResult? Function(String firstName)? firstNameChanged,
    TResult? Function(String lastName)? lastNameChanged,
    TResult? Function(String email)? emailAddressChanged,
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String countryCode)? countryCodeChanged,
    TResult? Function()? saveButtonPressed,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function()? verifyOtp,
    TResult? Function(String otp)? changeOTP,
    TResult? Function()? startCountdown,
    TResult? Function()? decrementTimer,
    TResult? Function()? resendOtp,
  }) {
    return saveButtonPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String imagePath)? changeProfilePicture,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function(String email)? emailAddressChanged,
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String countryCode)? countryCodeChanged,
    TResult Function()? saveButtonPressed,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function()? verifyOtp,
    TResult Function(String otp)? changeOTP,
    TResult Function()? startCountdown,
    TResult Function()? decrementTimer,
    TResult Function()? resendOtp,
    required TResult orElse(),
  }) {
    if (saveButtonPressed != null) {
      return saveButtonPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeProfilePicture value) changeProfilePicture,
    required TResult Function(FirstNameChanged value) firstNameChanged,
    required TResult Function(LastNameChanged value) lastNameChanged,
    required TResult Function(EmailAddressChanged value) emailAddressChanged,
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(CountryCodeChanged value) countryCodeChanged,
    required TResult Function(SaveButtonPressed value) saveButtonPressed,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ChangeOTP value) changeOTP,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(DecrementTimer value) decrementTimer,
    required TResult Function(ResendOtp value) resendOtp,
  }) {
    return saveButtonPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeProfilePicture value)? changeProfilePicture,
    TResult? Function(FirstNameChanged value)? firstNameChanged,
    TResult? Function(LastNameChanged value)? lastNameChanged,
    TResult? Function(EmailAddressChanged value)? emailAddressChanged,
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(CountryCodeChanged value)? countryCodeChanged,
    TResult? Function(SaveButtonPressed value)? saveButtonPressed,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ChangeOTP value)? changeOTP,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(DecrementTimer value)? decrementTimer,
    TResult? Function(ResendOtp value)? resendOtp,
  }) {
    return saveButtonPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeProfilePicture value)? changeProfilePicture,
    TResult Function(FirstNameChanged value)? firstNameChanged,
    TResult Function(LastNameChanged value)? lastNameChanged,
    TResult Function(EmailAddressChanged value)? emailAddressChanged,
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(CountryCodeChanged value)? countryCodeChanged,
    TResult Function(SaveButtonPressed value)? saveButtonPressed,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ChangeOTP value)? changeOTP,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(DecrementTimer value)? decrementTimer,
    TResult Function(ResendOtp value)? resendOtp,
    required TResult orElse(),
  }) {
    if (saveButtonPressed != null) {
      return saveButtonPressed(this);
    }
    return orElse();
  }
}

abstract class SaveButtonPressed implements EditProfileEvent {
  const factory SaveButtonPressed() = _$SaveButtonPressedImpl;
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
    extends _$EditProfileEventCopyWithImpl<$Res, _$GetPrefilledPhoneNumberImpl>
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
    return 'EditProfileEvent.getPrefilledPhoneNumber(countryCode: $countryCode, phoneNumber: $phoneNumber)';
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
    required TResult Function(String imagePath) changeProfilePicture,
    required TResult Function(String firstName) firstNameChanged,
    required TResult Function(String lastName) lastNameChanged,
    required TResult Function(String email) emailAddressChanged,
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String countryCode) countryCodeChanged,
    required TResult Function() saveButtonPressed,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function() verifyOtp,
    required TResult Function(String otp) changeOTP,
    required TResult Function() startCountdown,
    required TResult Function() decrementTimer,
    required TResult Function() resendOtp,
  }) {
    return getPrefilledPhoneNumber(countryCode, phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String imagePath)? changeProfilePicture,
    TResult? Function(String firstName)? firstNameChanged,
    TResult? Function(String lastName)? lastNameChanged,
    TResult? Function(String email)? emailAddressChanged,
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String countryCode)? countryCodeChanged,
    TResult? Function()? saveButtonPressed,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function()? verifyOtp,
    TResult? Function(String otp)? changeOTP,
    TResult? Function()? startCountdown,
    TResult? Function()? decrementTimer,
    TResult? Function()? resendOtp,
  }) {
    return getPrefilledPhoneNumber?.call(countryCode, phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String imagePath)? changeProfilePicture,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function(String email)? emailAddressChanged,
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String countryCode)? countryCodeChanged,
    TResult Function()? saveButtonPressed,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function()? verifyOtp,
    TResult Function(String otp)? changeOTP,
    TResult Function()? startCountdown,
    TResult Function()? decrementTimer,
    TResult Function()? resendOtp,
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
    required TResult Function(_ChangeProfilePicture value) changeProfilePicture,
    required TResult Function(FirstNameChanged value) firstNameChanged,
    required TResult Function(LastNameChanged value) lastNameChanged,
    required TResult Function(EmailAddressChanged value) emailAddressChanged,
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(CountryCodeChanged value) countryCodeChanged,
    required TResult Function(SaveButtonPressed value) saveButtonPressed,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ChangeOTP value) changeOTP,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(DecrementTimer value) decrementTimer,
    required TResult Function(ResendOtp value) resendOtp,
  }) {
    return getPrefilledPhoneNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeProfilePicture value)? changeProfilePicture,
    TResult? Function(FirstNameChanged value)? firstNameChanged,
    TResult? Function(LastNameChanged value)? lastNameChanged,
    TResult? Function(EmailAddressChanged value)? emailAddressChanged,
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(CountryCodeChanged value)? countryCodeChanged,
    TResult? Function(SaveButtonPressed value)? saveButtonPressed,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ChangeOTP value)? changeOTP,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(DecrementTimer value)? decrementTimer,
    TResult? Function(ResendOtp value)? resendOtp,
  }) {
    return getPrefilledPhoneNumber?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeProfilePicture value)? changeProfilePicture,
    TResult Function(FirstNameChanged value)? firstNameChanged,
    TResult Function(LastNameChanged value)? lastNameChanged,
    TResult Function(EmailAddressChanged value)? emailAddressChanged,
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(CountryCodeChanged value)? countryCodeChanged,
    TResult Function(SaveButtonPressed value)? saveButtonPressed,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ChangeOTP value)? changeOTP,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(DecrementTimer value)? decrementTimer,
    TResult Function(ResendOtp value)? resendOtp,
    required TResult orElse(),
  }) {
    if (getPrefilledPhoneNumber != null) {
      return getPrefilledPhoneNumber(this);
    }
    return orElse();
  }
}

abstract class GetPrefilledPhoneNumber implements EditProfileEvent {
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
    extends _$EditProfileEventCopyWithImpl<$Res, _$VerifyOtpImpl>
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
    return 'EditProfileEvent.verifyOtp()';
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
    required TResult Function(String imagePath) changeProfilePicture,
    required TResult Function(String firstName) firstNameChanged,
    required TResult Function(String lastName) lastNameChanged,
    required TResult Function(String email) emailAddressChanged,
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String countryCode) countryCodeChanged,
    required TResult Function() saveButtonPressed,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function() verifyOtp,
    required TResult Function(String otp) changeOTP,
    required TResult Function() startCountdown,
    required TResult Function() decrementTimer,
    required TResult Function() resendOtp,
  }) {
    return verifyOtp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String imagePath)? changeProfilePicture,
    TResult? Function(String firstName)? firstNameChanged,
    TResult? Function(String lastName)? lastNameChanged,
    TResult? Function(String email)? emailAddressChanged,
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String countryCode)? countryCodeChanged,
    TResult? Function()? saveButtonPressed,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function()? verifyOtp,
    TResult? Function(String otp)? changeOTP,
    TResult? Function()? startCountdown,
    TResult? Function()? decrementTimer,
    TResult? Function()? resendOtp,
  }) {
    return verifyOtp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String imagePath)? changeProfilePicture,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function(String email)? emailAddressChanged,
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String countryCode)? countryCodeChanged,
    TResult Function()? saveButtonPressed,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function()? verifyOtp,
    TResult Function(String otp)? changeOTP,
    TResult Function()? startCountdown,
    TResult Function()? decrementTimer,
    TResult Function()? resendOtp,
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
    required TResult Function(_ChangeProfilePicture value) changeProfilePicture,
    required TResult Function(FirstNameChanged value) firstNameChanged,
    required TResult Function(LastNameChanged value) lastNameChanged,
    required TResult Function(EmailAddressChanged value) emailAddressChanged,
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(CountryCodeChanged value) countryCodeChanged,
    required TResult Function(SaveButtonPressed value) saveButtonPressed,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ChangeOTP value) changeOTP,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(DecrementTimer value) decrementTimer,
    required TResult Function(ResendOtp value) resendOtp,
  }) {
    return verifyOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeProfilePicture value)? changeProfilePicture,
    TResult? Function(FirstNameChanged value)? firstNameChanged,
    TResult? Function(LastNameChanged value)? lastNameChanged,
    TResult? Function(EmailAddressChanged value)? emailAddressChanged,
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(CountryCodeChanged value)? countryCodeChanged,
    TResult? Function(SaveButtonPressed value)? saveButtonPressed,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ChangeOTP value)? changeOTP,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(DecrementTimer value)? decrementTimer,
    TResult? Function(ResendOtp value)? resendOtp,
  }) {
    return verifyOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeProfilePicture value)? changeProfilePicture,
    TResult Function(FirstNameChanged value)? firstNameChanged,
    TResult Function(LastNameChanged value)? lastNameChanged,
    TResult Function(EmailAddressChanged value)? emailAddressChanged,
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(CountryCodeChanged value)? countryCodeChanged,
    TResult Function(SaveButtonPressed value)? saveButtonPressed,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ChangeOTP value)? changeOTP,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(DecrementTimer value)? decrementTimer,
    TResult Function(ResendOtp value)? resendOtp,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(this);
    }
    return orElse();
  }
}

abstract class VerifyOtp implements EditProfileEvent {
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
    extends _$EditProfileEventCopyWithImpl<$Res, _$ChangeOTPImpl>
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
    return 'EditProfileEvent.changeOTP(otp: $otp)';
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
    required TResult Function(String imagePath) changeProfilePicture,
    required TResult Function(String firstName) firstNameChanged,
    required TResult Function(String lastName) lastNameChanged,
    required TResult Function(String email) emailAddressChanged,
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String countryCode) countryCodeChanged,
    required TResult Function() saveButtonPressed,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function() verifyOtp,
    required TResult Function(String otp) changeOTP,
    required TResult Function() startCountdown,
    required TResult Function() decrementTimer,
    required TResult Function() resendOtp,
  }) {
    return changeOTP(otp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String imagePath)? changeProfilePicture,
    TResult? Function(String firstName)? firstNameChanged,
    TResult? Function(String lastName)? lastNameChanged,
    TResult? Function(String email)? emailAddressChanged,
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String countryCode)? countryCodeChanged,
    TResult? Function()? saveButtonPressed,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function()? verifyOtp,
    TResult? Function(String otp)? changeOTP,
    TResult? Function()? startCountdown,
    TResult? Function()? decrementTimer,
    TResult? Function()? resendOtp,
  }) {
    return changeOTP?.call(otp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String imagePath)? changeProfilePicture,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function(String email)? emailAddressChanged,
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String countryCode)? countryCodeChanged,
    TResult Function()? saveButtonPressed,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function()? verifyOtp,
    TResult Function(String otp)? changeOTP,
    TResult Function()? startCountdown,
    TResult Function()? decrementTimer,
    TResult Function()? resendOtp,
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
    required TResult Function(_ChangeProfilePicture value) changeProfilePicture,
    required TResult Function(FirstNameChanged value) firstNameChanged,
    required TResult Function(LastNameChanged value) lastNameChanged,
    required TResult Function(EmailAddressChanged value) emailAddressChanged,
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(CountryCodeChanged value) countryCodeChanged,
    required TResult Function(SaveButtonPressed value) saveButtonPressed,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ChangeOTP value) changeOTP,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(DecrementTimer value) decrementTimer,
    required TResult Function(ResendOtp value) resendOtp,
  }) {
    return changeOTP(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeProfilePicture value)? changeProfilePicture,
    TResult? Function(FirstNameChanged value)? firstNameChanged,
    TResult? Function(LastNameChanged value)? lastNameChanged,
    TResult? Function(EmailAddressChanged value)? emailAddressChanged,
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(CountryCodeChanged value)? countryCodeChanged,
    TResult? Function(SaveButtonPressed value)? saveButtonPressed,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ChangeOTP value)? changeOTP,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(DecrementTimer value)? decrementTimer,
    TResult? Function(ResendOtp value)? resendOtp,
  }) {
    return changeOTP?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeProfilePicture value)? changeProfilePicture,
    TResult Function(FirstNameChanged value)? firstNameChanged,
    TResult Function(LastNameChanged value)? lastNameChanged,
    TResult Function(EmailAddressChanged value)? emailAddressChanged,
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(CountryCodeChanged value)? countryCodeChanged,
    TResult Function(SaveButtonPressed value)? saveButtonPressed,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ChangeOTP value)? changeOTP,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(DecrementTimer value)? decrementTimer,
    TResult Function(ResendOtp value)? resendOtp,
    required TResult orElse(),
  }) {
    if (changeOTP != null) {
      return changeOTP(this);
    }
    return orElse();
  }
}

abstract class ChangeOTP implements EditProfileEvent {
  const factory ChangeOTP(final String otp) = _$ChangeOTPImpl;

  String get otp;
  @JsonKey(ignore: true)
  _$$ChangeOTPImplCopyWith<_$ChangeOTPImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StartCountdownImplCopyWith<$Res> {
  factory _$$StartCountdownImplCopyWith(_$StartCountdownImpl value,
          $Res Function(_$StartCountdownImpl) then) =
      __$$StartCountdownImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartCountdownImplCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res, _$StartCountdownImpl>
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
    return 'EditProfileEvent.startCountdown()';
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
    required TResult Function(String imagePath) changeProfilePicture,
    required TResult Function(String firstName) firstNameChanged,
    required TResult Function(String lastName) lastNameChanged,
    required TResult Function(String email) emailAddressChanged,
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String countryCode) countryCodeChanged,
    required TResult Function() saveButtonPressed,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function() verifyOtp,
    required TResult Function(String otp) changeOTP,
    required TResult Function() startCountdown,
    required TResult Function() decrementTimer,
    required TResult Function() resendOtp,
  }) {
    return startCountdown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String imagePath)? changeProfilePicture,
    TResult? Function(String firstName)? firstNameChanged,
    TResult? Function(String lastName)? lastNameChanged,
    TResult? Function(String email)? emailAddressChanged,
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String countryCode)? countryCodeChanged,
    TResult? Function()? saveButtonPressed,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function()? verifyOtp,
    TResult? Function(String otp)? changeOTP,
    TResult? Function()? startCountdown,
    TResult? Function()? decrementTimer,
    TResult? Function()? resendOtp,
  }) {
    return startCountdown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String imagePath)? changeProfilePicture,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function(String email)? emailAddressChanged,
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String countryCode)? countryCodeChanged,
    TResult Function()? saveButtonPressed,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function()? verifyOtp,
    TResult Function(String otp)? changeOTP,
    TResult Function()? startCountdown,
    TResult Function()? decrementTimer,
    TResult Function()? resendOtp,
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
    required TResult Function(_ChangeProfilePicture value) changeProfilePicture,
    required TResult Function(FirstNameChanged value) firstNameChanged,
    required TResult Function(LastNameChanged value) lastNameChanged,
    required TResult Function(EmailAddressChanged value) emailAddressChanged,
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(CountryCodeChanged value) countryCodeChanged,
    required TResult Function(SaveButtonPressed value) saveButtonPressed,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ChangeOTP value) changeOTP,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(DecrementTimer value) decrementTimer,
    required TResult Function(ResendOtp value) resendOtp,
  }) {
    return startCountdown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeProfilePicture value)? changeProfilePicture,
    TResult? Function(FirstNameChanged value)? firstNameChanged,
    TResult? Function(LastNameChanged value)? lastNameChanged,
    TResult? Function(EmailAddressChanged value)? emailAddressChanged,
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(CountryCodeChanged value)? countryCodeChanged,
    TResult? Function(SaveButtonPressed value)? saveButtonPressed,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ChangeOTP value)? changeOTP,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(DecrementTimer value)? decrementTimer,
    TResult? Function(ResendOtp value)? resendOtp,
  }) {
    return startCountdown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeProfilePicture value)? changeProfilePicture,
    TResult Function(FirstNameChanged value)? firstNameChanged,
    TResult Function(LastNameChanged value)? lastNameChanged,
    TResult Function(EmailAddressChanged value)? emailAddressChanged,
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(CountryCodeChanged value)? countryCodeChanged,
    TResult Function(SaveButtonPressed value)? saveButtonPressed,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ChangeOTP value)? changeOTP,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(DecrementTimer value)? decrementTimer,
    TResult Function(ResendOtp value)? resendOtp,
    required TResult orElse(),
  }) {
    if (startCountdown != null) {
      return startCountdown(this);
    }
    return orElse();
  }
}

abstract class StartCountdown implements EditProfileEvent {
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
    extends _$EditProfileEventCopyWithImpl<$Res, _$DecrementTimerImpl>
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
    return 'EditProfileEvent.decrementTimer()';
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
    required TResult Function(String imagePath) changeProfilePicture,
    required TResult Function(String firstName) firstNameChanged,
    required TResult Function(String lastName) lastNameChanged,
    required TResult Function(String email) emailAddressChanged,
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String countryCode) countryCodeChanged,
    required TResult Function() saveButtonPressed,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function() verifyOtp,
    required TResult Function(String otp) changeOTP,
    required TResult Function() startCountdown,
    required TResult Function() decrementTimer,
    required TResult Function() resendOtp,
  }) {
    return decrementTimer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String imagePath)? changeProfilePicture,
    TResult? Function(String firstName)? firstNameChanged,
    TResult? Function(String lastName)? lastNameChanged,
    TResult? Function(String email)? emailAddressChanged,
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String countryCode)? countryCodeChanged,
    TResult? Function()? saveButtonPressed,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function()? verifyOtp,
    TResult? Function(String otp)? changeOTP,
    TResult? Function()? startCountdown,
    TResult? Function()? decrementTimer,
    TResult? Function()? resendOtp,
  }) {
    return decrementTimer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String imagePath)? changeProfilePicture,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function(String email)? emailAddressChanged,
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String countryCode)? countryCodeChanged,
    TResult Function()? saveButtonPressed,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function()? verifyOtp,
    TResult Function(String otp)? changeOTP,
    TResult Function()? startCountdown,
    TResult Function()? decrementTimer,
    TResult Function()? resendOtp,
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
    required TResult Function(_ChangeProfilePicture value) changeProfilePicture,
    required TResult Function(FirstNameChanged value) firstNameChanged,
    required TResult Function(LastNameChanged value) lastNameChanged,
    required TResult Function(EmailAddressChanged value) emailAddressChanged,
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(CountryCodeChanged value) countryCodeChanged,
    required TResult Function(SaveButtonPressed value) saveButtonPressed,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ChangeOTP value) changeOTP,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(DecrementTimer value) decrementTimer,
    required TResult Function(ResendOtp value) resendOtp,
  }) {
    return decrementTimer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeProfilePicture value)? changeProfilePicture,
    TResult? Function(FirstNameChanged value)? firstNameChanged,
    TResult? Function(LastNameChanged value)? lastNameChanged,
    TResult? Function(EmailAddressChanged value)? emailAddressChanged,
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(CountryCodeChanged value)? countryCodeChanged,
    TResult? Function(SaveButtonPressed value)? saveButtonPressed,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ChangeOTP value)? changeOTP,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(DecrementTimer value)? decrementTimer,
    TResult? Function(ResendOtp value)? resendOtp,
  }) {
    return decrementTimer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeProfilePicture value)? changeProfilePicture,
    TResult Function(FirstNameChanged value)? firstNameChanged,
    TResult Function(LastNameChanged value)? lastNameChanged,
    TResult Function(EmailAddressChanged value)? emailAddressChanged,
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(CountryCodeChanged value)? countryCodeChanged,
    TResult Function(SaveButtonPressed value)? saveButtonPressed,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ChangeOTP value)? changeOTP,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(DecrementTimer value)? decrementTimer,
    TResult Function(ResendOtp value)? resendOtp,
    required TResult orElse(),
  }) {
    if (decrementTimer != null) {
      return decrementTimer(this);
    }
    return orElse();
  }
}

abstract class DecrementTimer implements EditProfileEvent {
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
    extends _$EditProfileEventCopyWithImpl<$Res, _$ResendOtpImpl>
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
    return 'EditProfileEvent.resendOtp()';
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
    required TResult Function(String imagePath) changeProfilePicture,
    required TResult Function(String firstName) firstNameChanged,
    required TResult Function(String lastName) lastNameChanged,
    required TResult Function(String email) emailAddressChanged,
    required TResult Function(String mobileNumber) mobileNumberChanged,
    required TResult Function(String countryCode) countryCodeChanged,
    required TResult Function() saveButtonPressed,
    required TResult Function(String countryCode, String phoneNumber)
        getPrefilledPhoneNumber,
    required TResult Function() verifyOtp,
    required TResult Function(String otp) changeOTP,
    required TResult Function() startCountdown,
    required TResult Function() decrementTimer,
    required TResult Function() resendOtp,
  }) {
    return resendOtp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String imagePath)? changeProfilePicture,
    TResult? Function(String firstName)? firstNameChanged,
    TResult? Function(String lastName)? lastNameChanged,
    TResult? Function(String email)? emailAddressChanged,
    TResult? Function(String mobileNumber)? mobileNumberChanged,
    TResult? Function(String countryCode)? countryCodeChanged,
    TResult? Function()? saveButtonPressed,
    TResult? Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult? Function()? verifyOtp,
    TResult? Function(String otp)? changeOTP,
    TResult? Function()? startCountdown,
    TResult? Function()? decrementTimer,
    TResult? Function()? resendOtp,
  }) {
    return resendOtp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String imagePath)? changeProfilePicture,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function(String email)? emailAddressChanged,
    TResult Function(String mobileNumber)? mobileNumberChanged,
    TResult Function(String countryCode)? countryCodeChanged,
    TResult Function()? saveButtonPressed,
    TResult Function(String countryCode, String phoneNumber)?
        getPrefilledPhoneNumber,
    TResult Function()? verifyOtp,
    TResult Function(String otp)? changeOTP,
    TResult Function()? startCountdown,
    TResult Function()? decrementTimer,
    TResult Function()? resendOtp,
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
    required TResult Function(_ChangeProfilePicture value) changeProfilePicture,
    required TResult Function(FirstNameChanged value) firstNameChanged,
    required TResult Function(LastNameChanged value) lastNameChanged,
    required TResult Function(EmailAddressChanged value) emailAddressChanged,
    required TResult Function(MobileNumberChanged value) mobileNumberChanged,
    required TResult Function(CountryCodeChanged value) countryCodeChanged,
    required TResult Function(SaveButtonPressed value) saveButtonPressed,
    required TResult Function(GetPrefilledPhoneNumber value)
        getPrefilledPhoneNumber,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ChangeOTP value) changeOTP,
    required TResult Function(StartCountdown value) startCountdown,
    required TResult Function(DecrementTimer value) decrementTimer,
    required TResult Function(ResendOtp value) resendOtp,
  }) {
    return resendOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeProfilePicture value)? changeProfilePicture,
    TResult? Function(FirstNameChanged value)? firstNameChanged,
    TResult? Function(LastNameChanged value)? lastNameChanged,
    TResult? Function(EmailAddressChanged value)? emailAddressChanged,
    TResult? Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult? Function(CountryCodeChanged value)? countryCodeChanged,
    TResult? Function(SaveButtonPressed value)? saveButtonPressed,
    TResult? Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ChangeOTP value)? changeOTP,
    TResult? Function(StartCountdown value)? startCountdown,
    TResult? Function(DecrementTimer value)? decrementTimer,
    TResult? Function(ResendOtp value)? resendOtp,
  }) {
    return resendOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeProfilePicture value)? changeProfilePicture,
    TResult Function(FirstNameChanged value)? firstNameChanged,
    TResult Function(LastNameChanged value)? lastNameChanged,
    TResult Function(EmailAddressChanged value)? emailAddressChanged,
    TResult Function(MobileNumberChanged value)? mobileNumberChanged,
    TResult Function(CountryCodeChanged value)? countryCodeChanged,
    TResult Function(SaveButtonPressed value)? saveButtonPressed,
    TResult Function(GetPrefilledPhoneNumber value)? getPrefilledPhoneNumber,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ChangeOTP value)? changeOTP,
    TResult Function(StartCountdown value)? startCountdown,
    TResult Function(DecrementTimer value)? decrementTimer,
    TResult Function(ResendOtp value)? resendOtp,
    required TResult orElse(),
  }) {
    if (resendOtp != null) {
      return resendOtp(this);
    }
    return orElse();
  }
}

abstract class ResendOtp implements EditProfileEvent {
  const factory ResendOtp() = _$ResendOtpImpl;
}
