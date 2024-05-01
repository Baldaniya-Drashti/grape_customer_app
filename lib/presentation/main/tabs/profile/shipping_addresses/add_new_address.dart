import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/profile/shipping_addresses/shipping_addresses_bloc.dart';
import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/infrastructure/main/shipping_address_dto/shipping_address_dto.dart';
import 'package:grape_customer_app/injection.dart';
import 'package:grape_customer_app/presentation/common/utils/app_focus.dart';
import 'package:grape_customer_app/presentation/common/utils/flushbar_creator.dart';
import 'package:grape_customer_app/presentation/common/widgets/common_country_code_picker.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/widgets/buttons/common_button.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_app_bar.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_keboard_config.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/inputs.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

@RoutePage(name: 'AddNewAddress')
class AddNewAddress extends StatelessWidget {
  final ShippingAddressDTO shippingAddressResponce;
  final bool isFromAuthFlow;
  const AddNewAddress(
      {super.key,
      required this.shippingAddressResponce,
      this.isFromAuthFlow = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppFocus.unfocus(context),
      child: BlocProvider(
        create: (context) => getIt<ShippingAddressesBloc>()
          ..add(
            ShippingAddressesEvent.prefillEditAddressData(
              shippingAddressResponce,
              shippingAddressResponce.full_name == null ? false : true,
            ),
          ),
        child: BlocConsumer<ShippingAddressesBloc, ShippingAddressesState>(
          listener: (BuildContext context, ShippingAddressesState state) {
            state.failureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  showError(
                    message: failure.maybeMap(
                      badRequest: (value) => value.error,
                      showAPIResponseMessage: (value) => value.message,
                      networkError: (value) =>
                          'Please check your internet connectivity',
                      orElse: () => "Server Error. Try again later.",
                    ),
                  ).show(context);
                },
                (r) {
                  showSuccess(message: r).show(context).then((value) async {
                    if (isFromAuthFlow) {
                      context.router.replaceAll(
                        [
                          PageRouteInfo(MainTabView.name),
                        ],
                      );
                    } else {
                      await context.router.maybePop(true);
                    }
                  });
                },
              ),
            );
          },
          builder: (context, state) {
            return Scaffold(
              appBar: CustomAppBar(
                  title: state.isEdit ? 'Edit Address' : 'Add New Address'),
              body: BlocBuilder<ShippingAddressesBloc, ShippingAddressesState>(
                builder: (context, state) {
                  return KeyboardActions(
                    config: CustomKeyboardConfig(focusNode: [
                      state.mobileNumberFocusNode,
                      state.pinCodeFocusNode,
                    ]).buildConfig(context),
                    child: Form(
                      autovalidateMode: state.showErrorMessages
                          //|| getIsMobileNumberChange(state)
                          ? AutovalidateMode.always
                          : AutovalidateMode.disabled,
                      child: ListView(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: getSize(18)),
                        children: [
                          SizedBox(
                            height: getSize(30),
                          ),
                          fullNameTextFiled(context, state),
                          SizedBox(
                            height: getSize(20),
                          ),
                          mobileNumberTextFiled(context, state),
                          SizedBox(
                            height: getSize(20),
                          ),
                          addressTextFiled(context, state),
                          SizedBox(
                            height: getSize(20),
                          ),
                          landMarkTextFiled(context, state),
                          SizedBox(
                            height: getSize(20),
                          ),
                          stateTextFiled(context, state),
                          SizedBox(
                            height: getSize(20),
                          ),
                          cityTextFiled(context, state),
                          SizedBox(
                            height: getSize(20),
                          ),
                          pinCodeTextFiled(context, state),
                          SizedBox(
                            height: getSize(20),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              bottomNavigationBar: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getSize(18),
                    vertical: isFullScreenDevice(context) ? 0 : getSize(18),
                  ),
                  child: CommonButton(
                    onPressed: () {
                      if (state.isEdit) {
                        context.read<ShippingAddressesBloc>().add(
                              ShippingAddressesEvent.editShippingAddress(
                                shippingAddressResponce.id?.toString() ?? "",
                              ),
                            );
                      } else {
                        context.read<ShippingAddressesBloc>().add(
                              ShippingAddressesEvent.addShippingAddress(),
                            );
                      }
                    },
                    buttonText: AppLocalizations.of(context).save,
                    isSubmitting: state.isSubmitting,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  CustomTextField pinCodeTextFiled(
      BuildContext context, ShippingAddressesState state) {
    return CustomTextField(
      key: state.isEdit ? Key('pinCode') : null,
      hintText: AppLocalizations.of(context).pinCode,
      labelText: AppLocalizations.of(context).pinCode,
      initialValue: state.pinCode.getValue(),
      focusNode: state.pinCodeFocusNode,
      keyboardType: TextInputType.number,
      onChanged: (pinCode) => context.read<ShippingAddressesBloc>().add(
            ShippingAddressesEvent.pinCodeChanged(pinCode),
          ),
      validator: (p0, p1) =>
          context.read<ShippingAddressesBloc>().state.pinCode.value.fold(
              (l) => l.maybeMap(
                    orElse: () => null,
                    empty: (value) => AppLocalizations.of(context).enterPinCode,
                    exceedingLength: (value) =>
                        'Pincode should be atleast 6 character long',
                  ),
              (r) => null),
    );
  }

  CustomTextField cityTextFiled(
      BuildContext context, ShippingAddressesState state) {
    return CustomTextField(
      key: state.isEdit ? Key('city') : null,
      hintText: AppLocalizations.of(context).city,
      labelText: AppLocalizations.of(context).city,
      initialValue: state.city.getValue(),
      onChanged: (city) => context.read<ShippingAddressesBloc>().add(
            ShippingAddressesEvent.cityChanged(city),
          ),
      validator: (p0, p1) =>
          context.read<ShippingAddressesBloc>().state.city.value.fold(
              (l) => l.maybeMap(
                    orElse: () => null,
                    empty: (value) => AppLocalizations.of(context).enterCity,
                  ),
              (r) => null),
    );
  }

  CustomTextField stateTextFiled(
      BuildContext context, ShippingAddressesState state) {
    return CustomTextField(
      key: state.isEdit ? Key('state') : null,
      hintText: AppLocalizations.of(context).state,
      labelText: AppLocalizations.of(context).state,
      initialValue: state.state.getValue() ?? "",
      onChanged: (state) => context.read<ShippingAddressesBloc>().add(
            ShippingAddressesEvent.stateChanged(state),
          ),
      validator: (p0, p1) =>
          context.read<ShippingAddressesBloc>().state.state.value.fold(
              (l) => l.maybeMap(
                    orElse: () => null,
                    empty: (value) => AppLocalizations.of(context).enterState,
                  ),
              (r) => null),
    );
  }

  CustomTextField landMarkTextFiled(
      BuildContext context, ShippingAddressesState state) {
    return CustomTextField(
      key: state.isEdit ? Key('landMark') : null,
      hintText: AppLocalizations.of(context).landMark,
      labelText: AppLocalizations.of(context).landMark,
      initialValue: state.landMark.getValue() ?? "",
      onChanged: (landMark) => context.read<ShippingAddressesBloc>().add(
            ShippingAddressesEvent.landMarkChanged(landMark),
          ),
      validator: (p0, p1) =>
          context.read<ShippingAddressesBloc>().state.landMark.value.fold(
              (l) => l.maybeMap(
                    orElse: () => null,
                    empty: (value) =>
                        AppLocalizations.of(context).enterLandMark,
                  ),
              (r) => null),
    );
  }

  CustomTextField addressTextFiled(
      BuildContext context, ShippingAddressesState state) {
    return CustomTextField(
      key: state.isEdit ? Key('address') : null,
      hintText: AppLocalizations.of(context).address,
      labelText: AppLocalizations.of(context).address,
      initialValue: state.address.getValue(),
      maxLines: 5,
      minLines: 1,
      onChanged: (address) => context
          .read<ShippingAddressesBloc>()
          .add(ShippingAddressesEvent.addressChanged(address)),
      validator: (p0, p1) =>
          context.read<ShippingAddressesBloc>().state.address.value.fold(
              (l) => l.maybeMap(
                    orElse: () => null,
                    empty: (value) => AppLocalizations.of(context).enterAddress,
                  ),
              (r) => null),
    );
  }

  CustomTextField mobileNumberTextFiled(
      BuildContext context, ShippingAddressesState state) {
    return CustomTextField(
      key: state.isEdit ? Key('mobileNumber') : null,
      labelText: AppLocalizations.of(context).mobileNumber,
      hintText: AppLocalizations.of(context).mobileNumber,
      initialValue: state.isEdit ? state.mobileNumber.getValue() : null,
      keyboardType: TextInputType.phone,
      focusNode: state.mobileNumberFocusNode,
      onChanged: (mobileNumber) => context
          .read<ShippingAddressesBloc>()
          .add(ShippingAddressesEvent.mobileNumberChanged(mobileNumber)),
      validator: (p0, p1) =>
          context.read<ShippingAddressesBloc>().state.mobileNumber.value.fold(
              (l) => l.maybeMap(
                    empty: (value) => AppLocalizations.of(context).enterMobile,
                    invalidMobileNumber: (_) =>
                        AppLocalizations.of(context).enterMobile,
                    orElse: () => null,
                  ),
              (r) => null),
      prefixIcon: CommonCountryCodePicker(
        initialSelection: state.countryCode,
        onChanged: (code) => context.read<ShippingAddressesBloc>().add(
              ShippingAddressesEvent.countryCodeChanged(code.phoneCode),
            ),
      ),
    );
  }

  CustomTextField fullNameTextFiled(
      BuildContext context, ShippingAddressesState state) {
    return CustomTextField(
      key: state.isEdit ? Key('fullName') : null,
      labelText: AppLocalizations.of(context).fullName,
      hintText: AppLocalizations.of(context).fullName,
      initialValue: state.isEdit ? state.fullName.getValue() : null,
      textCapitalization: TextCapitalization.words,
      onChanged: (fullName) => context
          .read<ShippingAddressesBloc>()
          .add(ShippingAddressesEvent.fullNameChanged(fullName)),
      validator: (p0, p1) =>
          context.read<ShippingAddressesBloc>().state.fullName.value.fold(
              (l) => l.maybeMap(
                    empty: (value) =>
                        AppLocalizations.of(context).enterFullName,
                    invalidUsername: (value) =>
                        AppLocalizations.of(context).enterFullName,
                    orElse: () => null,
                  ),
              (r) => null),
    );
  }
}
