import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grape_customer_app/application/main/home/product_detail/product_detail_bloc.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/common/widgets/paginated_list_view.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/core/widgets/utility/common_rating_bar.dart';

class SimilarProductWidget extends StatelessWidget {
  const SimilarProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      builder: (context, state) {
        return Visibility(
          visible: state.similarProduct.isNotEmpty,
          child: SizedBox(
            height: getSize(218),
            child: PaginatedListView(
              onRefresh: () {
                context.read<ProductDetailBloc>().add(
                      ProductDetailEvent.getProductDetails(
                          state.getProductDetails.product?.id.toString() ?? "",
                          true),
                    );
              },
              onLoading: () {
                context.read<ProductDetailBloc>().add(
                      ProductDetailEvent.getProductDetails(
                          state.getProductDetails.product?.id.toString() ?? "",
                          false),
                    );
              },
              refreshController: context
                  .read<ProductDetailBloc>()
                  .similarProductRefreshController,
              scrollDirection: Axis.horizontal,
              child: ListView.builder(
                itemCount: state.similarProduct.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                // padding: EdgeInsets.symmetric(
                //   horizontal: getSize(18),
                // ),
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: getSize(150),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: getSize(index == 0 ? 18 : 9),
                        right: getSize(
                          index ==
                                  ((state.getProductDetails.same_store
                                              ?.length ??
                                          0) -
                                      1)
                              ? 18
                              : 9,
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          context.router.push(
                            PageRouteInfo(
                              ProductDetailsView.name,
                              args: ProductDetailsViewArgs(
                                productId:
                                    state.similarProduct[index].id.toString(),
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
                                    borderRadius:
                                        BorderRadius.circular(getSize(10)),
                                    child: state.similarProduct[index].images
                                                ?.first.image !=
                                            null
                                        ? CachedNetworkImage(
                                            imageUrl: state
                                                    .similarProduct[index]
                                                    .images
                                                    ?.first
                                                    .image ??
                                                "",
                                            placeholder: (context, url) =>
                                                Container(
                                              height: getSize(130),
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade100,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        getSize(10)),
                                              ),
                                            ),
                                            height: getSize(130),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            fit: BoxFit.cover,
                                          )
                                        : Container(),
                                  ),
                                ),
                                SizedBox(
                                  height: getSize(8),
                                ),
                                BaseText(
                                  text: state
                                          .similarProduct[index].product_name ??
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
                                      visible: state
                                              .similarProduct[index].discount !=
                                          null,
                                      child: BaseText(
                                        text:
                                            '\$${state.similarProduct[index].price}',
                                        textDecoration:
                                            TextDecoration.lineThrough,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        textColor:
                                            AppColors.black.withOpacity(0.4),
                                      ),
                                    ),
                                    SizedBox(
                                      width: getSize(state.similarProduct[index]
                                                  .discount !=
                                              null
                                          ? 6
                                          : 0),
                                    ),
                                    Expanded(
                                      child: BaseText(
                                        text: state.similarProduct[index]
                                                    .discount !=
                                                null
                                            ? '\$${(state.similarProduct[index].price ?? 0) - (((state.similarProduct[index].price ?? 0) / 100) * (int.tryParse(state.getProductDetails.product?.discount ?? "") ?? 0))}'
                                            : '\$${state.similarProduct[index].price}',
                                        fontWeight: FontWeight.w600,
                                        maxLines: 1,
                                      ),
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
                                              .similarProduct[index].review_rate
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
                                          '${state.similarProduct[index].order_qty} Sold',
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
                                    Expanded(
                                      child: BaseText(
                                        text: state.similarProduct[index]
                                                .shop_location ??
                                            "",
                                        fontSize: 8,
                                        maxLines: 1,
                                        fontWeight: FontWeight.w500,
                                        textColor:
                                            AppColors.black.withOpacity(0.4),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Visibility(
                              visible:
                                  state.similarProduct[index].discount != null,
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
                                        '-${state.similarProduct[index].discount}%',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    textColor: Color(0xFFFF770E),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
