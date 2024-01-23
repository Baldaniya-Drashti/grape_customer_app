part of 'edit_profile_bloc.dart';

@freezed
class EditProfileEvent with _$EditProfileEvent {
  const factory EditProfileEvent.changeProfilePicture(String imagePath) =
      _ChangeProfilePicture;

  const factory EditProfileEvent.firstNameChanged(String firstName) =
      FirstNameChanged;
  const factory EditProfileEvent.lastNameChanged(String lastName) =
      LastNameChanged;
  const factory EditProfileEvent.emailAddressChanged(String email) =
      EmailAddressChanged;

  const factory EditProfileEvent.mobileNumberChanged(String mobileNumber) =
      MobileNumberChanged;
  const factory EditProfileEvent.countryCodeChanged(String countryCode) =
      CountryCodeChanged;

  const factory EditProfileEvent.saveButtonPressed() = SaveButtonPressed;
  const factory EditProfileEvent.getPrefilledPhoneNumber(
      String countryCode, String phoneNumber) = GetPrefilledPhoneNumber;
  const factory EditProfileEvent.verifyOtp() = VerifyOtp;
  const factory EditProfileEvent.changeOTP(String otp) = ChangeOTP;
  const factory EditProfileEvent.startCountdown() = StartCountdown;
  const factory EditProfileEvent.decrementTimer() = DecrementTimer;
  const factory EditProfileEvent.resendOtp() = ResendOtp;
}
