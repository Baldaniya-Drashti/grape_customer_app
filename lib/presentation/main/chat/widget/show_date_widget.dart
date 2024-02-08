import 'package:flutter/material.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/main/chat/widget/chat_methods.dart';

class ShowDateWidget extends StatelessWidget {
  const ShowDateWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding:
            EdgeInsets.symmetric(vertical: getSize(5), horizontal: getSize(10)),
        margin: EdgeInsets.symmetric(vertical: getSize(10)),
        decoration: BoxDecoration(
          color: AppColors.primaryOrange,
          borderRadius: BorderRadius.circular(
            getSize(8),
          ),
        ),
        child: BaseText(
          text: ChatMethods().isToday(DateTime.fromMillisecondsSinceEpoch(
                  DateTime.now().millisecondsSinceEpoch * 1000))
              ? 'Today'
              : ChatMethods().formatAsYesterday(
                  DateTime.fromMillisecondsSinceEpoch(
                      DateTime.now().millisecondsSinceEpoch)),
          fontSize: 12,
          textColor: AppColors.white,
        ),
      ),
    );
  }
}
