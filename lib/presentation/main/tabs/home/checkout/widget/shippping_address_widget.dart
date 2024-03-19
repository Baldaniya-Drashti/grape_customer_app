import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/checkout/checkout_bloc.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';

class ShippingAddressWidget extends StatelessWidget {
  const ShippingAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getSize(30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BaseText(
                  text: 'Shipping Address',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                GestureDetector(
                  onTap: () async {
                    var res = await context.router.push(
                      PageRouteInfo(
                        ShippingAddresses.name,
                        args: ShippingAddressesArgs(isFromChangeAddress: true),
                      ),
                    );

                    if (res != null) {
                      context
                          .read<CheckoutBloc>()
                          .add(CheckoutEvent.getCheckoutDetail(true));
                    }
                  },
                  child: BaseText(
                    text: 'Change',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.primaryOrange,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getSize(10),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: getSize(18),
                horizontal: getSize(24),
              ),
              decoration: BoxDecoration(
                color: AppColors.grey.withOpacity(0.20),
                borderRadius: BorderRadius.circular(getSize(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseText(
                    text: state.checkoutDTO.shipping_address?.full_name ?? "",
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  BaseText(
                    text:
                        '+${state.checkoutDTO.shipping_address?.country_code} ${state.checkoutDTO.shipping_address?.mobile}',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  BaseText(
                    text:
                        '${state.checkoutDTO.shipping_address?.address},${state.checkoutDTO.shipping_address?.state},${state.checkoutDTO.shipping_address?.city},${state.checkoutDTO.shipping_address?.pincode}',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    showFullDescription: true,
                  ),
                  BaseText(
                    text:
                        'Landmark: ${state.checkoutDTO.shipping_address?.landmark}',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
