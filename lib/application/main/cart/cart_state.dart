part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  factory CartState({
    required List<GetCartListDTO> cartListDTO,
    required bool isLoading,
    required bool isNoDataFound,
    required bool isErrorInAPI,
    required num cartTotal,
    required Option<Either<MainFailure, String>> failureOrSuccessOption,
  }) = _CartState;
  factory CartState.initial() => CartState(
        cartListDTO: [],
        isLoading: false,
        isNoDataFound: false,
        isErrorInAPI: false,
        failureOrSuccessOption: none(),
        cartTotal: 0,
      );
}
