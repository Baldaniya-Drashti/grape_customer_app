import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grape_customer_app/domain/auth/auth_value_objects.dart';
import 'package:grape_customer_app/domain/main/i_main_facade.dart';
import 'package:grape_customer_app/domain/main/main_failure.dart';
import 'package:grape_customer_app/infrastructure/main/shipping_address_dto/shipping_address_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'shipping_addresses_state.dart';
part 'shipping_addresses_event.dart';
part 'shipping_addresses_bloc.freezed.dart';

@injectable
class ShippingAddressesBloc
    extends Bloc<ShippingAddressesEvent, ShippingAddressesState> {
  int page = 1;
  int lastPage = 1;

  bool isFetching = false;
  final RefreshController refreshController = RefreshController();
  final IMainFacade mainFacade;
  ShippingAddressesBloc(this.mainFacade)
      : super(ShippingAddressesState.initial()) {
    on<ShippingAddressesEvent>(
      (event, emit) async {
        await event.map(
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
              state.copyWith(pinCode: PinCode(value.pinCode)),
            );
          },
          selectedIndex: (value) {
            emit(state.copyWith(
              selectedIndex: value.index,
            ));
          },
          prefillEditAddressData: (PrefillEditAddressData value) async {
            emit(
              state.copyWith(
                fullName:
                    Username(value.shippingAddressResponce.full_name ?? ''),
                countryCode: value.shippingAddressResponce.country_code ?? '91',
                mobileNumber:
                    MobileNumber(value.shippingAddressResponce.mobile ?? ''),
                landMark: InputEmptyOrNot(
                    value.shippingAddressResponce.landmark ?? ''),
                address: InputEmptyOrNot(
                    value.shippingAddressResponce.address ?? ''),
                state:
                    InputEmptyOrNot(value.shippingAddressResponce.state ?? ''),
                city: InputEmptyOrNot(value.shippingAddressResponce.city ?? ''),
                pinCode: PinCode(value.shippingAddressResponce.pincode ?? ''),
                isEdit: value.isEdit,
                failureOrSuccessOption: none(),
              ),
            );
          },
          addShippingAddress: (AddShippingAddress value) async {
            Either<MainFailure, String>? failureOrSuccess;

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
              emit(
                state.copyWith(
                  isSubmitting: true,
                  failureOrSuccessOption: none(),
                ),
              );

              failureOrSuccess = await mainFacade.addShippingAddress(
                fullName: state.fullName,
                mobileNumber: state.mobileNumber,
                countryCode: state.countryCode,
                address: state.address,
                landMark: state.landMark,
                state: state.state,
                city: state.city,
                pinCode: state.pinCode,
              );
            }

            emit(
              state.copyWith(
                isSubmitting: false,
                showErrorMessages: true,
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          getShippingAddress: (GetShippingAddress value) async {
            emit(
              state.copyWith(
                isLoading: true,
                failureOrSuccessOption: none(),
              ),
            );

            var res = await mainFacade.getShippingAddressAPI();

            res.fold(
              (l) => emit(
                state.copyWith(
                  isLoading: false,
                  isErrorInAPI: true,
                  failureOrSuccessOption: none(),
                ),
              ),
              (r) => emit(
                state.copyWith(
                  isLoading: false,
                  isErrorInAPI: false,
                  isNoDataFound: r.isEmpty,
                  failureOrSuccessOption: none(),
                  addressList: r,
                ),
              ),
            );
          },
          editShippingAddress: (EditShippingAddress value) async {
            Either<MainFailure, String>? failureOrSuccess;

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
              emit(
                state.copyWith(
                  isSubmitting: true,
                  failureOrSuccessOption: none(),
                ),
              );

              failureOrSuccess = await mainFacade.editShippingAddress(
                fullName: state.fullName,
                mobileNumber: state.mobileNumber,
                countryCode: state.countryCode,
                address: state.address,
                landMark: state.landMark,
                state: state.state,
                city: state.city,
                pinCode: state.pinCode,
                id: value.id,
              );
            }

            emit(
              state.copyWith(
                isSubmitting: false,
                showErrorMessages: true,
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          deleteShippingAddress: (DeleteShippingAddress value) async {
            Either<MainFailure, String>? failureOrSuccess;
            emit(
              state.copyWith(
                isSubmitting: true,
                failureOrSuccessOption: none(),
              ),
            );

            failureOrSuccess = await mainFacade.deleteShippinAddress(
              id: value.id,
            );

            emit(
              state.copyWith(
                isSubmitting: false,
                showErrorMessages: true,
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
        );
      },
    );
  }
}
