import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grape_customer_app/application/main/profile/my_orders/my_orders_bloc.dart';
import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/injection.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_app_bar.dart';
import 'package:grape_customer_app/presentation/main/tabs/profile/my_orders/widgets/order_detail_item.dart';

@RoutePage(name: 'RefundRequestView')
class RefundRequestView extends StatelessWidget {
  final String orderId;
  const RefundRequestView({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context).orderDetails,
        actions: [helpView(context)],
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) =>
              getIt<MyOrdersBloc>()..add(MyOrdersEvent.getOrderDetail(orderId)),
          child: BlocBuilder<MyOrdersBloc, MyOrdersState>(
            builder: (context, state) {
              if (state.isLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryOrange,
                  ),
                );
              } else {
                return ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                    horizontal: getSize(18),
                    vertical: getSize(20),
                  ),
                  physics: BouncingScrollPhysics(),
                  children: [
                    OrderDetailItem(),
                    SizedBox(
                      height: getSize(30),
                    ),
                    BaseText(
                      text: 'Reason For Return',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: getSize(5),
                    ),
                    BaseText(
                      text:
                          'Please tell us the correct reason for the return. This information is only to improve our service',
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: getSize(15),
                    ),
                    Divider(
                      color: Colors.black.withOpacity(0.10),
                      height: 0,
                    ),
                    SizedBox(
                      height: getSize(15),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: state.refundReasonList.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Theme(
                        data: ThemeData(
                          splashFactory: NoSplash.splashFactory,
                          highlightColor: Colors.transparent,
                        ),
                        child: ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: getSize(5)),
                          splashColor: Colors.transparent,
                          onTap: () {
                            context
                                .read<MyOrdersBloc>()
                                .add(MyOrdersEvent.changeReturnReason(index));
                          },
                          minVerticalPadding: 0,
                          minLeadingWidth: 0,
                          dense: true,
                          visualDensity: VisualDensity(
                            vertical: VisualDensity.minimumDensity,
                            horizontal: VisualDensity.minimumDensity,
                          ),
                          leading: SvgPicture.asset(
                            state.selectedRefundReason == index
                                ? SvgImageConstant.emptyRadio
                                : SvgImageConstant.selectedRadio,
                          ),
                          title: BaseText(
                            text: state.refundReasonList[index],
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getSize(15),
                    ),
                    Divider(
                      color: Colors.black.withOpacity(0.10),
                      height: 0,
                    ),
                    SizedBox(
                      height: getSize(15),
                    ),
                    BaseText(
                      text: 'Upload Photo',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: getSize(5),
                    ),
                    BaseText(
                      text:
                          'Please upload the photo of defective product. This information is only to improve our service',
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  GestureDetector helpView(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(PageRouteInfo(HelpView.name));
      },
      child: Padding(
        padding: EdgeInsets.only(right: getSize(18)),
        child: Row(
          children: [
            SvgPicture.asset(
              SvgImageConstant.feedback,
              colorFilter: ColorFilter.mode(
                AppColors.primaryOrange,
                BlendMode.srcATop,
              ),
            ),
            SizedBox(
              width: getSize(6),
            ),
            BaseText(
              text: 'Help',
              fontSize: 12,
              textColor: AppColors.primaryOrange,
            )
          ],
        ),
      ),
    );
  }
}
