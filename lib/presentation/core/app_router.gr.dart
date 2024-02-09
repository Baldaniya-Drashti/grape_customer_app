// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i24;
import 'package:flutter/material.dart' as _i25;
import 'package:grape_customer_app/application/main/profile/shipping_addresses/shipping_addresses_response.dart'
    as _i26;
import 'package:grape_customer_app/presentation/auth/login/login_screen.dart'
    as _i9;
import 'package:grape_customer_app/presentation/auth/login/otp_login_verification_screen.dart'
    as _i14;
import 'package:grape_customer_app/presentation/auth/register/otp_register_verification_screen.dart'
    as _i15;
import 'package:grape_customer_app/presentation/auth/register/register_screen.dart'
    as _i19;
import 'package:grape_customer_app/presentation/core/widgets/layout/success_view.dart'
    as _i23;
import 'package:grape_customer_app/presentation/main/chat/chat_view.dart'
    as _i4;
import 'package:grape_customer_app/presentation/main/main_tab_view.dart'
    as _i10;
import 'package:grape_customer_app/presentation/main/tabs/cart/cart_view.dart'
    as _i3;
import 'package:grape_customer_app/presentation/main/tabs/favourite/favourite_view.dart'
    as _i7;
import 'package:grape_customer_app/presentation/main/tabs/home/checkout/checkout_view.dart'
    as _i5;
import 'package:grape_customer_app/presentation/main/tabs/home/home_view.dart'
    as _i8;
import 'package:grape_customer_app/presentation/main/tabs/home/product_details/product_details_view.dart'
    as _i17;
import 'package:grape_customer_app/presentation/main/tabs/home/search/search_view.dart'
    as _i20;
import 'package:grape_customer_app/presentation/main/tabs/notification/notification_view.dart'
    as _i11;
import 'package:grape_customer_app/presentation/main/tabs/profile/profile_view.dart'
    as _i18;
import 'package:grape_customer_app/presentation/onboarding/onboarding_page.dart'
    as _i12;
import 'package:grape_customer_app/presentation/profile/edit_profile/edit_profile.dart'
    as _i6;
import 'package:grape_customer_app/presentation/profile/edit_profile/otp_edit_profile_verification_screen.dart'
    as _i13;
import 'package:grape_customer_app/presentation/profile/payment_method/add_new_card.dart'
    as _i2;
import 'package:grape_customer_app/presentation/profile/payment_method/payment_method.dart'
    as _i16;
import 'package:grape_customer_app/presentation/profile/shipping_addresses/add_new_address.dart'
    as _i1;
import 'package:grape_customer_app/presentation/profile/shipping_addresses/shipping_addresses.dart'
    as _i21;
import 'package:grape_customer_app/presentation/splash/splash_page.dart'
    as _i22;

abstract class $AppRouter extends _i24.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i24.PageFactory> pagesMap = {
    AddNewAddress.name: (routeData) {
      final args = routeData.argsAs<AddNewAddressArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AddNewAddress(
          key: args.key,
          shippingAddressResponce: args.shippingAddressResponce,
        ),
      );
    },
    AddNewCard.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AddNewCard(),
      );
    },
    CartView.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CartView(),
      );
    },
    ChatView.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ChatView(),
      );
    },
    CheckoutView.name: (routeData) {
      final args = routeData.argsAs<CheckoutViewArgs>(
          orElse: () => const CheckoutViewArgs());
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.CheckoutView(
          key: args.key,
          isFromCart: args.isFromCart,
        ),
      );
    },
    EditProfileScreen.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.EditProfileScreen(),
      );
    },
    FavouriteView.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.FavouriteView(),
      );
    },
    HomeView.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.HomeView(),
      );
    },
    LoginPage.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.LoginScreen(),
      );
    },
    MainTabView.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.MainTabView(),
      );
    },
    NotificationView.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.NotificationView(),
      );
    },
    Onboarding.name: (routeData) {
      final args = routeData.argsAs<OnboardingArgs>(
          orElse: () => const OnboardingArgs());
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.OnBoardingPage(key: args.key),
      );
    },
    OtpEditProfileVerificationView.name: (routeData) {
      final args = routeData.argsAs<OtpEditProfileVerificationViewArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.OtpEditProfileVerificationView(
          key: args.key,
          countryCode: args.countryCode,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    OtpLoginVerificationView.name: (routeData) {
      final args = routeData.argsAs<OtpLoginVerificationViewArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.OtpLoginVerificationView(
          key: args.key,
          countryCode: args.countryCode,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    OtpRegisterVerificationView.name: (routeData) {
      final args = routeData.argsAs<OtpRegisterVerificationViewArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.OtpRegisterVerificationView(
          key: args.key,
          countryCode: args.countryCode,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    PaymentMethod.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.PaymentMethod(),
      );
    },
    ProductDetailsView.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.ProductDetailsView(),
      );
    },
    ProfileView.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.ProfileView(),
      );
    },
    RegisterScreen.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.RegisterScreen(),
      );
    },
    SearchView.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.SearchView(),
      );
    },
    ShippingAddresses.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.ShippingAddress(),
      );
    },
    SplashPage.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.SplashPage(),
      );
    },
    SuccessScreen.name: (routeData) {
      final args = routeData.argsAs<SuccessScreenArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i23.SuccessScreen(
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
class AddNewAddress extends _i24.PageRouteInfo<AddNewAddressArgs> {
  AddNewAddress({
    _i25.Key? key,
    required _i26.ShippingAddressResponse shippingAddressResponce,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          AddNewAddress.name,
          args: AddNewAddressArgs(
            key: key,
            shippingAddressResponce: shippingAddressResponce,
          ),
          initialChildren: children,
        );

  static const String name = 'AddNewAddress';

  static const _i24.PageInfo<AddNewAddressArgs> page =
      _i24.PageInfo<AddNewAddressArgs>(name);
}

class AddNewAddressArgs {
  const AddNewAddressArgs({
    this.key,
    required this.shippingAddressResponce,
  });

  final _i25.Key? key;

  final _i26.ShippingAddressResponse shippingAddressResponce;

  @override
  String toString() {
    return 'AddNewAddressArgs{key: $key, shippingAddressResponce: $shippingAddressResponce}';
  }
}

/// generated route for
/// [_i2.AddNewCard]
class AddNewCard extends _i24.PageRouteInfo<void> {
  const AddNewCard({List<_i24.PageRouteInfo>? children})
      : super(
          AddNewCard.name,
          initialChildren: children,
        );

  static const String name = 'AddNewCard';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CartView]
class CartView extends _i24.PageRouteInfo<void> {
  const CartView({List<_i24.PageRouteInfo>? children})
      : super(
          CartView.name,
          initialChildren: children,
        );

  static const String name = 'CartView';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ChatView]
class ChatView extends _i24.PageRouteInfo<void> {
  const ChatView({List<_i24.PageRouteInfo>? children})
      : super(
          ChatView.name,
          initialChildren: children,
        );

  static const String name = 'ChatView';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i5.CheckoutView]
class CheckoutView extends _i24.PageRouteInfo<CheckoutViewArgs> {
  CheckoutView({
    _i25.Key? key,
    bool isFromCart = false,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          CheckoutView.name,
          args: CheckoutViewArgs(
            key: key,
            isFromCart: isFromCart,
          ),
          initialChildren: children,
        );

  static const String name = 'CheckoutView';

  static const _i24.PageInfo<CheckoutViewArgs> page =
      _i24.PageInfo<CheckoutViewArgs>(name);
}

class CheckoutViewArgs {
  const CheckoutViewArgs({
    this.key,
    this.isFromCart = false,
  });

  final _i25.Key? key;

  final bool isFromCart;

  @override
  String toString() {
    return 'CheckoutViewArgs{key: $key, isFromCart: $isFromCart}';
  }
}

/// generated route for
/// [_i6.EditProfileScreen]
class EditProfileScreen extends _i24.PageRouteInfo<void> {
  const EditProfileScreen({List<_i24.PageRouteInfo>? children})
      : super(
          EditProfileScreen.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileScreen';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i7.FavouriteView]
class FavouriteView extends _i24.PageRouteInfo<void> {
  const FavouriteView({List<_i24.PageRouteInfo>? children})
      : super(
          FavouriteView.name,
          initialChildren: children,
        );

  static const String name = 'FavouriteView';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i8.HomeView]
class HomeView extends _i24.PageRouteInfo<void> {
  const HomeView({List<_i24.PageRouteInfo>? children})
      : super(
          HomeView.name,
          initialChildren: children,
        );

  static const String name = 'HomeView';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i9.LoginScreen]
class LoginPage extends _i24.PageRouteInfo<void> {
  const LoginPage({List<_i24.PageRouteInfo>? children})
      : super(
          LoginPage.name,
          initialChildren: children,
        );

  static const String name = 'LoginPage';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i10.MainTabView]
class MainTabView extends _i24.PageRouteInfo<void> {
  const MainTabView({List<_i24.PageRouteInfo>? children})
      : super(
          MainTabView.name,
          initialChildren: children,
        );

  static const String name = 'MainTabView';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i11.NotificationView]
class NotificationView extends _i24.PageRouteInfo<void> {
  const NotificationView({List<_i24.PageRouteInfo>? children})
      : super(
          NotificationView.name,
          initialChildren: children,
        );

  static const String name = 'NotificationView';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i12.OnBoardingPage]
class Onboarding extends _i24.PageRouteInfo<OnboardingArgs> {
  Onboarding({
    _i25.Key? key,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          Onboarding.name,
          args: OnboardingArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'Onboarding';

  static const _i24.PageInfo<OnboardingArgs> page =
      _i24.PageInfo<OnboardingArgs>(name);
}

class OnboardingArgs {
  const OnboardingArgs({this.key});

  final _i25.Key? key;

  @override
  String toString() {
    return 'OnboardingArgs{key: $key}';
  }
}

/// generated route for
/// [_i13.OtpEditProfileVerificationView]
class OtpEditProfileVerificationView
    extends _i24.PageRouteInfo<OtpEditProfileVerificationViewArgs> {
  OtpEditProfileVerificationView({
    _i25.Key? key,
    required String countryCode,
    required String phoneNumber,
    List<_i24.PageRouteInfo>? children,
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

  static const _i24.PageInfo<OtpEditProfileVerificationViewArgs> page =
      _i24.PageInfo<OtpEditProfileVerificationViewArgs>(name);
}

class OtpEditProfileVerificationViewArgs {
  const OtpEditProfileVerificationViewArgs({
    this.key,
    required this.countryCode,
    required this.phoneNumber,
  });

  final _i25.Key? key;

  final String countryCode;

  final String phoneNumber;

  @override
  String toString() {
    return 'OtpEditProfileVerificationViewArgs{key: $key, countryCode: $countryCode, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i14.OtpLoginVerificationView]
class OtpLoginVerificationView
    extends _i24.PageRouteInfo<OtpLoginVerificationViewArgs> {
  OtpLoginVerificationView({
    _i25.Key? key,
    required String countryCode,
    required String phoneNumber,
    List<_i24.PageRouteInfo>? children,
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

  static const _i24.PageInfo<OtpLoginVerificationViewArgs> page =
      _i24.PageInfo<OtpLoginVerificationViewArgs>(name);
}

class OtpLoginVerificationViewArgs {
  const OtpLoginVerificationViewArgs({
    this.key,
    required this.countryCode,
    required this.phoneNumber,
  });

  final _i25.Key? key;

  final String countryCode;

  final String phoneNumber;

  @override
  String toString() {
    return 'OtpLoginVerificationViewArgs{key: $key, countryCode: $countryCode, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i15.OtpRegisterVerificationView]
class OtpRegisterVerificationView
    extends _i24.PageRouteInfo<OtpRegisterVerificationViewArgs> {
  OtpRegisterVerificationView({
    _i25.Key? key,
    required String countryCode,
    required String phoneNumber,
    List<_i24.PageRouteInfo>? children,
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

  static const _i24.PageInfo<OtpRegisterVerificationViewArgs> page =
      _i24.PageInfo<OtpRegisterVerificationViewArgs>(name);
}

class OtpRegisterVerificationViewArgs {
  const OtpRegisterVerificationViewArgs({
    this.key,
    required this.countryCode,
    required this.phoneNumber,
  });

  final _i25.Key? key;

  final String countryCode;

  final String phoneNumber;

  @override
  String toString() {
    return 'OtpRegisterVerificationViewArgs{key: $key, countryCode: $countryCode, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i16.PaymentMethod]
class PaymentMethod extends _i24.PageRouteInfo<void> {
  const PaymentMethod({List<_i24.PageRouteInfo>? children})
      : super(
          PaymentMethod.name,
          initialChildren: children,
        );

  static const String name = 'PaymentMethod';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i17.ProductDetailsView]
class ProductDetailsView extends _i24.PageRouteInfo<void> {
  const ProductDetailsView({List<_i24.PageRouteInfo>? children})
      : super(
          ProductDetailsView.name,
          initialChildren: children,
        );

  static const String name = 'ProductDetailsView';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i18.ProfileView]
class ProfileView extends _i24.PageRouteInfo<void> {
  const ProfileView({List<_i24.PageRouteInfo>? children})
      : super(
          ProfileView.name,
          initialChildren: children,
        );

  static const String name = 'ProfileView';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i19.RegisterScreen]
class RegisterScreen extends _i24.PageRouteInfo<void> {
  const RegisterScreen({List<_i24.PageRouteInfo>? children})
      : super(
          RegisterScreen.name,
          initialChildren: children,
        );

  static const String name = 'RegisterScreen';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i20.SearchView]
class SearchView extends _i24.PageRouteInfo<void> {
  const SearchView({List<_i24.PageRouteInfo>? children})
      : super(
          SearchView.name,
          initialChildren: children,
        );

  static const String name = 'SearchView';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i21.ShippingAddress]
class ShippingAddresses extends _i24.PageRouteInfo<void> {
  const ShippingAddresses({List<_i24.PageRouteInfo>? children})
      : super(
          ShippingAddresses.name,
          initialChildren: children,
        );

  static const String name = 'ShippingAddresses';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i22.SplashPage]
class SplashPage extends _i24.PageRouteInfo<void> {
  const SplashPage({List<_i24.PageRouteInfo>? children})
      : super(
          SplashPage.name,
          initialChildren: children,
        );

  static const String name = 'SplashPage';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i23.SuccessScreen]
class SuccessScreen extends _i24.PageRouteInfo<SuccessScreenArgs> {
  SuccessScreen({
    _i25.Key? key,
    required String title,
    required String subTitle,
    String? image,
    List<_i24.PageRouteInfo>? children,
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

  static const _i24.PageInfo<SuccessScreenArgs> page =
      _i24.PageInfo<SuccessScreenArgs>(name);
}

class SuccessScreenArgs {
  const SuccessScreenArgs({
    this.key,
    required this.title,
    required this.subTitle,
    this.image,
  });

  final _i25.Key? key;

  final String title;

  final String subTitle;

  final String? image;

  @override
  String toString() {
    return 'SuccessScreenArgs{key: $key, title: $title, subTitle: $subTitle, image: $image}';
  }
}
