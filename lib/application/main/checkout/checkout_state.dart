part of 'checkout_bloc.dart';

@freezed
class CheckoutState with _$CheckoutState {
  factory CheckoutState({
    required bool isFromCart,
    required CheckoutDTO checkoutDTO,
    required List<GetProductListResponse> getProductList,
    required String productId,
    required num quantity,
    required bool isLoading,
    required bool isSubmitting,
    required bool isNoDataFound,
    required bool isErrorInAPI,
    required num cartTotal,
    required num orderTotal,
    required Option<Either<MainFailure, String>> failureOrSuccessOption,
  }) = _CheckoutState;
  factory CheckoutState.initial() => CheckoutState(
        isFromCart: false,
        checkoutDTO: CheckoutDTO(),
        isLoading: false,
        isErrorInAPI: false,
        isNoDataFound: false,
        getProductList: [],
        failureOrSuccessOption: none(),
        productId: '',
        quantity: 1,
        cartTotal: 0,
        orderTotal: 0,
        isSubmitting: false,
      );
}
