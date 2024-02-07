import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/png_image_constants.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
              onTap: () {
                context.router.push(PageRouteInfo(PaymentMethod.name));
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
              Image.asset(
                PngImageConstants.masterCard,
                height: getSize(20),
                width: getSize(32),
              ),
              SizedBox(
                width: getSize(8),
              ),
              BaseText(
                text: '**** **** **** 8395',
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
}
