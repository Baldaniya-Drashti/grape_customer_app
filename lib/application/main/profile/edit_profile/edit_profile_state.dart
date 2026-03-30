part of 'edit_profile_bloc.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState({
    required Option<Either<AccountFailure, List>> authFailureOrSuccessOption,
    required Option<Either<AuthFailure, String>> otpFailureOrSuccessOption,
    required Option<Either<AuthFailure, String>> verifyOtpOrSuccessOption,
    required bool showErrorMessages,
    required bool isSubmitting,
    required String selectImage,
    required Username firstName,
    required Username lastName,
    required EmailAddress emailAddress,
    required MobileNumber mobileNumber,
    required String countryCode,
    required Account currentUser,
    required OTPText enteredOTP,
    required int secondsRemaining,
    required FocusNode mobileNumberFocusNode,
    required bool isVerify,
  }) = _EditProfileState;
  factory EditProfileState.initial() => EditProfileState(
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
        showErrorMessages: false,
        selectImage: getCurrentUser().profile ?? "",
        firstName: Username(getCurrentUser().firstName ?? ""),
        lastName: Username(getCurrentUser().lastName ?? ""),
        emailAddress: EmailAddress(getCurrentUser().email ?? ""),
        mobileNumber: MobileNumber(getCurrentUser().phone?.toString() ?? ""),
        countryCode: getCurrentUser().countryCode?.replaceFirst('+', '') ?? "",
        currentUser: getCurrentUser(),
        enteredOTP: OTPText(''),
        secondsRemaining: 0,
        otpFailureOrSuccessOption: none(),
        verifyOtpOrSuccessOption: none(),
        mobileNumberFocusNode: FocusNode(),
        isVerify: true,
      );
}
