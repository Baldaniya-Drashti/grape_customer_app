part of 'login_form_bloc.dart';

@freezed
class LoginFormEvent with _$LoginFormEvent {
  const factory LoginFormEvent.mobileNumberChanged(String mobileNumber) =
      MobileNumberChanged;

  const factory LoginFormEvent.selectCountryCode(String counryCode) =
      SelectCountryCode;
  const factory LoginFormEvent.loginPressed() = LoginPressed;

  const factory LoginFormEvent.startCountdown() = StartCountdown;
  const factory LoginFormEvent.decrementTimer() = DecrementTimer;
  const factory LoginFormEvent.resendOtp() = ResendOtp;
  const factory LoginFormEvent.getPrefilledPhoneNumber(
      String countryCode, String phoneNumber) = GetPrefilledPhoneNumber;
  const factory LoginFormEvent.verifyOtp() = VerifyOtp;
  const factory LoginFormEvent.changeOTP(String otp) = ChangeOTP;
}
