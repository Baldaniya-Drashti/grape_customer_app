import 'package:flutter/widgets.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/png_image_constants.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';

class EmptyCartView extends StatelessWidget {
  const EmptyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            PngImageConstants.cartUnselected,
            height: getSize(74),
            width: getSize(74),
          ),
          SizedBox(
            height: getSize(10),
          ),
          BaseText(
            text: 'You haven’t add to cart anything yet',
            fontSize: 14,
            textColor: AppColors.black.withOpacity(0.50),
          )
        ],
      ),
    );
  }
}
