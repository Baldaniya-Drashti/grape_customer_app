part of 'login_form_bloc.dart';

@freezed
class LoginFormState with _$LoginFormState {
  const factory LoginFormState({
    required MobileNumber mobileNumber,
    required bool showErrorMessages,
    required bool isSubmitting,
    required String selectedCountrycode,
    required OTPText enteredOTP,
    required int secondsRemaining,
    required FocusNode mobileNumberFocusNode,
    required Option<Either<AuthFailure, String>> authFailureOrSuccessOption,
    required Option<Either<AuthFailure, String>> resendFailureOrSuccessOption,
  }) = _LoginFormState;

  factory LoginFormState.initial() => LoginFormState(
        mobileNumber: MobileNumber(''),
        showErrorMessages: false,
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
        selectedCountrycode: '91',
        enteredOTP: OTPText(''),
        secondsRemaining: 00,
        mobileNumberFocusNode: FocusNode(),
        resendFailureOrSuccessOption: none(),
      );
}
