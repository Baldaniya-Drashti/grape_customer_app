import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/chat/chat_bloc.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/common/utils/app_focus.dart';
import 'package:grape_customer_app/presentation/common/widgets/paginated_list_view.dart';
import 'package:grape_customer_app/presentation/main/chat/widget/chat_bubble_view.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppFocus.unfocus(context);
      },
      child: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          return PaginatedListView(
            reverse: true,
            onRefresh: () {
              context.read<ChatBloc>().add(
                    GetChatDetailList(
                      true,
                      state.apiSuccessData.receiver_id.toString(),
                    ),
                  );
              // controller.getChatDetailsAPI(isRefresh: true);
            },
            onLoading: () {
              context.read<ChatBloc>().add(
                    GetChatDetailList(
                      false,
                      state.apiSuccessData.receiver_id.toString(),
                    ),
                  );
              //  controller.getChatDetailsAPI();
            },
            refreshController: state.refreshController,
            child: ListView.builder(
              shrinkWrap: true,
              reverse: true,
              padding: EdgeInsets.only(
                left: getSize(18),
                right: getSize(18),
                bottom: getSize(80),
                top: getSize(30),
              ),
              itemCount: state.chatList.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => ChatBubbleView(index: index),
            ),
          );
        },
      ),
    );
  }
}
