import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/favourite/favourite_bloc.dart';
import 'package:grape_customer_app/injection.dart';
import 'package:grape_customer_app/presentation/common/utils/flushbar_creator.dart';
import 'package:grape_customer_app/presentation/core/shimmer/product_grid_shimmer.dart';
import 'package:grape_customer_app/presentation/main/tabs/favourite/widgets/favourite_grid_view.dart';

@RoutePage(name: 'FavouriteView')
class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<FavouriteBloc>()..add(FavouriteEvent.getFavouriteList(true)),
      child: BlocConsumer<FavouriteBloc, FavouriteState>(
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
                context.read<FavouriteBloc>().add(
                      FavouriteEvent.getFavouriteList(true),
                    );
              },
            ),
          );
        },
        builder: (context, state) {
          if (state.isLoading) {
            return ProductGridShimmerView();
          }
          return FavouriteGridView();
        },
      ),
    );
  }
}
