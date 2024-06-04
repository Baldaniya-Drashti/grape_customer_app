import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/notifications/notifications_bloc.dart';

import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/infrastructure/main/notification_dto/notification_list_dto.dart';
import 'package:grape_customer_app/injection.dart';
import 'package:grape_customer_app/presentation/common/utils/app_focus.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/core/widgets/buttons/common_button.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_text_field.dart';
import 'package:grape_customer_app/presentation/core/widgets/utility/common_rating_bar.dart';

class RateAndReviewBotthomSheet extends StatelessWidget {
  final Notifications notifications;
  const RateAndReviewBotthomSheet({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  rateAndReviewBotthomSheet(
    BuildContext context,
  ) {
    return showModalBottomSheet<bool>(
      context: context,
      backgroundColor: AppColors.white,
      elevation: 0,
      isScrollControlled: true,
      useRootNavigator: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(getSize(14)),
          topRight: Radius.circular(getSize(14)),
        ),
      ),
      builder: (context) => BlocProvider(
        create: (context) => getIt<NotificationsBloc>()
          ..add(
            NotificationsEvent.getReviewProduct(
                notifications.data_id?.toString() ?? ""),
          ),
        child: BlocBuilder<NotificationsBloc, NotificationsState>(
            builder: (context, state) {
          if (state.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Form(
              autovalidateMode: state.showErrorMessages
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              child: GestureDetector(
                onTap: () {
                  AppFocus.unfocus(context);
                },
                child: AnimatedPadding(
                  padding: MediaQuery.of(context).viewInsets,
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.decelerate,
                  child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: getSize(18)),
                    physics: BouncingScrollPhysics(),
                    children: [
                      SizedBox(
                        height: getSize(22),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: BaseText(
                                  textAlign: TextAlign.center,
                                  text: 'Rate and Review',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  textColor: AppColors.black,
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  onPressed: () {
                                    context.router.maybePop();
                                  },
                                  icon: Icon(Icons.close_rounded),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getSize(42),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: getSize(10)),
                        decoration: BoxDecoration(
                          color: AppColors.grey.withOpacity(0.20),
                          borderRadius: BorderRadius.circular(getSize(10)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: getSize(40),
                              width: getSize(40),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(getSize(6)),
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    state.getReviewProduct.images?.first
                                            .image ??
                                        "",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: getSize(10),
                            ),
                            BaseText(
                              text: state.getReviewProduct.name ?? "",
                              fontSize: 14,
                              maxLines: 1,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getSize(42),
                      ),
                      BaseText(
                        text: 'What is you rate?',
                        fontSize: 12,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: getSize(8),
                      ),
                      Center(
                        child: CommonRatingBar(
                          iconnSize: getSize(36),
                          horizontalPadding: getSize(7),
                          onRatingUpdate: (p0) {
                            context
                                .read<NotificationsBloc>()
                                .add(NotificationsEvent.productReview(p0));
                          },
                        ),
                      ),
                      SizedBox(
                        height: getSize(30),
                      ),
                      BaseText(
                        text: 'Please share your opinion about the product',
                        fontSize: 12,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: getSize(8),
                      ),
                      CustomTextField(
                        hintText: 'Your Review',
                        maxLines: 3,
                        onChanged: (p0) => context
                            .read<NotificationsBloc>()
                            .add(NotificationsEvent.reviewChanged(p0)),
                        validator: (p0, p1) => state.reviewndRate.value.fold(
                            (l) => l.maybeMap(
                                  empty: (value) => 'Please enter review',
                                  orElse: () => null,
                                ),
                            (r) => null),
                      ),
                      SizedBox(
                        height: getSize(30),
                      ),
                      CommonButton(
                        onPressed: () {
                          context
                              .read<NotificationsBloc>()
                              .add(NotificationsEvent.submitReview(context));
                        },
                        buttonText: 'Submit',
                        isSubmitting: state.isSubmitting,
                      ),
                      SizedBox(
                        height: getSize(30),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
