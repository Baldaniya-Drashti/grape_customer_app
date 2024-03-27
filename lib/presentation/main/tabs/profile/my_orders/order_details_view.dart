import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/profile/my_orders/my_orders_bloc.dart';
import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/injection.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_app_bar.dart';
import 'package:grape_customer_app/presentation/main/tabs/profile/my_orders/widgets/order_detail_item.dart';
import 'package:grape_customer_app/presentation/main/tabs/profile/my_orders/widgets/order_detail_paid_amount.dart';
import 'package:grape_customer_app/presentation/main/tabs/profile/my_orders/widgets/order_detail_payment_method.dart';
import 'package:grape_customer_app/presentation/main/tabs/profile/my_orders/widgets/order_detail_shipping_address.dart';
import 'package:grape_customer_app/presentation/main/tabs/profile/my_orders/widgets/order_detail_track_order.dart';

@RoutePage(name: 'OrderDetails')
class OrderDetails extends StatelessWidget {
  final String orderId;
  const OrderDetails({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<MyOrdersBloc>()..add(MyOrdersEvent.getOrderDetail(orderId)),
      child: BlocConsumer<MyOrdersBloc, MyOrdersState>(
        builder: (context, state) {
          return Scaffold(
            appBar:
                CustomAppBar(title: AppLocalizations.of(context).orderDetails),
            body: state.isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryOrange,
                    ),
                  )
                : state.isErrorInAPI
                    ? Center(
                        child: BaseText(
                            text: 'Something went wrong. Please try again'),
                      )
                    : ListView(
                        padding: EdgeInsets.symmetric(
                          horizontal: getSize(18),
                          vertical: getSize(20),
                        ),
                        physics: BouncingScrollPhysics(),
                        children: [
                          OrderDetailItem(),
                          OrderDetailTrackOrder(),
                          OrderDetailPaidAmount(),
                          OrderDetailShippingAddress(),
                          OrderDetailPaymentMethod(),
                        ],
                      ),
            bottomNavigationBar: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getSize(18),
                  vertical: isFullScreenDevice(context) ? 0 : getSize(18),
                ),
                child: BaseText(
                  text: 'Cancel Order',
                  textAlign: TextAlign.center,
                  textColor: Color(0xFFDC0505),
                ),
              ),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
