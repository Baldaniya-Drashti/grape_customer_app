import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grape_customer_app/domain/auth/auth_value_objects.dart';
import 'package:grape_customer_app/domain/main/i_main_facade.dart';
import 'package:grape_customer_app/domain/main/main_failure.dart';
import 'package:grape_customer_app/infrastructure/main/chat_dto/chat_list_dto.dart';
import 'package:grape_customer_app/infrastructure/main/notification_dto/get_review_product_dto.dart';
import 'package:grape_customer_app/infrastructure/main/notification_dto/notification_list_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'notifications_state.dart';
part 'notifications_event.dart';
part 'notifications_bloc.freezed.dart';

@injectable
class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  int page = 1;
  int lastPage = 1;
  bool isFetching = false;

  final IMainFacade mainFacade;
  NotificationsBloc(this.mainFacade) : super(NotificationsState.initial()) {
    on<NotificationsEvent>(
      (event, emit) async {
        await event.map(
          tabChange: (value) async {
            emit(state.copyWith(selectedTab: value.tabIndex));
          },
          onClickOfRateAndReviewTile: (OnClickOfRateAndReviewTile value) async {
            emit(
              state.copyWith(
                  isShowClickAndReviewBottomSheet: value.isShowBottomSheet),
            );
          },
          reviewChanged: (ReviewChanged value) {
            emit(
              state.copyWith(
                reviewndRate: InputEmptyOrNot(value.review),
                failureOrSuccessOption: none(),
              ),
            );
          },
          submitReview: (SubmitReview value) async {
            Either<MainFailure, String>? failureOrSuccess;
            final isReviewValid = state.reviewndRate.isValid();
            if (isReviewValid) {
              emit(
                state.copyWith(
                  isSubmitting: true,
                  failureOrSuccessOption: none(),
                ),
              );

              failureOrSuccess = await mainFacade.giveReviewToProduct(
                productId: state.getReviewProduct.id?.toString() ?? "",
                rating: state.productReview.toString(),
                reviewComment: state.reviewndRate.getOrCrash() ?? "",
              );
            }
            if (failureOrSuccess?.isRight() ?? false) {
              value.context.router.maybePop(true);
            }
            emit(
              state.copyWith(
                showErrorMessages: true,
                isSubmitting: false,
                isShowClickAndReviewBottomSheet: false,
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          getMessageList: (GetMessageList value) async {
            if (value.isRefresh) {
              page = 1;
              emit(
                state.copyWith(
                  messageList: [],
                  failureOrSuccessOption: none(),
                ),
              );
              state.messageRefreshController.resetNoData();
            } else {
              if (page > lastPage) {
                state.messageRefreshController.loadNoData();
                return;
              }
            }

            emit(state.copyWith(isLoading: value.isRefresh));

            var res = await mainFacade.getChatListAPI(page: page);

            page++;

            res.fold(
              (l) => emit(
                state.copyWith(
                  isErrorInAPI: true,
                  isLoading: false,
                  messageList: [],
                  failureOrSuccessOption: none(),
                ),
              ),
              (r) {
                var res = ChatListDTO.fromJson(r.data);

                lastPage = r.meta?.lastPage ?? 1;
                return emit(
                  state.copyWith(
                    isLoading: false,
                    isErrorInAPI: false,
                    failureOrSuccessOption: none(),
                    isNoDataFound:
                        res.messages != null && res.messages!.isEmpty,
                    messageList: List.from(state.messageList)
                      ..addAll(res.messages ?? []),
                    messageListDTO: res,
                  ),
                );
              },
            );
          },
          getNotificationList: (GetNotificationList value) async {
            if (value.isRefresh) {
              page = 1;
              emit(
                state.copyWith(
                  notificationList: [],
                  failureOrSuccessOption: none(),
                ),
              );
              state.messageRefreshController.resetNoData();
            } else {
              if (page > lastPage) {
                state.messageRefreshController.loadNoData();
                return;
              }
            }

            emit(state.copyWith(isLoading: value.isRefresh));

            var res = await mainFacade.getNotificationListAPI(page: page);

            page++;

            res.fold(
              (l) => emit(
                state.copyWith(
                  isErrorInAPI: true,
                  isLoading: false,
                  notificationList: [],
                  failureOrSuccessOption: none(),
                ),
              ),
              (r) {
                var res = NotificationListDTO.fromJson(r.data);
                lastPage = r.meta?.lastPage ?? 1;
                return emit(
                  state.copyWith(
                    isLoading: false,
                    isErrorInAPI: false,
                    failureOrSuccessOption: none(),
                    isNoDataFound:
                        res.notifications != null && res.notifications!.isEmpty,
                    notificationListDTO: res,
                    notificationList: List.from(state.notificationList)
                      ..addAll(res.notifications ?? []),
                  ),
                );
              },
            );
          },
          readNotification: (ReadNotification value) async {
            var res = await mainFacade.getReadNotificationAPI(
                notificationId: value.notificationID);
            res.fold(
              (l) => emit(
                state.copyWith(
                  isErrorInAPI: true,
                  isLoading: false,
                  failureOrSuccessOption: none(),
                ),
              ),
              (r) {
                add(NotificationsEvent.getNotificationList(true));
                // return emit(
                //   state.copyWith(
                //     failureOrSuccessOption: none(),
                //   ),
                // );
              },
            );
          },
          productReview: (ProductReview value) async {
            emit(state.copyWith(productReview: value.review));
          },
          getReviewProduct: (GetReviewProduct value) async {
            emit(
              state.copyWith(
                isLoading: true,
                failureOrSuccessOption: none(),
              ),
            );

            var res = await mainFacade.reviewNotificationAPI(
              dataId: value.dataID,
            );
            res.fold(
              (l) => emit(
                state.copyWith(
                  isLoading: false,
                  isShowClickAndReviewBottomSheet: false,
                  failureOrSuccessOption: none(),
                ),
              ),
              (r) => emit(
                state.copyWith(
                  isLoading: false,
                  isShowClickAndReviewBottomSheet: false,
                  getReviewProduct: r,
                  failureOrSuccessOption: none(),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
