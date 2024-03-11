import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grape_customer_app/application/main/home/product_detail/product_detail_bloc.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/core/widgets/utility/common_rating_bar.dart';

class ProductMainInfo extends StatelessWidget {
  const ProductMainInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getSize(18)),
              child: Row(
                children: [
                  BaseText(
                    text: state.getProductDetails.product_name ?? "",
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    width: getSize(4),
                  ),
                  Visibility(
                    visible: state.getProductDetails.discount != null,
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
                        text: '-${state.getProductDetails.discount}%',
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        textColor: Color(0xFFFF770E),
                      ),
                    ),
                  ),
                  Spacer(),
                  Visibility(
                    visible: state.getProductDetails.available_qty == 0,
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        horizontal: getSize(14),
                        vertical: getSize(4),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF666666),
                        borderRadius: BorderRadius.circular(getSize(6)),
                      ),
                      child: BaseText(
                        text: 'Out of Stock',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        textColor: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getSize(18)),
              child: Row(
                children: [
                  CommonRatingBar(
                    onRatingUpdate: (p0) {},
                    iconnSize: getSize(12),
                    initialRating:
                        state.getProductDetails.review_rate?.toDouble() ?? 0.0,
                    horizontalPadding: getSize(4),
                    absorbing: true,
                  ),
                  SizedBox(
                    width: getSize(4),
                  ),
                  BaseText(
                    text: '${state.getProductDetails.order_qty} Sold',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  Spacer(),
                  BaseText(
                    text: '\$350',
                    textDecoration: TextDecoration.lineThrough,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.black.withOpacity(0.4),
                  ),
                  SizedBox(
                    width: getSize(6),
                  ),
                  BaseText(
                    text: '\$${state.getProductDetails.price}',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    textColor: Color(0xFF527FF2),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getSize(18)),
              child: Row(
                children: [
                  SvgPicture.asset(
                    SvgImageConstant.location,
                    height: getSize(14),
                    width: getSize(14),
                    colorFilter: ColorFilter.mode(
                      AppColors.black.withOpacity(0.7),
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(
                    width: getSize(2),
                  ),
                  BaseText(
                    text: state.getProductDetails.shop_location ?? "",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.black.withOpacity(0.7),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
