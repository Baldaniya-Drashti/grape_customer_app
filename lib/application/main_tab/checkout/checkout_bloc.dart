import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'checkout_state.dart';
part 'checkout_event.dart';
part 'checkout_bloc.freezed.dart';

@injectable
class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(CheckoutState.initial()) {
    on<CheckoutEvent>(
      (event, emit) async {
        await event.map(
          isFromCart: (IsFromCart value) async {
            emit(state.copyWith(isFromCart: value.isFromCart));
          },
        );
      },
    );
  }
}
