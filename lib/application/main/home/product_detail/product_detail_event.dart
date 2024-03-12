part of 'product_detail_bloc.dart';

@freezed
class ProductDetailEvent with _$ProductDetailEvent {
  factory ProductDetailEvent.increaseProductQuantity() =
      IncreaseProductQuantity;
  factory ProductDetailEvent.decreaseProductQuantity() =
      DecreaseProductQuantity;
  factory ProductDetailEvent.getProductDetails(String productId) =
      GetProductDetails;
  factory ProductDetailEvent.selectImage(int index) = SelectImage;
  factory ProductDetailEvent.addProductToCart() = AddProductToCart;
  factory ProductDetailEvent.removeProductFromCart() = RemoveProductFromCart;
}
