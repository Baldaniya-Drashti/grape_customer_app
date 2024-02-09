part of 'notifications_bloc.dart';

@freezed
class NotificationsState with _$NotificationsState {
  factory NotificationsState({
    required int selectedTab,
    required bool isShowClickAndReviewBottomSheet,
    required InputEmptyOrNot reviewndRate,
    required bool showErrorMessages,
    required Option<Either<AuthFailure, String>> failureOrSuccessOption,
  }) = _NotificationsState;
  factory NotificationsState.initial() => NotificationsState(
        selectedTab: 0,
        isShowClickAndReviewBottomSheet: false,
        reviewndRate: InputEmptyOrNot(''),
        showErrorMessages: false,
        failureOrSuccessOption: none(),
      );
}
