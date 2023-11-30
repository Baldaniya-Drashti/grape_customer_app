import 'package:get/get.dart';
import 'package:grape_customer_app/modules/splash/splash_binding.dart';
import 'package:grape_customer_app/modules/splash/splash_view.dart';

import '../modules/main/main_binding.dart';
import '../modules/main/main_tab.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.MAIN,
      page: () => MainTab(),
      binding: MainBindings(),
      children: [],
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
      children: [],
    ),
  ];
}
