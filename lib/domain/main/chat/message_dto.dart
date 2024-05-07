import 'package:freezed_annotation/freezed_annotation.dart';
part 'message_dto.freezed.dart';

@freezed
class Message with _$Message {
  factory Message({
    int? id,
    required String content,
    required String sender,
    required String receiver,
    required String roomId,
    int? chatId,
    required int type, // 0: Normal Message, 1: Image
  }) = _Message;
}
