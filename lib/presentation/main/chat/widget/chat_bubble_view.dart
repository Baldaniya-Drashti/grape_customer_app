import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/chat/chat_bloc.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/common/utils/get_current_user.dart';
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
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        var chatList = state.chatList;

        var isSender = getCurrentUser().userId == chatList[index].sender_id;
        return StickyHeader(
          header: (index != (chatList.length - 1)
                  ? !(ChatMethods().isSameDay(
                      DateTime.fromMillisecondsSinceEpoch(
                          chatList[index].time ?? 0),
                      DateTime.fromMillisecondsSinceEpoch(
                          chatList[index + 1].time ?? 0),
                    ))
                  : true)
              ? ShowDateWidget(
                  index: index,
                  time: chatList[index].time ?? 0,
                )
              : Container(),
          content: Column(
            children: [
              Row(
                mainAxisAlignment:
                    isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  isSender
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
                        crossAxisAlignment: isSender
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          Row(
                            //crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Visibility(
                                visible: isSender,
                                child: Row(
                                  children: [
                                    getTimeView(chatList[index].time ?? 0),
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
                                      bottomLeft: isSender
                                          ? Radius.circular(getSize(12))
                                          : Radius.circular(0),
                                      bottomRight: isSender
                                          ? Radius.circular(0)
                                          : Radius.circular(getSize(12)),
                                    ),
                                    color: isSender
                                        ? Color(0xFFFFEEE1)
                                        : Color(0xFFF5F5F5),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: getSize(10),
                                    horizontal: getSize(15),
                                  ),
                                  child: BaseText(
                                    text: chatList[index].message ?? "",
                                    fontSize: 12,
                                    showFullDescription: true,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w400,
                                    textColor: isSender
                                        ? AppColors.black
                                        : AppColors.black.withOpacity(0.8),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: !isSender,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: getSize(6),
                                    ),
                                    getTimeView(chatList[index].time ?? 0),
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
      },
    );
  }

  getTimeView(int time) {
    return BaseText(
      text: DateFormat('hh:mm a').format(
        DateTime.fromMillisecondsSinceEpoch(time),
      ),
      fontSize: 10,
      textColor: AppColors.black.withOpacity(0.6),
    );
  }
}
