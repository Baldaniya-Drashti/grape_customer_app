part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {
  factory CartEvent.getCartList(bool isRefresh) = GetCartList;
  factory CartEvent.removeProductFromCart(String cartId) =
      RemoveProductFromCart;
}
