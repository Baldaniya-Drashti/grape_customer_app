// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_detail_dto.freezed.dart';
part 'chat_detail_dto.g.dart';

@freezed
class ChatDetailDTO with _$ChatDetailDTO {
  factory ChatDetailDTO({
    int? receiver_id,
    String? profile,
    String? first_name,
    String? last_name,
    List<Chats>? chats,
  }) = _ChatDetailDTO;

  factory ChatDetailDTO.fromJson(Map<String, dynamic> json) =>
      _$ChatDetailDTOFromJson(json);
}

@freezed
class Chats with _$Chats {
  factory Chats({
    int? id,
    int? sender_id,
    int? reciever_id,
    int? message_type,
    String? message,
    int? time,
  }) = _Chats;

  factory Chats.fromJson(Map<String, dynamic> json) => _$ChatsFromJson(json);
}
