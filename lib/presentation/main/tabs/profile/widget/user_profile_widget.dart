import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/presentation/common/utils/get_current_user.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getSize(10)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.primaryOrange,
      ),
      child: Row(
        children: [
          Container(
            height: getSize(53),
            width: getSize(53),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHDRlp-KGr_M94k_oor4Odjn2UzbAS7n1YoA&usqp=CAU',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: getSize(12),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseText(
                  text:
                      'Hello! ${getCurrentUser().firstName} ${getCurrentUser().lastName}',
                  textColor: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  maxLines: 1,
                ),
                SizedBox(
                  height: getSize(6),
                ),
                Row(
                  children: [
                    SvgPicture.asset(SvgImageConstant.email),
                    SizedBox(
                      width: getSize(4),
                    ),
                    BaseText(
                      text: getCurrentUser().email ?? "",
                      textColor: AppColors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(
                  height: getSize(4),
                ),
                Row(
                  children: [
                    SvgPicture.asset(SvgImageConstant.call),
                    SizedBox(
                      width: getSize(4),
                    ),
                    BaseText(
                      text:
                          '${getCurrentUser().countryCode} ${getCurrentUser().phone}',
                      textColor: AppColors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
