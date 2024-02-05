// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
<<<<<<< HEAD
<<<<<<< HEAD
import 'package:auto_route/auto_route.dart' as _i25;
import 'package:flutter/material.dart' as _i26;
import 'package:grape_customer_app/application/main/profile/shipping_addresses/shipping_addresses_response.dart'
    as _i27;
import 'package:auto_route/auto_route.dart' as _i18;
import 'package:flutter/material.dart' as _i19;
=======
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:flutter/material.dart' as _i20;
>>>>>>> 4a267b3 (maitry : search view completed)
=======
import 'package:auto_route/auto_route.dart' as _i20;
import 'package:flutter/material.dart' as _i21;
>>>>>>> ca68361 (maitry : product details in progress)
import 'package:grape_customer_app/application/main/profile/shipping_addresses/shipping_addresses_response.dart'
    as _i22;
import 'package:grape_customer_app/presentation/auth/login/login_screen.dart'
    as _i8;
import 'package:grape_customer_app/presentation/auth/login/otp_login_verification_screen.dart'
    as _i15;
import 'package:grape_customer_app/presentation/auth/register/otp_register_verification_screen.dart'
    as _i16;
import 'package:grape_customer_app/presentation/auth/register/register_screen.dart'
<<<<<<< HEAD
    as _i20;
import 'package:grape_customer_app/presentation/core/widgets/layout/success_view.dart'
<<<<<<< HEAD
    as _i24;
import 'package:grape_customer_app/presentation/main/main_tab_view.dart' as _i9;
=======
    as _i18;
=======
    as _i15;
import 'package:grape_customer_app/presentation/core/widgets/layout/success_view.dart'
    as _i19;
>>>>>>> ca68361 (maitry : product details in progress)
import 'package:grape_customer_app/presentation/main/main_tab_view.dart' as _i7;
>>>>>>> 4a267b3 (maitry : search view completed)
import 'package:grape_customer_app/presentation/main/tabs/cart/cart_view.dart'
    as _i3;
import 'package:grape_customer_app/presentation/main/tabs/favourite/favourite_view.dart'
    as _i6;
import 'package:grape_customer_app/presentation/main/tabs/home/checkout/checkout_view.dart'
    as _i4;
import 'package:grape_customer_app/presentation/main/tabs/home/home_view.dart'
<<<<<<< HEAD
    as _i7;
import 'package:grape_customer_app/presentation/main/tabs/home/product_details/product_details_view.dart'
    as _i18;
import 'package:grape_customer_app/presentation/main/tabs/home/search/search_view.dart'
    as _i21;
=======
    as _i5;
import 'package:grape_customer_app/presentation/main/tabs/home/product_details/product_details_view.dart'
    as _i13;
import 'package:grape_customer_app/presentation/main/tabs/home/search/search_view.dart'
<<<<<<< HEAD
    as _i15;
>>>>>>> 4a267b3 (maitry : search view completed)
=======
    as _i16;
>>>>>>> ca68361 (maitry : product details in progress)
import 'package:grape_customer_app/presentation/main/tabs/notification/notification_view.dart'
    as _i11;
import 'package:grape_customer_app/presentation/main/tabs/profile/profile_view.dart'
<<<<<<< HEAD
    as _i19;
=======
    as _i14;
>>>>>>> ca68361 (maitry : product details in progress)
import 'package:grape_customer_app/presentation/onboarding/onboarding_page.dart'
    as _i12;
import 'package:grape_customer_app/presentation/profile/edit_profile/edit_profile.dart'
    as _i5;
import 'package:grape_customer_app/presentation/profile/edit_profile/otp_edit_profile_verification_screen.dart'
    as _i14;
import 'package:grape_customer_app/presentation/profile/my_orders/my_orders.dart'
    as _i10;
import 'package:grape_customer_app/presentation/profile/my_orders/order_details.dart'
    as _i13;
import 'package:grape_customer_app/presentation/profile/payment_method/add_new_card.dart'
    as _i2;
import 'package:grape_customer_app/presentation/profile/payment_method/payment_method.dart'
    as _i17;
import 'package:grape_customer_app/presentation/profile/shipping_addresses/add_new_address.dart'
    as _i1;
import 'package:grape_customer_app/presentation/profile/shipping_addresses/shipping_addresses.dart'
<<<<<<< HEAD
<<<<<<< HEAD
    as _i22;
import 'package:grape_customer_app/presentation/splash/splash_page.dart'
    as _i23;

abstract class $AppRouter extends _i25.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i25.PageFactory> pagesMap = {
    AddNewAddress.name: (routeData) {
      final args = routeData.argsAs<AddNewAddressArgs>();
      return _i25.AutoRoutePage<dynamic>(
=======
    as _i16;
import 'package:grape_customer_app/presentation/splash/splash_page.dart'
=======
>>>>>>> ca68361 (maitry : product details in progress)
    as _i17;
import 'package:grape_customer_app/presentation/splash/splash_page.dart'
    as _i18;

abstract class $AppRouter extends _i20.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i20.PageFactory> pagesMap = {
    AddNewAddress.name: (routeData) {
      final args = routeData.argsAs<AddNewAddressArgs>();
<<<<<<< HEAD
      return _i19.AutoRoutePage<dynamic>(
>>>>>>> 4a267b3 (maitry : search view completed)
=======
      return _i20.AutoRoutePage<dynamic>(
>>>>>>> ca68361 (maitry : product details in progress)
        routeData: routeData,
        child: _i1.AddNewAddress(
          key: args.key,
          shippingAddressResponce: args.shippingAddressResponce,
        ),
      );
    },
<<<<<<< HEAD
    AddNewCard.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
=======
    CartView.name: (routeData) {
<<<<<<< HEAD
      return _i19.AutoRoutePage<dynamic>(
>>>>>>> 4a267b3 (maitry : search view completed)
=======
      return _i20.AutoRoutePage<dynamic>(
>>>>>>> ca68361 (maitry : product details in progress)
        routeData: routeData,
        child: const _i2.AddNewCard(),
      );
    },
    CartView.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CartView(),
      );
    },
    CheckoutView.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.CheckoutView(),
      );
    },
    EditProfileScreen.name: (routeData) {
<<<<<<< HEAD
<<<<<<< HEAD
      return _i25.AutoRoutePage<dynamic>(
=======
      return _i19.AutoRoutePage<dynamic>(
>>>>>>> 4a267b3 (maitry : search view completed)
=======
      return _i20.AutoRoutePage<dynamic>(
>>>>>>> ca68361 (maitry : product details in progress)
        routeData: routeData,
        child: const _i5.EditProfileScreen(),
      );
    },
    FavouriteView.name: (routeData) {
<<<<<<< HEAD
<<<<<<< HEAD
      return _i25.AutoRoutePage<dynamic>(
=======
      return _i19.AutoRoutePage<dynamic>(
>>>>>>> 4a267b3 (maitry : search view completed)
=======
      return _i20.AutoRoutePage<dynamic>(
>>>>>>> ca68361 (maitry : product details in progress)
        routeData: routeData,
        child: const _i6.FavouriteView(),
      );
    },
    HomeView.name: (routeData) {
<<<<<<< HEAD
<<<<<<< HEAD
      return _i25.AutoRoutePage<dynamic>(
=======
      return _i19.AutoRoutePage<dynamic>(
>>>>>>> 4a267b3 (maitry : search view completed)
=======
      return _i20.AutoRoutePage<dynamic>(
>>>>>>> ca68361 (maitry : product details in progress)
        routeData: routeData,
        child: const _i7.HomeView(),
      );
    },
    LoginPage.name: (routeData) {
<<<<<<< HEAD
<<<<<<< HEAD
      return _i25.AutoRoutePage<dynamic>(
=======
      return _i19.AutoRoutePage<dynamic>(
>>>>>>> 4a267b3 (maitry : search view completed)
=======
      return _i20.AutoRoutePage<dynamic>(
>>>>>>> ca68361 (maitry : product details in progress)
        routeData: routeData,
        child: const _i8.LoginScreen(),
      );
    },
    MainTabView.name: (routeData) {
<<<<<<< HEAD
<<<<<<< HEAD
      return _i25.AutoRoutePage<dynamic>(
=======
      return _i19.AutoRoutePage<dynamic>(
>>>>>>> 4a267b3 (maitry : search view completed)
=======
      return _i20.AutoRoutePage<dynamic>(
>>>>>>> ca68361 (maitry : product details in progress)
        routeData: routeData,
        child: const _i9.MainTabView(),
      );
    },
    MyOrders.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.MyOrders(),
      );
    },
    NotificationView.name: (routeData) {
<<<<<<< HEAD
<<<<<<< HEAD
      return _i25.AutoRoutePage<dynamic>(
=======
      return _i19.AutoRoutePage<dynamic>(
>>>>>>> 4a267b3 (maitry : search view completed)
=======
      return _i20.AutoRoutePage<dynamic>(
>>>>>>> ca68361 (maitry : product details in progress)
        routeData: routeData,
        child: const _i11.NotificationView(),
      );
    },
    Onboarding.name: (routeData) {
      final args = routeData.argsAs<OnboardingArgs>(
          orElse: () => const OnboardingArgs());
<<<<<<< HEAD
<<<<<<< HEAD
      return _i25.AutoRoutePage<dynamic>(
=======
      return _i19.AutoRoutePage<dynamic>(
>>>>>>> 4a267b3 (maitry : search view completed)
=======
      return _i20.AutoRoutePage<dynamic>(
>>>>>>> ca68361 (maitry : product details in progress)
        routeData: routeData,
        child: _i12.OnBoardingPage(key: args.key),
      );
    },
    OrderDetails.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.OrderDetails(),
      );
    },
    OtpEditProfileVerificationView.name: (routeData) {
      final args = routeData.argsAs<OtpEditProfileVerificationViewArgs>();
<<<<<<< HEAD
<<<<<<< HEAD
      return _i25.AutoRoutePage<dynamic>(
=======
      return _i19.AutoRoutePage<dynamic>(
>>>>>>> 4a267b3 (maitry : search view completed)
=======
      return _i20.AutoRoutePage<dynamic>(
>>>>>>> ca68361 (maitry : product details in progress)
        routeData: routeData,
        child: _i14.OtpEditProfileVerificationView(
          key: args.key,
          countryCode: args.countryCode,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    OtpLoginVerificationView.name: (routeData) {
      final args = routeData.argsAs<OtpLoginVerificationViewArgs>();
<<<<<<< HEAD
<<<<<<< HEAD
      return _i25.AutoRoutePage<dynamic>(
=======
      return _i19.AutoRoutePage<dynamic>(
>>>>>>> 4a267b3 (maitry : search view completed)
=======
      return _i20.AutoRoutePage<dynamic>(
>>>>>>> ca68361 (maitry : product details in progress)
        routeData: routeData,
        child: _i15.OtpLoginVerificationView(
          key: args.key,
          countryCode: args.countryCode,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    OtpRegisterVerificationView.name: (routeData) {
      final args = routeData.argsAs<OtpRegisterVerificationViewArgs>();
<<<<<<< HEAD
<<<<<<< HEAD
      return _i25.AutoRoutePage<dynamic>(
=======
      return _i19.AutoRoutePage<dynamic>(
>>>>>>> 4a267b3 (maitry : search view completed)
=======
      return _i20.AutoRoutePage<dynamic>(
>>>>>>> ca68361 (maitry : product details in progress)
        routeData: routeData,
        child: _i16.OtpRegisterVerificationView(
          key: args.key,
          countryCode: args.countryCode,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    ProductDetailsView.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
<<<<<<< HEAD
        child: const _i17.PaymentMethod(),
      );
    },
    ProductDetailsView.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.ProductDetailsView(),
      );
    },
    ProfileView.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.ProfileView(),
=======
        child: const _i13.ProductDetailsView(),
      );
    },
    ProfileView.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.ProfileView(),
>>>>>>> ca68361 (maitry : product details in progress)
      );
    },
    RegisterScreen.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
<<<<<<< HEAD
        child: const _i20.RegisterScreen(),
      );
    },
    SearchView.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.SearchView(),
=======
        child: const _i15.RegisterScreen(),
>>>>>>> ca68361 (maitry : product details in progress)
      );
    },
    SearchView.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.SearchView(),
      );
    },
    ShippingAddresses.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.ShippingAddress(),
      );
    },
    SplashPage.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.SplashPage(),
      );
    },
    SuccessScreen.name: (routeData) {
      final args = routeData.argsAs<SuccessScreenArgs>();
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.SuccessScreen(
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
class AddNewAddress extends _i20.PageRouteInfo<AddNewAddressArgs> {
  AddNewAddress({
    _i21.Key? key,
    required _i22.ShippingAddressResponse shippingAddressResponce,
    List<_i20.PageRouteInfo>? children,
  }) : super(
          AddNewAddress.name,
          args: AddNewAddressArgs(
            key: key,
            shippingAddressResponce: shippingAddressResponce,
          ),
          initialChildren: children,
        );

  static const String name = 'AddNewAddress';

  static const _i20.PageInfo<AddNewAddressArgs> page =
      _i20.PageInfo<AddNewAddressArgs>(name);
}

class AddNewAddressArgs {
  const AddNewAddressArgs({
    this.key,
    required this.shippingAddressResponce,
  });

  final _i21.Key? key;

  final _i22.ShippingAddressResponse shippingAddressResponce;

  @override
  String toString() {
    return 'AddNewAddressArgs{key: $key, shippingAddressResponce: $shippingAddressResponce}';
  }
}

/// generated route for
/// [_i2.CartView]
class CartView extends _i20.PageRouteInfo<void> {
  const CartView({List<_i20.PageRouteInfo>? children})
      : super(
          CartView.name,
          initialChildren: children,
        );

  static const String name = 'CartView';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i3.EditProfileScreen]
class EditProfileScreen extends _i20.PageRouteInfo<void> {
  const EditProfileScreen({List<_i20.PageRouteInfo>? children})
      : super(
          EditProfileScreen.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileScreen';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i4.FavouriteView]
class FavouriteView extends _i20.PageRouteInfo<void> {
  const FavouriteView({List<_i20.PageRouteInfo>? children})
      : super(
          FavouriteView.name,
          initialChildren: children,
        );

  static const String name = 'FavouriteView';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomeView]
class HomeView extends _i20.PageRouteInfo<void> {
  const HomeView({List<_i20.PageRouteInfo>? children})
      : super(
          HomeView.name,
          initialChildren: children,
        );

  static const String name = 'HomeView';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i6.LoginScreen]
class LoginPage extends _i20.PageRouteInfo<void> {
  const LoginPage({List<_i20.PageRouteInfo>? children})
      : super(
          LoginPage.name,
          initialChildren: children,
        );

  static const String name = 'LoginPage';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i7.MainTabView]
class MainTabView extends _i20.PageRouteInfo<void> {
  const MainTabView({List<_i20.PageRouteInfo>? children})
      : super(
          MainTabView.name,
          initialChildren: children,
        );

  static const String name = 'MainTabView';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i8.NotificationView]
class NotificationView extends _i20.PageRouteInfo<void> {
  const NotificationView({List<_i20.PageRouteInfo>? children})
      : super(
          NotificationView.name,
          initialChildren: children,
        );

  static const String name = 'NotificationView';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i9.OnBoardingPage]
class Onboarding extends _i20.PageRouteInfo<OnboardingArgs> {
  Onboarding({
    _i21.Key? key,
    List<_i20.PageRouteInfo>? children,
  }) : super(
          Onboarding.name,
          args: OnboardingArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'Onboarding';

  static const _i20.PageInfo<OnboardingArgs> page =
      _i20.PageInfo<OnboardingArgs>(name);
}

class OnboardingArgs {
  const OnboardingArgs({this.key});

  final _i21.Key? key;

  @override
  String toString() {
    return 'OnboardingArgs{key: $key}';
  }
}

/// generated route for
/// [_i13.OrderDetails]
class OrderDetails extends _i25.PageRouteInfo<void> {
  const OrderDetails({List<_i25.PageRouteInfo>? children})
      : super(
          OrderDetails.name,
          initialChildren: children,
        );

  static const String name = 'OrderDetails';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i14.OtpEditProfileVerificationView]
class OtpEditProfileVerificationView
    extends _i20.PageRouteInfo<OtpEditProfileVerificationViewArgs> {
  OtpEditProfileVerificationView({
    _i21.Key? key,
    required String countryCode,
    required String phoneNumber,
    List<_i20.PageRouteInfo>? children,
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

  static const _i20.PageInfo<OtpEditProfileVerificationViewArgs> page =
      _i20.PageInfo<OtpEditProfileVerificationViewArgs>(name);
}

class OtpEditProfileVerificationViewArgs {
  const OtpEditProfileVerificationViewArgs({
    this.key,
    required this.countryCode,
    required this.phoneNumber,
  });

  final _i21.Key? key;

  final String countryCode;

  final String phoneNumber;

  @override
  String toString() {
    return 'OtpEditProfileVerificationViewArgs{key: $key, countryCode: $countryCode, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i15.OtpLoginVerificationView]
class OtpLoginVerificationView
    extends _i20.PageRouteInfo<OtpLoginVerificationViewArgs> {
  OtpLoginVerificationView({
    _i21.Key? key,
    required String countryCode,
    required String phoneNumber,
    List<_i20.PageRouteInfo>? children,
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

<<<<<<< HEAD
<<<<<<< HEAD
  static const _i25.PageInfo<OtpLoginVerificationViewArgs> page =
      _i25.PageInfo<OtpLoginVerificationViewArgs>(name);
=======
  static const _i19.PageInfo<OtpLoginVerificationViewArgs> page =
      _i19.PageInfo<OtpLoginVerificationViewArgs>(name);
>>>>>>> 4a267b3 (maitry : search view completed)
=======
  static const _i20.PageInfo<OtpLoginVerificationViewArgs> page =
      _i20.PageInfo<OtpLoginVerificationViewArgs>(name);
>>>>>>> ca68361 (maitry : product details in progress)
}

class OtpLoginVerificationViewArgs {
  const OtpLoginVerificationViewArgs({
    this.key,
    required this.countryCode,
    required this.phoneNumber,
  });

  final _i21.Key? key;

  final String countryCode;

  final String phoneNumber;

  @override
  String toString() {
    return 'OtpLoginVerificationViewArgs{key: $key, countryCode: $countryCode, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i16.OtpRegisterVerificationView]
class OtpRegisterVerificationView
<<<<<<< HEAD
    extends _i25.PageRouteInfo<OtpRegisterVerificationViewArgs> {
  OtpRegisterVerificationView({
    _i26.Key? key,
    required String countryCode,
    required String phoneNumber,
    List<_i25.PageRouteInfo>? children,
    extends _i19.PageRouteInfo<OtpRegisterVerificationViewArgs> {
=======
    extends _i20.PageRouteInfo<OtpRegisterVerificationViewArgs> {
>>>>>>> ca68361 (maitry : product details in progress)
  OtpRegisterVerificationView({
    _i21.Key? key,
    required String countryCode,
    required String phoneNumber,
    List<_i20.PageRouteInfo>? children,
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

<<<<<<< HEAD
  static const _i25.PageInfo<OtpRegisterVerificationViewArgs> page =
      _i25.PageInfo<OtpRegisterVerificationViewArgs>(name);
  static const _i19.PageInfo<OtpRegisterVerificationViewArgs> page =
      _i19.PageInfo<OtpRegisterVerificationViewArgs>(name);
=======
  static const _i20.PageInfo<OtpRegisterVerificationViewArgs> page =
      _i20.PageInfo<OtpRegisterVerificationViewArgs>(name);
>>>>>>> ca68361 (maitry : product details in progress)
}

class OtpRegisterVerificationViewArgs {
  const OtpRegisterVerificationViewArgs({
    this.key,
    required this.countryCode,
    required this.phoneNumber,
  });

<<<<<<< HEAD
  final _i26.Key? key;
  final _i20.Key? key;
=======
  final _i21.Key? key;
>>>>>>> ca68361 (maitry : product details in progress)

  final String countryCode;

  final String phoneNumber;

  @override
  String toString() {
    return 'OtpRegisterVerificationViewArgs{key: $key, countryCode: $countryCode, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
<<<<<<< HEAD
/// [_i17.PaymentMethod]
class PaymentMethod extends _i25.PageRouteInfo<void> {
  const PaymentMethod({List<_i25.PageRouteInfo>? children})
      : super(
          PaymentMethod.name,
          initialChildren: children,
        );

  static const String name = 'PaymentMethod';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i18.ProductDetailsView]
class ProductDetailsView extends _i25.PageRouteInfo<void> {
  const ProductDetailsView({List<_i25.PageRouteInfo>? children})
=======
/// [_i13.ProductDetailsView]
class ProductDetailsView extends _i20.PageRouteInfo<void> {
  const ProductDetailsView({List<_i20.PageRouteInfo>? children})
>>>>>>> ca68361 (maitry : product details in progress)
      : super(
          ProductDetailsView.name,
          initialChildren: children,
        );

  static const String name = 'ProductDetailsView';

<<<<<<< HEAD
  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i19.ProfileView]
class ProfileView extends _i25.PageRouteInfo<void> {
  const ProfileView({List<_i25.PageRouteInfo>? children})
/// [_i13.ProfileView]
class ProfileView extends _i19.PageRouteInfo<void> {
  const ProfileView({List<_i19.PageRouteInfo>? children})
=======
  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i14.ProfileView]
class ProfileView extends _i20.PageRouteInfo<void> {
  const ProfileView({List<_i20.PageRouteInfo>? children})
>>>>>>> ca68361 (maitry : product details in progress)
      : super(
          ProfileView.name,
          initialChildren: children,
        );

  static const String name = 'ProfileView';

<<<<<<< HEAD
  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i20.RegisterScreen]
class RegisterScreen extends _i25.PageRouteInfo<void> {
  const RegisterScreen({List<_i25.PageRouteInfo>? children})
  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
=======
  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
>>>>>>> ca68361 (maitry : product details in progress)
}

/// generated route for
/// [_i15.RegisterScreen]
class RegisterScreen extends _i20.PageRouteInfo<void> {
  const RegisterScreen({List<_i20.PageRouteInfo>? children})
      : super(
          RegisterScreen.name,
          initialChildren: children,
        );

  static const String name = 'RegisterScreen';

<<<<<<< HEAD
  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i21.SearchView]
class SearchView extends _i25.PageRouteInfo<void> {
  const SearchView({List<_i25.PageRouteInfo>? children})
  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
=======
  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
>>>>>>> ca68361 (maitry : product details in progress)
}

/// generated route for
/// [_i16.SearchView]
class SearchView extends _i20.PageRouteInfo<void> {
  const SearchView({List<_i20.PageRouteInfo>? children})
      : super(
          SearchView.name,
          initialChildren: children,
        );

  static const String name = 'SearchView';

<<<<<<< HEAD
  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i22.ShippingAddress]
class ShippingAddresses extends _i25.PageRouteInfo<void> {
  const ShippingAddresses({List<_i25.PageRouteInfo>? children})
  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
=======
  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
>>>>>>> ca68361 (maitry : product details in progress)
}

/// generated route for
/// [_i17.ShippingAddress]
class ShippingAddresses extends _i20.PageRouteInfo<void> {
  const ShippingAddresses({List<_i20.PageRouteInfo>? children})
      : super(
          ShippingAddresses.name,
          initialChildren: children,
        );

  static const String name = 'ShippingAddresses';

<<<<<<< HEAD
  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i23.SplashPage]
class SplashPage extends _i25.PageRouteInfo<void> {
  const SplashPage({List<_i25.PageRouteInfo>? children})
  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
=======
  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
>>>>>>> ca68361 (maitry : product details in progress)
}

/// generated route for
/// [_i18.SplashPage]
class SplashPage extends _i20.PageRouteInfo<void> {
  const SplashPage({List<_i20.PageRouteInfo>? children})
      : super(
          SplashPage.name,
          initialChildren: children,
        );

  static const String name = 'SplashPage';

<<<<<<< HEAD
  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i24.SuccessScreen]
class SuccessScreen extends _i25.PageRouteInfo<SuccessScreenArgs> {
  SuccessScreen({
    _i26.Key? key,
    required String title,
    required String subTitle,
    String? image,
    List<_i25.PageRouteInfo>? children,
  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
=======
  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
>>>>>>> ca68361 (maitry : product details in progress)
}

/// generated route for
/// [_i19.SuccessScreen]
class SuccessScreen extends _i20.PageRouteInfo<SuccessScreenArgs> {
  SuccessScreen({
    _i21.Key? key,
    required String title,
    required String subTitle,
    String? image,
    List<_i20.PageRouteInfo>? children,
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

<<<<<<< HEAD
  static const _i25.PageInfo<SuccessScreenArgs> page =
      _i25.PageInfo<SuccessScreenArgs>(name);
  static const _i19.PageInfo<SuccessScreenArgs> page =
      _i19.PageInfo<SuccessScreenArgs>(name);
=======
  static const _i20.PageInfo<SuccessScreenArgs> page =
      _i20.PageInfo<SuccessScreenArgs>(name);
>>>>>>> ca68361 (maitry : product details in progress)
}

class SuccessScreenArgs {
  const SuccessScreenArgs({
    this.key,
    required this.title,
    required this.subTitle,
    this.image,
  });

<<<<<<< HEAD
  final _i26.Key? key;
  final _i20.Key? key;
=======
  final _i21.Key? key;
>>>>>>> ca68361 (maitry : product details in progress)

  final String title;

  final String subTitle;

  final String? image;

  @override
  String toString() {
    return 'SuccessScreenArgs{key: $key, title: $title, subTitle: $subTitle, image: $image}';
  }
}
