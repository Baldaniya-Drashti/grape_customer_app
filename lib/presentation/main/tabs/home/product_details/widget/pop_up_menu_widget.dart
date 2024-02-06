import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';

class PopMenuWidget extends StatelessWidget {
  const PopMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      padding: EdgeInsets.zero,
      icon: SvgPicture.asset(
        SvgImageConstant.more,
      ),
      color: AppColors.white,
      offset: Offset(0, 0),
      elevation: 0,
      position: PopupMenuPosition.under,
      shadowColor: AppColors.black.withOpacity(0.25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          getSize(10),
        ),
        side: BorderSide(
          color: AppColors.black.withOpacity(0.25),
        ),
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        getMenuItems(
          title: 'Home',
          image: SvgImageConstant.homeUnselected,
        ),
        PopupMenuDivider(
          height: 0,
        ),
        getMenuItems(
          title: 'Share',
          image: SvgImageConstant.share,
        ),
        PopupMenuDivider(
          height: 0,
        ),
        getMenuItems(
          title: 'My Favorite',
          image: SvgImageConstant.favouriteUnselected,
        ),
        PopupMenuDivider(
          height: 0,
        ),
        getMenuItems(
          title: 'Messages',
          image: SvgImageConstant.message,
        ),
        PopupMenuDivider(
          height: 0,
        ),
        getMenuItems(
          title: 'My Profile',
          image: SvgImageConstant.profileUnselected,
        ),
        PopupMenuDivider(
          height: 0,
        ),
        getMenuItems(
          title: 'Ask Help?',
          image: SvgImageConstant.feedback,
        ),
        PopupMenuDivider(
          height: 0,
        ),
        getMenuItems(
          title: 'Report',
          image: SvgImageConstant.report,
        ),
        PopupMenuDivider(
          height: 0,
        ),
        getMenuItems(
          title: 'Feedback',
          image: SvgImageConstant.help,
        ),
      ],
    );
  }

  PopupMenuItem<dynamic> getMenuItems(
      {required String title, required String image}) {
    return PopupMenuItem(
      padding: EdgeInsets.symmetric(horizontal: getSize(12)),
      child: ListTile(
        dense: true,
        splashColor: Colors.transparent,
        visualDensity: VisualDensity(
          vertical: VisualDensity.minimumDensity,
        ),
        minVerticalPadding: 0,
        contentPadding: EdgeInsets.zero,
        minLeadingWidth: getSize(0),
        horizontalTitleGap: getSize(10),
        leading: SvgPicture.asset(
          image,
          colorFilter: ColorFilter.mode(AppColors.black, BlendMode.srcIn),
          height: getSize(18),
          width: getSize(18),
        ),
        title: BaseText(
          text: title,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
