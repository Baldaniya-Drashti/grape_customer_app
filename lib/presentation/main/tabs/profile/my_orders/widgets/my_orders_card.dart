import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/profile/my_orders/my_orders_bloc.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/infrastructure/core/common_product_from_json_response.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:intl/intl.dart';

class MyOrdesCard extends StatelessWidget {
  final int index;
  const MyOrdesCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrdersBloc, MyOrdersState>(
      builder: (context, state) {
        var productConfigarationList = jsonDecode(
            state.getMyOrderList[index].product?.product_form_json ?? "");
        var dataList = ProductFromJson.fromJson(productConfigarationList)
            .data
            .where((element) => element.fieldType == 1)
            .toList();
        return GestureDetector(
          onTap: () async {
            var res = await context.router.push(
              PageRouteInfo(
                OrderDetails.name,
                args: OrderDetailsArgs(
                  orderId:
                      state.getMyOrderList[index].order_id?.toString() ?? "",
                ),
              ),
            );

            if (res != null && res == true) {
              context
                  .read<MyOrdersBloc>()
                  .add(MyOrdersEvent.getMyOrdersList(true));
            }
          },
          child: Container(
            padding: EdgeInsets.all(getSize(10)),
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.20),
                  blurRadius: 10,
                  offset: Offset(0, 0),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(getSize(10)),
                        child: CachedNetworkImage(
                          imageUrl: state.getMyOrderList[index].product?.images
                                  ?.first.image ??
                              "",
                          height: getSize(80),
                          width: getSize(80),
                          fit: BoxFit.cover,
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
                            text: state.getMyOrderList[index].product
                                    ?.product_name ??
                                "",
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: getSize(2),
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
                            height: getSize(3),
                          ),
                          getProductDetailsTile(
                            title: 'Quantity',
                            description: state.getMyOrderList[index].quantity
                                    ?.toString() ??
                                "1",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: getSize(4),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        BaseText(
                          text: DateFormat('dd MMM yyyy').format(
                              DateTime.fromMillisecondsSinceEpoch(
                                  (state.getMyOrderList[index].order_date ??
                                      0))),
                          // '23 Oct 2023',
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          textColor: AppColors.black.withOpacity(0.6),
                        ),
                        SizedBox(
                          height: getSize(4),
                        ),
                        BaseText(
                          text: getOrderStatus(
                              state.getMyOrderList[index].status ?? 0),
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          textColor: AppColors.red,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: getSize(12),
                ),
                Row(
                  children: [
                    getAmountDetails(state),
                    Spacer(),
                    getOrderDetails(context, state),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget getOrderDetails(BuildContext context, MyOrdersState state) {
    return GestureDetector(
      onTap: () => context.router.push(
        PageRouteInfo(
          OrderDetails.name,
          args: OrderDetailsArgs(
            orderId: state.getMyOrderList[index].order_id?.toString() ?? "",
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getSize(16),
          vertical: getSize(6),
        ),
        decoration: BoxDecoration(
          color: AppColors.black.withOpacity(0.07),
          borderRadius: BorderRadius.circular(10),
        ),
        child: BaseText(
          text: 'Details',
          fontSize: 12,
        ),
      ),
    );
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

  String getOrderStatus(int status) {
    switch (status) {
      case 0:
        return 'Pending';
      case 1:
        return 'Accept';
      case 2:
        return 'Processing';
      case 3:
        return 'Shipped';
      case 4:
        return 'Delivered';
      case 5:
        return 'Cancelled';
      default:
        return '';
    }
  }

  Widget getAmountDetails(MyOrdersState state) {
    return Row(
      children: [
        BaseText(
          text: 'Total Amount: ',
          fontSize: 10,
          fontWeight: FontWeight.w500,
          textColor: AppColors.black.withOpacity(0.6),
        ),
        BaseText(
          text: NumberFormat.simpleCurrency(
                  decimalDigits:
                      state.getMyOrderList[index].amount is int ? 0 : 2)
              .format(state.getMyOrderList[index].amount),
          fontSize: 18,
          fontWeight: FontWeight.w600,
          textColor: AppColors.mildBlue,
        ),
      ],
    );
  }
}
