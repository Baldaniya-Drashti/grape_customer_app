part of 'shipping_addresses_bloc.dart';

@freezed
class ShippingAddressesState with _$ShippingAddressesState {
  const factory ShippingAddressesState({
    required Username fullName,
    required FocusNode mobileNumberFocusNode,
    required FocusNode pinCodeFocusNode,
    required MobileNumber mobileNumber,
    required String countryCode,
    required InputEmptyOrNot address,
    required InputEmptyOrNot landMark,
    required InputEmptyOrNot state,
    required InputEmptyOrNot city,
    required PinCode pinCode,
    required bool showErrorMessages,
    required bool isSubmitting,
    required bool isLoading,
    required Option<Either<MainFailure, String>> failureOrSuccessOption,
    required List<ShippingAddressDTO> addressList,
    required int selectedIndex,
    required bool isEdit,
    required bool isErrorInAPI,
    required bool isNoDataFound,
  }) = _ShippingAddressesState;
  factory ShippingAddressesState.initial() => ShippingAddressesState(
        fullName: Username(''),
        mobileNumber: MobileNumber(''),
        countryCode: '91',
        address: InputEmptyOrNot(''),
        city: InputEmptyOrNot(''),
        landMark: InputEmptyOrNot(''),
        pinCode: PinCode(''),
        state: InputEmptyOrNot(''),
        showErrorMessages: false,
        failureOrSuccessOption: none(),
        addressList: [],
        selectedIndex: 0,
        isEdit: false,
        isSubmitting: false,
        isLoading: false,
        isErrorInAPI: false,
        isNoDataFound: false,
        mobileNumberFocusNode: FocusNode(),
        pinCodeFocusNode: FocusNode(),
      );
}
