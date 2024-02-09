part of 'checkout_bloc.dart';

@freezed
class CheckoutState with _$CheckoutState {
  factory CheckoutState({
    required bool isFromCart,

  }) = _CheckoutState;
  factory CheckoutState.initial() => CheckoutState(
        isFromCart: false,
    
      );
}
