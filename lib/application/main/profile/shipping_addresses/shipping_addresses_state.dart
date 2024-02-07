part of 'shipping_addresses_bloc.dart';

@freezed
class ShippingAddressesState with _$ShippingAddressesState {
  const factory ShippingAddressesState({
    required Username fullName,
    required MobileNumber mobileNumber,
    required String countryCode,
    required InputEmptyOrNot address,
    required InputEmptyOrNot landMark,
    required InputEmptyOrNot state,
    required InputEmptyOrNot city,
    required InputEmptyOrNot pinCode,
    required bool showErrorMessages,
    required Option<Either<AuthFailure, String>> failureOrSuccessOption,
    required List<ShippingAddressResponse> addressList,
    required int selectedIndex,
    required bool isEdit,
  }) = _ShippingAddressesState;
  factory ShippingAddressesState.initial() => ShippingAddressesState(
        fullName: Username(''),
        mobileNumber: MobileNumber(''),
        countryCode: '91',
        address: InputEmptyOrNot(''),
        city: InputEmptyOrNot(''),
        landMark: InputEmptyOrNot(''),
        pinCode: InputEmptyOrNot(''),
        state: InputEmptyOrNot(''),
        showErrorMessages: false,
        failureOrSuccessOption: none(),
        addressList: [],
        selectedIndex: 0,
        isEdit: false,
      );
}
