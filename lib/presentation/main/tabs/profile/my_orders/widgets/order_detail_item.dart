import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grape_customer_app/application/main/profile/my_orders/my_orders_bloc.dart';
import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/infrastructure/core/common_product_from_json_response.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/styles/styles.dart';
import 'package:intl/intl.dart';

class OrderDetailItem extends StatelessWidget {
  const OrderDetailItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrdersBloc, MyOrdersState>(
      builder: (context, state) {
        if (state.orderDetailDTO.product?.product_form_json != null) {
          var productConfigarationList =
              jsonDecode(state.orderDetailDTO.product?.product_form_json ?? "");
          var dataList = ProductFromJson.fromJson(productConfigarationList)
              .data
              .where((element) => element.fieldType == 1)
              .toList();
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: getSize(20),
              vertical: getSize(17),
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.10),
                  blurRadius: 10,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (state.orderDetailDTO.product?.images != null)
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(getSize(10)),
                          child: CachedNetworkImage(
                            imageUrl: state.orderDetailDTO.product?.images
                                    ?.first.image ??
                                "",
                            width: getSize(100),
                            height: getSize(100),
                            placeholder: (context, url) => Container(
                              color: Colors.grey.shade300,
                              width: getSize(100),
                              height: getSize(100),
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    else
                      Container(),
                    SizedBox(
                      width: getSize(10),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: BaseText(
                                  text: state.orderDetailDTO.product
                                          ?.product_name ??
                                      "",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  maxLines: 1,
                                ),
                              ),
                              SizedBox(
                                width: getSize(10),
                              ),
                              BaseText(
                                text: NumberFormat.simpleCurrency(
                                        decimalDigits:
                                            state.orderDetailDTO.amount is int
                                                ? 0
                                                : 2)
                                    .format(state.orderDetailDTO.amount),
                                fontWeight: FontWeight.w600,
                                textColor: AppColors.mildBlue,
                                fontSize: 16,
                              )
                            ],
                          ),
                          SizedBox(
                            height: getSize(10),
                          ),
                          detailRow(
                            iconWidget:
                                SvgPicture.asset(SvgImageConstant.calender),
                            title:
                                'Order on ${DateFormat('dd MMM yyyy').format(DateTime.fromMillisecondsSinceEpoch((state.orderDetailDTO.order_date ?? 0)))}',
                          ),
                          SizedBox(
                            height: getSize(8),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                              dataList.length,
                              (index) => Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: getSize(3)),
                                child: getProductDetailsTile(
                                  title: dataList[index].name ?? "",
                                  description: dataList[index].value ?? "",
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: getSize(8),
                          ),
                          Row(
                            children: [
                              detailRow(
                                iconWidget: Row(
                                  children: [
                                    BaseText(
                                      text: state.orderDetailDTO.quantity
                                              ?.toString() ??
                                          "",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10,
                                    ),
                                  ],
                                ),
                                title: 'Qty',
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.all(getSize(4)),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: getOrderStatusColor(
                                          state.orderDetailDTO.status ?? 0)
                                      .withOpacity(0.08),
                                ),
                                child: BaseText(
                                  text: getOrderStatus(
                                      state.orderDetailDTO.status ?? 0),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  textColor: getOrderStatusColor(
                                      state.orderDetailDTO.status ?? 0),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getSize(14),
                ),
                Divider(
                  color: AppColors.black.withOpacity(0.1),
                  thickness: 1,
                ),
                GestureDetector(
                  onTap: () => context.router.push(PageRouteInfo(
                    ChatView.name,
                  )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        SvgImageConstant.message,
                        colorFilter: ColorFilter.mode(
                          AppColors.primaryOrange,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(
                        width: getSize(10),
                      ),
                      BaseText(
                        text: AppLocalizations.of(context).contactVendor,
                        textColor: AppColors.primaryOrange,
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  String getOrderStatus(int status) {
    switch (status) {
      case 0:
        return 'Pending';
      case 1:
        return 'Packed';
      case 2:
        return 'Shipped';
      case 3:
        return 'Delivered';
      case 4:
        return 'Cancelled';

      default:
        return '';
    }
  }

  Color getOrderStatusColor(int status) {
    switch (status) {
      case 0:
        return Color(0XFFD0A200);
      case 1:
        return Color(0XFFD0A200);
      case 2:
        return Color(0XFFD0A200);
      case 3:
        return AppColors.green;
      case 4:
        return AppColors.red;

      default:
        return Color(0XFFD0A200);
    }
  }

  RichText getProductDetailsTile(
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

  Widget detailRow({required Widget iconWidget, required String title}) {
    return Row(
      children: [
        iconWidget,
        SizedBox(
          width: getSize(5),
        ),
        BaseText(
          text: title,
          fontSize: 8,
          fontWeight: FontWeight.w500,
          textColor: AppColors.black.withOpacity(0.7),
        )
      ],
    );
  }
}
