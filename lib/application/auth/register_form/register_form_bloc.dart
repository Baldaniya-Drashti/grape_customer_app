import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:grape_customer_app/domain/auth/auth_failure.dart';
import 'package:grape_customer_app/domain/auth/auth_value_objects.dart';
import 'package:grape_customer_app/domain/auth/i_auth_facade.dart';

part 'register_form_bloc.freezed.dart';
part 'register_form_event.dart';
part 'register_form_state.dart';

/// RegisterFormBloc manages the user's register flow
@injectable
class RegisterFormBloc extends Bloc<RegisterFormEvent, RegisterFormState> {
  final IAuthFacade _authFacade;
  late Timer _timer;
  int _secondsRemaining = 30;

  RegisterFormBloc(this._authFacade) : super(RegisterFormState.initial()) {
    on<RegisterFormEvent>((event, emit) async {
      await event.map(emailChanged: (e) async {
        emit(
          state.copyWith(
            emailAddress: EmailAddress(e.email),
            authFailureOrSuccessOption: none(),
          ),
        );
      }, registerPressed: (e) async {
        Either<AuthFailure, Unit>? failureOrSuccess;

        final isEmailValid = state.emailAddress.isValid();
        final isFirstNameValid = state.firstName.isValid();
        final isLastNameValid = state.lastName.isValid();
        final isMobileNumberValid = state.mobileNumber.isValid();

        if (isEmailValid &&
            isFirstNameValid &&
            isLastNameValid &&
            isMobileNumberValid) {
          emit(
            state.copyWith(
              isSubmitting: true,
              authFailureOrSuccessOption: none(),
            ),
          );

          // failureOrSuccess = await _authFacade.register(
          //   emailAddress: state.emailAddress,
          //   username: state.username,
          //   password: state.password,
          // );
        }

        emit(
          state.copyWith(
            isSubmitting: false,
            showErrorMessages: true,
            authFailureOrSuccessOption: optionOf(failureOrSuccess),
          ),
        );
      }, lastNameChanged: (LastNameChanged value) {
        emit(
          state.copyWith(
            lastName: Username(value.lastName),
            authFailureOrSuccessOption: none(),
          ),
        );
      }, firstNameChanged: (FirstNameChanged value) {
        emit(
          state.copyWith(
            firstName: Username(value.firstName),
            authFailureOrSuccessOption: none(),
          ),
        );
      }, mobileNumberChanged: (MobileNumberChanged value) {
        emit(
          state.copyWith(
            mobileNumber: MobileNumber(value.mobileNumber),
            authFailureOrSuccessOption: none(),
          ),
        );
      }, selectCountryCode: (e) {
        emit(
          state.copyWith(
            selectedCountrycode: e.counryCode,
            authFailureOrSuccessOption: none(),
          ),
        );
      }, verifyOtp: (VerifyOtp value) {
        Either<AuthFailure, Unit>? failureOrSuccess;

        final isOTPValid = state.enteredOTP.isValid();

        if (isOTPValid) {
          emit(
            state.copyWith(
              isSubmitting: true,
              authFailureOrSuccessOption: none(),
            ),
          );

          // failureOrSuccess = await _authFacade.register(
          //   emailAddress: state.emailAddress,
          //   username: state.username,
          //   password: state.password,
          // );
        }

        emit(
          state.copyWith(
            isSubmitting: false,
            showErrorMessages: true,
            authFailureOrSuccessOption: optionOf(failureOrSuccess),
          ),
        );
      }, changeOTP: (ChangeOTP value) {
        emit(
          state.copyWith(
            enteredOTP: OTPText(value.otp),
            authFailureOrSuccessOption: none(),
          ),
        );
      }, getPrefilledPhoneNumber: (GetPrefilledPhoneNumber value) {
        emit(
          state.copyWith(
            mobileNumber: MobileNumber(value.phoneNumber),
            selectedCountrycode: value.countryCode,
            authFailureOrSuccessOption: none(),
          ),
        );
      }, startCountdown: (StartCountdown value) {
        _timer = Timer.periodic(Duration(seconds: 1), (timer) {
          if (_secondsRemaining > 0) {
            _secondsRemaining--;
            emit(state.copyWith(secondsRemaining: _secondsRemaining));
          } else {
            _timer.cancel();
            add(StopCountdown());
          }
        });
      }, stopCountdown: (StopCountdown value) {
        _timer.cancel();
        _secondsRemaining = 30;
        add(StopCountdown());
      });
    });
  }
}
