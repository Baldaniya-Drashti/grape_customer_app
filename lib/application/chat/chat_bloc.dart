import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:grape_customer_app/domain/main/chat/message_dto.dart';
import 'package:grape_customer_app/domain/main/i_main_facade.dart';
import 'package:grape_customer_app/infrastructure/main/chat_dto/chat_detail_dto.dart';
import 'package:grape_customer_app/infrastructure/main/chat_service/socket_chat_service.dart';
import 'package:grape_customer_app/presentation/common/utils/get_current_user.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'chat_event.dart';
part 'chat_state.dart';
part 'chat_bloc.freezed.dart';

@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final SocketChatService chatService;
  int page = 1;
  final IMainFacade mainFacade;
  int lastPage = 1;
  var textEditingController = TextEditingController();
  Timer? searchOnStoppedTyping;

  ChatBloc(this.chatService, this.mainFacade) : super(ChatState.initial()) {
    //  textEditingController.addListener(onTextChanged);
    on<ChatEvent>(
      (event, emit) async {
        await event.map(
          connectToSocket: (value) async {
            chatService.connectToSocket();

            await emit.forEach(
              chatService.socketConnectStream,
              onData: (data) {
                add(ChatEvent.createRoom(value.sender, value.receiver));
                add(ChatEvent.updateStatusToOnline(
                    value.sender, value.receiver));

                return state.copyWith(isConnectedToSocket: true);
                //return ChatState.connectedToSocket();
              },
            );
          },
          updateStatusToOnline: (value) async {
            chatService.updateStatusToOnline(value.sender, value.receiver);
            await emit.forEach(
              chatService.statusOnlineStream,
              onData: (data) {
                return state.copyWith(
                  isStatusOnlineReceived: data['is_online'],
                  onlineUserID: data['sender_id'].toString(),
                );

                //  return ChatState.statusOnlineReceived(data);
              },
            );
          },
          createRoom: (value) async {
            final sender = value.sender;
            final receiver = value.receiver;

            chatService.createRoom(sender, receiver);
            await emit.forEach(
              chatService.roomConnectedStream,
              onData: (data) {
                add(ChatEvent.getChatDetailList(true, value.receiver));
                add(ChatEvent.getOpponentOnlineStatus(
                    value.sender, value.receiver));

                add(ChatEvent.recieveMessage());
                add(ChatEvent.typing(sender, receiver));
                add(ChatEvent.removeTyping(sender, receiver));
                add(ChatEvent.removeTypingReciever());

                return state.copyWith(
                  roomId: data,
                );
              },
            );
          },
          sendMessage: (value) async {
            final message = value.message;
            chatService.sendMessage(message).then(
                  (value) {},
                );
            //add(ChatEvent.removeTyping('4', '2'));
            var updatedList = List<Chats>.from(state.chatList);
            updatedList.insert(
              0,
              Chats(
                id: message.id,
                message: message.content,
                message_type: message.type,
                reciever_id: int.tryParse(message.receiver),
                sender_id: int.tryParse(message.sender),
                time: DateTime.now().millisecondsSinceEpoch,
              ),
            );
            return emit(
              state.copyWith(
                chatList: updatedList,
                textFieldValue: '',
              ),
            );
          },
          typing: (value) async {
            final sender = value.sender;
            final receiver = value.receiver;
            chatService.sendTypingEvent(sender, receiver);
            await emit.forEach(
              chatService.displayTypingStream,
              onData: (data) {
                return state.copyWith(
                  //  displayTypingData: data['receiver_id'],
                  isRecieverTyping: (data['receiver_id'] ==
                              getCurrentUser().userId.toString() &&
                          data['roomId'] == state.roomId)
                      ? true
                      : false,
                );
              },
            );
          },
          removeTyping: (value) async {
            final sender = value.sender;
            final receiver = value.receiver;
            chatService.sendRemoveTypingEvent(sender, receiver);
          },
          getOpponentOnlineStatus: (value) async {
            final sender = value.sender;
            final receiver = value.receiver;
            chatService.getOpponentOnlineStatus(sender, receiver, state.roomId);
            await emit.forEach(
              chatService.getOnlineStatusStream,
              onData: (data) {
                return state.copyWith(
                  isStatusOnlineReceived: data['is_online'],
                  onlineUserID: data['sender_id'].toString(),
                );

                //  return ChatState.statusOnlineReceived(data);
              },
            );
          },
          getSenderAndRecieverID: (GetSenderAndRecieverID value) async {
            add(ChatEvent.connectToSocket(value.sender, value.receiver));
            emit(state.copyWith(recieverId: value.receiver));
          },
          recieveMessage: (RecieveMessage value) async {
            await emit.forEach(
              chatService.newMessageStream,
              onData: (data) {
                var updatedList = List<Chats>.from(state.chatList);
                updatedList.insert(0, data);
                return state.copyWith(chatList: updatedList);
              },
            );
          },
          removeListners: (RemoveListners value) async {
            chatService.removeListners();
          },
          getChatDetailList: (GetChatDetailList value) async {
            if (value.isRefresh) {
              page = 1;
              emit(
                state.copyWith(
                  chatList: [],
                ),
              );
              state.refreshController.resetNoData();
            } else {
              if (page > lastPage) {
                state.refreshController.loadNoData();
                return;
              }
            }
            emit(state.copyWith(isLoading: value.isRefresh));
            var res = await mainFacade.getChatDetailListAPI(
              page: page,
              recieverId: value.receiverId,
            );

            page++;

            res.fold(
              (l) => emit(
                state.copyWith(isApiFailed: true, isLoading: false),
              ),
              (r) {
                emit(state.copyWith(isApiFailed: false, isLoading: false));
                var chatDetail = ChatDetailDTO.fromJson(r.data);
                var chatList = chatDetail.chats ?? [];
                if (chatList.isNotEmpty) {
                  Map<String, dynamic> receivedMessageData = {
                    'roomId': state.roomId,
                    'sender_id': getCurrentUser().userId.toString(),
                    'receiver_id': state.recieverId,
                    'chatId': chatList.first.id.toString(),
                  };
                  //log('receivedMessageDataFromBloc : $receivedMessageData');
                  SocketChatService()
                      .socket
                      .emit('ReadMessage', receivedMessageData);
                }

                lastPage = r.meta?.lastPage ?? 1;
                return emit(
                  state.copyWith(
                    chatList: List.from(state.chatList)..addAll(chatList),
                    apiSuccessData: ChatDetailDTO(
                      chats: chatList,
                      first_name: chatDetail.first_name ?? "",
                      last_name: chatDetail.last_name ?? "",
                      profile: chatDetail.profile ?? "",
                      receiver_id: chatDetail.receiver_id ?? -1,
                    ),
                  ),
                );
              },
            );
          },
          sendMessageTextChange: (SendMessageTextChange value) async {
            if (value.value.isNotEmpty) {
              add(ChatEvent.userTyping(
                  getCurrentUser().userId.toString(), state.recieverId));
              const duration = Duration(seconds: 2);
              if (searchOnStoppedTyping != null) {
                searchOnStoppedTyping?.cancel();
              }
              searchOnStoppedTyping = Timer(
                duration,
                () async {
                  if (value.value.trim().isNotEmpty) {
                    add(ChatEvent.removeTyping(
                        getCurrentUser().userId.toString(), state.recieverId));
                    //  fetchQuestions();
                  }
                },
              );
            } else {
              emit(state.copyWith(isUserTyping: false));
            }

            return emit(state.copyWith(textFieldValue: value.value));
          },
          removeTypingReciever: (RemoveTypingReciever value) async {
            await emit.forEach(
              chatService.getRecieverTypingStatus,
              onData: (data) {
                return state.copyWith(
                  isRecieverTyping: (data['receiver_id'] ==
                              getCurrentUser().userId.toString() &&
                          data['roomId'] == state.roomId)
                      ? false
                      : true,
                );
              },
            );
          },
          userTyping: (UserTyping value) async {
            final sender = value.sender;
            final receiver = value.receiver;
            chatService.sendTypingEvent(sender, receiver);
          },
        );
      },
    );
  }
}
