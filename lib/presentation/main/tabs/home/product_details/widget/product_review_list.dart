import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/core/widgets/utility/common_rating_bar.dart';
import 'package:intl/intl.dart';

class ProductReviewListWidget extends StatelessWidget {
  const ProductReviewListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      padding: EdgeInsets.symmetric(horizontal: getSize(18)),
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(getSize(12)),
        margin: EdgeInsets.symmetric(vertical: getSize(5)),
        decoration: BoxDecoration(
          color: Color(0xFFD9D9D9).withOpacity(0.20),
          borderRadius: BorderRadius.circular(getSize(10)),
          border: Border.all(
            color: AppColors.black.withOpacity(0.2),
            width: getSize(1),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: getSize(20),
                  backgroundColor: Colors.grey.shade400,
                  backgroundImage: CachedNetworkImageProvider(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS56ldGyKRHaDGinQ1tg9qMxKiw5-ZW_CyCXZ6p3R0Yg0bZNbd9KErKJhyywksv4DDhQcU&usqp=CAU',
                  ),
                ),
                SizedBox(width: getSize(8)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseText(
                      text: 'James Lawson',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: getSize(3),
                    ),
                    BaseText(
                      text: DateFormat('dd MMM , yyyy').format(
                          DateTime.fromMillisecondsSinceEpoch(
                              DateTime.now().millisecondsSinceEpoch)),
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                    )
                  ],
                ),
                Spacer(),
                CommonRatingBar(
                  horizontalPadding: getSize(1.2),
                  iconnSize: getSize(12),
                  initialRating: 4.0,
                  absorbing: true,
                  onRatingUpdate: (value) {},
                ),
              ],
            ),
            SizedBox(height: getSize(12)),
            BaseText(
              text:
                  'Nothing 1 are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit, not sure if the box was always this small but the 90s are and will always be one of my favorites.',
              textColor: AppColors.black.withOpacity(0.6),
              fontSize: 12,
              lineHeight: 1.5,
              showFullDescription: true,
              fontWeight: FontWeight.w400,
            )
          ],
        ),
      ),
    );
  }
}
