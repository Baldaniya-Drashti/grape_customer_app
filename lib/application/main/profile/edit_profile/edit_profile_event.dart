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
  
}
