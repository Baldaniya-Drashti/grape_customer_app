// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:grape_customer_app/presentation/auth/login/login_screen.dart'
    as _i1;
import 'package:grape_customer_app/presentation/auth/login/otp_login_verification_screen.dart'
    as _i3;
import 'package:grape_customer_app/presentation/auth/register/otp_register_verification_screen.dart'
    as _i4;
import 'package:grape_customer_app/presentation/auth/register/register_screen.dart'
    as _i5;
import 'package:grape_customer_app/presentation/onboarding/onboarding_page.dart'
    as _i2;
import 'package:grape_customer_app/presentation/splash/splash_page.dart' as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    LoginPage.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.LoginScreen(),
      );
    },
    Onboarding.name: (routeData) {
      final args = routeData.argsAs<OnboardingArgs>(
          orElse: () => const OnboardingArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.OnBoardingPage(key: args.key),
      );
    },
    OtpLoginVerificationView.name: (routeData) {
      final args = routeData.argsAs<OtpLoginVerificationViewArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.OtpLoginVerificationView(
          key: args.key,
          countryCode: args.countryCode,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    OtpRegisterVerificationView.name: (routeData) {
      final args = routeData.argsAs<OtpRegisterVerificationViewArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.OtpRegisterVerificationView(
          key: args.key,
          countryCode: args.countryCode,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    RegisterScreen.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.RegisterScreen(),
      );
    },
    SplashPage.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SplashPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.LoginScreen]
class LoginPage extends _i7.PageRouteInfo<void> {
  const LoginPage({List<_i7.PageRouteInfo>? children})
      : super(
          LoginPage.name,
          initialChildren: children,
        );

  static const String name = 'LoginPage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.OnBoardingPage]
class Onboarding extends _i7.PageRouteInfo<OnboardingArgs> {
  Onboarding({
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          Onboarding.name,
          args: OnboardingArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'Onboarding';

  static const _i7.PageInfo<OnboardingArgs> page =
      _i7.PageInfo<OnboardingArgs>(name);
}

class OnboardingArgs {
  const OnboardingArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'OnboardingArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.OtpLoginVerificationView]
class OtpLoginVerificationView
    extends _i7.PageRouteInfo<OtpLoginVerificationViewArgs> {
  OtpLoginVerificationView({
    _i8.Key? key,
    required String countryCode,
    required String phoneNumber,
    List<_i7.PageRouteInfo>? children,
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

  static const _i7.PageInfo<OtpLoginVerificationViewArgs> page =
      _i7.PageInfo<OtpLoginVerificationViewArgs>(name);
}

class OtpLoginVerificationViewArgs {
  const OtpLoginVerificationViewArgs({
    this.key,
    required this.countryCode,
    required this.phoneNumber,
  });

  final _i8.Key? key;

  final String countryCode;

  final String phoneNumber;

  @override
  String toString() {
    return 'OtpLoginVerificationViewArgs{key: $key, countryCode: $countryCode, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i4.OtpRegisterVerificationView]
class OtpRegisterVerificationView
    extends _i7.PageRouteInfo<OtpRegisterVerificationViewArgs> {
  OtpRegisterVerificationView({
    _i8.Key? key,
    required String countryCode,
    required String phoneNumber,
    List<_i7.PageRouteInfo>? children,
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

  static const _i7.PageInfo<OtpRegisterVerificationViewArgs> page =
      _i7.PageInfo<OtpRegisterVerificationViewArgs>(name);
}

class OtpRegisterVerificationViewArgs {
  const OtpRegisterVerificationViewArgs({
    this.key,
    required this.countryCode,
    required this.phoneNumber,
  });

  final _i8.Key? key;

  final String countryCode;

  final String phoneNumber;

  @override
  String toString() {
    return 'OtpRegisterVerificationViewArgs{key: $key, countryCode: $countryCode, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i5.RegisterScreen]
class RegisterScreen extends _i7.PageRouteInfo<void> {
  const RegisterScreen({List<_i7.PageRouteInfo>? children})
      : super(
          RegisterScreen.name,
          initialChildren: children,
        );

  static const String name = 'RegisterScreen';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SplashPage]
class SplashPage extends _i7.PageRouteInfo<void> {
  const SplashPage({List<_i7.PageRouteInfo>? children})
      : super(
          SplashPage.name,
          initialChildren: children,
        );

  static const String name = 'SplashPage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
