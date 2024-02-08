part of 'notifications_bloc.dart';

@freezed
class NotificationsState with _$NotificationsState {
  factory NotificationsState({
    required int selectedTab,
  }) = _MainTabState;
  factory NotificationsState.initial() => NotificationsState(
        selectedTab: 0,
      );
}
