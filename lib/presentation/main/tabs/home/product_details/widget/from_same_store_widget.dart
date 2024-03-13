import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grape_customer_app/application/main/home/product_detail/product_detail_bloc.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/core/widgets/utility/common_rating_bar.dart';

class FromSameStoreWidget extends StatelessWidget {
  const FromSameStoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      builder: (context, state) {
        return SizedBox(
          height: getSize(200),
          child: ListView.builder(
            itemCount: state.getProductDetails.same_store?.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(
              horizontal: getSize(18),
            ),
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  context.router.push(
                    PageRouteInfo(
                      ProductDetailsView.name,
                      args: ProductDetailsViewArgs(
                        productId: state.getProductDetails.same_store?[index].id
                                .toString() ??
                            "",
                      ),
                    ),
                  );
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
                              imageUrl: state.getProductDetails
                                      .same_store?[index].images?.first.image ??
                                  "",
                              placeholder: (context, url) => Container(
                                height: getSize(110),
                                width: getSize(110),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius:
                                      BorderRadius.circular(getSize(10)),
                                ),
                              ),
                              height: getSize(110),
                              width: getSize(110),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getSize(8),
                        ),
                        BaseText(
                          text: state.getProductDetails.same_store?[index]
                                  .product_name ??
                              "",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: getSize(5),
                        ),
                        Row(
                          children: [
                            Visibility(
                              visible: state.getProductDetails
                                      .same_store?[index].discount !=
                                  null,
                              child: BaseText(
                                text:
                                    '\$${state.getProductDetails.same_store?[index].price}',
                                textDecoration: TextDecoration.lineThrough,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                textColor: AppColors.black.withOpacity(0.4),
                              ),
                            ),
                            SizedBox(
                              width: getSize(state.getProductDetails
                                          .same_store?[index].discount !=
                                      null
                                  ? 6
                                  : 0),
                            ),
                            BaseText(
                              text: state.getProductDetails.same_store?[index]
                                          .discount !=
                                      null
                                  ? '\$${(state.getProductDetails.same_store?[index].price ?? 0) - (((state.getProductDetails.same_store?[index].price ?? 0) / 100) * 20)}'
                                  : '\$${state.getProductDetails.same_store?[index].price}',
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
                              initialRating: state.getProductDetails
                                      .same_store?[index].review_rate
                                      ?.toDouble() ??
                                  0,
                              horizontalPadding: getSize(2),
                              absorbing: true,
                            ),
                            SizedBox(
                              width: getSize(4),
                            ),
                            BaseText(
                              text:
                                  '${state.getProductDetails.same_store?[index].order_qty} Sold',
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
                              text: state.getProductDetails.same_store?[index]
                                      .shop_location ??
                                  "",
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                              textColor: AppColors.black.withOpacity(0.4),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Visibility(
                      visible:
                          state.getProductDetails.same_store?[index].discount !=
                              null,
                      child: Positioned(
                        left: getSize(6),
                        top: getSize(6),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: getSize(4),
                            vertical: getSize(2),
                          ),
                          // height: getSize(16),
                          // width: getSize(36),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFF094),
                            borderRadius: BorderRadius.circular(
                              getSize(4),
                            ),
                          ),
                          child: BaseText(
                            text:
                                '-${state.getProductDetails.same_store?[index].discount}%',
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            textColor: Color(0xFFFF770E),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
