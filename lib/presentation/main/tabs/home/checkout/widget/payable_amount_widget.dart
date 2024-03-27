import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/checkout/checkout_bloc.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:intl/intl.dart';

class PayableAmountWidget extends StatelessWidget {
  const PayableAmountWidget({super.key});

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
            BaseText(
              text: 'Payable Amount',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              textColor: AppColors.black.withOpacity(0.80),
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
                children: [
                  getPriceDetails(
                    title: 'Item (${state.getProductList.length})',
                    price: NumberFormat.simpleCurrency(
                            decimalDigits: state.cartTotal is int ? 0 : 2)
                        .format(state.cartTotal),
                  ),
                  SizedBox(
                    height: getSize(18),
                  ),
                  getPriceDetails(
                    title: 'Shipping',
                    price: NumberFormat.simpleCurrency(
                            decimalDigits:
                                state.checkoutDTO.shipping_charge is int
                                    ? 0
                                    : 2)
                        .format(state.checkoutDTO.shipping_charge),
                  ),
                  SizedBox(
                    height: getSize(18),
                  ),
                  getPriceDetails(
                    title: 'Tax',
                    price: NumberFormat.simpleCurrency(
                            decimalDigits: state.checkoutDTO.tax is int ? 0 : 2)
                        .format(state.checkoutDTO.tax),
                  ),
                  SizedBox(
                    height: getSize(18),
                  ),
                  Divider(
                    height: 0,
                    color: AppColors.black.withOpacity(0.10),
                  ),
                  SizedBox(
                    height: getSize(18),
                  ),
                  getTotalPriceDetails(
                    title: 'Total Price',
                    price: NumberFormat.simpleCurrency(
                            decimalDigits: state.orderTotal is int ? 0 : 2)
                        .format(state.orderTotal),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Row getPriceDetails({required String title, required String price}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BaseText(
          text: title,
          fontSize: 13,
          fontWeight: FontWeight.w500,
          textColor: AppColors.black.withOpacity(0.60),
        ),
        BaseText(
          text: price,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          textColor: AppColors.black.withOpacity(0.80),
        ),
      ],
    );
  }

  Row getTotalPriceDetails({required String title, required String price}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BaseText(
          text: title,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        BaseText(
          text: price,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          textColor: AppColors.primaryOrange,
        ),
      ],
    );
  }
}
