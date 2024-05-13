import 'package:grape_customer_app/domain/main/chat/message_dto.dart';
import 'package:grape_customer_app/infrastructure/main/chat_dto/chat_detail_dto.dart';

abstract class ChatService {
  Stream<List<Chats>> getMessages();

  Future<void> sendMessage(Message message);
  void updateStatusToOnline(String sender, String receiver);
  void removeListners();

  void createRoom(String sender, String receiver);
  void sendTypingEvent(String sender, String receiver);
  void sendRemoveTypingEvent(String sender, String receiver);
  void getOpponentOnlineStatus(String sender, String receiver, String roomId);
}
