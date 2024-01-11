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

  LoginFormBloc(this._authFacade) : super(LoginFormState.initial()) {
    on<LoginFormEvent>((event, emit) async {
      await event.map(
        loginPressed: (e) async {
          Either<AuthFailure, Unit>? failureOrSuccess;

          final isMobileNumberValid = state.mobileNumber.isValid();

          if (isMobileNumberValid) {
            emit(
              state.copyWith(
                isSubmitting: true,
                authFailureOrSuccessOption: none(),
              ),
            );

            // failureOrSuccess = await _authFacade.login(
            //   emailAddress: EmailAddress('input'),
            //   password: Password('input'),
            // );
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
      );
    });
  }
}
