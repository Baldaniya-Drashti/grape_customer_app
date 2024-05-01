import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/profile/my_orders/my_orders_bloc.dart';
import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/common/widgets/common_stepper.dart';
import 'package:intl/intl.dart';

class OrderDetailTrackOrder extends StatelessWidget {
  const OrderDetailTrackOrder({super.key});

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
              text: AppLocalizations.of(context).trackOrder,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: getSize(25),
            ),
            CommonStepper(
              isPlaced: (state.orderDetailDTO.status ?? 0) >= 0,
              isPacked: (state.orderDetailDTO.status ?? 0) >= 1 &&
                  state.orderDetailDTO.status != 4,
              isShipped: (state.orderDetailDTO.status ?? 0) >= 2 &&
                  state.orderDetailDTO.status != 4,
              isDelivered: (state.orderDetailDTO.status ?? 0) >= 3 &&
                  state.orderDetailDTO.status != 4,
              placeTitle: 'Placed',
              placeDescription: state.orderDetailDTO.order_date != null
                  ? 'Order placed on ${getDateTime(state.orderDetailDTO.order_date ?? 0)}'
                  : "",
              packedTitle: 'Packed',
              packedDescription: state.orderDetailDTO.packed_date != null
                  ? 'Order packed on ${getDateTime(state.orderDetailDTO.packed_date ?? 0)}'
                  : "",
              shippedTitle: 'Shipped',
              shippedDescription: state.orderDetailDTO.shipped_date != null
                  ? 'Product on the way'
                  : "",
              deliveredTitle: 'Delivered',
              deliveredDescription: state.orderDetailDTO.delivered_date != null
                  ? 'Expected date ${getDateTime(state.orderDetailDTO.delivered_date ?? 0)}'
                  : "",
            ),
          ],
        );
      },
    );
  }

  getDateTime(int date) {
    return DateFormat('dd MMM , hh:mm aa')
        .format(DateTime.fromMillisecondsSinceEpoch(date));
  }
}
