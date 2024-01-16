// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;
import 'package:grape_customer_app/presentation/auth/login/login_screen.dart'
    as _i4;
import 'package:grape_customer_app/presentation/auth/login/otp_login_verification_screen.dart'
    as _i8;
import 'package:grape_customer_app/presentation/auth/register/otp_register_verification_screen.dart'
    as _i9;
import 'package:grape_customer_app/presentation/auth/register/register_screen.dart'
    as _i11;
import 'package:grape_customer_app/presentation/core/widgets/layout/success_view.dart'
    as _i13;
import 'package:grape_customer_app/presentation/main/main_tab_view.dart' as _i5;
import 'package:grape_customer_app/presentation/main/tabs/cart_view.dart'
    as _i1;
import 'package:grape_customer_app/presentation/main/tabs/favourite_view.dart'
    as _i2;
import 'package:grape_customer_app/presentation/main/tabs/home_view.dart'
    as _i3;
import 'package:grape_customer_app/presentation/main/tabs/notification_view.dart'
    as _i6;
import 'package:grape_customer_app/presentation/main/tabs/profile_view.dart'
    as _i10;
import 'package:grape_customer_app/presentation/onboarding/onboarding_page.dart'
    as _i7;
import 'package:grape_customer_app/presentation/splash/splash_page.dart'
    as _i12;

abstract class $AppRouter extends _i14.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    CartView.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CartView(),
      );
    },
    FavouriteView.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.FavouriteView(),
      );
    },
    HomeView.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeView(),
      );
    },
    LoginPage.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginScreen(),
      );
    },
    MainTabView.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.MainTabView(),
      );
    },
    NotificationView.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.NotificationView(),
      );
    },
    Onboarding.name: (routeData) {
      final args = routeData.argsAs<OnboardingArgs>(
          orElse: () => const OnboardingArgs());
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.OnBoardingPage(key: args.key),
      );
    },
    OtpLoginVerificationView.name: (routeData) {
      final args = routeData.argsAs<OtpLoginVerificationViewArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.OtpLoginVerificationView(
          key: args.key,
          countryCode: args.countryCode,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    OtpRegisterVerificationView.name: (routeData) {
      final args = routeData.argsAs<OtpRegisterVerificationViewArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.OtpRegisterVerificationView(
          key: args.key,
          countryCode: args.countryCode,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    ProfileView.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.ProfileView(),
      );
    },
    RegisterScreen.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.RegisterScreen(),
      );
    },
    SplashPage.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.SplashPage(),
      );
    },
    SuccessScreen.name: (routeData) {
      final args = routeData.argsAs<SuccessScreenArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.SuccessScreen(
          key: args.key,
          title: args.title,
          subTitle: args.subTitle,
          image: args.image,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.CartView]
class CartView extends _i14.PageRouteInfo<void> {
  const CartView({List<_i14.PageRouteInfo>? children})
      : super(
          CartView.name,
          initialChildren: children,
        );

  static const String name = 'CartView';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i2.FavouriteView]
class FavouriteView extends _i14.PageRouteInfo<void> {
  const FavouriteView({List<_i14.PageRouteInfo>? children})
      : super(
          FavouriteView.name,
          initialChildren: children,
        );

  static const String name = 'FavouriteView';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeView]
class HomeView extends _i14.PageRouteInfo<void> {
  const HomeView({List<_i14.PageRouteInfo>? children})
      : super(
          HomeView.name,
          initialChildren: children,
        );

  static const String name = 'HomeView';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginScreen]
class LoginPage extends _i14.PageRouteInfo<void> {
  const LoginPage({List<_i14.PageRouteInfo>? children})
      : super(
          LoginPage.name,
          initialChildren: children,
        );

  static const String name = 'LoginPage';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i5.MainTabView]
class MainTabView extends _i14.PageRouteInfo<void> {
  const MainTabView({List<_i14.PageRouteInfo>? children})
      : super(
          MainTabView.name,
          initialChildren: children,
        );

  static const String name = 'MainTabView';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i6.NotificationView]
class NotificationView extends _i14.PageRouteInfo<void> {
  const NotificationView({List<_i14.PageRouteInfo>? children})
      : super(
          NotificationView.name,
          initialChildren: children,
        );

  static const String name = 'NotificationView';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i7.OnBoardingPage]
class Onboarding extends _i14.PageRouteInfo<OnboardingArgs> {
  Onboarding({
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          Onboarding.name,
          args: OnboardingArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'Onboarding';

  static const _i14.PageInfo<OnboardingArgs> page =
      _i14.PageInfo<OnboardingArgs>(name);
}

class OnboardingArgs {
  const OnboardingArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'OnboardingArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.OtpLoginVerificationView]
class OtpLoginVerificationView
    extends _i14.PageRouteInfo<OtpLoginVerificationViewArgs> {
  OtpLoginVerificationView({
    _i15.Key? key,
    required String countryCode,
    required String phoneNumber,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          OtpLoginVerificationView.name,
          args: OtpLoginVerificationViewArgs(
            key: key,
            countryCode: countryCode,
            phoneNumber: phoneNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'OtpLoginVerificationView';

  static const _i14.PageInfo<OtpLoginVerificationViewArgs> page =
      _i14.PageInfo<OtpLoginVerificationViewArgs>(name);
}

class OtpLoginVerificationViewArgs {
  const OtpLoginVerificationViewArgs({
    this.key,
    required this.countryCode,
    required this.phoneNumber,
  });

  final _i15.Key? key;

  final String countryCode;

  final String phoneNumber;

  @override
  String toString() {
    return 'OtpLoginVerificationViewArgs{key: $key, countryCode: $countryCode, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i9.OtpRegisterVerificationView]
class OtpRegisterVerificationView
    extends _i14.PageRouteInfo<OtpRegisterVerificationViewArgs> {
  OtpRegisterVerificationView({
    _i15.Key? key,
    required String countryCode,
    required String phoneNumber,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          OtpRegisterVerificationView.name,
          args: OtpRegisterVerificationViewArgs(
            key: key,
            countryCode: countryCode,
            phoneNumber: phoneNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'OtpRegisterVerificationView';

  static const _i14.PageInfo<OtpRegisterVerificationViewArgs> page =
      _i14.PageInfo<OtpRegisterVerificationViewArgs>(name);
}

class OtpRegisterVerificationViewArgs {
  const OtpRegisterVerificationViewArgs({
    this.key,
    required this.countryCode,
    required this.phoneNumber,
  });

  final _i15.Key? key;

  final String countryCode;

  final String phoneNumber;

  @override
  String toString() {
    return 'OtpRegisterVerificationViewArgs{key: $key, countryCode: $countryCode, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i10.ProfileView]
class ProfileView extends _i14.PageRouteInfo<void> {
  const ProfileView({List<_i14.PageRouteInfo>? children})
      : super(
          ProfileView.name,
          initialChildren: children,
        );

  static const String name = 'ProfileView';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i11.RegisterScreen]
class RegisterScreen extends _i14.PageRouteInfo<void> {
  const RegisterScreen({List<_i14.PageRouteInfo>? children})
      : super(
          RegisterScreen.name,
          initialChildren: children,
        );

  static const String name = 'RegisterScreen';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i12.SplashPage]
class SplashPage extends _i14.PageRouteInfo<void> {
  const SplashPage({List<_i14.PageRouteInfo>? children})
      : super(
          SplashPage.name,
          initialChildren: children,
        );

  static const String name = 'SplashPage';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i13.SuccessScreen]
class SuccessScreen extends _i14.PageRouteInfo<SuccessScreenArgs> {
  SuccessScreen({
    _i15.Key? key,
    required String title,
    required String subTitle,
    String? image,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          SuccessScreen.name,
          args: SuccessScreenArgs(
            key: key,
            title: title,
            subTitle: subTitle,
            image: image,
          ),
          initialChildren: children,
        );

  static const String name = 'SuccessScreen';

  static const _i14.PageInfo<SuccessScreenArgs> page =
      _i14.PageInfo<SuccessScreenArgs>(name);
}

class SuccessScreenArgs {
  const SuccessScreenArgs({
    this.key,
    required this.title,
    required this.subTitle,
    this.image,
  });

  final _i15.Key? key;

  final String title;

  final String subTitle;

  final String? image;

  @override
  String toString() {
    return 'SuccessScreenArgs{key: $key, title: $title, subTitle: $subTitle, image: $image}';
  }
}
