part of 'my_orders_bloc.dart';

@freezed
class MyOrdersEvent with _$MyOrdersEvent {
  factory MyOrdersEvent.getMyOrdersList(bool isRefresh) = GetMyOrderseList;
  factory MyOrdersEvent.getOrderDetail(String orderId) = GetOrderDetail;
  factory MyOrdersEvent.cancelOrder(String orderId) = CancelOrder;
}
