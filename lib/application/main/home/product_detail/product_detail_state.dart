part of 'product_detail_bloc.dart';

@freezed
class ProductDetailState with _$ProductDetailState {
  factory ProductDetailState({
    required int productQuantity,
    required bool isLoading,
    required bool isShopDetailLoading,
    required bool isErrorInAPI,
    required bool isFavourite,
    required ProductDetailDTO getProductDetails,
    required List<SimilarProduct> similarProduct,
    required List<Data> dataList,
    required int selectedImageIndex,
    required bool isNoDataFound,
    required List<GetProductListResponse> getProductList,
    required Option<Either<MainFailure, String>> failureOrSuccessOption,
    required List<MapEntry<String, dynamic>> filterList,
    required List<MapEntry<String, dynamic>> selectedFilterList,
    required ShopDetailDTO shopDetailDTO,
  }) = _ProductDetailState;
  factory ProductDetailState.initial() => ProductDetailState(
        productQuantity: 1,
        isLoading: false,
        isErrorInAPI: false,
        getProductDetails: ProductDetailDTO(),
        dataList: [],
        selectedImageIndex: 0,
        failureOrSuccessOption: none(),
        isFavourite: false,
        similarProduct: [],
        getProductList: [],
        isNoDataFound: false,
        filterList: [],
        selectedFilterList: [
          MapEntry('All', ['1'])
        ],
        shopDetailDTO: ShopDetailDTO(),
        isShopDetailLoading: false,
      );
}
