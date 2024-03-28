import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grape_customer_app/application/main/home/product_detail/product_detail_bloc.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/core/widgets/utility/common_rating_bar.dart';
import 'package:intl/intl.dart';

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
                  Expanded(
                    child: BaseText(
                      text:
                          'dmkfsmfjdjgkfdgfkhfgjjsdsjkfjfhdjughughfujgfjuhfjfkjdeiorereureiturt yrujhgfjgndfjmgdhne fjdhfrsfhasjudfraswuehwy',
                      //state.getProductDetails.product?.product_name ?? "",
                      fontWeight: FontWeight.w600,
                      showFullDescription: true,
                    ),
                  ),
                  SizedBox(
                    width: getSize(4),
                  ),
                  Visibility(
                    visible: state.getProductDetails.product?.discount != null,
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
                        text: '-${state.getProductDetails.product?.discount}%',
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        textColor: Color(0xFFFF770E),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getSize(10),
                  ),
                  //  Spacer(),
                  Visibility(
                    visible:
                        state.getProductDetails.product?.available_qty == 0,
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
            SizedBox(
              height: getSize(5),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getSize(18)),
              child: Row(
                children: [
                  Visibility(
                    visible: state.getProductDetails.product?.discount != null,
                    child: BaseText(
                      text: state.getProductDetails.product != null
                          ? NumberFormat.simpleCurrency(
                              decimalDigits: num.tryParse(state
                                          .getProductDetails.product?.price
                                          .toString() ??
                                      "0") is int
                                  ? 0
                                  : 2,
                            ).format(
                              state.getProductDetails.product?.price ?? "0")
                          : '',
                      textDecoration: TextDecoration.lineThrough,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.black.withOpacity(0.4),
                    ),
                  ),
                  SizedBox(
                    width: getSize(
                        state.getProductDetails.product?.discount != null
                            ? 6
                            : 0),
                  ),
                  BaseText(
                    text: state.getProductDetails.product?.discount != null
                        ? NumberFormat.simpleCurrency(
                            decimalDigits: num.tryParse(state
                                        .getProductDetails.product?.price
                                        .toString() ??
                                    "0") is int
                                ? 0
                                : 2,
                          ).format((state.getProductDetails.product?.price ??
                                0) -
                            (((state.getProductDetails.product?.price ?? 0) /
                                    100) *
                                (int.tryParse(state.getProductDetails.product
                                            ?.discount ??
                                        "0") ??
                                    0)))
                        //'\$${(state.getProductList[index].price ?? 0) - (((state.getProductList[index].price ?? 0) / 100) * (int.tryParse(state.getProductList[index].discount ?? "") ?? 0))}'
                        : NumberFormat.simpleCurrency(
                            decimalDigits: num.tryParse(state
                                        .getProductDetails.product?.price
                                        .toString() ??
                                    "0") is int
                                ? 0
                                : 2,
                          ).format(state.getProductDetails.product?.price ?? 0),
                    //  : '\$${state.getProductList[index].price}',
                    fontWeight: FontWeight.w600,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getSize(5),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getSize(18)),
              child: Row(
                children: [
                  CommonRatingBar(
                    onRatingUpdate: (p0) {},
                    iconnSize: getSize(12),
                    initialRating: state.getProductDetails.product?.review_rate
                            ?.toDouble() ??
                        0.0,
                    horizontalPadding: getSize(4),
                    absorbing: true,
                  ),
                  SizedBox(
                    width: getSize(2),
                  ),
                  BaseText(
                    text: '${state.getProductDetails.product?.order_qty} Sold',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getSize(5),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getSize(18)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    SvgImageConstant.location,
                    height: getSize(18),
                    width: getSize(18),
                    colorFilter: ColorFilter.mode(
                      AppColors.black.withOpacity(0.7),
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(
                    width: getSize(6),
                  ),
                  Expanded(
                    child: BaseText(
                      text: state.getProductDetails.vendor_details
                              ?.shop_location ??
                          "",
                      fontSize: 12,
                      maxLines: 2,
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.black.withOpacity(0.7),
                    ),
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
