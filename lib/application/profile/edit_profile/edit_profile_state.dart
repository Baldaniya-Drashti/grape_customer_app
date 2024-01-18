part of 'edit_profile_bloc.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState({
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
    required bool showErrorMessages,
    required bool isSubmitting,
    required String selectImage,
    required Username firstName,
    required Username lastName,
    required EmailAddress emailAddress,
    required MobileNumber mobileNumber,
    required String countryCode,
  }) = _EditProfileState;
  factory EditProfileState.initial() => EditProfileState(
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
        showErrorMessages: false,
        selectImage: '',
        firstName: Username(''),
        lastName: Username(''),
        emailAddress: EmailAddress(''),
        mobileNumber: MobileNumber(''),
        countryCode: '+91',
      );
}
