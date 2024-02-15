import 'package:flutter/material.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';

class OrderDetailShippingAddress extends StatelessWidget {
  const OrderDetailShippingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: getSize(30),
        ),
        BaseText(
          text: 'Shipping Address',
          fontSize: 14,
          fontWeight: FontWeight.w600,
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
                text: 'John Andrew',
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: getSize(4),
              ),
              BaseText(
                text: '+60 85285 8525',
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: getSize(4),
              ),
              BaseText(
                text:
                    '3711 Spring Hill Rd undefined Tallahassee, Nevada 52874 United States',
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(
                height: getSize(4),
              ),
              BaseText(
                text: 'Landmark: Near Smart Mall',
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
