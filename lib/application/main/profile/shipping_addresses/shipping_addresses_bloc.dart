import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grape_customer_app/application/main/profile/shipping_addresses/shipping_addresses_response.dart';
import 'package:grape_customer_app/domain/auth/auth_failure.dart';
import 'package:grape_customer_app/domain/auth/auth_value_objects.dart';
import 'package:injectable/injectable.dart';

part 'shipping_addresses_state.dart';
part 'shipping_addresses_event.dart';
part 'shipping_addresses_bloc.freezed.dart';

@injectable
class ShippingAddressesBloc
    extends Bloc<ShippingAddressesEvent, ShippingAddressesState> {
  ShippingAddressesBloc() : super(ShippingAddressesState.initial()) {
    on<ShippingAddressesEvent>((event, emit) async {
      await event.map(
        saveButtonPressed: (value) async {
          final isFullNameValid = state.fullName.isValid();
          final isMobileNumberValid = state.mobileNumber.isValid();
          final isAddressValid = state.address.isValid();
          final isLandMarkValid = state.landMark.isValid();
          final isStateValid = state.state.isValid();
          final isCityValid = state.city.isValid();
          final isPinCodeValid = state.pinCode.isValid();

          if (isFullNameValid &&
              isMobileNumberValid &&
              isAddressValid &&
              isLandMarkValid &&
              isStateValid &&
              isCityValid &&
              isPinCodeValid) {
            value.context.router.pop(
              ShippingAddressResponse(
                fullName: state.fullName.getValue(),
                countryCode: state.countryCode,
                mobileNumber: state.mobileNumber.getValue(),
                address: state.address.getValue(),
                landMark: state.landMark.getValue(),
                state: state.state.getValue(),
                city: state.city.getValue(),
                pinCode: state.pinCode.getValue(),
              ),
            );
          }

          emit(
            state.copyWith(
              showErrorMessages: true,
            ),
          );
        },
        fullNameChanged: (FullNameChanged value) async {
          emit(state.copyWith(
            fullName: Username(value.fullName),
            failureOrSuccessOption: none(),
          ));
        },
        mobileNumberChanged: (value) {
          emit(state.copyWith(
            mobileNumber: MobileNumber(value.mobileNumber),
            failureOrSuccessOption: none(),
          ));
        },
        countryCodeChanged: (value) {
          emit(state.copyWith(
            countryCode: value.countryCode,
            failureOrSuccessOption: none(),
          ));
        },
        addressChanged: (value) {
          emit(
            state.copyWith(address: InputEmptyOrNot(value.address)),
          );
        },
        landMarkChanged: (value) {
          emit(
            state.copyWith(landMark: InputEmptyOrNot(value.landMark)),
          );
        },
        stateChanged: (value) {
          emit(
            state.copyWith(state: InputEmptyOrNot(value.state)),
          );
        },
        cityChanged: (value) {
          emit(
            state.copyWith(city: InputEmptyOrNot(value.city)),
          );
        },
        pinCodeChanged: (value) {
          emit(
            state.copyWith(pinCode: InputEmptyOrNot(value.pinCode)),
          );
        },
        addAddresses: (value) {
          emit(state.copyWith(
              addressList: List.of(state.addressList)
                ..add(value.shippingAddressResponce)));
        },
        selectedIndex: (value) {
          emit(state.copyWith(
            selectedIndex: value.index,
          ));
        },
        deleteAddress: (value) {
          emit(state.copyWith(
            addressList: List.of(state.addressList)..removeAt(value.index),
          ));
        },
        prefillEditAddressData: (PrefillEditAddressData value) async {
          emit(
            state.copyWith(
              isEdit: value.isEdit,
              selectedAddressItems: value.shippingAddressResponce,
              failureOrSuccessOption: none(),
            ),
          );
        },
      );
    });
  }
}
