import 'package:flutter/material.dart';

import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/main/chat/widget/chat_methods.dart';

class ShowDateWidget extends StatelessWidget {
  final int time;
  const ShowDateWidget({
    Key? key,
    required this.time,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BaseText(
        text: ChatMethods().isToday(DateTime.fromMillisecondsSinceEpoch(time))
            ? 'Today'
            : ChatMethods()
                .formatAsYesterday(DateTime.fromMillisecondsSinceEpoch(time)),
        fontSize: 12,
        textColor: AppColors.black.withOpacity(0.60),
      ),
    );
  }
}
