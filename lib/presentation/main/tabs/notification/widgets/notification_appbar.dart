import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/notifications/notifications_bloc.dart';

import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';

class NotificationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const NotificationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsBloc, NotificationsState>(
      builder: (context, state) {
        return AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          automaticallyImplyLeading: true,
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.white,
          centerTitle: true,
          title: BaseText(
            fontSize: 16,
            text: AppLocalizations.of(context).notifications,
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          bottom: TabBar(
            onTap: (value) {
              context
                  .read<NotificationsBloc>()
                  .add(NotificationsEvent.tabChange(value));
            },
            automaticIndicatorColorAdjustment: true,
            labelStyle: TextStyle(
              fontSize: getFontSize(14),
              fontWeight: FontWeight.w500,
              color: AppColors.black.withOpacity(0.5),
              fontFamily: 'SFPro',
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: getFontSize(14),
              fontWeight: FontWeight.w500,
              color: AppColors.black.withOpacity(0.5),
              fontFamily: 'SFPro',
            ),
            labelColor: AppColors.black,
            unselectedLabelColor: AppColors.black.withOpacity(0.60),
            splashFactory: NoSplash.splashFactory,
            dividerColor: AppColors.black.withOpacity(0.10),
            indicatorColor: AppColors.primaryOrange,
            indicatorSize: TabBarIndicatorSize.tab,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            indicatorPadding: EdgeInsets.zero,
            labelPadding: EdgeInsets.zero,
            dividerHeight: getSize(2.5),
            indicatorWeight: getSize(2.5),
            tabs: [
              Tab(
                child: getTabTitleMethod(
                  title: 'All Notification',
                  count:
                      state.notificationListDTO.total_unread_notification ?? 0,
                  index: 0,
                  notificationsState: state,
                ),
              ),
              Tab(
                child: getTabTitleMethod(
                  title: 'All Messages',
                  count: state.messageListDTO.total_unread_messages ?? 0,
                  index: 1,
                  notificationsState: state,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Row getTabTitleMethod(
      {required String title,
      required int count,
      required int index,
      required NotificationsState notificationsState}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BaseText(
          text: title,
          fontSize: 14,
          textColor: notificationsState.selectedTab == index
              ? AppColors.black
              : AppColors.black.withOpacity(0.60),
        ),
        SizedBox(
          width: getSize(4),
        ),
        Visibility(
          visible: count > 0,
          child: Container(
            padding: EdgeInsets.all(getSize(5)),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.primaryOrange,
              shape: BoxShape.circle,
            ),
            child: BaseText(
              text: count.toString(),
              fontSize: 10,
              fontWeight: FontWeight.w500,
              textColor: AppColors.white,
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(getSize(100));
}
