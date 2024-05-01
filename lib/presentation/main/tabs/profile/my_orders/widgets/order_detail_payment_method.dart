import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/profile/my_orders/my_orders_bloc.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';

class OrderDetailPaymentMethod extends StatelessWidget {
  const OrderDetailPaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrdersBloc, MyOrdersState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getSize(30),
            ),
            BaseText(
              text: 'Payment Method',
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: getSize(10),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
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
                          state.orderDetailDTO.payment_method?.brand ?? "") ??
                      Container(),
                  SizedBox(
                    width: getSize(8),
                  ),
                  BaseText(
                    text:
                        '**** **** **** ${state.orderDetailDTO.payment_method?.last4 ?? ""}',
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
