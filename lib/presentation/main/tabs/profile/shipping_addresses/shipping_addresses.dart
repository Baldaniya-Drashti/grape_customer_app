import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grape_customer_app/application/main/profile/shipping_addresses/shipping_addresses_bloc.dart';
import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/infrastructure/main/shipping_address_dto/shipping_address_dto.dart';
import 'package:grape_customer_app/injection.dart';
import 'package:grape_customer_app/presentation/common/utils/flushbar_creator.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/core/widgets/buttons/common_button.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_app_bar.dart';
import 'package:grape_customer_app/presentation/main/tabs/profile/shipping_addresses/widgets/shipping_address_card.dart';

@RoutePage(name: 'ShippingAddresses')
class ShippingAddress extends StatelessWidget {
  final bool isFromChangeAddress;
  const ShippingAddress({super.key, this.isFromChangeAddress = false});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ShippingAddressesBloc>()
        ..add(ShippingAddressesEvent.getShippingAddress()),
      child: BlocConsumer<ShippingAddressesBloc, ShippingAddressesState>(
        listener: (context, state) {
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
                showSuccess(message: r).show(context).then((value) {
                  context
                      .read<ShippingAddressesBloc>()
                      .add(ShippingAddressesEvent.getShippingAddress());
                });
              },
            ),
          );
        },
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(
              title: AppLocalizations.of(context).shippingAddresses,
              actions: [
                GestureDetector(
                  onTap: () async {
                    var res = await context.router.push(
                      PageRouteInfo(
                        AddNewAddress.name,
                        args: AddNewAddressArgs(
                          shippingAddressResponce: ShippingAddressDTO(),
                        ),
                      ),
                    );
                    if (res != null && res == true) {
                      context
                          .read<ShippingAddressesBloc>()
                          .add(ShippingAddressesEvent.getShippingAddress());
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: getSize(16)),
                    child: SvgPicture.asset(SvgImageConstant.addIcon),
                  ),
                ),
              ],
            ),
            body: state.isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryOrange,
                    ),
                  )
                : state.isErrorInAPI
                    ? Center(
                        child: BaseText(
                            text: 'Something went wrong. Please try again'),
                      )
                    : state.isNoDataFound
                        ? Center(
                            child: BaseText(
                              text: 'No shipping addresses found.',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        : ListView.separated(
                            padding: EdgeInsets.symmetric(
                                horizontal: getSize(16), vertical: getSize(32)),
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) => SizedBox(
                              height: getSize(20),
                            ),
                            itemCount: state.addressList.length,
                            itemBuilder: (context1, index) =>
                                ShippingAddressCard(
                              onTapSelectCard: () => context
                                  .read<ShippingAddressesBloc>()
                                  .add(
                                    ShippingAddressesEvent.selectedIndex(index),
                                  ),
                              onTapDelete: () =>
                                  context.read<ShippingAddressesBloc>().add(
                                        ShippingAddressesEvent
                                            .deleteShippingAddress(state
                                                    .addressList[index].id
                                                    ?.toString() ??
                                                ""),
                                      ),
                              onTapEdit: () async {
                                var res = await context.router.push(
                                  PageRouteInfo(
                                    AddNewAddress.name,
                                    args: AddNewAddressArgs(
                                      shippingAddressResponce:
                                          state.addressList[index],
                                    ),
                                  ),
                                );
                                if (res != null && res == true) {
                                  context.read<ShippingAddressesBloc>().add(
                                      ShippingAddressesEvent
                                          .getShippingAddress());
                                }
                              },
                              isSelectCard: state.selectedIndex == index,
                              shippingAddress: state.addressList[index],
                            ),
                          ),
            bottomNavigationBar: Visibility(
              visible: isFromChangeAddress,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getSize(18),
                    vertical: isFullScreenDevice(context) ? 0 : getSize(14),
                  ),
                  child: CommonButton(
                    onPressed: state.addressList.isEmpty
                        ? () {}
                        : () {
                            context.router.maybePop(
                                state.addressList[state.selectedIndex]);
                          },
                    buttonText: AppLocalizations.of(context).save,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
