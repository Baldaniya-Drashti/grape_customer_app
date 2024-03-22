import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/home/home_bloc.dart';
import 'package:grape_customer_app/application/main/notifications/notifications_bloc.dart';
import 'package:grape_customer_app/application/main/profile/get_account/account_cubit.dart';
import 'package:grape_customer_app/application/main_tab/main_tab_bloc.dart';

import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';
import 'package:grape_customer_app/injection.dart';
import 'package:grape_customer_app/presentation/common/utils/app_focus.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart'
    as autoroute;
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_app_bar.dart';
import 'package:grape_customer_app/presentation/main/tabs/cart/cart_view.dart';
import 'package:grape_customer_app/presentation/main/tabs/notification/widgets/notification_appbar.dart';
import 'package:grape_customer_app/presentation/main/tabs/favourite/favourite_view.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/home_view.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/widgets/home_app_bar.dart';
import 'package:grape_customer_app/presentation/main/tabs/notification/notification_view.dart';
import 'package:grape_customer_app/presentation/main/tabs/profile/profile_view.dart';
//import 'package:grape_customer_app/presentation/main/tabs/home_view.dart';

import 'package:grape_customer_app/presentation/main/widgets/custom_bottom_navigation.dart';

@RoutePage(name: 'MainTabView')
class MainTabView extends StatelessWidget {
  const MainTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              getIt<MainTabBloc>()..add(MainTabEvent.initDynamicLink(context)),
        ),
        BlocProvider<AccountCubit>(
          create: (context) => getIt<AccountCubit>()..getAccount(),
        ),
        BlocProvider(
          create: (context) =>
              getIt<HomeBloc>()..add(HomeEvent.getProductList(true)),
        ),
        BlocProvider(
          create: (context) => NotificationsBloc(),
        ),
      ],
      child: BlocBuilder<MainTabBloc, MainTabState>(
        builder: (context, state) {
          // context
          //     .read<MainTabBloc>()
          //     .add(MainTabEvent.pushNotificationInitialize(context));
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: getAppbar(state, context),
              body: GestureDetector(
                onTap: () {
                  AppFocus.unfocus(context);
                },
                child: IndexedStack(
                  index: state.pageIndex,
                  children: List<Widget>.generate(
                    context.read<MainTabBloc>().pageList.length,
                    (int index) {
                      return Navigator(
                        onGenerateRoute: (RouteSettings settings) {
                          return onGenerateRoute(
                            settings,
                            context.read<MainTabBloc>().pageList[index],
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              bottomNavigationBar: CustomBottomNavigationWidget(),
            ),
          );
        },
      ),
    );
  }
}

getAppbar(MainTabState state, BuildContext context) {
  switch (state.selectedTab) {
    case 0:
      return HomeAppbar();
    case 1:
      return CustomAppBar(title: AppLocalizations.of(context).favorites);
    case 2:
      return CustomAppBar(title: AppLocalizations.of(context).myCart);
    case 3:
      return NotificationAppBar();
    case 4:
      return CustomAppBar(title: AppLocalizations.of(context).profile);
    default:
  }
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
}
