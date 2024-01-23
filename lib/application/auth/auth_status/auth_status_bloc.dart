import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grape_customer_app/presentation/common/utils/get_cookie.dart';
import 'package:injectable/injectable.dart';
import 'package:grape_customer_app/domain/auth/i_auth_facade.dart';

part 'auth_status_event.dart';
part 'auth_status_state.dart';
part 'auth_status_bloc.freezed.dart';

/// AuthStatusBloc manages the current user's auth status within the app.
@injectable
class AuthStatusBloc extends Bloc<AuthStatusEvent, AuthStatusState> {
  final IAuthFacade _authFacade;

  AuthStatusBloc(this._authFacade) : super(const AuthStatusState.initial()) {
    on<AuthStatusEvent>(
      (event, emit) async {
        await event.map(
          authCheckRequested: (e) async {
            final authenticated = await _authFacade.checkAuthenticated();
            final isShowIntroScreen = isUserShowIntro();
            if (isShowIntroScreen == null) {
              emit(AuthStatusState.introScreenVisibilty());
            } else {
              emit(
                authenticated
                    ? const AuthStatusState.authenticated()
                    : const AuthStatusState.unauthenticated(''),
              );
            }
          },
          signedOut: (e) async {
            var res = await _authFacade.logout();
            res.fold(
                (l) => null, (r) => emit(AuthStatusState.unauthenticated(r)));
          },
        );
      },
    );
  }
}
