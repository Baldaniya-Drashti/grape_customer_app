import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/home/product_detail/product_detail_bloc.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/infrastructure/core/common_product_from_json_response.dart';
import 'package:grape_customer_app/infrastructure/main/home_dto/get_product_list_response.dart';
import 'package:grape_customer_app/injection.dart';
import 'package:grape_customer_app/presentation/common/utils/flushbar_creator.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/core/widgets/buttons/common_button.dart';

class BuyNowDialog extends StatelessWidget {
  const BuyNowDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  buyNowDialog(
      BuildContext context,
      GetProductListResponse getProductListResponse,
      List<Data> productFromJson,
      ProductDetailState state) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      elevation: 0,
      useSafeArea: true,
      //isScrollControlled: true,
      // scrollControlDisabledMaxHeightRatio: 0.68,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(getSize(14)),
          topRight: Radius.circular(getSize(14)),
        ),
      ),
      builder: (context) => SafeArea(
        child: BlocProvider(
          create: (context) => getIt<ProductDetailBloc>(),
          child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: getSize(20),
                  ),
                  productDetailsView(context, getProductListResponse),
                  SizedBox(
                    height: getSize(16),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      productFromJson
                          .where((element) => element.fieldType == 1)
                          .length,
                      (index) => getProductDetails(
                        title: productFromJson
                                .where((element) => element.fieldType == 1)
                                .toList()[index]
                                .name ??
                            "",
                        description: productFromJson
                                .where((element) => element.fieldType == 1)
                                .toList()[index]
                                .value ??
                            "",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getSize(16),
                  ),
                  quantityContainerWidget(context, state),
                  SizedBox(
                    height: getSize(30),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: getSize(18)),
                    child: CommonButton(
                      onPressed: () {
                        if (state.productQuantity >
                            (getProductListResponse.available_qty ?? 0)) {
                          showError(
                                  message:
                                      'only ${getProductListResponse.available_qty} quantity left to buy!!')
                              .show(context);
                        } else {
                          context.router.pop();
                          context.router.push(
                            PageRouteInfo(
                              CheckoutView.name,
                              args: CheckoutViewArgs(
                                productId: getProductListResponse.id.toString(),
                                quantity: state.productQuantity,
                              ),
                            ),
                          );
                        }
                      },
                      buttonText: 'Buy Now',
                    ),
                  ),
                  SizedBox(
                    height: getSize(isFullScreenDevice(context) ? 0 : 30),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

getProductDetails({required String title, required String description}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: getSize(18),
      vertical: getSize(3),
    ),
    child: RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: getFontSize(12),
          color: AppColors.black.withOpacity(0.60),
          fontFamily: 'SfPro',
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(text: '$title: '),
          TextSpan(
            text: description,
            style: TextStyle(
              color: AppColors.black.withOpacity(0.80),
              fontFamily: 'SfPro',
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
      textScaler: TextScaler.linear(1),
    ),
  );
}

quantityContainerWidget(
  BuildContext context,
  ProductDetailState state,
) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: getSize(18)),
    decoration: BoxDecoration(
      color: Color(0xFFD9D9D9).withOpacity(0.20),
      borderRadius: BorderRadius.circular(getSize(10)),
    ),
    padding: EdgeInsets.symmetric(
      horizontal: getSize(20),
      vertical: getSize(4),
    ),
    child: Row(
      children: [
        BaseText(
          text: 'Quantity',
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        Spacer(),
        IconButton(
          onPressed: () => context
              .read<ProductDetailBloc>()
              .add(ProductDetailEvent.decreaseProductQuantity()),
          icon: Container(
            height: getSize(20),
            width: getSize(20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(getSize(6)),
              border: Border.all(
                color: AppColors.black.withOpacity(0.20),
              ),
            ),
            child: Icon(
              Icons.remove,
              size: getSize(12),
            ),
          ),
        ),
        Container(
          height: getSize(27),
          width: getSize(27),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.primaryOrange,
            shape: BoxShape.circle,
          ),
          child: BaseText(
            text: '${state.productQuantity}',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            textColor: AppColors.white,
          ),
        ),
        IconButton(
          onPressed: () => context
              .read<ProductDetailBloc>()
              .add(ProductDetailEvent.increaseProductQuantity()),
          icon: Container(
            height: getSize(20),
            width: getSize(20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(getSize(6)),
              border: Border.all(
                color: AppColors.black.withOpacity(0.20),
              ),
            ),
            child: Icon(
              Icons.add,
              size: getSize(12),
            ),
          ),
        )
      ],
    ),
  );

  // return BlocProvider(
  //   create: (context) => getIt<ProductDetailBloc>(),
  //   child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
  //     builder: (context, state) {
  //       return Container(
  //         margin: EdgeInsets.symmetric(horizontal: getSize(18)),
  //         decoration: BoxDecoration(
  //           color: Color(0xFFD9D9D9).withOpacity(0.20),
  //           borderRadius: BorderRadius.circular(getSize(10)),
  //         ),
  //         padding: EdgeInsets.symmetric(
  //           horizontal: getSize(20),
  //           vertical: getSize(4),
  //         ),
  //         child: Row(
  //           children: [
  //             BaseText(
  //               text: 'Quantity',
  //               fontSize: 14,
  //               fontWeight: FontWeight.w500,
  //             ),
  //             Spacer(),
  //             IconButton(
  //               onPressed: () => context
  //                   .read<ProductDetailBloc>()
  //                   .add(ProductDetailEvent.decreaseProductQuantity()),
  //               icon: Container(
  //                 height: getSize(20),
  //                 width: getSize(20),
  //                 alignment: Alignment.center,
  //                 decoration: BoxDecoration(
  //                   color: AppColors.white,
  //                   borderRadius: BorderRadius.circular(getSize(6)),
  //                   border: Border.all(
  //                     color: AppColors.black.withOpacity(0.20),
  //                   ),
  //                 ),
  //                 child: Icon(
  //                   Icons.remove,
  //                   size: getSize(12),
  //                 ),
  //               ),
  //             ),
  //             Container(
  //               height: getSize(27),
  //               width: getSize(27),
  //               alignment: Alignment.center,
  //               decoration: BoxDecoration(
  //                 color: AppColors.primaryOrange,
  //                 shape: BoxShape.circle,
  //               ),
  //               child: BaseText(
  //                 text: '${state.productQuantity}',
  //                 fontSize: 14,
  //                 fontWeight: FontWeight.w500,
  //                 textColor: AppColors.white,
  //               ),
  //             ),
  //             IconButton(
  //               onPressed: () => context
  //                   .read<ProductDetailBloc>()
  //                   .add(ProductDetailEvent.increaseProductQuantity()),
  //               icon: Container(
  //                 height: getSize(20),
  //                 width: getSize(20),
  //                 alignment: Alignment.center,
  //                 decoration: BoxDecoration(
  //                   color: AppColors.white,
  //                   borderRadius: BorderRadius.circular(getSize(6)),
  //                   border: Border.all(
  //                     color: AppColors.black.withOpacity(0.20),
  //                   ),
  //                 ),
  //                 child: Icon(
  //                   Icons.add,
  //                   size: getSize(12),
  //                 ),
  //               ),
  //             )
  //           ],
  //         ),
  //       );

  //     },
  //   ),
  // );
}

productDetailsView(
    BuildContext context, GetProductListResponse getProductListResponse) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: getSize(18)),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              children: [
                Container(
                  height: getSize(60),
                  width: getSize(60),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.primaryOrange.withOpacity(0.20),
                    ),
                    borderRadius: BorderRadius.circular(getSize(6)),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        getProductListResponse.images?[0].image ?? "",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: getSize(12),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseText(
                      text: getProductListResponse.product_name ?? "",
                      fontWeight: FontWeight.w600,
                      textColor: AppColors.black.withOpacity(0.80),
                    ),
                    SizedBox(
                      height: getSize(8),
                    ),
                    Row(
                      children: [
                        Visibility(
                          visible: getProductListResponse.discount != null,
                          child: BaseText(
                            text: '\$${getProductListResponse.price}',
                            textDecoration: TextDecoration.lineThrough,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            textColor: AppColors.black.withOpacity(0.4),
                          ),
                        ),
                        SizedBox(
                          width: getSize(
                              getProductListResponse.discount != null ? 6 : 0),
                        ),
                        BaseText(
                          text: getProductListResponse.discount != null
                              ? '\$${(getProductListResponse.price ?? 0) - (((getProductListResponse.price ?? 0) / 100) * 20)}'
                              : '\$${getProductListResponse.price}',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          textColor: Color(0xFF527FF2),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Positioned.fill(
              top: getSize(-10),
              right: getSize(-10),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    context.router.pop();
                  },
                  icon: Icon(Icons.close_rounded),
                ),
              ),
            )
          ],
        ),
      ],
    ),
  );
}
