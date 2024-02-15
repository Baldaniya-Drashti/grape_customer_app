import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';

class MyOrdesCard extends StatelessWidget {
  const MyOrdesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(PageRouteInfo(OrderDetails.name)),
      child: Container(
        padding: EdgeInsets.all(getSize(10)),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.20),
              blurRadius: 10,
              offset: Offset(0, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0U3avlAFpuN9Sf5PVhN3MHdXQzh6rJusL93tMQRngAnrK1k0Z9CH4hzhArR0kyV-Fm_E&usqp=CAU',
                  // height: getSize(50),
                  width: getSize(50),
                ),
                SizedBox(
                  width: getSize(4),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseText(
                      text: 'Nothing Phone 1',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: getSize(2),
                    ),
                    getProductDetailsTile(
                      title: 'Colors',
                      description: 'Black',
                    ),
                    SizedBox(
                      height: getSize(2),
                    ),
                    getProductDetailsTile(
                      title: 'Size',
                      description: '128 GB',
                    ),
                    SizedBox(
                      height: getSize(2),
                    ),
                    getProductDetailsTile(
                      title: 'Quantity',
                      description: '1',
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    BaseText(
                      text: '23 Oct 2023',
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.black.withOpacity(0.6),
                    ),
                    SizedBox(
                      height: getSize(4),
                    ),
                    BaseText(
                      text: '(Return) Processing',
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.red,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: getSize(12),
            ),
            Row(
              children: [
                getAmountDetails(),
                Spacer(),
                getOrderDetails(context),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget getOrderDetails(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(PageRouteInfo(OrderDetails.name)),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getSize(16),
          vertical: getSize(6),
        ),
        decoration: BoxDecoration(
          color: AppColors.black.withOpacity(0.07),
          borderRadius: BorderRadius.circular(10),
        ),
        child: BaseText(
          text: 'Details',
          fontSize: 12,
        ),
      ),
    );
  }

  RichText getProductDetailsTile(
      {required String title, required String description}) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: getFontSize(10),
          color: AppColors.black.withOpacity(0.80),
          fontFamily: 'SfPro',
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(text: '$title: '),
          TextSpan(
            text: description,
            style: TextStyle(
              color: AppColors.black,
              fontFamily: 'SfPro',
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
      textScaler: TextScaler.linear(1),
    );
  }

  Widget getAmountDetails() {
    return Row(
      children: [
        BaseText(
          text: 'Total Amount: ',
          fontSize: 10,
          fontWeight: FontWeight.w500,
          textColor: AppColors.black.withOpacity(0.6),
        ),
        BaseText(
          text: '\$299',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          textColor: AppColors.mildBlue,
        ),
      ],
    );
  }
}
