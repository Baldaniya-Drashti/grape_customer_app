part of 'my_orders_bloc.dart';

@freezed
class MyOrdersState with _$MyOrdersState {
  const factory MyOrdersState.initial() = _Initial;
  const factory MyOrdersState.loadInProgress() = _LoadInProgress;
}