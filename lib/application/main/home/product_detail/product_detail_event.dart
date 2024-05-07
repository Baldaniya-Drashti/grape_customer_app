part of 'product_detail_bloc.dart';

@freezed
class ProductDetailEvent with _$ProductDetailEvent {
  factory ProductDetailEvent.increaseProductQuantity() =
      IncreaseProductQuantity;
  factory ProductDetailEvent.decreaseProductQuantity() =
      DecreaseProductQuantity;
  factory ProductDetailEvent.getProductDetails(
      String productId, bool isRefresh, bool showLoading) = GetProductDetails;
  factory ProductDetailEvent.addToFavourite({String? productId}) =
      AddToFavourite;
  factory ProductDetailEvent.selectImage(int index) = SelectImage;
  factory ProductDetailEvent.addProductToCart({String? productId}) =
      AddProductToCart;
  factory ProductDetailEvent.removeProductFromCart(String cartId) =
      RemoveProductFromCart;
  factory ProductDetailEvent.removeProductFromFavourite({String? productId}) =
      RemoveProductFromFavourite;

  factory ProductDetailEvent.getProductYouMayAlsoLikeProductList(
      bool isRefresh) = GetProductYouMayAlsoLikeProductList;
  factory ProductDetailEvent.disposeController() = DisposeController;
  factory ProductDetailEvent.getShopDetailAPI(String? shopId, bool isRefresh) =
      GetShopDetailAPI;
  factory ProductDetailEvent.getShopDetailFilterAPI(
      String? shopId, bool isRefresh) = GetShopDetailFilterAPI;
  factory ProductDetailEvent.addFilterInList(
      MapEntry<String, dynamic> addFilter) = AddFilterInList;
}
