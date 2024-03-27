import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/profile/my_orders/my_orders_bloc.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';

class OrderDetailShippingAddress extends StatelessWidget {
  const OrderDetailShippingAddress({super.key});

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
                    text:
                        state.orderDetailDTO.shipping_address?.full_name ?? "",
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: getSize(4),
                  ),
                  BaseText(
                    text:
                        '+${state.orderDetailDTO.shipping_address?.country_code} ${state.orderDetailDTO.shipping_address?.mobile}',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: getSize(4),
                  ),
                  BaseText(
                    text:
                        '${state.orderDetailDTO.shipping_address?.address},${state.orderDetailDTO.shipping_address?.state},${state.orderDetailDTO.shipping_address?.city},${state.orderDetailDTO.shipping_address?.pincode}',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: getSize(4),
                  ),
                  BaseText(
                    text:
                        'Landmark:${state.orderDetailDTO.shipping_address?.landmark}',
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
