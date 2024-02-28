import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:grape_customer_app/domain/auth/auth_failure.dart';
import 'package:grape_customer_app/domain/auth/auth_value_objects.dart';
import 'package:grape_customer_app/domain/auth/i_auth_facade.dart';

part 'login_form_bloc.freezed.dart';
part 'login_form_event.dart';
part 'login_form_state.dart';

/// LoginFormBloc manages the user's login flow
@injectable
class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  final IAuthFacade _authFacade;
  late Timer timer;

  LoginFormBloc(this._authFacade) : super(LoginFormState.initial()) {
    on<LoginFormEvent>(
      (event, emit) async {
        await event.map(
          loginPressed: (e) async {
            Either<AuthFailure, String>? failureOrSuccess;

            final isMobileNumberValid = state.mobileNumber.isValid();
            if (isMobileNumberValid) {
              emit(
                state.copyWith(
                  isSubmitting: true,
                  authFailureOrSuccessOption: none(),
                ),
              );

              failureOrSuccess = await _authFacade.login(
                mobileNumber: state.mobileNumber,
                countryCode: '+${state.selectedCountrycode}',
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
          selectCountryCode: (e) {
            emit(state.copyWith(selectedCountrycode: e.counryCode));
          },
          mobileNumberChanged: (e) {
            emit(
              state.copyWith(
                mobileNumber: MobileNumber(e.mobileNumber),
                authFailureOrSuccessOption: none(),
              ),
            );
          },
          startCountdown: (StartCountdown value) {
            timer = Timer.periodic(const Duration(seconds: 1), (timer) {
              if (state.secondsRemaining > 0 && !isClosed) {
                add(const LoginFormEvent.decrementTimer());
              } else {
                timer.cancel();
                // add(const LoginFormEvent.resendOtp());
              }
            });
            emit(state.copyWith(secondsRemaining: 30));
          },
          decrementTimer: (DecrementTimer value) {
            emit(state.copyWith(
              secondsRemaining: state.secondsRemaining - 1,
              authFailureOrSuccessOption: none(),
              resendFailureOrSuccessOption: none(),
            ));
          },
          resendOtp: (ResendOtp value) async {
            //timer.cancel();

            Either<AuthFailure, String>? failureOrSuccess;

            emit(
              state.copyWith(
                isSubmitting: true,
                authFailureOrSuccessOption: none(),
              ),
            );

            failureOrSuccess = await _authFacade.resendOtp(
              countryCode: '+${state.selectedCountrycode}',
              mobileNumber: state.mobileNumber,
            );

            emit(
              state.copyWith(
                isSubmitting: false,
                //showErrorMessages: true,
                secondsRemaining: 30,
                resendFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
            add(LoginFormEvent.startCountdown());
          },
          verifyOtp: (VerifyOtp value) async {
            Either<AuthFailure, String>? failureOrSuccess;

            final isOTPValid = state.enteredOTP.isValid();

            if (isOTPValid) {
              emit(
                state.copyWith(
                  isSubmitting: true,
                  authFailureOrSuccessOption: none(),
                ),
              );

              failureOrSuccess = await _authFacade.verifyOtp(
                countryCode: '+${state.selectedCountrycode}',
                mobileNumber: state.mobileNumber,
                otp: state.enteredOTP,
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
                selectedCountrycode: value.countryCode,
                authFailureOrSuccessOption: none(),
              ),
            );
          },
        );
      },
    );
  }
}
