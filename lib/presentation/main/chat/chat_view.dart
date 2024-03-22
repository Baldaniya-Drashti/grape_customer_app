import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/png_image_constants.dart';
import 'package:grape_customer_app/presentation/common/utils/app_focus.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/common/widgets/paginated_list_view.dart';
import 'package:grape_customer_app/presentation/core/styles/styles.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_text_field.dart';
import 'package:grape_customer_app/presentation/core/widgets/layout/layout.dart';
import 'package:grape_customer_app/presentation/main/chat/widget/chat_bubble_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage(name: 'ChatView')
class ChatView extends StatelessWidget {
  final bool fromLiveChatSupport;
  const ChatView({super.key, this.fromLiveChatSupport = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: getSize(18),
            vertical: getSize(isFullScreenDevice(context) ? 0 : 12),
          ),
          color: AppColors.white,
          child: CustomTextField(
            hintText: 'Type a message',
            maxLines: 5,
            minLines: 1,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.send,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.send_rounded,
                color: AppColors.primaryOrange,
              ),
            ),
          ),
        ),
      ),
      appBar: fromLiveChatSupport ? getLiveChatAppBar() : getUserAppBar(),
      body: GestureDetector(
        onTap: () {
          AppFocus.unfocus(context);
        },
        child: PaginatedListView(
          reverse: true,
          onRefresh: () {
            // controller.getChatDetailsAPI(isRefresh: true);
          },
          onLoading: () {
            //  controller.getChatDetailsAPI();
          },
          refreshController: RefreshController(),
          child: ListView.builder(
            shrinkWrap: true,
            reverse: true,
            padding: EdgeInsets.only(
              left: getSize(18),
              right: getSize(18),
              bottom: getSize(80),
              top: getSize(30),
            ),
            itemCount: 10,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => ChatBubbleView(index: index),
          ),
        ),
      ),
    );
  }

  getLiveChatAppBar() {
    return CustomAppBar(
      title: '',
      leadingWidth: null,
      customTitle: Row(
        children: [
          Image.asset(
            PngImageConstants.cartSelected,
            height: getSize(25),
            width: getSize(30),
          ),
          SizedBox(
            width: getSize(10),
          ),
          Expanded(
            child: BaseText(
              text: 'Live Chat Support',
              maxLines: 1,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  getUserAppBar() {
    return CustomAppBar(
      title: '',
      leadingWidth: null,
      customTitle: Row(
        children: [
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
                'https://www.tpci.in/indiabusinesstrade/wp-content/uploads/2023/09/Untitled-design-6-3.png'),
            radius: getSize(20),
          ),
          SizedBox(
            width: getSize(10),
          ),
          Expanded(
            child: BaseText(
              text: 'Sansa Indira',
              maxLines: 1,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
