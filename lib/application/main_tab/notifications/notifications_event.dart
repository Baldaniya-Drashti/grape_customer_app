part of 'notifications_bloc.dart';

@freezed
class NotificationsEvent with _$NotificationsEvent {
  factory NotificationsEvent.tabChange(int tabIndex) = TabChange;
  factory NotificationsEvent.onClickOfRateAndReviewTile(
      bool isShowBottomSheet) = OnClickOfRateAndReviewTile;
  const factory NotificationsEvent.reviewChanged(String review) = ReviewChanged;
  const factory NotificationsEvent.submitReview() = SubmitReview;
}
