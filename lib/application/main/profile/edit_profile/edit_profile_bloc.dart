import 'package:dartz/dartz.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grape_customer_app/domain/account/account.dart';
import 'package:grape_customer_app/domain/account/account_failure.dart';
import 'package:grape_customer_app/domain/account/i_account_repository.dart';
import 'package:grape_customer_app/domain/auth/auth_failure.dart';
import 'package:grape_customer_app/domain/auth/auth_value_objects.dart';
import 'package:grape_customer_app/domain/auth/i_auth_facade.dart';
import 'package:grape_customer_app/presentation/common/utils/get_current_user.dart';
import 'package:injectable/injectable.dart';
part 'edit_profile_state.dart';
part 'edit_profile_event.dart';
part 'edit_profile_bloc.freezed.dart';

@injectable
class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final IAuthFacade _authFacade;
  final IAccountRepository accountRepository;
  EditProfileBloc(this._authFacade, this.accountRepository)
      : super(EditProfileState.initial()) {
    on<EditProfileEvent>((event, emit) async {
      await event.map(
        changeProfilePicture: (value) async {
          emit(
            state.copyWith(selectImage: value.imagePath),
          );
        },
        firstNameChanged: (FirstNameChanged value) async {
          emit(
            state.copyWith(
              firstName: Username(value.firstName),
              authFailureOrSuccessOption: none(),
            ),
          );
        },
        lastNameChanged: (LastNameChanged value) async {
          emit(
            state.copyWith(
              lastName: Username(value.lastName),
              authFailureOrSuccessOption: none(),
            ),
          );
        },
        emailAddressChanged: (EmailAddressChanged value) async {
          emit(
            state.copyWith(
              emailAddress: EmailAddress(value.email),
              authFailureOrSuccessOption: none(),
            ),
          );
        },
        mobileNumberChanged: (MobileNumberChanged value) async {
          emit(
            state.copyWith(
                mobileNumber: MobileNumber(value.mobileNumber),
                authFailureOrSuccessOption: none()),
          );
        },
        countryCodeChanged: (CountryCodeChanged value) async {
          emit(
            state.copyWith(
              countryCode: value.countryCode,
              authFailureOrSuccessOption: none(),
            ),
          );
        },
        saveButtonPressed: (e) async {
          Either<AccountFailure, Unit>? failureOrSuccess;
          final isFirstNameValid = state.firstName.isValid();
          final isLastNameValid = state.lastName.isValid();
          final isEmailAddressValid = state.emailAddress.isValid();
          final isMobileNumberValid = state.mobileNumber.isValid();

          if (isFirstNameValid &&
              isLastNameValid &&
              isEmailAddressValid &&
              isMobileNumberValid) {
            emit(
              state.copyWith(
                isSubmitting: true,
                authFailureOrSuccessOption: none(),
              ),
            );
            failureOrSuccess = await accountRepository.updateUser(
              firstName: state.firstName,
              lastName: state.lastName,
              emailAddress: state.emailAddress,
              countryCode: state.countryCode,
              mobileNumber: state.mobileNumber,
              profileImage: state.selectImage,
            );
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
