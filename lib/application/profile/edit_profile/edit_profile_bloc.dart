import 'package:country_code_picker/country_code_picker.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grape_customer_app/application/auth/register_form/register_form_bloc.dart';
import 'package:grape_customer_app/domain/auth/auth_failure.dart';
import 'package:grape_customer_app/domain/auth/auth_value_objects.dart';
import 'package:injectable/injectable.dart';
part 'edit_profile_state.dart';
part 'edit_profile_event.dart';
part 'edit_profile_bloc.freezed.dart';

@injectable
class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc() : super(EditProfileState.initial()) {
    on<EditProfileEvent>((event, emit) async {
      event.map(
        changeProfilePicture: (value) {
          emit(
            state.copyWith(selectImage: value.imagePath),
          );
        },
        firstNameChanged: (FirstNameChanged value) => emit(
          state.copyWith(
            firstName: Username(value.firstName),
            authFailureOrSuccessOption: none(),
          ),
        ),
        lastNameChanged: (LastNameChanged value) => emit(state.copyWith(
          lastName: Username(value.lastName),
          authFailureOrSuccessOption: none(),
        )),
        emailAddressChanged: (EmailAddressChanged value) => emit(
          state.copyWith(
            emailAddress: EmailAddress(value.email),
            authFailureOrSuccessOption: none(),
          ),
        ),
        mobileNumberChanged: (MobileNumberChanged value) => emit(
          state.copyWith(
              mobileNumber: MobileNumber(value.mobileNumber),
              authFailureOrSuccessOption: none()),
        ),
        countryCodeChanged: (CountryCodeChanged value) => emit(
          state.copyWith(
            countryCode: value.countryCode,
            authFailureOrSuccessOption: none(),
          ),
        ),
        saveButtonPressed: (e) {
          Either<AuthFailure, Unit>? failureOrSuccess;
          final isFirstNameValid = state.firstName.isValid();
          final isLastNameValid = state.lastName.isValid();
          final isEmailAddressValid = state.emailAddress.isValid();
          final isMobileNumberValid = state.mobileNumber.isValid();

          if (isFirstNameValid &&
              isLastNameValid &&
              isEmailAddressValid &&
              isMobileNumberValid) {
            emit(state.copyWith(
              isSubmitting: true,
              authFailureOrSuccessOption: none(),
            ));
          }
          emit(
            state.copyWith(
              isSubmitting: false,
              showErrorMessages: true,
              authFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          );
        },
      );
    });
  }
}
