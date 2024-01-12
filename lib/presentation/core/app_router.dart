import 'package:auto_route/auto_route.dart';

import 'package:grape_customer_app/presentation/core/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashPage.page, initial: true),
        AutoRoute(page: Onboarding.page),
        AutoRoute(page: LoginPage.page),
        AutoRoute(page: RegisterScreen.page),
        AutoRoute(page: OtpRegisterVerificationView.page),
        AutoRoute(page: OtpLoginVerificationView.page),
      ];
}
