import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grape_customer_app/application/chat/chat_bloc.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/png_image_constants.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/domain/main/chat/message_dto.dart';
import 'package:grape_customer_app/injection.dart';
import 'package:grape_customer_app/presentation/common/utils/app_focus.dart';
import 'package:grape_customer_app/presentation/common/utils/get_current_user.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/styles.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_text_field.dart';
import 'package:grape_customer_app/presentation/core/widgets/layout/layout.dart';
import 'package:grape_customer_app/presentation/core/widgets/utility/life_cycle_watcher.dart';
import 'package:grape_customer_app/presentation/main/chat/widget/chat_shimmer.dart';
import 'package:grape_customer_app/presentation/main/chat/widget/chat_widget.dart';

@RoutePage(name: 'ChatView')
class ChatView extends StatelessWidget {
  final bool fromLiveChatSupport;
  final String recieverID;
  const ChatView(
      {super.key, this.fromLiveChatSupport = false, required this.recieverID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ChatBloc>()
        ..add(
          ChatEvent.getSenderAndRecieverID(
            getCurrentUser().userId.toString(),
            recieverID,
          ),
        ),
      child: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          //   log('isUserTyping : ${state.isUserTyping}');
          return LifecycleWatcher(
            child: Scaffold(
              backgroundColor: AppColors.white,
              bottomSheet: SafeArea(
                // bottom: isFullScreenDevice(context),
                //    top: getSize(18),
                child: Container(
                  // margin: EdgeInsets.only(
                  //   bottom:
                  //       isFullScreenDevice(context) ? getSize(24) : getSize(0),
                  // ),
                  padding: EdgeInsets.only(
                    left: getSize(18),
                    bottom: getSize(20),
                    top: getSize(20),
                    right: getSize(18),
                  ),
                  color: AppColors.white,
                  child: CustomTextField(
                    hintText: 'Type a message',
                    maxLines: 5,
                    controller: context.read<ChatBloc>().textEditingController,
                    //key: Key(state.textFieldValue),
                    //initialValue: state.textFieldValue,
                    //  initialValue: state.textFieldValue,
                    minLines: 1,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    onChanged: (value) => context
                        .read<ChatBloc>()
                        .add(ChatEvent.sendMessageTextChange(value)),
                    suffixIcon: IconButton(
                      onPressed: () {
                        // log(textEditingController.text);
                        AppFocus.unfocus(context);
                        if (state.textFieldValue.trim().isNotEmpty) {
                          context
                              .read<ChatBloc>()
                              .textEditingController
                              .clear();
                          context.read<ChatBloc>().add(
                                ChatEvent.sendMessage(
                                  Message(
                                    content: state.textFieldValue.trim(),
                                    sender: getCurrentUser().userId.toString(),
                                    receiver: recieverID,
                                    roomId: state.roomId,
                                    type: 0,
                                  ),
                                ),
                              );
                        }
                      },
                      icon: Icon(
                        Icons.send_rounded,
                        color: AppColors.primaryOrange,
                      ),
                    ),
                  ),
                ),
              ),
              appBar:
                  fromLiveChatSupport ? getLiveChatAppBar() : getUserAppBar(),
              body: SafeArea(
                child: WillPopScope(
                  onWillPop: () {
                    context.read<ChatBloc>().add(ChatEvent.removeListners());
                    Navigator.pop(context, true);
                    return Future.value(true);
                  },
                  child: state.isLoading
                      ? Center(
                          child: ShimmerChatBubble(),
                        )
                      : state.isApiFailed
                          ? Center(
                              child: BaseText(
                                text:
                                    'Something went wrong. Please try again!!',
                              ),
                            )
                          : state.isConnectedToSocket
                              ? ChatWidget()
                              : SizedBox(),
                ),
              ),
            ),
          );
        },
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
      customTitle: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          return Row(
            children: [
              if (state.apiSuccessData.profile != null)
                Stack(
                  alignment: Alignment.topRight,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: getSize(34),
                      width: getSize(34),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.grey1,
                        borderRadius: BorderRadius.circular(getSize(10)),
                        image: state.apiSuccessData.profile != null &&
                                state.apiSuccessData.profile!.isNotEmpty
                            ? DecorationImage(
                                image: CachedNetworkImageProvider(
                                  state.apiSuccessData.profile ?? "",
                                ),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: state.apiSuccessData.profile == null ||
                              state.apiSuccessData.profile!.isEmpty
                          ? SvgPicture.asset(
                              SvgImageConstant.profileUnselected,
                            )
                          : null,
                    ),
                    Positioned(
                      top: getSize(-3),
                      right: getSize(-3),
                      child: Container(
                        height: getSize(10),
                        width: getSize(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: state.isStatusOnlineReceived == 1
                              ? AppColors.green
                              : AppColors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              SizedBox(
                width: getSize(10),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseText(
                      text:
                          '${state.apiSuccessData.first_name ?? ""} ${state.apiSuccessData.last_name ?? ""}',
                      maxLines: 1,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: getSize(state.isRecieverTyping ? 2 : 0),
                    ),
                    Visibility(
                      visible: state.isRecieverTyping,
                      child: BaseText(
                        text: 'typing...',
                        maxLines: 1,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
