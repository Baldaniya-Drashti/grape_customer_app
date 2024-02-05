// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:flutter/material.dart' as _i20;
import 'package:grape_customer_app/application/main/profile/shipping_addresses/shipping_addresses_response.dart'
    as _i21;
import 'package:grape_customer_app/presentation/auth/login/login_screen.dart'
    as _i6;
import 'package:grape_customer_app/presentation/auth/login/otp_login_verification_screen.dart'
    as _i11;
import 'package:grape_customer_app/presentation/auth/register/otp_register_verification_screen.dart'
    as _i12;
import 'package:grape_customer_app/presentation/auth/register/register_screen.dart'
    as _i14;
import 'package:grape_customer_app/presentation/core/widgets/layout/success_view.dart'
    as _i18;
import 'package:grape_customer_app/presentation/main/main_tab_view.dart' as _i7;
import 'package:grape_customer_app/presentation/main/tabs/cart/cart_view.dart'
    as _i2;
import 'package:grape_customer_app/presentation/main/tabs/favourite/favourite_view.dart'
    as _i4;
import 'package:grape_customer_app/presentation/main/tabs/home/home_view.dart'
    as _i5;
import 'package:grape_customer_app/presentation/main/tabs/home/search/search_view.dart'
    as _i15;
import 'package:grape_customer_app/presentation/main/tabs/notification/notification_view.dart'
    as _i8;
import 'package:grape_customer_app/presentation/main/tabs/profile/profile_view.dart'
    as _i13;
import 'package:grape_customer_app/presentation/onboarding/onboarding_page.dart'
    as _i9;
import 'package:grape_customer_app/presentation/profile/edit_profile/edit_profile.dart'
    as _i3;
import 'package:grape_customer_app/presentation/profile/edit_profile/otp_edit_profile_verification_screen.dart'
    as _i10;
import 'package:grape_customer_app/presentation/profile/shipping_addresses/add_new_address.dart'
    as _i1;
import 'package:grape_customer_app/presentation/profile/shipping_addresses/shipping_addresses.dart'
    as _i16;
import 'package:grape_customer_app/presentation/splash/splash_page.dart'
    as _i17;

abstract class $AppRouter extends _i19.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i19.PageFactory> pagesMap = {
    AddNewAddress.name: (routeData) {
      final args = routeData.argsAs<AddNewAddressArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AddNewAddress(
          key: args.key,
          shippingAddressResponce: args.shippingAddressResponce,
        ),
      );
    },
    CartView.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CartView(),
      );
    },
    EditProfileScreen.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.EditProfileScreen(),
      );
    },
    FavouriteView.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.FavouriteView(),
      );
    },
    HomeView.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeView(),
      );
    },
    LoginPage.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.LoginScreen(),
      );
    },
    MainTabView.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.MainTabView(),
      );
    },
    NotificationView.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.NotificationView(),
      );
    },
    Onboarding.name: (routeData) {
      final args = routeData.argsAs<OnboardingArgs>(
          orElse: () => const OnboardingArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.OnBoardingPage(key: args.key),
      );
    },
    OtpEditProfileVerificationView.name: (routeData) {
      final args = routeData.argsAs<OtpEditProfileVerificationViewArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.OtpEditProfileVerificationView(
          key: args.key,
          countryCode: args.countryCode,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    OtpLoginVerificationView.name: (routeData) {
      final args = routeData.argsAs<OtpLoginVerificationViewArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.OtpLoginVerificationView(
          key: args.key,
          countryCode: args.countryCode,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    OtpRegisterVerificationView.name: (routeData) {
      final args = routeData.argsAs<OtpRegisterVerificationViewArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.OtpRegisterVerificationView(
          key: args.key,
          countryCode: args.countryCode,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    ProfileView.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.ProfileView(),
      );
    },
    RegisterScreen.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.RegisterScreen(),
      );
    },
    SearchView.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.SearchView(),
      );
    },
    ShippingAddresses.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.ShippingAddress(),
      );
    },
    SplashPage.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.SplashPage(),
      );
    },
    SuccessScreen.name: (routeData) {
      final args = routeData.argsAs<SuccessScreenArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.SuccessScreen(
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
/// [_i1.AddNewAddress]
class AddNewAddress extends _i19.PageRouteInfo<AddNewAddressArgs> {
  AddNewAddress({
    _i20.Key? key,
    required _i21.ShippingAddressResponse shippingAddressResponce,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          AddNewAddress.name,
          args: AddNewAddressArgs(
            key: key,
            shippingAddressResponce: shippingAddressResponce,
          ),
          initialChildren: children,
        );

  static const String name = 'AddNewAddress';

  static const _i19.PageInfo<AddNewAddressArgs> page =
      _i19.PageInfo<AddNewAddressArgs>(name);
}

class AddNewAddressArgs {
  const AddNewAddressArgs({
    this.key,
    required this.shippingAddressResponce,
  });

  final _i20.Key? key;

  final _i21.ShippingAddressResponse shippingAddressResponce;

  @override
  String toString() {
    return 'AddNewAddressArgs{key: $key, shippingAddressResponce: $shippingAddressResponce}';
  }
}

/// generated route for
/// [_i2.CartView]
class CartView extends _i19.PageRouteInfo<void> {
  const CartView({List<_i19.PageRouteInfo>? children})
      : super(
          CartView.name,
          initialChildren: children,
        );

  static const String name = 'CartView';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i3.EditProfileScreen]
class EditProfileScreen extends _i19.PageRouteInfo<void> {
  const EditProfileScreen({List<_i19.PageRouteInfo>? children})
      : super(
          EditProfileScreen.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileScreen';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i4.FavouriteView]
class FavouriteView extends _i19.PageRouteInfo<void> {
  const FavouriteView({List<_i19.PageRouteInfo>? children})
      : super(
          FavouriteView.name,
          initialChildren: children,
        );

  static const String name = 'FavouriteView';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomeView]
class HomeView extends _i19.PageRouteInfo<void> {
  const HomeView({List<_i19.PageRouteInfo>? children})
      : super(
          HomeView.name,
          initialChildren: children,
        );

  static const String name = 'HomeView';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i6.LoginScreen]
class LoginPage extends _i19.PageRouteInfo<void> {
  const LoginPage({List<_i19.PageRouteInfo>? children})
      : super(
          LoginPage.name,
          initialChildren: children,
        );

  static const String name = 'LoginPage';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i7.MainTabView]
class MainTabView extends _i19.PageRouteInfo<void> {
  const MainTabView({List<_i19.PageRouteInfo>? children})
      : super(
          MainTabView.name,
          initialChildren: children,
        );

  static const String name = 'MainTabView';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i8.NotificationView]
class NotificationView extends _i19.PageRouteInfo<void> {
  const NotificationView({List<_i19.PageRouteInfo>? children})
      : super(
          NotificationView.name,
          initialChildren: children,
        );

  static const String name = 'NotificationView';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i9.OnBoardingPage]
class Onboarding extends _i19.PageRouteInfo<OnboardingArgs> {
  Onboarding({
    _i20.Key? key,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          Onboarding.name,
          args: OnboardingArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'Onboarding';

  static const _i19.PageInfo<OnboardingArgs> page =
      _i19.PageInfo<OnboardingArgs>(name);
}

class OnboardingArgs {
  const OnboardingArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'OnboardingArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.OtpEditProfileVerificationView]
class OtpEditProfileVerificationView
    extends _i19.PageRouteInfo<OtpEditProfileVerificationViewArgs> {
  OtpEditProfileVerificationView({
    _i20.Key? key,
    required String countryCode,
    required String phoneNumber,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          OtpEditProfileVerificationView.name,
          args: OtpEditProfileVerificationViewArgs(
            key: key,
            countryCode: countryCode,
            phoneNumber: phoneNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'OtpEditProfileVerificationView';

  static const _i19.PageInfo<OtpEditProfileVerificationViewArgs> page =
      _i19.PageInfo<OtpEditProfileVerificationViewArgs>(name);
}

class OtpEditProfileVerificationViewArgs {
  const OtpEditProfileVerificationViewArgs({
    this.key,
    required this.countryCode,
    required this.phoneNumber,
  });

  final _i20.Key? key;

  final String countryCode;

  final String phoneNumber;

  @override
  String toString() {
    return 'OtpEditProfileVerificationViewArgs{key: $key, countryCode: $countryCode, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i11.OtpLoginVerificationView]
class OtpLoginVerificationView
    extends _i19.PageRouteInfo<OtpLoginVerificationViewArgs> {
  OtpLoginVerificationView({
    _i20.Key? key,
    required String countryCode,
    required String phoneNumber,
    List<_i19.PageRouteInfo>? children,
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

  static const _i19.PageInfo<OtpLoginVerificationViewArgs> page =
      _i19.PageInfo<OtpLoginVerificationViewArgs>(name);
}

class OtpLoginVerificationViewArgs {
  const OtpLoginVerificationViewArgs({
    this.key,
    required this.countryCode,
    required this.phoneNumber,
  });

  final _i20.Key? key;

  final String countryCode;

  final String phoneNumber;

  @override
  String toString() {
    return 'OtpLoginVerificationViewArgs{key: $key, countryCode: $countryCode, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i12.OtpRegisterVerificationView]
class OtpRegisterVerificationView
    extends _i19.PageRouteInfo<OtpRegisterVerificationViewArgs> {
  OtpRegisterVerificationView({
    _i20.Key? key,
    required String countryCode,
    required String phoneNumber,
    List<_i19.PageRouteInfo>? children,
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

  static const _i19.PageInfo<OtpRegisterVerificationViewArgs> page =
      _i19.PageInfo<OtpRegisterVerificationViewArgs>(name);
}

class OtpRegisterVerificationViewArgs {
  const OtpRegisterVerificationViewArgs({
    this.key,
    required this.countryCode,
    required this.phoneNumber,
  });

  final _i20.Key? key;

  final String countryCode;

  final String phoneNumber;

  @override
  String toString() {
    return 'OtpRegisterVerificationViewArgs{key: $key, countryCode: $countryCode, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i13.ProfileView]
class ProfileView extends _i19.PageRouteInfo<void> {
  const ProfileView({List<_i19.PageRouteInfo>? children})
      : super(
          ProfileView.name,
          initialChildren: children,
        );

  static const String name = 'ProfileView';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i14.RegisterScreen]
class RegisterScreen extends _i19.PageRouteInfo<void> {
  const RegisterScreen({List<_i19.PageRouteInfo>? children})
      : super(
          RegisterScreen.name,
          initialChildren: children,
        );

  static const String name = 'RegisterScreen';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i15.SearchView]
class SearchView extends _i19.PageRouteInfo<void> {
  const SearchView({List<_i19.PageRouteInfo>? children})
      : super(
          SearchView.name,
          initialChildren: children,
        );

  static const String name = 'SearchView';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i16.ShippingAddress]
class ShippingAddresses extends _i19.PageRouteInfo<void> {
  const ShippingAddresses({List<_i19.PageRouteInfo>? children})
      : super(
          ShippingAddresses.name,
          initialChildren: children,
        );

  static const String name = 'ShippingAddresses';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i17.SplashPage]
class SplashPage extends _i19.PageRouteInfo<void> {
  const SplashPage({List<_i19.PageRouteInfo>? children})
      : super(
          SplashPage.name,
          initialChildren: children,
        );

  static const String name = 'SplashPage';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i18.SuccessScreen]
class SuccessScreen extends _i19.PageRouteInfo<SuccessScreenArgs> {
  SuccessScreen({
    _i20.Key? key,
    required String title,
    required String subTitle,
    String? image,
    List<_i19.PageRouteInfo>? children,
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

  static const _i19.PageInfo<SuccessScreenArgs> page =
      _i19.PageInfo<SuccessScreenArgs>(name);
}

class SuccessScreenArgs {
  const SuccessScreenArgs({
    this.key,
    required this.title,
    required this.subTitle,
    this.image,
  });

  final _i20.Key? key;

  final String title;

  final String subTitle;

  final String? image;

  @override
  String toString() {
    return 'SuccessScreenArgs{key: $key, title: $title, subTitle: $subTitle, image: $image}';
  }
}
