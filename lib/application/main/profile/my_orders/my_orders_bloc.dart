import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_orders_state.dart';
part 'my_orders_event.dart';
part 'my_orders_bloc.freezed.dart';

class MyOrdersBloc extends Bloc<MyOrdersEvent,MyOrdersState>{
  MyOrdersBloc() : super(const MyOrdersState.initial()){
    
  }
}