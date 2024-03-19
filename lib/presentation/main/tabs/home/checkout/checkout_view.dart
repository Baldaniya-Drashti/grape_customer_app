import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/checkout/checkout_bloc.dart';

import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/injection.dart';
import 'package:grape_customer_app/presentation/common/utils/flushbar_creator.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/core/widgets/buttons/common_button.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_app_bar.dart';

import 'package:grape_customer_app/presentation/main/tabs/home/checkout/widget/get_checkout_product.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/checkout/widget/payable_amount_widget.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/checkout/widget/payment_method_widget.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/checkout/widget/shippping_address_widget.dart';

@RoutePage(name: 'CheckoutView')
class CheckoutView extends StatelessWidget {
  final bool isFromCart;
  final String productId;
  final num quantity;
  const CheckoutView({
    super.key,
    this.isFromCart = false,
    this.productId = '',
    this.quantity = 1,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CheckoutBloc>()
        ..add(
          CheckoutEvent.isFromCart(
            isFromCart,
            productId,
            quantity,
          ),
        )
        ..add(CheckoutEvent.getCheckoutDetail(true)),
      child: BlocConsumer<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(title: 'Checkout'),
            body: SafeArea(
              child: state.isLoading
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
                      : state.getProductList.isNotEmpty
                          ? ListView(
                              shrinkWrap: true,
                              padding:
                                  EdgeInsets.symmetric(horizontal: getSize(18)),
                              physics: BouncingScrollPhysics(),
                              children: [
                                GetCheckoutProductDetailWidget(),
                                PayableAmountWidget(),
                                ShippingAddressWidget(),
                                PaymentMethodWidget(),
                              ],
                            )
                          : Container(),
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
                  isSubmitting: state.isSubmitting,
                  onPressed: () async {
                    context
                        .read<CheckoutBloc>()
                        .add(CheckoutEvent.orderPlace());
                  },
                  buttonText: 'Pay Now',
                ),
              ),
            ),
          );
        },
        listener: (BuildContext context, CheckoutState state) {
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
              (r) async {
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
                // await showSuccess(message: r).show(context).then((value) {
                //   context.router.pop(state.cardDetail.firstWhere((element) =>
                //       element.payment_method_id == state.selectedCard));
                // });
              },
            ),
          );
        },
      ),
    );
  }
}
