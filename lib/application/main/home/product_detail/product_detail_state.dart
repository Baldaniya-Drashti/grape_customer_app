part of 'product_detail_bloc.dart';

@freezed
class ProductDetailState with _$ProductDetailState {
  factory ProductDetailState({
    required int productQuantity,
    required bool isLoading,
    required bool isErrorInAPI,
    required bool isFavourite,
    required GetProductListResponse getProductDetails,
    required List<Data> dataList,
    required int selectedImageIndex,
    required Option<Either<MainFailure, String>> failureOrSuccessOption,
  }) = _ProductDetailState;
  factory ProductDetailState.initial() => ProductDetailState(
        productQuantity: 1,
        isLoading: false,
        isErrorInAPI: false,
        getProductDetails: GetProductListResponse(),
        dataList: [],
        selectedImageIndex: 0,
        failureOrSuccessOption: none(),
        isFavourite: false,
      );
}
