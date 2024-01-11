part of 'login_form_bloc.dart';

@freezed
class LoginFormEvent with _$LoginFormEvent {
  const factory LoginFormEvent.mobileNumberChanged(String mobileNumber) = MobileNumberChanged;

  const factory LoginFormEvent.selectCountryCode(String counryCode) = SelectCountryCode;
  const factory LoginFormEvent.loginPressed() = LoginPressed;
}
