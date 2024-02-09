import 'package:cached_network_image/cached_network_image.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/main/tabs/notification/widgets/rate_and_review_widget.dart';

class AllNotificationListWidget extends StatelessWidget {
  const AllNotificationListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      padding:
          EdgeInsets.symmetric(horizontal: getSize(12), vertical: getSize(10)),
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () async {
            await RateAndReviewBotthomSheet()
                .rateAndReviewBotthomSheet(context);
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: getSize(9)),
            padding: EdgeInsets.symmetric(
              horizontal: getSize(6),
              vertical: getSize(8),
            ),
            decoration: BoxDecoration(
              color: index == 0 ? Color(0xFFFFEEE1) : Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(
                getSize(10),
              ),
              border: Border.all(
                color: index == 0
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
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0U3avlAFpuN9Sf5PVhN3MHdXQzh6rJusL93tMQRngAnrK1k0Z9CH4hzhArR0kyV-Fm_E&usqp=CAU',
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
                            text: 'Order Booked',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            textColor: index == 0
                                ? AppColors.primaryOrange
                                : AppColors.black.withOpacity(0.60),
                          ),
                          BaseText(
                            text: '12 Aug 2023',
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                            textColor: index == 0
                                ? AppColors.primaryOrange
                                : AppColors.black.withOpacity(0.60),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getSize(4),
                      ),
                      BaseText(
                        text:
                            'iullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
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
    );
  }
}
