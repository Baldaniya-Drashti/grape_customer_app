// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_list_dto.freezed.dart';
part 'notification_list_dto.g.dart';

@freezed
class NotificationListDTO with _$NotificationListDTO {
  const factory NotificationListDTO({
    List<Notifications>? notifications,
    int? total_unread_notification,
  }) = _NotificationListDTO;

  factory NotificationListDTO.fromJson(Map<String, dynamic> json) =>
      _$NotificationListDTOFromJson(json);
}

@freezed
class Notifications with _$Notifications {
  const factory Notifications({
    int? id,
    String? title,
    String? message,
    int? is_read,
    String? image,
    int? created_at,
    int? type,
    String? data_id,
  }) = _Notifications;

  factory Notifications.fromJson(Map<String, dynamic> json) =>
      _$NotificationsFromJson(json);
}
