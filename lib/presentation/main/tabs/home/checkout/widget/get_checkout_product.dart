import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/checkout/checkout_bloc.dart';

import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/infrastructure/core/common_product_from_json_response.dart';
import 'package:grape_customer_app/infrastructure/main/home_dto/get_product_list_response.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:intl/intl.dart';

class GetCheckoutProductDetailWidget extends StatelessWidget {
  const GetCheckoutProductDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getSize(10),
            ),
            getChooseCategoryView(),
            if (state.isFromCart)
              Container(
                padding: EdgeInsets.all(getSize(10)),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(getSize(10)),
                    bottomRight: Radius.circular(getSize(10)),
                    bottomLeft: Radius.circular(getSize(10)),
                  ),
                  border: Border.all(
                    color: AppColors.primaryOrange,
                  ),
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: state.getProductList.length,
                  itemBuilder: (context, index) => getCheckoutCartContainer(
                      getProductListResponse: state.getProductList[index],
                      context: context),
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 0,
                      color: AppColors.primaryOrange.withOpacity(0.20),
                    );
                  },
                ),
              )
            else
              getCheckoutContainer(
                getProductListResponse: state.getProductList.isNotEmpty
                    ? state.getProductList.first
                    : GetProductListResponse(),
              ),
          ],
        );
      },
    );
  }

  getCheckoutCartContainer(
      {required GetProductListResponse getProductListResponse,
      required BuildContext context}) {
    var productConfigarationList =
        jsonDecode(getProductListResponse.product_form_json ?? "");
    var dataList = ProductFromJson.fromJson(productConfigarationList)
        .data
        .where((element) => element.fieldType == 1)
        .toList();
    return Container(
      padding: EdgeInsets.all(getSize(10)),
      decoration: BoxDecoration(
        color: AppColors.white,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            children: [
              Center(
                child: getProductListResponse.images?.first.image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(getSize(10)),
                        child: CachedNetworkImage(
                          imageUrl:
                              getProductListResponse.images?.first.image ?? "",
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseText(
                      text: getProductListResponse.product_name ?? "",
                      fontSize: 14,
                      maxLines: 2,
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
                    SizedBox(
                      height: getSize(3),
                    ),
                    getProductDetails(
                      title: 'Quantity',
                      description: getProductListResponse.quantity
                              ?.toStringAsFixed(
                                  getProductListResponse.quantity is int
                                      ? 0
                                      : 2) ??
                          "1",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getSize(3),
              ),
            ],
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomRight,
              child: BaseText(
                text: NumberFormat.simpleCurrency(
                        decimalDigits: num.tryParse(
                                getProductListResponse.price.toString()) is int
                            ? 0
                            : 0)
                    .format(getProductListResponse.price),
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
                  context.read<CheckoutBloc>().add(
                        CheckoutEvent.removeCheckoutProduct(
                          getProductListResponse.id.toString(),
                        ),
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

  getCheckoutContainer(
      {required GetProductListResponse getProductListResponse}) {
    var productConfigarationList =
        jsonDecode(getProductListResponse.product_form_json ?? "");
    var dataList = ProductFromJson.fromJson(productConfigarationList)
        .data
        .where((element) => element.fieldType == 1)
        .toList();
    return Container(
      padding: EdgeInsets.all(getSize(10)),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(getSize(10)),
          bottomRight: Radius.circular(getSize(10)),
          bottomLeft: Radius.circular(getSize(10)),
        ),
        border: Border.all(
          color: AppColors.primaryOrange,
        ),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                height: getSize(90),
                width: getSize(90),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(getSize(10)),
                  ),
                ),
                child: CachedNetworkImage(
                  imageUrl: getProductListResponse.images?.first.image ?? "",
                  placeholder: (context, url) => Container(
                    height: getSize(80),
                    width: getSize(60),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: SmoothBorderRadius.all(
                        SmoothRadius(
                          cornerRadius: getSize(4),
                          cornerSmoothing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: getSize(8),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseText(
                      text: getProductListResponse.product_name ?? "",
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
                    SizedBox(
                      height: getSize(3),
                    ),
                    getProductDetails(
                      title: 'Quantity',
                      description: getProductListResponse.quantity
                              ?.toStringAsFixed(
                                  getProductListResponse.quantity is int
                                      ? 0
                                      : 2) ??
                          "1",
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomRight,
              child: BaseText(
                text: '\$${getProductListResponse.price}',
                fontSize: 18,
                textColor: AppColors.mildBlue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  RichText getProductDetails(
      {required String title, required String description}) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: getFontSize(10),
          color: AppColors.black.withOpacity(0.80),
          fontFamily: 'SfPro',
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(text: '$title: '),
          TextSpan(
            text: description,
            style: TextStyle(
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

  getChooseCategoryView() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getSize(10),
        vertical: getSize(3),
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryOrange,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(getSize(9)),
          topLeft: Radius.circular(getSize(9)),
        ),
      ),
      child: BaseText(
        text: 'Choose for buying',
        fontSize: 12,
        fontWeight: FontWeight.w500,
        textColor: AppColors.white,
      ),
    );
  }
}
