import 'package:cached_network_image/cached_network_image.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/notifications/notifications_bloc.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/common/widgets/paginated_list_view.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/main/tabs/notification/widgets/rate_and_review_widget.dart';
import 'package:intl/intl.dart';

class AllNotificationListWidget extends StatelessWidget {
  const AllNotificationListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsBloc, NotificationsState>(
      builder: (context, state) {
        return PaginatedListView(
          onRefresh: () {
            context
                .read<NotificationsBloc>()
                .add(NotificationsEvent.getNotificationList(true));
          },
          onLoading: () {
            context
                .read<NotificationsBloc>()
                .add(NotificationsEvent.getNotificationList(false));
          },
          refreshController: state.notificationRefreshController,
          isNoDataFound:
              state.isLoading == false && state.notificationListDTO.isEmpty,
          child: ListView.builder(
            itemCount: state.notificationListDTO.length,
            padding: EdgeInsets.symmetric(
                horizontal: getSize(12), vertical: getSize(10)),
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async {
                  if (state.notificationListDTO[index].is_read == 0) {
                    context.read<NotificationsBloc>().add(
                          NotificationsEvent.readNotification(
                            state.notificationListDTO[index].id?.toString() ??
                                "",
                          ),
                        );
                  }

                  if (state.notificationListDTO[index].data_id != null) {
                    await RateAndReviewBotthomSheet()
                        .rateAndReviewBotthomSheet(context);
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: getSize(9)),
                  padding: EdgeInsets.symmetric(
                    horizontal: getSize(6),
                    vertical: getSize(8),
                  ),
                  decoration: BoxDecoration(
                    color: state.notificationListDTO[index].is_read == 0
                        ? Color(0xFFFFEEE1)
                        : Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(
                      getSize(10),
                    ),
                    border: Border.all(
                      color: state.notificationListDTO[index].is_read == 0
                          ? AppColors.primaryOrange.withOpacity(0.4)
                          : Colors.transparent,
                    ),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(getSize(6)),
                        child: CachedNetworkImage(
                          height: getSize(50),
                          width: getSize(50),
                          imageUrl:
                              state.notificationListDTO[index].image ?? "",
                          placeholder: (context, url) => Container(
                            height: getSize(50),
                            width: getSize(50),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: SmoothBorderRadius.all(
                                SmoothRadius(
                                  cornerRadius: getSize(6),
                                  cornerSmoothing: 1,
                                ),
                              ),
                            ),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: getSize(8),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BaseText(
                                  text:
                                      state.notificationListDTO[index].title ??
                                          "",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  textColor: AppColors.black,
                                ),
                                BaseText(
                                  text: DateFormat('dd MMM yyyy').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                      (state.notificationListDTO[index]
                                              .created_at ??
                                          0),
                                    ),
                                  ),
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500,
                                  textColor: state.notificationListDTO[index]
                                              .is_read ==
                                          0
                                      ? AppColors.primaryOrange
                                      : AppColors.black.withOpacity(0.60),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: getSize(4),
                            ),
                            BaseText(
                              text: state.notificationListDTO[index].message ??
                                  "",
                              fontSize: 12,
                              maxLines: 2,
                              textColor: AppColors.black
                                  .withOpacity(index == 0 ? 0.60 : 0.40),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
