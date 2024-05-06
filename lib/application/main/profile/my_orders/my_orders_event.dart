part of 'my_orders_bloc.dart';

@freezed
class MyOrdersEvent with _$MyOrdersEvent {
  factory MyOrdersEvent.getMyOrdersList(bool isRefresh) = GetMyOrderseList;
  factory MyOrdersEvent.getReasonRefundList() = GetReasonRefundList;

  factory MyOrdersEvent.getOrderDetail(String orderId) = GetOrderDetail;
  factory MyOrdersEvent.cancelOrder(String orderId) = CancelOrder;
  factory MyOrdersEvent.changeReturnReason(int index) = ChangeReturnReason;
  factory MyOrdersEvent.addRefundPhoto(String path) = AddRefundPhoto;
  factory MyOrdersEvent.removeRefundPhoto(int index) = RemoveRefundPhoto;
  factory MyOrdersEvent.additionalCommentChange(String input) =
      AdditionalCommentChange;
  factory MyOrdersEvent.submitRefundRequest() = SubmitRefundRequest;
}
