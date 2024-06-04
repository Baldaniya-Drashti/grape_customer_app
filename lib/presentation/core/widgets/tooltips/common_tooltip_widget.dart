import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/presentation/core/styles/styles.dart';

import 'package:super_tooltip/super_tooltip.dart';

class CommonTooltipWidget extends StatelessWidget {
  const CommonTooltipWidget({
    super.key,
    required this.superTooltipController,
    this.content,
  });

  final SuperTooltipController superTooltipController;
  final Widget? content;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await superTooltipController.showTooltip();
      },
      child: SuperTooltip(
        showBarrier: false,
        controller: superTooltipController,
        backgroundColor: Colors.white,
        // popupDirection: TooltipDirection.=,
        shadowColor: AppColors.primaryOrange.withOpacity(0.3),
        borderColor: AppColors.primaryOrange,
        shadowBlurRadius: 20,
        shadowSpreadRadius: 0,
        borderWidth: 1,
        sigmaX: 0,
        sigmaY: 0,
        content: content ?? Container(),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     BaseText(
        //       text: StringConstant.whenThisDealMustBeLiveFrom.tr,
        //       fontSize: 12,
        //       // textColor: ColorConstants.black.withOpacity(0.8),
        //     ),
        //     GestureDetector(
        //       onTap: () async {
        //         await superTooltipController.hideTooltip();
        //       },
        //       child: BaseText(
        //         text: StringConstant.gotIt.tr,
        //         fontSize: 15,
        //         textColor: ColorConstants.kPrimary,
        //       ),
        //     ),
        //   ],
        // ),
        child: SvgPicture.asset(SvgImageConstant.infoIcon),
      ),
    );
  }
}
