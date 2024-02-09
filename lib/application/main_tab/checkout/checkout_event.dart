part of 'checkout_bloc.dart';

@freezed
class CheckoutEvent with _$CheckoutEvent {
  factory CheckoutEvent.isFromCart(bool isFromCart) = IsFromCart;
  
}
