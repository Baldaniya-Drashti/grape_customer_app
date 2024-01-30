part of 'edit_shipping_addresses_bloc.dart';

@freezed
class EditShippingAddressesEvent with _$EditShippingAddressesEvent {
  const factory EditShippingAddressesEvent.fullNameChanged(String fullName) =
      FullNameChanged;
}
