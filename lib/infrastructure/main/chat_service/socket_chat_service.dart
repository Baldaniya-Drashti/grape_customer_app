import 'dart:async';
import 'dart:developer';
import 'package:grape_customer_app/infrastructure/main/chat_dto/chat_detail_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:grape_customer_app/domain/main/chat/i_chat_service.dart';
import 'package:grape_customer_app/domain/main/chat/message_dto.dart';

@injectable
class SocketChatService implements ChatService {
  late io.Socket socket;

  // Streams for events
  final StreamController<bool> _statusOnlineController =
      StreamController<bool>();
  final StreamController<bool> _socketConnectController =
      StreamController<bool>();
  final StreamController<String> _roomConnectedController =
      StreamController<String>();
  final StreamController<Chats> _newMessageController =
      StreamController<Chats>();
  final StreamController<String> _displayTypingController =
      StreamController<String>();
  final StreamController<String> _removeTypingController =
      StreamController<String>();
  final StreamController<bool> _getOnlineStatusController =
      StreamController<bool>();

  SocketChatService() {
    socket = io.io('https://www.grape.market:3001',
        io.OptionBuilder().setTransports(['websocket']).build());
    //connectToSocket(); // Connect to socket when the service is instantiated

    // Listen for socket connection event
    socket.onConnect((_) {
      log('Socket Connected');
      _socketConnectController.add(true);
    });
    socket.onConnecting((data) => log('Socket Connecting'));
    socket.onDisconnect((data) => log('Socket Disconnected'));
    // Listen for statusOnline event
    socket.on('statusOnline', (data) {
      log('statusOnline : $data');
      _statusOnlineController.add(data['is_online'] == 1 ? true : false);
    });

    // Listen for roomConnected event
    socket.on('roomConnected', (data) {
      log('roomConnected : $data');
      var list = data as List<dynamic>;
      _roomConnectedController.add(list.first.toString());
    });

    // Listen for newMessage event
    socket.on('newMessage', (data) {
      log('newMessage : $data');
      if (data != null) {
        var messageObject = Chats(
          id: data['chatId'],
          message: data['message'],
          message_type: data['type'],
          reciever_id: int.tryParse(data['receiver_id']),
          sender_id: int.tryParse(data['sender_id']),
          time: DateTime.now().millisecondsSinceEpoch,
        );
        _newMessageController.add(messageObject);
      }
      Map<String, dynamic> receivedMessageData = {
        'roomId': data['roomId'],
        'senderId': data['senderId'],
        'receiverId': data['receiverId'],
        'chatId': data['chatId']
      };
      socket.emit('ReadMessage', receivedMessageData);
    });

    // Listen for DisplayTyping event
    socket.on('DisplayTyping', (data) {
      log('DisplayTyping : $data');

      _displayTypingController.add(data.toString());
    });

    // Listen for removeTypingMessage event
    socket.on('removeTypingMessage', (data) {
      log('removeTypingMessage : $data');

      _removeTypingController.add(data.toString());
    });

    // Listen for getOnlineStatus event
    socket.on('statusOnline', (data) {
      log('statusOnline : $data');

      _getOnlineStatusController.add(data['is_online']);
    });
  }

  void connectToSocket() {
    socket.connect();
  }

  // Getters for event streams
  Stream<bool> get statusOnlineStream => _statusOnlineController.stream;
  Stream<bool> get socketConnectStream => _socketConnectController.stream;

  Stream<String> get roomConnectedStream => _roomConnectedController.stream;
  Stream<Chats> get newMessageStream => _newMessageController.stream;
  Stream<String> get displayTypingStream => _displayTypingController.stream;
  Stream<String> get removeTypingStream => _removeTypingController.stream;
  Stream<bool> get getOnlineStatusStream => _getOnlineStatusController.stream;

  @override
  Stream<List<Chats>> getMessages() {
    // Implement logic to listen for messages from socket
    throw UnimplementedError();
  }

  @override
  Future<void> sendMessage(Message message) async {
    final Map<String, dynamic> requestData = {
      'message': message.content,
      'type': message.type,
      'sender_id': message.sender,
      'receiver_id': message.receiver,
      'roomId': message.roomId
    };
    //log('requestData : $requestData');
    // Emit sendMessage event
    socket.emit('sendMessage', requestData);
  }

  @override
  void updateStatusToOnline(String sender, String reciever) {
    // Emit UpdateStatusToOnline event
    socket.emit(
        'UpdateStatusToOnline', {'sender_id': sender, 'receiver_id': reciever});
  }

  @override
  void createRoom(String sender, String receiver) {
    // Emit createRoom event
    socket.emit('createRoom', {'sender_id': sender, 'receiver_id': receiver});
  }

  @override
  void sendTypingEvent(String sender, String receiver) {
    // Emit typing event
    socket.emit('typing', {'sender_id': sender, 'receiver_id': receiver});
  }

  @override
  void sendRemoveTypingEvent(String sender, String receiver) {
    // Emit removeTyping event
    socket.emit('removeTyping', {'sender_id': sender, 'receiver_id': receiver});
  }

  @override
  void getOpponentOnlineStatus(String sender, String receiver) {
    // Emit getOnlineStatus event
    socket.emit(
        'getOnlineStatus', {'sender_id': sender, 'receiver_id': receiver});
  }

  @override
  void removeListners() {
    socket.clearListeners();
    socket.disconnect();
  }
}
