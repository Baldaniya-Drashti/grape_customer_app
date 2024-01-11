import 'package:flutter/material.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';

class CenterLoadingIndicator extends StatelessWidget {
  const CenterLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: ColoredBox(
        color: AppColors.black,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );
  }
}
