import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/core/widgets/buttons/common_button.dart';

class CancelOrderBottomSheet extends StatelessWidget {
  const CancelOrderBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  cancelOrderBottomSheet(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(getSize(14)),
          topRight: Radius.circular(getSize(14)),
        ),
      ),
      builder: (context) => SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getSize(18), vertical: getSize(20)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BaseText(
                text: 'Cancel Order',
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: getSize(30),
              ),
              BaseText(
                text: 'Are you sure want to cancel this order?',
                fontWeight: FontWeight.w500,
                textColor: AppColors.black.withOpacity(0.60),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: getSize(10),
              ),
              BaseText(
                text: 'Note: 20% amount will be deduct for cancellation charge',
                fontWeight: FontWeight.w500,
                textColor: AppColors.black.withOpacity(0.60),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: getSize(30),
              ),
              Row(
                children: [
                  Expanded(
                    child: CommonButton(
                      width: getSize(160),
                      onPressed: () {
                        context.router.pop(false);
                      },
                      borderColor: AppColors.primaryOrange,
                      buttonTextColor: AppColors.primaryOrange,
                      backgroundColor: AppColors.white,
                      buttonText: 'No',
                    ),
                  ),
                  SizedBox(width: getSize(19)),
                  Expanded(
                    child: CommonButton(
                      width: getSize(160),
                      onPressed: () {
                        context.router.pop(true);
                      },
                      buttonText: 'Yes',
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
