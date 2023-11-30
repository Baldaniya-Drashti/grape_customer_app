import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grape_customer_app/modules/splash/splash_controller.dart';
import 'package:grape_customer_app/shared/constants/constants.dart';
import 'package:grape_customer_app/shared/constants/png_image_constant.dart';
import 'package:grape_customer_app/shared/utils/math_utils.dart';
import 'package:grape_customer_app/shared/widgets/base_text.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              ColorConstants.splashColor1,
              ColorConstants.splashColor2,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Image.asset(
                controller.logo.value,
                height: getSize(415),
                width: getSize(237),
              ),
            ),
            Center(
              child: Image.asset(
                PngImageConstants.grape_text,
                height: getSize(34),
                width: getSize(125),
              ),
            ),
            SizedBox(
              height: getSize(5),
            ),
            BaseText(
              text: 'Company',
              isUpperCase: true,
              fontSize: 14,
              letterSpacing: 8,
              textColor: ColorConstants.black.withOpacity(0.60),
            )
          ],
        ),
      ),
    );
  }
}
