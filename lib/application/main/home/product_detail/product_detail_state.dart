part of 'product_detail_bloc.dart';

@freezed
class ProductDetailState with _$ProductDetailState {
  factory ProductDetailState({
    required int productQuantity,
    required bool isLoading,
    required bool isErrorInAPI,
    required GetProductListResponse getProductDetails,
    required ProductFromJson productFromJson,
    required int selectedImageIndex,
  }) = _ProductDetailState;
  factory ProductDetailState.initial() => ProductDetailState(
        productQuantity: 1,
        isLoading: false,
        isErrorInAPI: false,
        getProductDetails: GetProductListResponse(),
        productFromJson: ProductFromJson(),
        selectedImageIndex: 0,
      );
}
