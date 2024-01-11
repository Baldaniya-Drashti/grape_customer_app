// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:grape_customer_app/presentation/auth/login/login_screen.dart'
    as _i1;
import 'package:grape_customer_app/presentation/auth/register/register_screen.dart'
    as _i3;
import 'package:grape_customer_app/presentation/onboarding/onboarding_page.dart'
    as _i2;
import 'package:grape_customer_app/presentation/splash/splash_page.dart' as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    LoginPage.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.LoginScreen(),
      );
    },
    Onboarding.name: (routeData) {
      final args = routeData.argsAs<OnboardingArgs>(
          orElse: () => const OnboardingArgs());
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.OnBoardingPage(key: args.key),
      );
    },
    RegisterScreen.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.RegisterScreen(),
      );
    },
    SplashPage.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SplashPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.LoginScreen]
class LoginPage extends _i5.PageRouteInfo<void> {
  const LoginPage({List<_i5.PageRouteInfo>? children})
      : super(
          LoginPage.name,
          initialChildren: children,
        );

  static const String name = 'LoginPage';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.OnBoardingPage]
class Onboarding extends _i5.PageRouteInfo<OnboardingArgs> {
  Onboarding({
    _i6.Key? key,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          Onboarding.name,
          args: OnboardingArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'Onboarding';

  static const _i5.PageInfo<OnboardingArgs> page =
      _i5.PageInfo<OnboardingArgs>(name);
}

class OnboardingArgs {
  const OnboardingArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'OnboardingArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.RegisterScreen]
class RegisterScreen extends _i5.PageRouteInfo<void> {
  const RegisterScreen({List<_i5.PageRouteInfo>? children})
      : super(
          RegisterScreen.name,
          initialChildren: children,
        );

  static const String name = 'RegisterScreen';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SplashPage]
class SplashPage extends _i5.PageRouteInfo<void> {
  const SplashPage({List<_i5.PageRouteInfo>? children})
      : super(
          SplashPage.name,
          initialChildren: children,
        );

  static const String name = 'SplashPage';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
