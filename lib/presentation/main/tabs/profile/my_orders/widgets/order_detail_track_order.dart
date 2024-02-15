import 'package:flutter/material.dart';
import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/common/widgets/common_stepper.dart';

class OrderDetailTrackOrder extends StatelessWidget {
  const OrderDetailTrackOrder({super.key});

  @override
  Widget build(BuildContext context) {
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
          isPlaced: true,
          isPacked: true,
          isShipped: true,
          isDelivered: false,
          placeTitle: 'Placed',
          placeDescription: 'Order placed on 24 Oct, 12:AM',
          packedTitle: 'Packed',
          packedDescription: 'Order packed on 26 Oct',
          shippedTitle: 'Shipped',
          shippedDescription: 'Product on the way',
          deliveredTitle: 'Delivered',
          deliveredDescription: 'Expected date 28, Oct',
        ),
      ],
    );
  }
}
