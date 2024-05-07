// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_list_dto.freezed.dart';
part 'notification_list_dto.g.dart';

@freezed
class NotificationListDTO with _$NotificationListDTO {
  const factory NotificationListDTO({
    int? id,
    String? title,
    String? message,
    int? is_read,
    String? image,
    int? created_at,
    String? data_id,
  }) = _NotificationListDTO;

  factory NotificationListDTO.fromJson(Map<String, dynamic> json) =>
      _$NotificationListDTOFromJson(json);
}
