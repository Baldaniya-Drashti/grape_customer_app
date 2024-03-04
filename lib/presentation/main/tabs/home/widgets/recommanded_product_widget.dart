import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grape_customer_app/application/main/home/home_bloc.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/shimmer/product_grid_shimmer.dart';
import 'package:grape_customer_app/presentation/core/styles/styles.dart';
import 'package:grape_customer_app/presentation/core/widgets/utility/common_rating_bar.dart';

class RecommandedProductWidget extends StatelessWidget {
  const RecommandedProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.isLoading) {
          return ProductGridShimmerView();
        } else if (state.isErrorInAPI) {
          return Center(
            child: BaseText(text: 'Something wrong. Please try again!!'),
          );
        } else {
          return GridView.builder(
            itemCount: state.getProductList.length,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(
              horizontal: getSize(18),
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
                              imageUrl: state.getProductList[index].images
                                      ?.first.image ??
                                  "",
                              placeholder: (context, url) => Container(
                                height: getSize(160),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius:
                                      BorderRadius.circular(getSize(10)),
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
                          text: state.getProductList[index].product_name ?? "",
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
                              text: '\$${state.getProductList[index].price}',
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
                              initialRating: state
                                      .getProductList[index].review_rate
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
                                  '${state.getProductList[index].order_qty} Sold',
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
                              text: state.getProductList[index].shop_location ??
                                  "",
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
      },
    );
  }
}
