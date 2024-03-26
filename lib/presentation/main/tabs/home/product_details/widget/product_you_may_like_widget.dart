import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grape_customer_app/application/main/home/product_detail/product_detail_bloc.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/png_image_constants.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/core/widgets/utility/common_rating_bar.dart';
import 'package:intl/intl.dart';

class ProductYouMayLikeWidget extends StatelessWidget {
  const ProductYouMayLikeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      builder: (context, state) {
        return Visibility(
          visible: state.getProductList.isNotEmpty,
          child: GridView.builder(
            itemCount: state.getProductList.length,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(
              horizontal: getSize(18),
            ),
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              crossAxisSpacing: getSize(20),
              mainAxisSpacing: getSize(20),
            ),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  context.router.push(
                    PageRouteInfo(
                      ProductDetailsView.name,
                      args: ProductDetailsViewArgs(
                        productId: state.getProductList[index].id.toString(),
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
                            child: state.getProductList[index].images?.first
                                        .image !=
                                    null
                                ? CachedNetworkImage(
                                    imageUrl: state.getProductList[index].images
                                            ?.first.image ??
                                        "",
                                    placeholder: (context, url) => Container(
                                      height: getSize(145),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius:
                                            BorderRadius.circular(getSize(10)),
                                      ),
                                    ),
                                    height: getSize(145),
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                  )
                                : Container(),
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
                            Visibility(
                              visible:
                                  state.getProductList[index].discount != null,
                              child: BaseText(
                                text: NumberFormat.simpleCurrency(
                                  decimalDigits: num.tryParse(state
                                          .getProductList[index].price
                                          .toString()) is int
                                      ? 0
                                      : 2,
                                ).format(state.getProductList[index].price),
                                textDecoration: TextDecoration.lineThrough,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                textColor: AppColors.black.withOpacity(0.4),
                              ),
                            ),
                            SizedBox(
                              width: getSize(
                                  state.getProductList[index].discount != null
                                      ? 6
                                      : 0),
                            ),
                            Expanded(
                              child: BaseText(
                                text: state.getProductList[index].discount !=
                                        null
                                    ? NumberFormat.simpleCurrency(
                                        decimalDigits: num.tryParse(state
                                                .getProductList[index].price
                                                .toString()) is int
                                            ? 0
                                            : 2,
                                      ).format((state
                                                .getProductList[index].price ??
                                            0) -
                                        (((state.getProductList[index].price ??
                                                    0) /
                                                100) *
                                            (int.tryParse(state
                                                        .getProductList[index]
                                                        .discount ??
                                                    "") ??
                                                0)))
                                    //'\$${(state.getProductList[index].price ?? 0) - (((state.getProductList[index].price ?? 0) / 100) * (int.tryParse(state.getProductList[index].discount ?? "") ?? 0))}'
                                    : NumberFormat.simpleCurrency(
                                        decimalDigits: num.tryParse(state
                                                .getProductList[index].price
                                                .toString()) is int
                                            ? 0
                                            : 2,
                                      ).format(
                                        state.getProductList[index].price),
                                //  : '\$${state.getProductList[index].price}',
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
                                      .getProductList[index].review_rate
                                      ?.toDouble() ??
                                  0,
                              horizontalPadding: getSize(1),
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
                            Expanded(
                              child: BaseText(
                                text:
                                    state.getProductList[index].shop_location ??
                                        "",
                                fontSize: 8,
                                maxLines: 1,
                                fontWeight: FontWeight.w500,
                                textColor: AppColors.black.withOpacity(0.4),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: getSize(8),
                    ),
                    Positioned(
                      right: getSize(5),
                      top: getSize(5),
                      child: GestureDetector(
                        onTap: () {
                          if (state.getProductList[index].is_favorite == true) {
                            context.read<ProductDetailBloc>().add(
                                    ProductDetailEvent
                                        .removeProductFromFavourite(
                                  productId:
                                      state.getProductList[index].id.toString(),
                                ));
                          } else {
                            context.read<ProductDetailBloc>().add(
                                  ProductDetailEvent.addToFavourite(
                                    productId: state.getProductList[index].id
                                        .toString(),
                                  ),
                                );
                          }
                        },
                        child: SvgPicture.asset(
                          state.getProductList[index].is_favorite == true
                              ? SvgImageConstant.favouriteSelected
                              : SvgImageConstant.favouriteUnselected,
                        ),
                      ),
                    ),
                    Positioned(
                      right: getSize(5),
                      bottom: getSize(5),
                      child: GestureDetector(
                        onTap: () {
                          if (state.getProductList[index].is_cart == true) {
                          } else {
                            context.read<ProductDetailBloc>().add(
                                  ProductDetailEvent.addProductToCart(
                                    productId: state.getProductList[index].id
                                        .toString(),
                                  ),
                                );
                          }
                        },
                        child: Container(
                          height: getSize(22),
                          width: getSize(22),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(getSize(5)),
                            border: Border.all(color: AppColors.primaryOrange),
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Image.asset(
                                PngImageConstants.cartSelected,
                                height: getSize(13),
                                width: getSize(13),
                                color:
                                    state.getProductList[index].is_cart == true
                                        ? AppColors.primaryOrange
                                        : AppColors.black,
                              ),
                              Visibility(
                                visible:
                                    state.getProductList[index].is_cart == true,
                                child: Positioned.fill(
                                  top: getSize(2),
                                  left: getSize(-2),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: SvgPicture.asset(
                                      SvgImageConstant.successImage,
                                      height: getSize(4),
                                      width: getSize(4),
                                      colorFilter: ColorFilter.mode(
                                        AppColors.green,
                                        BlendMode.srcATop,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: state.getProductList[index].discount != null,
                      child: Positioned(
                        left: getSize(6),
                        top: getSize(6),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: getSize(4),
                            vertical: getSize(2),
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFF094),
                            borderRadius: BorderRadius.circular(
                              getSize(4),
                            ),
                          ),
                          child: BaseText(
                            text: '-${state.getProductList[index].discount}%',
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
