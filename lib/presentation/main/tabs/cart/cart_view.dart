import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:grape_customer_app/presentation/main/tabs/cart/widgets/cart_list_view.dart';

@RoutePage(name: 'CartView')
class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return CartListView();
  }
}
