import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main_tab/main_tab_bloc.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/main/widgets/custom_bottom_navigation.dart';

@RoutePage(name: 'MainTabView')
class MainTabView extends StatelessWidget {
  const MainTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainTabBloc(),
      child: BlocBuilder<MainTabBloc, MainTabState>(
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: BaseText(text: 'Current Index : ${state.selectedTab}'),
            ),
            bottomNavigationBar: CustomBottomNavigationWidget(),
          );
        },
      ),
    );
  }
}
