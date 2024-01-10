import 'package:flutter/material.dart';

import 'package:grape_customer_app/domain/core/color_constant.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';

class CommonButton extends StatelessWidget {
  final double borderRadius;
  final double? width;
  final double? height;
  final Gradient? gradient;
  final VoidCallback? onPressed;
  final String buttonText;
  final Widget? customWidget;
  final List<BoxShadow>? shadows;
  final Widget? iconWidget;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? buttonTextColor;
  final double? buttonFontSize;
  final FontWeight? buttonFontWeight;
  final Widget? widget;
  const CommonButton({
    Key? key,
    required this.onPressed,
    this.customWidget,
    this.borderRadius = 10,
    this.width,
    this.height,
    this.shadows,
    this.gradient,
    this.backgroundColor,
    required this.buttonText,
    this.iconWidget,
    this.buttonTextColor,
    this.buttonFontSize,
    this.buttonFontWeight,
    this.borderColor,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final borderRadius = this.borderRadius ?? BorderRadius.circular(14);
    return ElevatedButton(
      onPressed: () {
        //    AppFocus.unfocus(Get.context!);
        if (onPressed != null) {
          onPressed!();
        }
      },
      style: ElevatedButton.styleFrom(
        side: BorderSide(color: borderColor ?? Colors.transparent),
        elevation: 0,
        shadowColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        backgroundColor: backgroundColor ?? ColorConstants.primaryOrange,
        fixedSize: Size(
          getSize(width ?? MediaQuery.of(context).size.width),
          getSize(
            height ?? getSize(42),
          ),
        ),
        //  padding: EdgeInsets.symmetric(horizontal: getSize(10), vertical: 0),
        visualDensity: VisualDensity(
          vertical: VisualDensity.minimumDensity,
          horizontal: VisualDensity.minimumDensity,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            getSize(borderRadius),
          ),
        ),
      ),
      child: BaseText(
        text: buttonText,
        fontSize: buttonFontSize ?? 16,
        textAlign: TextAlign.center,
        maxLines: 1,
        fontWeight: buttonFontWeight ?? FontWeight.w500,
        textColor: buttonTextColor ?? Colors.white,
      ),
    );
  }
}
