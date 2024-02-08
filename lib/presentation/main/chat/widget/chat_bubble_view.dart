import 'package:flutter/material.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/styles.dart';
import 'package:grape_customer_app/presentation/main/chat/widget/chat_methods.dart';
import 'package:grape_customer_app/presentation/main/chat/widget/show_date_widget.dart';
import 'package:intl/intl.dart';
import 'package:sticky_headers/sticky_headers.dart';

class ChatBubbleView extends StatelessWidget {
  final int index;
  const ChatBubbleView({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return StickyHeader(
      header: (index != 9
              ? !(ChatMethods().isSameDay(
                  DateTime.fromMillisecondsSinceEpoch(
                      DateTime.now().millisecondsSinceEpoch),
                  DateTime.fromMillisecondsSinceEpoch(
                      DateTime.now().millisecondsSinceEpoch),
                ))
              : true)
          ? ShowDateWidget(index: index)
          : Container(),
      content: Column(
        children: [
          Row(
            mainAxisAlignment:
                index.isEven ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              index.isEven
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [],
                    )
                  : Container(),
              Padding(
                padding: EdgeInsets.only(bottom: getSize(15)),
                child: SizedBox(
                  width: getSize(300),
                  child: Column(
                    crossAxisAlignment: index.isEven
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Row(
                        //crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Visibility(
                            visible: index.isEven,
                            child: Row(
                              children: [
                                getTimeView(),
                                SizedBox(
                                  width: getSize(6),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(getSize(12)),
                                  topRight: Radius.circular(getSize(12)),
                                  bottomLeft: index.isEven
                                      ? Radius.circular(getSize(12))
                                      : Radius.circular(0),
                                  bottomRight: index.isEven
                                      ? Radius.circular(0)
                                      : Radius.circular(getSize(12)),
                                ),
                                color: index.isEven
                                    ? Color(0xFFFFEEE1)
                                    : Color(0xFFF5F5F5),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: getSize(10),
                                horizontal: getSize(15),
                              ),
                              child: BaseText(
                                text:
                                    'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia',
                                fontSize: 12,
                                showFullDescription: true,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w400,
                                textColor: index.isEven
                                    ? AppColors.black
                                    : AppColors.black.withOpacity(0.8),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: index.isOdd,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: getSize(6),
                                ),
                                getTimeView(),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  getTimeView() {
    return BaseText(
      text: DateFormat('hh:mm a').format(
        DateTime.fromMillisecondsSinceEpoch(
            DateTime.now().millisecondsSinceEpoch),
      ),
      fontSize: 10,
      textColor: AppColors.black.withOpacity(0.6),
    );
  }
}
