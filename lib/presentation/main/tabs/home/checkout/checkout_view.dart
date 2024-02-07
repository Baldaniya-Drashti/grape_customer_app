import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/core/widgets/buttons/common_button.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_app_bar.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/checkout/widget/get_checkout_product.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/checkout/widget/payable_amount_widget.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/checkout/widget/payment_method_widget.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/checkout/widget/shippping_address_widget.dart';

@RoutePage(name: 'CheckoutView')
class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {},
            buttonText: 'Pay Now',
          ),
        ),
      ),
    );
  }
}
