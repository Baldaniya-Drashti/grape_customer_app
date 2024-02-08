part of 'notifications_bloc.dart';

@freezed
class NotificationsEvent with _$NotificationsEvent {
  factory NotificationsEvent.tabChange(int tabIndex) = TabChange;
}
