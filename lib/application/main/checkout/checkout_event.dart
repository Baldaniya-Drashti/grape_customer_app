part of 'checkout_bloc.dart';

@freezed
class CheckoutEvent with _$CheckoutEvent {
  factory CheckoutEvent.isFromCart(
      bool isFromCart, String productId, num quantity) = IsFromCart;

  factory CheckoutEvent.getCheckoutDetail(bool isRefresh) = GetCheckoutDetail;
  factory CheckoutEvent.removeCheckoutProduct(String productId) =
      ChangePaymentMethod;
  factory CheckoutEvent.orderPlace() = OrderPlace;

  factory CheckoutEvent.changeShippingAddress(
      ShippingAddressDTO? shippingAddressDTO) = ChangeShippingAddress;

  factory CheckoutEvent.changePaymentMethod(GetCardsDTO getCartListDTO) =
      ChangePaymentMethodEvent;
}
