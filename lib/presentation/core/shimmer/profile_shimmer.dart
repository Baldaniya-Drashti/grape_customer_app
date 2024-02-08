import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade200,
      child: Container(
        padding: EdgeInsets.all(getSize(10)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade50,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: getSize(53),
              width: getSize(53),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.grey.shade50,
                shape: BoxShape.rectangle,
              ),
            ),
            SizedBox(
              width: getSize(12),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: getSize(3),
                    width: getSize(180),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.grey.shade50,
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  SizedBox(
                    height: getSize(6),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        SvgImageConstant.email,
                        colorFilter:
                            ColorFilter.mode(AppColors.grey, BlendMode.srcATop),
                      ),
                      SizedBox(
                        width: getSize(4),
                      ),
                      Container(
                        height: getSize(3),
                        width: getSize(150),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.grey.shade50,
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getSize(4),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        SvgImageConstant.call,
                        colorFilter:
                            ColorFilter.mode(AppColors.grey, BlendMode.srcATop),
                      ),
                      SizedBox(
                        width: getSize(4),
                      ),
                      Container(
                        height: getSize(3),
                        width: getSize(100),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.grey,
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
