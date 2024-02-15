import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/presentation/common/utils/dash_line.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/styles.dart';

class CommonStepper extends StatelessWidget {
  const CommonStepper({
    super.key,
    required this.isPlaced,
    required this.isPacked,
    required this.isShipped,
    required this.isDelivered,
    required this.placeTitle,
    required this.placeDescription,
    required this.packedTitle,
    required this.packedDescription,
    required this.shippedTitle,
    required this.shippedDescription,
    required this.deliveredTitle,
    required this.deliveredDescription,
  });

  final bool isPlaced;
  final bool isPacked;
  final bool isShipped;
  final bool isDelivered;
  final String placeTitle;
  final String placeDescription;

  final String packedTitle;
  final String packedDescription;

  final String shippedTitle;
  final String shippedDescription;

  final String deliveredTitle;
  final String deliveredDescription;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Row(
              children: [
                Container(
                  height: getSize(28),
                  width: getSize(28),
                  decoration: BoxDecoration(
                    color: isPlaced ? AppColors.primaryOrange : AppColors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: isPlaced
                      ? Icon(
                          Icons.check,
                          color: Colors.white,
                        )
                      : const SizedBox(),
                )
              ],
            ),
            MySeparator(
                isRow: false,
                color: isPlaced ? AppColors.primaryOrange : AppColors.grey,
                width: 1,
                height: getSize(70)),
            Row(
              children: [
                Container(
                  height: getSize(28),
                  width: getSize(28),
                  decoration: BoxDecoration(
                      color:
                          isPacked ? AppColors.primaryOrange : AppColors.grey,
                      shape: BoxShape.circle),
                  child: isPacked
                      ? Icon(
                          Icons.check,
                          color: Colors.white,
                        )
                      : const SizedBox(),
                )
              ],
            ),
            MySeparator(
                isRow: false,
                color: isPacked ? AppColors.primaryOrange : AppColors.grey,
                width: 1,
                height: getSize(70)),
            Row(
              children: [
                Container(
                  height: getSize(28),
                  width: getSize(28),
                  decoration: BoxDecoration(
                    color: isShipped ? AppColors.primaryOrange : AppColors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: isShipped
                      ? Icon(
                          Icons.check,
                          color: Colors.white,
                        )
                      : const SizedBox(),
                )
              ],
            ),
            MySeparator(
                isRow: false,
                color: isShipped ? AppColors.primaryOrange : AppColors.grey,
                width: 1,
                height: getSize(70)),
            Row(
              children: [
                Container(
                  height: getSize(28),
                  width: getSize(28),
                  decoration: BoxDecoration(
                      color: isDelivered
                          ? AppColors.primaryOrange
                          : AppColors.grey,
                      shape: BoxShape.circle),
                  child: isDelivered
                      ? Icon(
                          Icons.check,
                          color: Colors.white,
                        )
                      : SizedBox(),
                )
              ],
            ),
          ],
        ),
        SizedBox(
          width: getSize(20),
        ),
        Expanded(
          child: Column(
            children: [
              trackTile(
                title: placeTitle,
                description: placeDescription,
                svgUrl: SvgImageConstant.placed,
                isStatus: isPlaced,
              ),
              SizedBox(height: getSize(70)),
              trackTile(
                title: packedTitle,
                description: packedDescription,
                svgUrl: SvgImageConstant.packed,
                isStatus: isPacked,
              ),
              SizedBox(height: getSize(70)),
              trackTile(
                title: shippedTitle,
                description: shippedDescription,
                svgUrl: SvgImageConstant.shipped,
                isStatus: isShipped,
              ),
              SizedBox(height: getSize(60)),
              trackTile(
                title: deliveredTitle,
                description: deliveredDescription,
                svgUrl: SvgImageConstant.shipped,
                isStatus: isDelivered,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget trackTile({
    required String title,
    required String description,
    required String svgUrl,
    required bool isStatus,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BaseText(
              text: title,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              textColor: AppColors.black.withOpacity(0.8),
            ),
            BaseText(
              text: description,
              fontSize: 10,
              textColor: AppColors.black.withOpacity(0.7),
            ),
          ],
        ),
        SvgPicture.asset(
          svgUrl,
          colorFilter: ColorFilter.mode(
            isStatus ? AppColors.primaryOrange : AppColors.grey,
            BlendMode.srcIn,
          ),
        )
      ],
    );
  }
}
