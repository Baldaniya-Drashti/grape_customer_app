part of 'my_orders_bloc.dart';

@freezed
class MyOrdersState with _$MyOrdersState {
  factory MyOrdersState({
    required List<MyOrderDTO> getMyOrderList,
    required List<String> refundReasonList,
    required List<String> uploadImageList,
    required bool isLoading,
    required int selectedRefundReason,
    required bool isNoDataFound,
    required bool isErrorInAPI,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<MainFailure, String>> failureOrSuccessOption,
    required OrderDetailDTO orderDetailDTO,
    required InputEmptyOrNot additonalComment,
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
        refundReasonList: [
          'Item is damaged or defective',
          'Item is not as described',
          'Seller sent the wrong item',
          'Warranty-related returns',
          'Recall or quality assurance issues',
          'Manufacturer defects',
        ],
        selectedRefundReason: -1,
        uploadImageList: [""],
        additonalComment: InputEmptyOrNot(''),
      );
}
