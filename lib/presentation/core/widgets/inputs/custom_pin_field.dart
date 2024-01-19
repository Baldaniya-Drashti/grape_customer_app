import 'package:flutter/material.dart';

import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinField extends StatelessWidget {
  const CustomPinField({
    Key? key,
    this.onDone,
    this.length = 4,
    this.labelWidget,
    this.autofocus = false,
    this.validator,
    this.onChanged,
    this.onCompleted,
  }) : super(key: key);

  final Function(String)? onDone;
  final int length;
  final bool autofocus;
  final Widget? labelWidget;
  final Function(String)? onChanged;
  final String? Function(String?, BuildContext)? validator;
  final Function(String)? onCompleted;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (labelWidget != null) ...[
          labelWidget ?? Container(),
          SizedBox(height: getSize(8)),
        ],
        PinCodeTextField(
          appContext: context,
          length: 4,
          animationType: AnimationType.fade,
          hintCharacter: '-',
          errorTextMargin: EdgeInsets.only(top: getSize(10)),
          cursorHeight: getSize(20),

          textStyle: TextStyle(
            fontFamily: 'SFPro',
            letterSpacing: 0.5,
            color: AppColors.black,
            fontSize: getFontSize(14),
            fontWeight: FontWeight.w400,
          ),
          enableActiveFill: false,
          errorTextSpace: getSize(14),
          validator: (inputString) {
            return validator?.call(inputString, context);
          },
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(getSize(10)),
            fieldHeight: getSize(42),
            fieldWidth: getSize(72),
            activeFillColor: Colors.white,
            activeBorderWidth: 1,
            selectedBorderWidth: 1,
            borderWidth: 1,
            errorBorderWidth: 1,
            inactiveBorderWidth: 1,
            disabledBorderWidth: 1,
            activeColor: AppColors.primaryOrange,
            inactiveColor: AppColors.black.withOpacity(0.2),
            selectedColor: AppColors.primaryOrange.withOpacity(0.2),
            errorBorderColor: AppColors.red,
          ),
          cursorColor: AppColors.primaryOrange,

          //controller: controller.codeController,
          keyboardType: TextInputType.number,
          onCompleted: onCompleted,
          autovalidateMode: AutovalidateMode.onUserInteraction,

          onChanged: onChanged,
          beforeTextPaste: (text) {
            debugPrint("Allowing to paste ");

            return true;
          },
        ),
      ],
    );
  }
}
