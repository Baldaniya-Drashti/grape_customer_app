import 'package:flutter/material.dart';
import 'package:grape_customer_app/presentation/auth/forgot_password/forgot_password_screen.dart';
import 'package:grape_customer_app/presentation/auth/login/login_screen.dart';
import 'package:grape_customer_app/presentation/auth/register/register_screen.dart';
import 'package:grape_customer_app/presentation/auth/start_up_screen.dart';
import 'package:grape_customer_app/presentation/core/screen_transitions/fade_transition_route.dart';
import 'package:grape_customer_app/presentation/core/screen_transitions/slide_transition_route.dart';
import 'package:grape_customer_app/presentation/main/home_view.dart';

import 'package:grape_customer_app/presentation/splash/splash_page.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashPage.routeName:
        return FadeTransitionRoute(
          page: SplashPage(),
        );

      case StartUpScreen.routeName:
        return FadeTransitionRoute(
          page: StartUpScreen(),
        );

      case LoginScreen.routeName:
        return SlideTransitionRoute(
          page: LoginScreen(),
        );

      case RegisterScreen.routeName:
        return SlideTransitionRoute(
          page: RegisterScreen(),
        );

      case ForgotPasswordScreen.routeName:
        return SlideTransitionRoute(
          page: ForgotPasswordScreen(),
        );
      case HomeView.routeName:
        return FadeTransitionRoute(
          page: HomeView(),
        );
      default:
        return FadeTransitionRoute(
          page: SplashPage(),
        );
    }
  }
}
