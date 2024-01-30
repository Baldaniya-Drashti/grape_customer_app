part of 'shipping_addresses_bloc.dart';

@freezed
class ShippingAddressesEvent with _$ShippingAddressesEvent {
  const factory ShippingAddressesEvent.fullNameChanged(String fullName) =
      FullNameChanged;

  const factory ShippingAddressesEvent.mobileNumberChanged(
      String mobileNumber) = MobileNumberChanged;

  const factory ShippingAddressesEvent.countryCodeChanged(String countryCode) =
      CountryCodeChanged;

  const factory ShippingAddressesEvent.addressChanged(String address) =
      AddressChanged;

  const factory ShippingAddressesEvent.landMarkChanged(String landMark) =
      LandMarkChanged;
  const factory ShippingAddressesEvent.stateChanged(String state) =
      StateChanged;
  const factory ShippingAddressesEvent.cityChanged(String city) = CityChanged;
  const factory ShippingAddressesEvent.pinCodeChanged(String pinCode) =
      PinCodeChanged;

  const factory ShippingAddressesEvent.saveButtonPressed(BuildContext context) =
      SaveButtonPressed;
  const factory ShippingAddressesEvent.addAddresses(
      ShippingAddressResponce shippingAddressResponce) = AddAddresses;
  const factory ShippingAddressesEvent.prefillEditAddressData(
          ShippingAddressResponce shippingAddressResponce, bool isEdit) =
      PrefillEditAddressData;
  const factory ShippingAddressesEvent.selectedIndex(int index) = SeletedIndex;
  const factory ShippingAddressesEvent.deleteAddress(int index) = DeleteAddress;
}
