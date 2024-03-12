import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/cart/cart_bloc.dart';
import 'package:grape_customer_app/injection.dart';
import 'package:grape_customer_app/presentation/common/utils/flushbar_creator.dart';
import 'package:grape_customer_app/presentation/core/shimmer/simple_list_shimmer.dart';
import 'package:grape_customer_app/presentation/main/tabs/cart/widgets/cart_list_view.dart';

@RoutePage(name: 'CartView')
class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CartBloc>()..add(CartEvent.getCartList(true)),
      child: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          state.failureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                showError(
                  message: failure.maybeMap(
                    showAPIResponseMessage: (value) => value.message,
                    networkError: (value) =>
                        'Please check your internet connectivity',
                    orElse: () => "Server Error. Try again later.",
                  ),
                ).show(context);
              },
              (r) {
                showSuccess(
                  message: r,
                ).show(context);
                context.read<CartBloc>().add(
                      CartEvent.getCartList(true),
                    );
              },
            ),
          );
        },
        builder: (context, state) {
          if (state.isLoading) {
            return SimpleListShimmer();
          }
          return CartListView();
        },
      ),
    );
  }
}
