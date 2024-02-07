import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';

class EmptyFavouriteView extends StatelessWidget {
  const EmptyFavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            SvgImageConstant.favouriteUnselected,
            colorFilter: ColorFilter.mode(
              AppColors.black.withOpacity(0.4),
              BlendMode.srcIn,
            ),
            height: getSize(74),
            width: getSize(74),
          ),
          SizedBox(
            height: getSize(10),
          ),
          BaseText(
            text: 'You haven’t liked anything yet',
            fontSize: 14,
            textColor: AppColors.black.withOpacity(0.50),
          )
        ],
      ),
    );
  }
}
