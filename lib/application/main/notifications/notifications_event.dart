part of 'notifications_bloc.dart';

@freezed
class NotificationsEvent with _$NotificationsEvent {
  factory NotificationsEvent.tabChange(int tabIndex) = TabChange;
  factory NotificationsEvent.onClickOfRateAndReviewTile(
      bool isShowBottomSheet) = OnClickOfRateAndReviewTile;
  const factory NotificationsEvent.reviewChanged(String review) = ReviewChanged;
  const factory NotificationsEvent.submitReview() = SubmitReview;
  factory NotificationsEvent.getMessageList(bool isRefresh) = GetMessageList;
  factory NotificationsEvent.getNotificationList(bool isRefresh) =
      GetNotificationList;
  factory NotificationsEvent.readNotification(String notificationID) =
      ReadNotification;
  factory NotificationsEvent.reviewProduct(String dataID) = ReviewProduct;
}
