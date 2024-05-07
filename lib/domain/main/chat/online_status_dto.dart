import 'package:freezed_annotation/freezed_annotation.dart';

part 'online_status_dto.freezed.dart';

@freezed
class OnlineStatus with _$OnlineStatus {
  const factory OnlineStatus({
    required int senderId,
    required bool isOnline,
    required DateTime lastSeen,
  }) = _OnlineStatus;
}
