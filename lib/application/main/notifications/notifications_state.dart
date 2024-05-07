part of 'notifications_bloc.dart';

@freezed
class NotificationsState with _$NotificationsState {
  factory NotificationsState({
    required int selectedTab,
    required bool isShowClickAndReviewBottomSheet,
    required InputEmptyOrNot reviewndRate,
    required bool showErrorMessages,
    required List<ChatListDTO> messageListDTO,
    required List<NotificationListDTO> notificationListDTO,
    required bool isLoading,
    required bool isNoDataFound,
    required bool isErrorInAPI,
    required RefreshController notificationRefreshController,
    required RefreshController messageRefreshController,
    required Option<Either<AuthFailure, String>> failureOrSuccessOption,
  }) = _NotificationsState;
  factory NotificationsState.initial() => NotificationsState(
        selectedTab: 0,
        isShowClickAndReviewBottomSheet: false,
        reviewndRate: InputEmptyOrNot(''),
        showErrorMessages: false,
        failureOrSuccessOption: none(),
        messageListDTO: [],
        isLoading: false,
        isNoDataFound: false,
        isErrorInAPI: false,
        notificationRefreshController: RefreshController(),
        messageRefreshController: RefreshController(),
        notificationListDTO: [],
      );
}
