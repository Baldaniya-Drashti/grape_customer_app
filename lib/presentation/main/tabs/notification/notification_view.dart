import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/notifications/notifications_bloc.dart';

import 'package:grape_customer_app/presentation/main/tabs/notification/widgets/all_message_list.dart';
import 'package:grape_customer_app/presentation/main/tabs/notification/widgets/all_notification_list.dart';

@RoutePage(name: 'NotificationView')
class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsBloc, NotificationsState>(
      builder: (context, state) {
        return TabBarView(
          physics: BouncingScrollPhysics(),
          
          children: [
            AllNotificationListWidget(),
            AllMessageListWidget(),
          ],
        );
      },
    );
  }
}
