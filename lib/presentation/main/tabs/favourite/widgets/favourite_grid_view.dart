import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/core/widgets/utility/common_rating_bar.dart';

class FavouriteGridView extends StatelessWidget {
  const FavouriteGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
        horizontal: getSize(18),
        vertical: getSize(14),
      ),
      physics: BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        crossAxisSpacing: getSize(21),
        mainAxisSpacing: getSize(20),
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.router.push(PageRouteInfo(ProductDetailsView.name));
          },
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(getSize(10)),
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://www.tpci.in/indiabusinesstrade/wp-content/uploads/2023/09/Untitled-design-6-3.png",
                        placeholder: (context, url) => Container(
                          height: getSize(160),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(getSize(10)),
                          ),
                        ),
                        height: getSize(160),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getSize(8),
                  ),
                  BaseText(
                    text: 'Google Pixel 7a',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: getSize(5),
                  ),
                  Row(
                    children: [
                      BaseText(
                        text: '\$350',
                        textDecoration: TextDecoration.lineThrough,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        textColor: AppColors.black.withOpacity(0.4),
                      ),
                      SizedBox(
                        width: getSize(6),
                      ),
                      BaseText(
                        text: '\$350',
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getSize(5),
                  ),
                  Row(
                    children: [
                      CommonRatingBar(
                        onRatingUpdate: (p0) {},
                        iconnSize: getSize(9),
                        initialRating: 4.5,
                        horizontalPadding: getSize(2),
                        absorbing: true,
                      ),
                      SizedBox(
                        width: getSize(4),
                      ),
                      BaseText(
                        text: '200 Sold',
                        fontSize: 8,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getSize(3),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        SvgImageConstant.location,
                        height: getSize(12),
                        width: getSize(12),
                        colorFilter: ColorFilter.mode(
                          AppColors.black.withOpacity(0.4),
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(
                        width: getSize(2),
                      ),
                      BaseText(
                        text: 'Hyderabad',
                        fontSize: 8,
                        fontWeight: FontWeight.w500,
                        textColor: AppColors.black.withOpacity(0.4),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                left: getSize(6),
                top: getSize(6),
                child: Container(
                  height: getSize(16),
                  width: getSize(36),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFF094),
                    borderRadius: BorderRadius.circular(
                      getSize(4),
                    ),
                  ),
                  child: BaseText(
                    text: '-20%',
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    textColor: Color(0xFFFF770E),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
