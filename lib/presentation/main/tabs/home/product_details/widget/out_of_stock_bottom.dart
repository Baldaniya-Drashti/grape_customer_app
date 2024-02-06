import 'package:flutter/material.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/core/widgets/buttons/common_button.dart';

class OutOfStockBottomWidget extends StatelessWidget {
  const OutOfStockBottomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CommonButton(
      onPressed: () {},
      buttonText: 'Notify',
      height: 42,
      borderColor: AppColors.primaryOrange,
      buttonTextColor: AppColors.primaryOrange,
      backgroundColor: AppColors.white,
    );
  }
}
