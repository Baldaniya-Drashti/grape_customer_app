// import 'package:socket_io_client/socket_io_client.dart';

// class SocketService {
//   static final Socket socket = io(SocketConstants.socketUrl,
//       OptionBuilder().setTransports(['websocket']).build());
//   static String? roomId;
//   static var name = "".obs;
//   static var finalName = "".obs;
//   static var messageList = <GetChatDetailsResponse>[].obs;
//   static var senderId = ''.obs;
//   static var recieverId = ''.obs;
//   static var messageType = 0.obs;
//   static String? recId;
//   static var isOnline = 0.obs;
//   static var isTyping = false.obs;
//   static RxString imagePath = ''.obs;

//   static connectSocket() {
//     if (!socket.connected) {
//       socket.connect();
//       socket.onConnect((data) => updateUserStatus());
//     } else {
//       updateUserStatus();
//     }

//     socket.onConnectError((data) => print("Connect Error: $data"));
//     socket.onDisconnect((data) => print("Socket Disconnected"));

//     getOtherUserOnlineStatus();
//     createRoom();
//     roomConnectedResponse();
//     receivedMessage();
//     senderTyping();
//     displayTyping();
//     removeTypingMessage();
//   }

//   static clearListeners() {
//     socket.clearListeners();
//   }

//   static updateUserStatus() {
//     Get.printInfo(info: 'Socket Connected');
//     var req = {
//       'senderId': senderId.value,
//       'receiverId': recieverId.value,
//     };
//     socket.emit(
//       SocketConstants.updateStatusToOnline,
//       req,
//     );
//   }

//   static socketDisconnect() {
//     socket.disconnect();

//     socket.dispose();
//     //socket.destroy();
//   }

//   static setReceiverId(String id) {
//     recieverId.value = id;
//     Get.printInfo(info: 'Set Reciever Id =====> ${recieverId.value}');
//   }

//   static setSenderId(String id) {
//     senderId.value = id;
//     Get.printInfo(info: 'Set Sender Id =====> ${senderId.value}');
//   }

//   static createRoom() {
//     try {
//       socket.emit(SocketConstants.createRoom, {
//         'senderId': senderId.value,
//         'receiverId': recieverId.value,
//       });
//     } catch (e) {
//       print("socketChat Exception=======$e");
//     }
//   }

//   static sendMessage(int type, String message) {
//     try {
//       socket.emit(SocketConstants.sendMessage, {
//         'message': message,
//         'type': type,
//         'senderId': senderId.value,
//         'receiverId': recieverId.value,
//         'roomId': roomId
//       });
//       // messageList
//       //     .insert(0, {'msg': message, 'isSender': true, 'isImage': hasImage});
//       messageList.insert(
//         0,
//         GetChatDetailsResponse(
//           message: message,
//           userId: DependencyInjection.userResponse.value.sId,
//           createdAt: DateTime.now().millisecondsSinceEpoch ~/ 1000,
//         ),
//       );
//       isTyping.value = false;
//       removeTyping();
//       //  printInfo(info: 'messageList : ${messageList.map((element) => element)}');

//       messageType.value = type;
//       // printInfo(info: "messageList.length${messageList.length}");
//     } catch (e) {
//       //  printInfo(info: "send message exception=======$e");
//     }
//   }

//   static receivedMessage() {
//     try {
//       socket.on(SocketConstants.newMessageListener, (data) {
//         Get.printInfo(info: "${SocketConstants.newMessageListener} : $data");
//         Map<String, dynamic> receivedMessageData = {
//           'roomId': data['roomId'],
//           'senderId': data['senderId'],
//           'receiverId': data['receiverId'],
//           'chatId': data['chatId']
//         };
//         socket.emit(
//           SocketConstants.readMessage,
//           receivedMessageData,
//         );
//         String msg = data['message'];
//         messageList.insert(
//           0,
//           GetChatDetailsResponse(
//             message: CommonWidget.asterisksFormat(msg.trim()),
//             userId: recieverId.value,
//             createdAt: DateTime.now().millisecondsSinceEpoch ~/ 1000,
//           ),
//         );

//         //ssenderId.value = data['senderId'];
//         //printInfo(info: "senderId: $senderId");
//       });
//     } catch (e) {
//       //printInfo(info: "newMessage exception: $e");
//     }
//   }

//   static getOtherUserOnlineStatus() {
//     socket.on(SocketConstants.statusOnlineListener, (data) {
//       // isOnline.value = data['isOnline'];
//       print(data);
//     });
//   }

//   static roomConnectedResponse() {
//     try {
//       socket.on(SocketConstants.roomConnectedListener, (data) {
//         Get.printInfo(info: '${SocketConstants.createRoom} : $data');
//         if (data != null) {
//           roomId = data[0];

//           var chatList = data[1] as List;
//           // var chats = chatList.map((e) => GetChatDetailsResponse.fromJson(e));
//           roomId = data[0];
//           if (chatList.isNotEmpty) {
//             Get.printInfo(info: '${chatList.first['senderId']}');
//             Get.printInfo(info: '${chatList.first['receiverId']}');

//             Map<String, dynamic> receivedMessageData = {
//               'roomId': data[0],
//               'senderId': chatList.first['senderId'] ==
//                       DependencyInjection.userResponse.value.sId
//                   ? chatList.first['receiverId']
//                   : chatList.first['senderId'],
//               'receiverId': chatList.first['senderId'] ==
//                       DependencyInjection.userResponse.value.sId
//                   ? chatList.first['senderId']
//                   : chatList.first['receiverId'],
//               'chatId': chatList.first['_id'],
//             };
//             socket.emit(
//               SocketConstants.readMessage,
//               receivedMessageData,
//             );
//           }
//         }
//       });
//     } catch (e) {
//       //  printInfo(info: '$e');
//     }
//   }

//   static void senderTyping() {
//     try {
//       var mapData = {
//         'senderId': senderId.value,
//         'receiverId': recieverId.value,
//       };
//       socket.emit(SocketConstants.typing, mapData);
//     } catch (e) {
//       print(e);
//     }
//   }

//   static void displayTyping() {
//     try {
//       socket.on(SocketConstants.displayTyping, (data) {
//         print(
//             '${SocketConstants.displayTyping} ${data['receiverId'].runtimeType}');

//         if (data['receiverId'] == "1") {
//           isTyping.value = true;
//         } else {
//           isTyping.value = false;
//         }
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   static void removeTyping() {
//     try {
//       var mapData = {
//         'senderId': senderId.value,
//         'receiverId': recieverId.value,
//       };
//       socket.emit(SocketConstants.removeTyping, mapData);
//     } catch (e) {
//       print(e);
//     }
//   }

//   static void removeTypingMessage() {
//     try {
//       socket.on(
//         SocketConstants.removeTypingMessage,
//         (data) {
//           print('${SocketConstants.removeTypingMessage} $data');
//           isTyping.value = false;
//         },
//       );
//     } catch (e) {
//       print(e);
//     }
//   }
// }
