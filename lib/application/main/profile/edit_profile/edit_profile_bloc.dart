import 'dart:async';

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
  final IAccountRepository accountRepository;
  final IAuthFacade _authFacade;
  late Timer timer;
  EditProfileBloc(this.accountRepository, this._authFacade)
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
          Either<AccountFailure, List>? failureOrSuccess;
          final isFirstNameValid = state.firstName.isValid();
          final isLastNameValid = state.lastName.isValid();
          final isEmailAddressValid = state.emailAddress.isValid();
          final isMobileNumberValid = state.mobileNumber.isValid();

          if (isFirstNameValid &&
              isLastNameValid &&
              isMobileNumberValid &&
              isEmailAddressValid) {
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
              countryCode: '+${state.countryCode}',
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
        verifyOtp: (VerifyOtp value) async {
          Either<AuthFailure, String>? failureOrSuccess;

          final isOTPValid = state.enteredOTP.isValid();

          if (isOTPValid) {
            emit(
              state.copyWith(
                isSubmitting: true,
                verifyOtpOrSuccessOption: none(),
              ),
            );

            failureOrSuccess = await _authFacade.verifyOtp(
              countryCode: '+${state.countryCode}',
              mobileNumber: state.mobileNumber,
              otp: state.enteredOTP,
            );
          }

          emit(
            state.copyWith(
              isSubmitting: false,
              showErrorMessages: true,
              verifyOtpOrSuccessOption: optionOf(failureOrSuccess),
            ),
          );
        },
        changeOTP: (ChangeOTP value) {
          emit(
            state.copyWith(
              enteredOTP: OTPText(value.otp),
              authFailureOrSuccessOption: none(),
            ),
          );
        },
        getPrefilledPhoneNumber: (GetPrefilledPhoneNumber value) {
          emit(
            state.copyWith(
              mobileNumber: MobileNumber(value.phoneNumber),
              countryCode: value.countryCode,
              authFailureOrSuccessOption: none(),
            ),
          );
        },
        startCountdown: (StartCountdown value) {
          timer = Timer.periodic(const Duration(seconds: 1), (timer) {
            if (state.secondsRemaining > 0 && !isClosed) {
              add(const EditProfileEvent.decrementTimer());
            } else {
              timer.cancel();
              // add(const LoginFormEvent.resendOtp());
            }
          });
          emit(state.copyWith(secondsRemaining: 30));
        },
        decrementTimer: (DecrementTimer value) {
          emit(
            state.copyWith(
              secondsRemaining: state.secondsRemaining - 1,
              otpFailureOrSuccessOption: none(),
              verifyOtpOrSuccessOption: none(),
              authFailureOrSuccessOption: none(),
            ),
          );
        },
        resendOtp: (ResendOtp value) async {
          Either<AuthFailure, String>? failureOrSuccess;

          emit(
            state.copyWith(
              // isSubmitting: true,
              otpFailureOrSuccessOption: none(),
            ),
          );

          failureOrSuccess = await _authFacade.resendOtp(
            countryCode: '+${state.countryCode}',
            mobileNumber: state.mobileNumber,
          );

          emit(
            state.copyWith(
              isSubmitting: false,
              //showErrorMessages: true,
              secondsRemaining: 30,
              otpFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          );

          add(EditProfileEvent.startCountdown());
        },
      );
    });
  }
}
