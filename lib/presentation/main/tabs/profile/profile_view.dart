import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/png_image_constants.dart';
import 'package:grape_customer_app/domain/core/string_constant.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
<<<<<<< HEAD
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
=======
>>>>>>> 7a93155 (profile section ui)
import 'package:grape_customer_app/presentation/core/styles/styles.dart';
import 'package:grape_customer_app/presentation/core/widgets/layout/layout.dart';

@RoutePage(name: 'ProfileView')
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: StringConstant.profile,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getSize(20),
        ),
        child: Column(
          children: [
            profileInfoView(),
            SizedBox(
              height: getSize(20),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getSize(20)),
              child: Divider(
                thickness: 1,
                color: AppColors.black.withOpacity(0.1),
              ),
            ),
            selectionMenu(context),
            SizedBox(
              height: getSize(5),
            ),
            liveChatSupport(context),
            SizedBox(
              height: getSize(12),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: AppLocalizations.of(context).developedby,
                  ),
                  TextSpan(
                    text: AppLocalizations.of(context).iRoidSolutions,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  )
                ],
                style: TextStyle(
                  fontFamily: 'SfPro',
                  fontSize: getFontSize(10),
                  color: AppColors.black.withOpacity(0.6),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: getSize(6),
            ),
          ],
        ),
      ),
    );
  }

  Widget selectionMenu(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: getSize(20)),
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          selectionListTile(
            iconUrl: SvgImageConstant.profile,
            title: AppLocalizations.of(context).editProfile,
            onTap: () {
              context.router.push(PageRouteInfo(EditProfileScreen.name));
            },
          ),
          selectionListTile(
            iconUrl: SvgImageConstant.order,
            title: AppLocalizations.of(context).myOrders,
            onTap: () {},
          ),
          selectionListTile(
            iconUrl: SvgImageConstant.location,
            title: AppLocalizations.of(context).shippingAddresses,
            onTap: () {},
          ),
          selectionListTile(
            iconUrl: SvgImageConstant.payment,
            title: AppLocalizations.of(context).paymentMethods,
            onTap: () {},
          ),
          selectionListTile(
            iconUrl: SvgImageConstant.languages,
            title: AppLocalizations.of(context).languages,
            onTap: () {},
          ),
          selectionListTile(
            iconUrl: SvgImageConstant.customerSupport,
            title: AppLocalizations.of(context).customerSupport,
            onTap: () {},
          ),
          selectionListTile(
            iconUrl: SvgImageConstant.privacyPolicy,
            title: AppLocalizations.of(context).privacyPolicy,
            onTap: () {},
          ),
          selectionListTile(
            iconUrl: SvgImageConstant.tc,
            title: AppLocalizations.of(context).termsConditions,
            onTap: () {},
          ),
          selectionListTile(
            iconUrl: SvgImageConstant.logOut,
            title: AppLocalizations.of(context).logout,
            onTap: () {},
            isBackArrow: false,
          ),
          SizedBox(
            height: getSize(10),
          )
        ],
      ),
    );
  }

  Widget profileInfoView() {
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
                  text: 'Hello! John Andrew',
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
                      text: 'john.andrew@gamil.com',
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
                      text: '+60 8521 8546',
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

  Widget selectionListTile({
    required String iconUrl,
    required String title,
    required void Function() onTap,
    bool isBackArrow = true,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: SvgPicture.asset(iconUrl),
      title: BaseText(
        text: title,
        textColor: AppColors.black,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      trailing: isBackArrow
          ? SvgPicture.asset(SvgImageConstant.backArrow)
          : SizedBox(),
      onTap: onTap,
    );
  }

  Widget liveChatSupport(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getSize(20)),
      padding: EdgeInsets.symmetric(vertical: getSize(9)),
      decoration: BoxDecoration(
        color: Color(0xFFFFEEE1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.primaryOrange.withOpacity(0.4),
          width: getSize(1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            PngImageConstants.liveChat,
            height: 30,
          ),
          SizedBox(
            width: getSize(8),
          ),
          BaseText(
            text: AppLocalizations.of(context).liveChatSupport,
            textColor: AppColors.primaryOrange,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          )
        ],
      ),
    );
  }
}
