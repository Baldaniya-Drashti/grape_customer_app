part of 'chat_bloc.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    required bool isConnectedToSocket,
    required bool isStatusOnlineReceived,
    required bool isRoomConnectedReceived,
    required String textFieldValue,
    required bool isNewMessageReceived,
    required String displayTypingData,
    required String removeTypingData,
    required bool isLoading,
    required bool isApiFailed,
    required ChatDetailDTO apiSuccessData,
    required List<Chats> chatList,
    required bool isRemoveLoading,
    required String getOnlineStatusData,
    required RefreshController refreshController,
    required String roomId,
    // Add more properties as needed
  }) = _ChatState;

  factory ChatState.initial() => ChatState(
        isConnectedToSocket: false,
        isStatusOnlineReceived: false,
        isRoomConnectedReceived: false,
        textFieldValue: '',
        isNewMessageReceived: false,

        displayTypingData: '',
        removeTypingData: '',
        isLoading: false,
        isApiFailed: false,
        apiSuccessData:
            ChatDetailDTO(), // Initialize with appropriate default values
        isRemoveLoading: false,
        getOnlineStatusData: '', refreshController: RefreshController(),
        roomId: '', chatList: [],
        // Initialize other properties
      );
}


// @freezed
// class ChatState with _$ChatState {
//    const factory ChatState({
//     required bool isInitial,
//     required bool isConnectedToSocket,
//     required bool isStatusOnlineReceived,
//     required bool isRoomConnectedReceived,
//     required String textFieldValue,
//     required bool isNewMessageReceived,
//     // Add more properties as needed
//   }) = _ChatState;
//   const factory ChatState.initial() = Initial;
//   // const factory ChatState.connectedToSocket() = ConnectedToSocket;
//   // const factory ChatState.statusOnlineReceived(bool isOnline) =
//   //     StatusOnlineReceived;
//   // const factory ChatState.roomConnectedReceived(String data) =
//   //     RoomConnectedReceived;
//   // const factory ChatState.textFieldValue(String value) = TextFieldValue;
//   // const factory ChatState.newMessageReceived(Chats chats) = NewMessageReceived;
//   // // const factory ChatState.sendMessage(Chats chats) = MessageSend;

//   // const factory ChatState.displayTypingReceived(String data) =
//   //     DisplayTypingReceived;
//   // const factory ChatState.removeTypingReceived(String data) =
//   //     RemoveTypingReceived;
//   // const factory ChatState.loadingState() = LoadingState;
//   // const factory ChatState.apiFailed() = ApiFailed;
//   // const factory ChatState.apiSuccess(ChatDetailDTO chatDetailDTO) = ApiSuccess;

//   // const factory ChatState.removeLoading() = RemoveLoading;
//   // const factory ChatState.getOnlineStatusReceived(String data) =
//   //     GetOnlineStatusReceived;
// }
