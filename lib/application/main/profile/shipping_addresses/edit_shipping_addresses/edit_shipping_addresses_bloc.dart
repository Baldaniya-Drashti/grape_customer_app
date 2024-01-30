import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_shipping_addresses_state.dart';
part 'edit_shipping_addresses_event.dart';
part 'edit_shipping_addresses_bloc.freezed.dart';

class EditShippingAddressesBloc extends Bloc<EditShippingAddressesEvent,EditShippingAddressesState>{
  EditShippingAddressesBloc() : super(const EditShippingAddressesState.initial()){
    
  }
}