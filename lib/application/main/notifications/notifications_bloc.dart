import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grape_customer_app/domain/auth/auth_value_objects.dart';

import '../../../domain/auth/auth_failure.dart';

part 'notifications_state.dart';
part 'notifications_event.dart';
part 'notifications_bloc.freezed.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc() : super(NotificationsState.initial()) {
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
          submitReview: (SubmitReview value) {
            final isReviewValid = state.reviewndRate.isValid();
            if (isReviewValid) {}
            emit(
              state.copyWith(
                showErrorMessages: true,
                isShowClickAndReviewBottomSheet: false,
                failureOrSuccessOption: none(),
              ),
            );
          },
        );
      },
    );
  }
}
