import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_app_bar.dart';

@RoutePage(name: 'CheckoutView')
class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Checkout'),
    );
  }
}
