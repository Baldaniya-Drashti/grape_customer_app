import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/cart/cart_bloc.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/infrastructure/core/common_product_from_json_response.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/common/widgets/paginated_list_view.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/core/widgets/buttons/common_button.dart';
import 'package:grape_customer_app/presentation/main/tabs/cart/widgets/empty_cart_view.dart';
import 'package:intl/intl.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: PaginatedListView(
                onRefresh: () {
                  context.read<CartBloc>().add(CartEvent.getCartList(true));
                },
                refreshController: context.read<CartBloc>().refreshController,
                onLoading: () {
                  context.read<CartBloc>().add(CartEvent.getCartList(false));
                },
                //isNoDataFound: state.isNoDataFound,
                child: state.isNoDataFound
                    ? EmptyCartView()
                    : ListView.builder(
                        itemCount: state.cartListDTO.length,
                        padding: EdgeInsets.all(getSize(18)),
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return getCheckoutContainer(state, index, context);
                        },
                      ),
              ),
            ),
            SizedBox(
              height: getSize(state.isNoDataFound ? 0 : 8),
            ),
            Visibility(
              visible: !state.isNoDataFound,
              child: getSubTotal(
                  title: 'Subtotal',
                  description: NumberFormat.simpleCurrency(
                          decimalDigits: state.cartTotal is int ? 0 : 2)
                      .format(state.cartTotal)),
            ),
            SizedBox(
              height: getSize(state.isNoDataFound ? 0 : 14),
            ),
            Visibility(
              visible: !state.isNoDataFound,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: getSize(18)),
                child: CommonButton(
                  onPressed: () {
                    context.router.push(
                      PageRouteInfo(
                        CheckoutView.name,
                        args: CheckoutViewArgs(isFromCart: true),
                      ),
                    );
                  },
                  buttonText: 'Checkout',
                ),
              ),
            ),
            SizedBox(
              height: getSize(state.isNoDataFound ? 0 : 8),
            ),
          ],
        );
      },
    );
  }

  getCheckoutContainer(CartState state, int index, BuildContext context) {
    var productConfigarationList =
        jsonDecode(state.cartListDTO[index].product?.product_form_json ?? "");
    var dataList = ProductFromJson.fromJson(productConfigarationList)
        .data
        .where((element) => element.fieldType == 1)
        .toList();

    return Container(
      padding: EdgeInsets.all(getSize(10)),
      margin: EdgeInsets.symmetric(vertical: getSize(9)),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(getSize(10)),
        border: Border.all(
          color: AppColors.primaryOrange.withOpacity(0.20),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            children: [
              Center(
                child: state.cartListDTO[index].product?.images?.first.image !=
                        null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(getSize(10)),
                        child: CachedNetworkImage(
                          imageUrl: state.cartListDTO[index].product?.images
                                  ?.first.image ??
                              "",
                          placeholder: (context, url) => Container(
                            height: getSize(90),
                            width: getSize(90),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(getSize(10)),
                            ),
                          ),
                          height: getSize(90),
                          width: getSize(90),
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(),
              ),
              SizedBox(
                width: getSize(8),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseText(
                    text: state.cartListDTO[index].product?.product_name ?? "",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: getSize(8),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      dataList.length,
                      (index) => Padding(
                        padding: EdgeInsets.symmetric(vertical: getSize(3)),
                        child: getProductDetails(
                          title: dataList[index].name ?? "",
                          description: dataList[index].value ?? "",
                        ),
                      ),
                    ),
                  ),
                  // getProductDetails(
                  //   title: 'Colors',
                  //   description: state.cartListDTO[index].product?.color ?? "",
                  // ),
                  // SizedBox(
                  //   height: getSize(6),
                  // ),
                  // getProductDetails(
                  //   title: 'Size',
                  //   description: state.cartListDTO[index].product?.size ?? "",
                  // ),
                  SizedBox(
                    height: getSize(3),
                  ),
                  getProductDetails(
                    title: 'Quantity',
                    description: state.cartListDTO[index].product?.order_qty
                            ?.toString() ??
                        "1",
                  ),
                ],
              ),
            ],
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomRight,
              child: BaseText(
                text: NumberFormat.simpleCurrency(
                        decimalDigits: num.tryParse(state
                                    .cartListDTO[index].product?.price
                                    .toString() ??
                                "") is int
                            ? 0
                            : 2)
                    .format(state.cartListDTO[index].product?.price),
                fontSize: 18,
                textColor: AppColors.mildBlue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned.fill(
            top: getSize(-10),
            right: getSize(-10),
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  context.read<CartBloc>().add(
                        CartEvent.removeProductFromCart(
                            state.cartListDTO[index].id?.toString() ?? ""),
                      );
                },
                icon: Icon(
                  Icons.close_rounded,
                  color: AppColors.black.withOpacity(0.60),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  RichText getSubTotal({required String title, required String description}) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: AppColors.black.withOpacity(0.6),
          fontFamily: 'SfPro',
          fontSize: getFontSize(14),
          fontWeight: FontWeight.w400,
        ),
        children: [
          TextSpan(text: '$title: '),
          TextSpan(
            text: description,
            style: TextStyle(
              fontSize: getFontSize(18),
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

  RichText getProductDetails(
      {required String title, required String description}) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: getFontSize(10),
          color: AppColors.black,
          fontFamily: 'SfPro',
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(
            text: '$title: ',
            style: TextStyle(
              color: AppColors.black.withOpacity(0.80),
              fontFamily: 'SfPro',
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: description,
          )
        ],
      ),
      textScaler: TextScaler.linear(1),
    );
  }
}
