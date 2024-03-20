part of 'my_orders_bloc.dart';

@freezed
class MyOrdersState with _$MyOrdersState {
  factory MyOrdersState({
    required List<MyOrderDTO> getMyOrderList,
    required bool isLoading,
    required bool isNoDataFound,
    required bool isErrorInAPI,
    required Option<Either<MainFailure, String>> failureOrSuccessOption,
  }) = _MyOrdersState;
  factory MyOrdersState.initial() => MyOrdersState(
        isLoading: false,
        isNoDataFound: false,
        isErrorInAPI: false,
        failureOrSuccessOption: none(),
        getMyOrderList: [],
      );
}
