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
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _LoginFormState;

  factory LoginFormState.initial() => LoginFormState(
        mobileNumber: MobileNumber(''),
        showErrorMessages: false,
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
        selectedCountrycode: '',
        enteredOTP: OTPText(''),
        secondsRemaining: 0,
      );
}
