part of 'notifications_bloc.dart';

@freezed
class NotificationsEvent with _$NotificationsEvent {
  factory NotificationsEvent.tabChange(int tabIndex) = TabChange;
  factory NotificationsEvent.onClickOfRateAndReviewTile(
      bool isShowBottomSheet) = OnClickOfRateAndReviewTile;
  factory NotificationsEvent.reviewChanged(String review) = ReviewChanged;
  factory NotificationsEvent.productReview(double review) = ProductReview;

  factory NotificationsEvent.submitReview(BuildContext context) = SubmitReview;
  factory NotificationsEvent.getMessageList(bool isRefresh) = GetMessageList;
  factory NotificationsEvent.getNotificationList(bool isRefresh) =
      GetNotificationList;
  factory NotificationsEvent.readNotification(String notificationID) =
      ReadNotification;
  factory NotificationsEvent.getReviewProduct(String dataID) = GetReviewProduct;
}
