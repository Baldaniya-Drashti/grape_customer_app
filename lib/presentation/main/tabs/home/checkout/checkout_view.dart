import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/checkout/checkout_bloc.dart';

import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/injection.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/widgets/buttons/common_button.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_app_bar.dart';

import 'package:grape_customer_app/presentation/main/tabs/home/checkout/widget/get_checkout_product.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/checkout/widget/payable_amount_widget.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/checkout/widget/payment_method_widget.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/checkout/widget/shippping_address_widget.dart';

@RoutePage(name: 'CheckoutView')
class CheckoutView extends StatelessWidget {
  final bool isFromCart;
  const CheckoutView({super.key, this.isFromCart = false});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<CheckoutBloc>()..add(CheckoutEvent.isFromCart(isFromCart)),
      child: BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(title: 'Checkout'),
            body: SafeArea(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: getSize(18)),
                physics: BouncingScrollPhysics(),
                children: [
                  GetCheckoutProductDetailWidget(),
                  PayableAmountWidget(),
                  ShippingAddressWidget(),
                  PaymentMethodWidget(),
                ],
              ),
            ),
            bottomNavigationBar: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  left: getSize(18),
                  right: getSize(18),
                  top: getSize(8),
                  bottom: isFullScreenDevice(context) ? 0 : getSize(18),
                ),
                child: CommonButton(
                  onPressed: () async {
                    context.router.push(
                      PageRouteInfo(
                        SuccessScreen.name,
                        args: SuccessScreenArgs(
                          title: 'SUCCESS',
                          subTitle:
                              'Payment successful and your order booked successfully.',
                        ),
                      ),
                    );
                    await Future.delayed(
                      Duration(seconds: 3),
                      () => context.router.popUntil((route) => route.isFirst),
                    );
                  },
                  buttonText: 'Pay Now',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
