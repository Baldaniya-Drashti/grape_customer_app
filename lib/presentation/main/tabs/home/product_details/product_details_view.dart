import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grape_customer_app/application/main/home/product_detail/product_detail_bloc.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/injection.dart';
import 'package:grape_customer_app/presentation/common/utils/flushbar_creator.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/helper/dynamic_link_helper.dart';
import 'package:grape_customer_app/presentation/core/shimmer/product_detail_shimmer.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_app_bar.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/product_details/widget/buy_now_button_widget.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/product_details/widget/from_same_store_widget.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/product_details/widget/out_of_stock_bottom.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/product_details/widget/pop_up_menu_widget.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/product_details/widget/product_configuration_widget.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/product_details/widget/product_main_info.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/product_details/widget/product_review_list.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/product_details/widget/product_vender_detail_widget.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/product_details/widget/product_you_may_like_widget.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/product_details/widget/select_model_widget.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/product_details/widget/similar_product_widget.dart';
import 'package:share_plus/share_plus.dart';

@RoutePage(name: 'ProductDetailsView')
class ProductDetailsView extends StatelessWidget {
  final String productId;
  const ProductDetailsView({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductDetailBloc>()
        ..add(ProductDetailEvent.getProductDetails(productId, true)),
      child: BlocConsumer<ProductDetailBloc, ProductDetailState>(
        listener: (context, state) {
          state.failureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                showError(
                  message: failure.maybeMap(
                    showAPIResponseMessage: (value) => value.message,
                    networkError: (value) =>
                        'Please check your internet connectivity',
                    orElse: () => "Server Error. Try again later.",
                  ),
                ).show(context);
              },
              (r) {
                showSuccess(
                  message: r,
                ).show(context);
                context.read<ProductDetailBloc>().add(
                      ProductDetailEvent.getProductDetails(productId, true),
                    );
              },
            ),
          );
        },
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(
              title: 'Product Details',
              actions: [
                GestureDetector(
                  onTap: () async {
                    var shortlink = await DynamicLinksService.createDynamicLink(
                      imageURL: state.getProductDetails.product
                              ?.images?[state.selectedImageIndex].image ??
                          "",
                      title:
                          state.getProductDetails.product?.product_name ?? "",
                      description: state.dataList[4].value ?? "",
                    );

                    if (shortlink.isNotEmpty) {
                      await Share.share(shortlink);
                    }
                  },
                  child: SvgPicture.asset(
                    SvgImageConstant.share,
                  ),
                ),
                SizedBox(
                  width: getSize(8),
                ),
                PopMenuWidget(),
                SizedBox(
                  width: getSize(8),
                ),
              ],
            ),
            body: SafeArea(
              child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return ProductDetailShimmer();
                  } else if (state.isErrorInAPI) {
                    return Center(
                      child:
                          BaseText(text: 'Something wrong. Please try again!!'),
                    );
                  } else {
                    return ListView(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      children: [
                        Center(
                          child: state.getProductDetails.product?.images != null
                              ? CachedNetworkImage(
                                  imageUrl: state
                                          .getProductDetails
                                          .product
                                          ?.images?[state.selectedImageIndex]
                                          .image ??
                                      "",
                                  height: getSize(216),
                                  placeholder: (context, url) => Container(
                                    height: getSize(216),
                                    color: Colors.grey.shade300,
                                  ),
                                  fit: BoxFit.cover,
                                )
                              : Container(
                                  height: getSize(216),
                                  color: Colors.grey.shade300,
                                ),
                        ),
                        SizedBox(
                          height: getSize(10),
                        ),
                        SelectModelWidget(),
                        SizedBox(
                          height: getSize(20),
                        ),
                        ProductMainInfo(),
                        SizedBox(
                          height: getSize(20),
                        ),
                        ProductConfigurationWidget(),
                        SizedBox(
                          height: getSize(20),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: getSize(18)),
                          child: BaseText(
                            text: 'Product Specification:',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            textColor: AppColors.black.withOpacity(0.8),
                          ),
                        ),
                        SizedBox(
                          height: getSize(10),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: getSize(18)),
                          child: BaseText(
                            text: state.dataList.isNotEmpty
                                ? state.dataList
                                        .firstWhere((element) => element.name!
                                            .contains('Product Description'))
                                        .value ??
                                    ""
                                : "",
                            fontSize: 12,
                            showFullDescription: true,
                            textColor: AppColors.black.withOpacity(0.6),
                          ),
                        ),
                        SizedBox(
                          height: getSize(
                              state.getProductDetails.similar_product != null &&
                                      state.getProductDetails.similar_product!
                                          .isNotEmpty
                                  ? 20
                                  : 0),
                        ),
                        Visibility(
                          visible:
                              state.getProductDetails.similar_product != null &&
                                  state.getProductDetails.similar_product!
                                      .isNotEmpty,
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: getSize(18)),
                            child: BaseText(
                              text: 'Similar Products',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              textColor: AppColors.black.withOpacity(0.8),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getSize(
                              state.getProductDetails.similar_product != null &&
                                      state.getProductDetails.similar_product!
                                          .isNotEmpty
                                  ? 10
                                  : 0),
                        ),
                        SimilarProductWidget(),
                        SizedBox(
                          height: getSize(20),
                        ),
                        ProductVenderDetailWidget(),
                        SizedBox(
                          height: getSize(state.getProductDetails.same_store !=
                                      null &&
                                  state.getProductDetails.same_store!.isNotEmpty
                              ? 20
                              : 0),
                        ),
                        Visibility(
                          visible: state.getProductDetails.same_store != null &&
                              state.getProductDetails.same_store!.isNotEmpty,
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: getSize(18)),
                            child: BaseText(
                              text: 'From the Same Store',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              textColor: AppColors.black.withOpacity(0.8),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getSize(state.getProductDetails.same_store !=
                                      null &&
                                  state.getProductDetails.same_store!.isNotEmpty
                              ? 10
                              : 0),
                        ),
                        FromSameStoreWidget(),
                        SizedBox(
                          height: getSize(state.getProductDetails.same_store !=
                                      null &&
                                  state.getProductDetails.same_store!.isNotEmpty
                              ? 20
                              : 0),
                        ),
                        Visibility(
                          visible: state.getProductDetails.product?.reviews !=
                                  null &&
                              state.getProductDetails.product!.reviews!
                                  .isNotEmpty,
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: getSize(18)),
                            child: Row(
                              children: [
                                BaseText(
                                  text: 'Review Product',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    context.router.push(
                                      PageRouteInfo(ReviewProductList.name),
                                    );
                                  },
                                  child: BaseText(
                                    text: 'See More',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: getSize(18),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getSize(
                            state.getProductDetails.product?.reviews != null &&
                                    state.getProductDetails.product!.reviews!
                                        .isNotEmpty
                                ? 5
                                : 0,
                          ),
                        ),
                        Visibility(
                          visible: state.getProductDetails.product?.reviews !=
                                  null &&
                              state.getProductDetails.product!.reviews!
                                  .isNotEmpty,
                          child: ProductReviewListWidget(),
                        ),
                        Visibility(
                          visible: state.getProductList.isNotEmpty,
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                              horizontal: getSize(18),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: getSize(12),
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFEEE1),
                              borderRadius: BorderRadius.circular(getSize(6)),
                            ),
                            child: BaseText(
                              text: 'Products You May Also Like',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              textColor: AppColors.primaryOrange,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getSize(10),
                        ),
                        ProductYouMayLikeWidget(),
                        SizedBox(
                          height:
                              getSize(state.getProductList.isNotEmpty ? 20 : 0),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
            bottomNavigationBar: Visibility(
              visible: !state.isLoading && !state.isErrorInAPI,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: getSize(12),
                    right: getSize(18),
                    top: getSize(8),
                    bottom: isFullScreenDevice(context) ? 0 : getSize(18),
                  ),
                  child: state.getProductDetails.product?.available_qty == 0
                      ? OutOfStockBottomWidget()
                      : BuyNowButtonWidget(),
                  //
                  //
                  // OutOfStockBottomWidget(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
