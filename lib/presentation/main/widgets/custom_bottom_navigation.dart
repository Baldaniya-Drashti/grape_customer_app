import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grape_customer_app/application/main/notifications/notifications_bloc.dart';
import 'package:grape_customer_app/application/main_tab/main_tab_bloc.dart';
import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/png_image_constants.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';

class CustomBottomNavigationWidget extends StatelessWidget {
  const CustomBottomNavigationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainTabBloc, MainTabState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Theme(
          data: ThemeData(splashFactory: NoSplash.splashFactory),
          child: BottomNavigationBar(
            currentIndex: state.selectedTab,
            selectedItemColor: AppColors.primaryOrange,
            backgroundColor: AppColors.white,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            selectedLabelStyle: TextStyle(
              color: AppColors.primaryOrange,
              fontWeight: FontWeight.w500,
              fontSize: getFontSize(8),
              height: getSize(3.2),
              fontFamily: 'SFPro',
            ),
            unselectedLabelStyle: TextStyle(
              color: AppColors.black.withOpacity(0.4),
              fontWeight: FontWeight.w400,
              //  height: getSize(3.2),
              fontSize: getFontSize(8),
              fontFamily: 'SFPro',
            ),
            onTap: (value) {
              context.read<MainTabBloc>().add(MainTabEvent.tabChange(value));
            },
            items: [
              BottomNavigationBarItem(
                icon: getUnSelectedIcons(
                    iconName: SvgImageConstant.homeUnselected),
                label: AppLocalizations.of(context).home,
                activeIcon: getSelectedIcons(
                  iconName: PngImageConstants.grape_logo,
                  isPng: true,
                ),
              ),
              BottomNavigationBarItem(
                icon: getUnSelectedIcons(
                    iconName: SvgImageConstant.favouriteUnselected),
                label: AppLocalizations.of(context).favorites,
                activeIcon: getSelectedIcons(
                    iconName: SvgImageConstant.favouriteSelected),
              ),
              BottomNavigationBarItem(
                icon: getUnSelectedIcons(
                    iconName: PngImageConstants.cartUnselected, isPng: true),
                label: AppLocalizations.of(context).myCart,
                activeIcon: getSelectedIcons(
                  iconName: PngImageConstants.cartSelected,
                  isPng: true,
                ),
              ),
              BottomNavigationBarItem(
                icon: getUnSelectedIcons(
                    iconName: SvgImageConstant.notificationUnselected),
                label: AppLocalizations.of(context).notifications,
                activeIcon: getSelectedIcons(
                    iconName: SvgImageConstant.notificationSelected),
              ),
              BottomNavigationBarItem(
                icon: getUnSelectedIcons(
                    iconName: SvgImageConstant.profileUnselected),
                label: AppLocalizations.of(context).profile,
                activeIcon: getSelectedIcons(
                    iconName: SvgImageConstant.profileSelected),
              ),
            ],
          ),
        );
      },
    );
  }

  Container getUnSelectedIcons({bool isPng = false, required String iconName}) {
    return Container(
      height: getSize(34),
      width: getSize(34),
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          isPng
              ? Image.asset(
                  iconName,
                  height: getSize(24),
                  width: getSize(24),
                )
              : SvgPicture.asset(
                  iconName,
                  height: getSize(24),
                  width: getSize(24),
                  colorFilter: ColorFilter.mode(
                    AppColors.black.withOpacity(0.4),
                    BlendMode.srcIn,
                  ),
                ),
          BlocBuilder<NotificationsBloc, NotificationsState>(
            builder: (context, state) {
              return Visibility(
                visible: ((iconName
                            .contains(SvgImageConstant.notificationSelected) ||
                        iconName.contains(
                            SvgImageConstant.notificationUnselected)) &&
                    ((state.notificationListDTO.total_unread_notification ??
                                0) >
                            0 ||
                        (state.messageListDTO.total_unread_messages ?? 0) > 0)),
                child: Container(
                  height: getSize(8),
                  width: getSize(8),
                  decoration: BoxDecoration(
                    color: AppColors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  getSelectedIcons({bool isPng = false, required String iconName}) {
    return Container(
      height: getSize(34),
      width: getSize(34),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primaryOrange.withOpacity(0.2),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryOrange.withOpacity(0.2),
            offset: Offset(1, 1),
            blurRadius: getSize(5),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          isPng
              ? Image.asset(
                  iconName,
                  height: getSize(24),
                  width: getSize(24),
                )
              : SvgPicture.asset(
                  iconName,
                  height: getSize(24),
                  width: getSize(24),
                ),
          BlocBuilder<NotificationsBloc, NotificationsState>(
            builder: (context, state) {
              return Visibility(
                visible: ((iconName
                            .contains(SvgImageConstant.notificationSelected) ||
                        iconName.contains(
                            SvgImageConstant.notificationUnselected)) &&
                    ((state.notificationListDTO.total_unread_notification ??
                                0) >
                            0 ||
                        (state.messageListDTO.total_unread_messages ?? 0) > 0)),
                child: Container(
                  height: getSize(8),
                  width: getSize(8),
                  decoration: BoxDecoration(
                    color: AppColors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
