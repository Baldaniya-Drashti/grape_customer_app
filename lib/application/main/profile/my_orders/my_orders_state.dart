part of 'my_orders_bloc.dart';

@freezed
class MyOrdersState with _$MyOrdersState {
  factory MyOrdersState({
    required List<MyOrderDTO> getMyOrderList,
    required List<ReturnReasonModel> refundReasonList,
    required List<String> uploadImageList,
    required bool isLoading,
    required int selectedRefundReason,
    required bool isNoDataFound,
    required bool isErrorInAPI,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<MainFailure, String>> failureOrSuccessOption,
    required OrderDetailDTO orderDetailDTO,
    required String additonalComment,
  }) = _MyOrdersState;
  factory MyOrdersState.initial() => MyOrdersState(
        isLoading: false,
        isNoDataFound: false,
        isErrorInAPI: false,
        failureOrSuccessOption: none(),
        getMyOrderList: [],
        orderDetailDTO: OrderDetailDTO(),
        showErrorMessages: false,
        isSubmitting: false,
        refundReasonList: [],
        selectedRefundReason: -1,
        uploadImageList: [""],
        additonalComment: '',
      );
}
