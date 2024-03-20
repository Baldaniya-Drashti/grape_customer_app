import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/checkout/checkout_bloc.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/infrastructure/main/payemnt_method_dto/get_cards_dto.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      builder: (context, state) {
        if (state.checkoutDTO.payment_method == null) {
          return GestureDetector(
            onTap: () async {
              var res =
                  await context.router.push(PageRouteInfo(PaymentMethod.name));

              if (res != null) {
                context
                    .read<CheckoutBloc>()
                    .add(CheckoutEvent.changePaymentMethod(res as GetCardsDTO));
              }
            },
            child: Center(
              child: BaseText(
                text: 'Add payment method',
                textColor: AppColors.primaryOrange,
                textDecoration: TextDecoration.underline,
              ),
            ),
          );
        } else {
          return Column(
            children: [
              SizedBox(
                height: getSize(30),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BaseText(
                    text: 'Payment Method',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  GestureDetector(
                    onTap: () async {
                      var res = await context.router
                          .push(PageRouteInfo(PaymentMethod.name));

                      if (res != null) {
                        context.read<CheckoutBloc>().add(
                            CheckoutEvent.changePaymentMethod(
                                res as GetCardsDTO));
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
                child: Row(
                  children: [
                    getCardIcon(
                            state.checkoutDTO.payment_method?.brand ?? "") ??
                        Container(),
                    SizedBox(
                      width: getSize(8),
                    ),
                    BaseText(
                      text:
                          '**** **** **** ${state.checkoutDTO.payment_method?.last4 ?? ""}',
                      fontSize: 12,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: getSize(30),
              ),
            ],
          );
        }
      },
    );
  }

  Widget? getCardIcon(String cardType) {
    String img = "";
    Widget? icon;
    switch (cardType) {
      case 'mastercard':
        img = 'mastercard.png';
        break;
      case 'visa':
        img = 'visa.png';
        break;
      case 'verve':
        img = 'verve.png';
        break;
      case 'amex':
        img = 'american_express.png';
        break;
      case 'discover':
        img = 'discover.png';
        break;
      case 'diners':
        img = 'dinners_club.png';
        break;
      case 'jcb':
        img = 'jcb.png';
        break;
      case 'Others':
        icon = Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.credit_card,
            size: getSize(20),
            color: Colors.grey[600],
          ),
        );
        break;
      default:
        icon = Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.warning,
            size: 40.0,
            color: Colors.grey[600],
          ),
        );
        break;
    }
    Widget? widget;
    if (img.isNotEmpty) {
      widget = Image.asset(
        'assets/png/$img',
        alignment: Alignment.centerLeft,
        height: getSize(20),
        width: getSize(32),
        //fit: BoxFit.cover,
      );
    } else {
      widget = icon;
    }
    return widget;
  }
}
