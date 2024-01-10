import 'package:flutter/material.dart';
import 'package:grape_customer_app/domain/core/color_constant.dart';

class CenterLoadingIndicator extends StatelessWidget {
  const CenterLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: ColoredBox(
        color: ColorConstants.dmBackground,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );
  }
}
