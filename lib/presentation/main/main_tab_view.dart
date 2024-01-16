import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main_tab/main_tab_bloc.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart'
    as autoroute;
import 'package:grape_customer_app/presentation/main/tabs/cart_view.dart';
import 'package:grape_customer_app/presentation/main/tabs/favourite_view.dart';
import 'package:grape_customer_app/presentation/main/tabs/home_view.dart';
import 'package:grape_customer_app/presentation/main/tabs/notification_view.dart';
import 'package:grape_customer_app/presentation/main/tabs/profile_view.dart';
//import 'package:grape_customer_app/presentation/main/tabs/home_view.dart';

import 'package:grape_customer_app/presentation/main/widgets/custom_bottom_navigation.dart';

@RoutePage(name: 'MainTabView')
class MainTabView extends StatelessWidget {
  const MainTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MainTabBloc()..add(MainTabEvent.getCurrentLocation()),
      child: BlocBuilder<MainTabBloc, MainTabState>(
        builder: (context, state) {
          print('${context.read<MainTabBloc>().pageList}');
          return Scaffold(
            body: IndexedStack(
              index: state.pageIndex,
              children: List<Widget>.generate(
                context.read<MainTabBloc>().pageList.length,
                (int index) {
                  return Navigator(
                    onGenerateRoute: (RouteSettings settings) {
                      return onGenerateRoute(settings,
                          context.read<MainTabBloc>().pageList[index]);
                    },
                  );
                },
              ),
            ),
            bottomNavigationBar: CustomBottomNavigationWidget(),
          );
        },
      ),
    );
  }

  Route? onGenerateRoute(RouteSettings settings, String tabItem) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        if (tabItem == autoroute.HomeView.name) {
          return HomeView();
        } else if (tabItem == autoroute.FavouriteView.name) {
          return FavouriteView();
        } else if (tabItem == autoroute.CartView.name) {
          return CartView();
        } else if (tabItem == autoroute.NotificationView.name) {
          return NotificationView();
        } else if (tabItem == autoroute.ProfileView.name) {
          return ProfileView();
        }

        return Container();
      },
    );
    // if (tabItem == HomeView.name) {
    //   return PageRouteInfo(_name).;
    // } else if (tabItem == FavouriteView.name) {
    //   return getPageRoute(
    //     settings,
    //     OffersView(),
    //     binding: OffersBinding(),
    //   );
    // } else if (tabItem == CartView.name) {
    //   return getPageRoute(
    //     settings,
    //     RewardsView(),
    //     binding: RewardsBindings(),
    //   );
    // } else if (tabItem == NotificationView.name) {
    //   return getPageRoute(
    //     settings,
    //     FavoritesView(),
    //     binding: FavouritesBinding(),
    //   );
    // } else if (tabItem == ProfileView.name) {
    //   return getPageRoute(
    //     settings,
    //     ProfileView(),
    //     binding: ProfileBinding(),
    //   );
    // }
    // return null;
  }
}
