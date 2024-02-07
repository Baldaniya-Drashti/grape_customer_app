import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grape_customer_app/application/main/profile/shipping_addresses/shipping_addresses_bloc.dart';
import 'package:grape_customer_app/application/main/profile/shipping_addresses/shipping_addresses_response.dart';
import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/widgets/buttons/common_button.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_app_bar.dart';
import 'package:grape_customer_app/presentation/profile/shipping_addresses/widgets/shipping_address_card.dart';

@RoutePage(name: 'ShippingAddresses')
class ShippingAddress extends StatelessWidget {
  const ShippingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShippingAddressesBloc(),
      child: BlocConsumer<ShippingAddressesBloc, ShippingAddressesState>(
        listener: (context, state) {},
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
                          shippingAddressResponce: ShippingAddressResponse(),
                        ),
                      ),
                    );
                    if (res != null) {
                      context.read<ShippingAddressesBloc>().add(
                          ShippingAddressesEvent.addAddresses(
                              res as ShippingAddressResponse));
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: getSize(16)),
                    child: SvgPicture.asset(SvgImageConstant.addIcon),
                  ),
                ),
              ],
            ),
            body: state.addressList.isNotEmpty
                ? ListView.separated(
                    padding: EdgeInsets.symmetric(
                        horizontal: getSize(16), vertical: getSize(32)),
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => SizedBox(
                      height: getSize(20),
                    ),
                    itemCount: state.addressList.length,
                    itemBuilder: (context1, index) => ShippingAddressCard(
                      onTapSelectCard: () =>
                          context.read<ShippingAddressesBloc>().add(
                                ShippingAddressesEvent.selectedIndex(index),
                              ),
                      onTapDelete: () =>
                          context.read<ShippingAddressesBloc>().add(
                                ShippingAddressesEvent.deleteAddress(index),
                              ),
                      onTapEdit: () async {
                        await context.router.push(
                          PageRouteInfo(
                            AddNewAddress.name,
                            args: AddNewAddressArgs(
                              shippingAddressResponce: state.addressList[index],
                            ),
                          ),
                        );
                      },
                      isSelectCard: state.selectedIndex == index,
                      shippingAddress: state.addressList[index],
                    ),
                  )
                : Center(
                    child: BaseText(
                      text: AppLocalizations.of(context).noData,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
            bottomNavigationBar: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getSize(18),
                ),
                child: CommonButton(
                  onPressed: () {},
                  buttonText: AppLocalizations.of(context).save,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
