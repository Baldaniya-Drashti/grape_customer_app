part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.connectToSocket(String sender, String receiver) =
      ConnectToSocket;
  const factory ChatEvent.removeListners() = RemoveListners;
  const factory ChatEvent.getSenderAndRecieverID(
      String sender, String receiver) = GetSenderAndRecieverID;

  const factory ChatEvent.updateStatusToOnline(String sender, String receiver) =
      UpdateStatusToOnline;
  const factory ChatEvent.createRoom(String sender, String receiver) =
      CreateRoom;
  const factory ChatEvent.sendMessage(Message message) = SendMessage;
  const factory ChatEvent.sendMessageTextChange(String value) =
      SendMessageTextChange;

  const factory ChatEvent.recieveMessage() = RecieveMessage;

  const factory ChatEvent.typing(String sender, String receiver) = Typing;
  const factory ChatEvent.userTyping(String sender, String receiver) = UserTyping;

  const factory ChatEvent.removeTyping(String sender, String receiver) =
      RemoveTyping;
  const factory ChatEvent.removeTypingReciever() = RemoveTypingReciever;
  const factory ChatEvent.getOpponentOnlineStatus(
      String sender, String receiver) = GetOpponentOnlineStatus;

  factory ChatEvent.getChatDetailList(bool isRefresh, String receiverId) =
      GetChatDetailList;
}
