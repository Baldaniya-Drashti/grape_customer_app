part of 'register_form_bloc.dart';

@freezed
class RegisterFormEvent with _$RegisterFormEvent {
  const factory RegisterFormEvent.emailChanged(String email) = EmailChanged;

  const factory RegisterFormEvent.getPrefilledPhoneNumber(
      String countryCode, String phoneNumber) = GetPrefilledPhoneNumber;

  const factory RegisterFormEvent.lastNameChanged(String lastName) =
      LastNameChanged;
  const factory RegisterFormEvent.firstNameChanged(String firstName) =
      FirstNameChanged;
  const factory RegisterFormEvent.mobileNumberChanged(String mobileNumber) =
      MobileNumberChanged;
  const factory RegisterFormEvent.selectCountryCode(String counryCode) =
      SelectCountryCode;
  const factory RegisterFormEvent.changeOTP(String otp) = ChangeOTP;
  const factory RegisterFormEvent.registerPressed() = RegisterPressed;
  const factory RegisterFormEvent.startCountdown() = StartCountdown;
  const factory RegisterFormEvent.decrementTimer() = DecrementTimer;
  const factory RegisterFormEvent.resendOtp() = ResendOtp;

  const factory RegisterFormEvent.verifyOtp() = VerifyOtp;
}
