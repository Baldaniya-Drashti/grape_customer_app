import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';

class ShippingAddressWidget extends StatelessWidget {
  const ShippingAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
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

                log('res : $res');
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
                text: 'John Andrew',
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              BaseText(
                text: '+60 85285 8525',
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              BaseText(
                text:
                    '3711 Spring Hill Rd undefined Tallahassee, Nevada 52874 United States',
                fontSize: 14,
                fontWeight: FontWeight.w400,
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
