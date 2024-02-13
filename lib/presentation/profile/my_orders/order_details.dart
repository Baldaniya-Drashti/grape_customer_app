import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/profile/my_orders/my_orders_bloc.dart';
import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_app_bar.dart';
import 'package:grape_customer_app/presentation/profile/my_orders/widgets/item_detail_widget.dart';

@RoutePage(name: 'OrderDetails')
class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyOrdersBloc(),
      child: BlocConsumer<MyOrdersBloc, MyOrdersState>(
        builder: (context, state) {
          return Scaffold(
            appBar:
                CustomAppBar(title: AppLocalizations.of(context).orderDetails),
            body: ListView(
              padding: EdgeInsets.symmetric(
                  horizontal: getSize(18), vertical: getSize(20)),
              children: [
                ItemDetailWidget(),
              ],
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
