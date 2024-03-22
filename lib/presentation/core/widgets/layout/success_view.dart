import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/styles.dart';

@RoutePage(name: 'SuccessScreen')
class SuccessScreen extends StatelessWidget {
  final String title;
  final String subTitle;

  final String? image;
  const SuccessScreen({
    super.key,
    required this.title,
    required this.subTitle,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BaseText(
              text: 'Congratulations',
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
            SizedBox(
              height: getSize(60),
            ),
            SvgPicture.asset(image ?? SvgImageConstant.successImage),
            SizedBox(
              height: getSize(60),
            ),
            Center(
              child: BaseText(
                text: title,
                fontSize: 24,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500,
                textColor: AppColors.primaryOrange,
              ),
            ),
            SizedBox(
              height: getSize(14),
            ),
            BaseText(
              text: subTitle,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
              textColor: AppColors.black.withOpacity(0.5),
            ),
            // SizedBox(
            //   height: getSize(207),
            // ),
          ],
        ),
      ),
    );
  }
}
