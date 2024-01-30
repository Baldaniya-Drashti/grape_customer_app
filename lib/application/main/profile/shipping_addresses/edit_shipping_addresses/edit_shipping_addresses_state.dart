part of 'edit_shipping_addresses_bloc.dart';

@freezed
class EditShippingAddressesState with _$EditShippingAddressesState {
  const factory EditShippingAddressesState.initial() = _Initial;
  const factory EditShippingAddressesState.loadInProgress() = _LoadInProgress;
}