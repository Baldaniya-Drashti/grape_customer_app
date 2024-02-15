import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/profile/my_orders/my_orders_bloc.dart';
import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_app_bar.dart';
import 'package:grape_customer_app/presentation/main/tabs/profile/my_orders/widgets/my_orders_card.dart';

@RoutePage(name: 'MyOrders')
class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyOrdersBloc(),
      child: BlocConsumer<MyOrdersBloc, MyOrdersState>(
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(
              title: AppLocalizations.of(context).myOrders,
            ),
            body: ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: getSize(20),
                vertical: getSize(20),
              ),
              itemCount: 5,
              separatorBuilder: (context, index) => SizedBox(
                height: getSize(18),
              ),
              itemBuilder: (context, index) => MyOrdesCard(),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
