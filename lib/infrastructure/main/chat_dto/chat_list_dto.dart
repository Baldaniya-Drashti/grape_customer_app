// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_list_dto.freezed.dart';
part 'chat_list_dto.g.dart';

@freezed
class ChatListDTO with _$ChatListDTO {
  const factory ChatListDTO({
    int? receiver_id,
    String? first_name,
    String? last_name,
    String? profile,
    int? unseen_messages_count,
    int? message_type,
    String? message,
    int? time,
  }) = _ChatListDTO;

  factory ChatListDTO.fromJson(Map<String, dynamic> json) =>
      _$ChatListDTOFromJson(json);
}
