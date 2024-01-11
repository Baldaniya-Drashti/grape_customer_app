import 'package:flutter/material.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';

import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';

class CommonButton extends StatelessWidget {
  final double borderRadius;
  final double? width;
  final double? height;
  final Gradient? gradient;
  final VoidCallback onPressed;
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
  final bool isSubmitting;
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
    this.isSubmitting = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isSubmitting ? null : onPressed,
      style: ElevatedButton.styleFrom(
        side: BorderSide(color: borderColor ?? Colors.transparent),
        elevation: 0,
        shadowColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        backgroundColor: backgroundColor ?? AppColors.primaryOrange,
        disabledBackgroundColor: backgroundColor ?? AppColors.primaryOrange,
        fixedSize: Size(
          getSize(width ?? MediaQuery.of(context).size.width),
          getSize(
            height ?? getSize(42),
          ),
        ),
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
      child: isSubmitting
          ? CircularProgressIndicator(
              color: AppColors.white,
            )
          : BaseText(
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
