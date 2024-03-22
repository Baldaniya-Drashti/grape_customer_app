part of 'register_form_bloc.dart';

@freezed
class RegisterFormState with _$RegisterFormState {
  const factory RegisterFormState({
    required String emailAddress,
    required Username firstName,
    required Username lastName,
    required MobileNumber mobileNumber,
    required bool showErrorMessages,
    required bool isSubmitting,
    required String selectedCountrycode,
    required OTPText enteredOTP,
    required int secondsRemaining,
    required Option<Either<AuthFailure, String>> authFailureOrSuccessOption,
    required Option<Either<AuthFailure, String>> resendFailureOrSuccessOption,
  }) = _RegisterFormState;

  factory RegisterFormState.initial() => RegisterFormState(
        emailAddress: '',
        showErrorMessages: false,
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
        firstName: Username(''),
        lastName: Username(''),
        mobileNumber: MobileNumber(''),
        selectedCountrycode: '91',
        enteredOTP: OTPText(''),
        secondsRemaining: 0,
        resendFailureOrSuccessOption: none(),
      );
}
