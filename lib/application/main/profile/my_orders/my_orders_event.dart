part of 'my_orders_bloc.dart';

@freezed
class MyOrdersEvent with _$MyOrdersEvent {
  factory MyOrdersEvent.getMyOrderseList(bool isRefresh) = GetMyOrderseList;
}
