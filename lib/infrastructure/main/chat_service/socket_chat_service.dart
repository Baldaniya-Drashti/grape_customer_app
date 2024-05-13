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
  final StreamController<dynamic> _statusOnlineController =
      StreamController<dynamic>();
  final StreamController<dynamic> _getOnlineStatusController =
      StreamController<dynamic>();
  final StreamController<bool> _socketConnectController =
      StreamController<bool>();
  final StreamController<String> _roomConnectedController =
      StreamController<String>();
  final StreamController<Chats> _newMessageController =
      StreamController<Chats>();
  final StreamController<dynamic> _displayTypingController =
      StreamController<dynamic>();
  final StreamController<String> _removeTypingController =
      StreamController<String>();

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
      _statusOnlineController.add(data);
      _getOnlineStatusController.add(data);
    });

    // Listen for roomConnected event
    socket.on('roomConnected', (data) {
      //log('roomConnected : $data');
      var list = data as List<dynamic>;
      _roomConnectedController.add(list.first.toString());
    });

    // Listen for newMessage event
    socket.on('newMessage', (data) {
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
        Map<String, dynamic> receivedMessageData = {
          'roomId': data['roomId'],
          'sender_id': data['receiver_id'],
          'receiver_id': data['sender_id'],
          'chatId': data['chatId']
        };
        // log('receivedMessageData : $receivedMessageData');
        socket.emit('ReadMessage', receivedMessageData);
      }
    });

    // Listen for DisplayTyping event
    socket.on('DisplayTyping', (data) {
      log('DisplayTyping : $data');

      _displayTypingController.add(data);
    });

    // Listen for removeTypingMessage event
    socket.on('removeTypingMessage', (data) {
      log('removeTypingMessage : $data');

      _removeTypingController.add(data.toString());
    });

    // Listen for removeTyping event from reciever
    socket.on('removeTyping', (data) {
      log('removeTyping : $data');

      _removeTypingController.add(data.toString());
    });
  }

  void connectToSocket() {
    socket.connect();
  }

  // Getters for event streams
  Stream<dynamic> get statusOnlineStream => _statusOnlineController.stream;
  Stream<dynamic> get getOpponenetStatusOnlineStream =>
      _statusOnlineController.stream;

  Stream<bool> get socketConnectStream => _socketConnectController.stream;

  Stream<String> get roomConnectedStream => _roomConnectedController.stream;
  Stream<Chats> get newMessageStream => _newMessageController.stream;
  Stream<dynamic> get displayTypingStream => _displayTypingController.stream;
  Stream<String> get removeTypingStream => _removeTypingController.stream;
  Stream<dynamic> get getOnlineStatusStream =>
      _getOnlineStatusController.stream;

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
  void getOpponentOnlineStatus(String sender, String receiver, String roomId) {
    // Emit getOnlineStatus event
    socket.emit('getOnlineStatus',
        {'sender_id': sender, 'receiver_id': receiver, 'roomId': roomId});
  }

  @override
  void removeListners() {
    socket.clearListeners();
    socket.disconnect();
  }
}
