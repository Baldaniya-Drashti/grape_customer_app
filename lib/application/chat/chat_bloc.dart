import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:grape_customer_app/domain/main/chat/message_dto.dart';
import 'package:grape_customer_app/domain/main/i_main_facade.dart';
import 'package:grape_customer_app/infrastructure/main/chat_dto/chat_detail_dto.dart';
import 'package:grape_customer_app/infrastructure/main/chat_service/socket_chat_service.dart';
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

  ChatBloc(this.chatService, this.mainFacade) : super(ChatState.initial()) {
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
                add(ChatEvent.typing(value.sender, value.receiver));
                add(ChatEvent.removeTyping(value.sender, value.receiver));
                add(ChatEvent.recieveMessage());
                add(ChatEvent.getChatDetailList(true, value.receiver));
                return state.copyWith(isConnectedToSocket: true);
                //return ChatState.connectedToSocket();
              },
            );
          },
          updateStatusToOnline: (value) async {
            chatService.updateStatusToOnline(value.sender, value.receiver);
            await emit.forEach(
              chatService.getOnlineStatusStream,
              onData: (data) {
                return state.copyWith(isStatusOnlineReceived: data);

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
                return state.copyWith(displayTypingData: data);
              },
            );
          },
          removeTyping: (value) async {
            final sender = value.sender;
            final receiver = value.receiver;
            chatService.sendRemoveTypingEvent(sender, receiver);
            await emit.forEach(
              chatService.removeTypingStream,
              onData: (data) {
                return state.copyWith(removeTypingData: data);
              },
            );
          },
          getOpponentOnlineStatus: (value) async {
            final sender = value.sender;
            final receiver = value.receiver;
            chatService.getOpponentOnlineStatus(sender, receiver);
            await emit.forEach(
              chatService.getOnlineStatusStream,
              onData: (data) {
                return state.copyWith(isStatusOnlineReceived: data);
              },
            );
          },
          getSenderAndRecieverID: (GetSenderAndRecieverID value) async {
            add(ChatEvent.connectToSocket(value.sender, value.receiver));
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

              state.refreshController.resetNoData();
            } else {
              if (page > lastPage) {
                state.refreshController.loadNoData();
                return;
              }
            }
            emit(state.copyWith(isLoading: value.isRefresh));
            var res = await mainFacade.getChatListAPI(
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
            return emit(state.copyWith(textFieldValue: value.value));
          },
        );
      },
    );
  }
}
