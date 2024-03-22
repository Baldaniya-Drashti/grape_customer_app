// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i28;
import 'package:flutter/material.dart' as _i29;
import 'package:grape_customer_app/infrastructure/main/payemnt_method_dto/get_cards_dto.dart'
    as _i31;
import 'package:grape_customer_app/infrastructure/main/shipping_address_dto/shipping_address_dto.dart'
    as _i30;
import 'package:grape_customer_app/presentation/auth/login/login_screen.dart'
    as _i10;
import 'package:grape_customer_app/presentation/auth/login/otp_login_verification_screen.dart'
    as _i17;
import 'package:grape_customer_app/presentation/auth/register/otp_register_verification_screen.dart'
    as _i18;
import 'package:grape_customer_app/presentation/auth/register/register_screen.dart'
    as _i22;
import 'package:grape_customer_app/presentation/core/widgets/layout/success_view.dart'
    as _i27;
import 'package:grape_customer_app/presentation/main/chat/chat_view.dart'
    as _i4;
import 'package:grape_customer_app/presentation/main/main_tab_view.dart'
    as _i11;
import 'package:grape_customer_app/presentation/main/tabs/cart/cart_view.dart'
    as _i3;
import 'package:grape_customer_app/presentation/main/tabs/favourite/favourite_view.dart'
    as _i8;
import 'package:grape_customer_app/presentation/main/tabs/home/checkout/checkout_view.dart'
    as _i5;
import 'package:grape_customer_app/presentation/main/tabs/home/home_view.dart'
    as _i9;
import 'package:grape_customer_app/presentation/main/tabs/home/product_details/product_details_view.dart'
    as _i20;
import 'package:grape_customer_app/presentation/main/tabs/home/product_details/widget/review_product_list.dart'
    as _i23;
import 'package:grape_customer_app/presentation/main/tabs/home/search/search_view.dart'
    as _i24;
import 'package:grape_customer_app/presentation/main/tabs/notification/notification_view.dart'
    as _i13;
import 'package:grape_customer_app/presentation/main/tabs/profile/customer_support/customer_support.dart'
    as _i6;
import 'package:grape_customer_app/presentation/main/tabs/profile/edit_profile/edit_profile.dart'
    as _i7;
import 'package:grape_customer_app/presentation/main/tabs/profile/edit_profile/otp_edit_profile_verification_screen.dart'
    as _i16;
import 'package:grape_customer_app/presentation/main/tabs/profile/my_orders/my_orders.dart'
    as _i12;
import 'package:grape_customer_app/presentation/main/tabs/profile/my_orders/order_details.dart'
    as _i15;
import 'package:grape_customer_app/presentation/main/tabs/profile/payment_method/add_new_card.dart'
    as _i2;
import 'package:grape_customer_app/presentation/main/tabs/profile/payment_method/payment_method.dart'
    as _i19;
import 'package:grape_customer_app/presentation/main/tabs/profile/profile_view.dart'
    as _i21;
import 'package:grape_customer_app/presentation/main/tabs/profile/shipping_addresses/add_new_address.dart'
    as _i1;
import 'package:grape_customer_app/presentation/main/tabs/profile/shipping_addresses/shipping_addresses.dart'
    as _i25;
import 'package:grape_customer_app/presentation/onboarding/onboarding_page.dart'
    as _i14;
import 'package:grape_customer_app/presentation/splash/splash_page.dart'
    as _i26;

abstract class $AppRouter extends _i28.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i28.PageFactory> pagesMap = {
    AddNewAddress.name: (routeData) {
      final args = routeData.argsAs<AddNewAddressArgs>();
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AddNewAddress(
          key: args.key,
          shippingAddressResponce: args.shippingAddressResponce,
        ),
      );
    },
    AddNewCard.name: (routeData) {
      final args = routeData.argsAs<AddNewCardArgs>();
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AddNewCard(
          key: args.key,
          getCardsDTO: args.getCardsDTO,
        ),
      );
    },
    CartView.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CartView(),
      );
    },
    ChatView.name: (routeData) {
      final args =
          routeData.argsAs<ChatViewArgs>(orElse: () => const ChatViewArgs());
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ChatView(
          key: args.key,
          fromLiveChatSupport: args.fromLiveChatSupport,
        ),
      );
    },
    CheckoutView.name: (routeData) {
      final args = routeData.argsAs<CheckoutViewArgs>(
          orElse: () => const CheckoutViewArgs());
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.CheckoutView(
          key: args.key,
          isFromCart: args.isFromCart,
          productId: args.productId,
          quantity: args.quantity,
        ),
      );
    },
    CustomerSupport.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.CustomerSupport(),
      );
    },
    EditProfileScreen.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.EditProfileScreen(),
      );
    },
    FavouriteView.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.FavouriteView(),
      );
    },
    HomeView.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.HomeView(),
      );
    },
    LoginPage.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.LoginScreen(),
      );
    },
    MainTabView.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.MainTabView(),
      );
    },
    MyOrders.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.MyOrders(),
      );
    },
    NotificationView.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.NotificationView(),
      );
    },
    Onboarding.name: (routeData) {
      final args = routeData.argsAs<OnboardingArgs>(
          orElse: () => const OnboardingArgs());
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.OnBoardingPage(key: args.key),
      );
    },
    OrderDetails.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.OrderDetails(),
      );
    },
    OtpEditProfileVerificationView.name: (routeData) {
      final args = routeData.argsAs<OtpEditProfileVerificationViewArgs>();
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.OtpEditProfileVerificationView(
          key: args.key,
          countryCode: args.countryCode,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    OtpLoginVerificationView.name: (routeData) {
      final args = routeData.argsAs<OtpLoginVerificationViewArgs>();
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.OtpLoginVerificationView(
          key: args.key,
          countryCode: args.countryCode,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    OtpRegisterVerificationView.name: (routeData) {
      final args = routeData.argsAs<OtpRegisterVerificationViewArgs>();
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.OtpRegisterVerificationView(
          key: args.key,
          countryCode: args.countryCode,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    PaymentMethod.name: (routeData) {
      final args = routeData.argsAs<PaymentMethodArgs>(
          orElse: () => const PaymentMethodArgs());
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.PaymentMethod(
          key: args.key,
          isFromChangePayment: args.isFromChangePayment,
        ),
      );
    },
    ProductDetailsView.name: (routeData) {
      final args = routeData.argsAs<ProductDetailsViewArgs>();
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i20.ProductDetailsView(
          key: args.key,
          productId: args.productId,
        ),
      );
    },
    ProfileView.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.ProfileView(),
      );
    },
    RegisterScreen.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.RegisterScreen(),
      );
    },
    ReviewProductList.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.ReviewProductList(),
      );
    },
    SearchView.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.SearchView(),
      );
    },
    ShippingAddresses.name: (routeData) {
      final args = routeData.argsAs<ShippingAddressesArgs>(
          orElse: () => const ShippingAddressesArgs());
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.ShippingAddress(
          key: args.key,
          isFromChangeAddress: args.isFromChangeAddress,
        ),
      );
    },
    SplashPage.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i26.SplashPage(),
      );
    },
    SuccessScreen.name: (routeData) {
      final args = routeData.argsAs<SuccessScreenArgs>();
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.SuccessScreen(
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
class AddNewAddress extends _i28.PageRouteInfo<AddNewAddressArgs> {
  AddNewAddress({
    _i29.Key? key,
    required _i30.ShippingAddressDTO shippingAddressResponce,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          AddNewAddress.name,
          args: AddNewAddressArgs(
            key: key,
            shippingAddressResponce: shippingAddressResponce,
          ),
          initialChildren: children,
        );

  static const String name = 'AddNewAddress';

  static const _i28.PageInfo<AddNewAddressArgs> page =
      _i28.PageInfo<AddNewAddressArgs>(name);
}

class AddNewAddressArgs {
  const AddNewAddressArgs({
    this.key,
    required this.shippingAddressResponce,
  });

  final _i29.Key? key;

  final _i30.ShippingAddressDTO shippingAddressResponce;

  @override
  String toString() {
    return 'AddNewAddressArgs{key: $key, shippingAddressResponce: $shippingAddressResponce}';
  }
}

/// generated route for
/// [_i2.AddNewCard]
class AddNewCard extends _i28.PageRouteInfo<AddNewCardArgs> {
  AddNewCard({
    _i29.Key? key,
    required _i31.GetCardsDTO getCardsDTO,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          AddNewCard.name,
          args: AddNewCardArgs(
            key: key,
            getCardsDTO: getCardsDTO,
          ),
          initialChildren: children,
        );

  static const String name = 'AddNewCard';

  static const _i28.PageInfo<AddNewCardArgs> page =
      _i28.PageInfo<AddNewCardArgs>(name);
}

class AddNewCardArgs {
  const AddNewCardArgs({
    this.key,
    required this.getCardsDTO,
  });

  final _i29.Key? key;

  final _i31.GetCardsDTO getCardsDTO;

  @override
  String toString() {
    return 'AddNewCardArgs{key: $key, getCardsDTO: $getCardsDTO}';
  }
}

/// generated route for
/// [_i3.CartView]
class CartView extends _i28.PageRouteInfo<void> {
  const CartView({List<_i28.PageRouteInfo>? children})
      : super(
          CartView.name,
          initialChildren: children,
        );

  static const String name = 'CartView';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ChatView]
class ChatView extends _i28.PageRouteInfo<ChatViewArgs> {
  ChatView({
    _i29.Key? key,
    bool fromLiveChatSupport = false,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          ChatView.name,
          args: ChatViewArgs(
            key: key,
            fromLiveChatSupport: fromLiveChatSupport,
          ),
          initialChildren: children,
        );

  static const String name = 'ChatView';

  static const _i28.PageInfo<ChatViewArgs> page =
      _i28.PageInfo<ChatViewArgs>(name);
}

class ChatViewArgs {
  const ChatViewArgs({
    this.key,
    this.fromLiveChatSupport = false,
  });

  final _i29.Key? key;

  final bool fromLiveChatSupport;

  @override
  String toString() {
    return 'ChatViewArgs{key: $key, fromLiveChatSupport: $fromLiveChatSupport}';
  }
}

/// generated route for
/// [_i5.CheckoutView]
class CheckoutView extends _i28.PageRouteInfo<CheckoutViewArgs> {
  CheckoutView({
    _i29.Key? key,
    bool isFromCart = false,
    String productId = '',
    num quantity = 1,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          CheckoutView.name,
          args: CheckoutViewArgs(
            key: key,
            isFromCart: isFromCart,
            productId: productId,
            quantity: quantity,
          ),
          initialChildren: children,
        );

  static const String name = 'CheckoutView';

  static const _i28.PageInfo<CheckoutViewArgs> page =
      _i28.PageInfo<CheckoutViewArgs>(name);
}

class CheckoutViewArgs {
  const CheckoutViewArgs({
    this.key,
    this.isFromCart = false,
    this.productId = '',
    this.quantity = 1,
  });

  final _i29.Key? key;

  final bool isFromCart;

  final String productId;

  final num quantity;

  @override
  String toString() {
    return 'CheckoutViewArgs{key: $key, isFromCart: $isFromCart, productId: $productId, quantity: $quantity}';
  }
}

/// generated route for
/// [_i6.CustomerSupport]
class CustomerSupport extends _i28.PageRouteInfo<void> {
  const CustomerSupport({List<_i28.PageRouteInfo>? children})
      : super(
          CustomerSupport.name,
          initialChildren: children,
        );

  static const String name = 'CustomerSupport';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i7.EditProfileScreen]
class EditProfileScreen extends _i28.PageRouteInfo<void> {
  const EditProfileScreen({List<_i28.PageRouteInfo>? children})
      : super(
          EditProfileScreen.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileScreen';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i8.FavouriteView]
class FavouriteView extends _i28.PageRouteInfo<void> {
  const FavouriteView({List<_i28.PageRouteInfo>? children})
      : super(
          FavouriteView.name,
          initialChildren: children,
        );

  static const String name = 'FavouriteView';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i9.HomeView]
class HomeView extends _i28.PageRouteInfo<void> {
  const HomeView({List<_i28.PageRouteInfo>? children})
      : super(
          HomeView.name,
          initialChildren: children,
        );

  static const String name = 'HomeView';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i10.LoginScreen]
class LoginPage extends _i28.PageRouteInfo<void> {
  const LoginPage({List<_i28.PageRouteInfo>? children})
      : super(
          LoginPage.name,
          initialChildren: children,
        );

  static const String name = 'LoginPage';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i11.MainTabView]
class MainTabView extends _i28.PageRouteInfo<void> {
  const MainTabView({List<_i28.PageRouteInfo>? children})
      : super(
          MainTabView.name,
          initialChildren: children,
        );

  static const String name = 'MainTabView';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i12.MyOrders]
class MyOrders extends _i28.PageRouteInfo<void> {
  const MyOrders({List<_i28.PageRouteInfo>? children})
      : super(
          MyOrders.name,
          initialChildren: children,
        );

  static const String name = 'MyOrders';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i13.NotificationView]
class NotificationView extends _i28.PageRouteInfo<void> {
  const NotificationView({List<_i28.PageRouteInfo>? children})
      : super(
          NotificationView.name,
          initialChildren: children,
        );

  static const String name = 'NotificationView';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i14.OnBoardingPage]
class Onboarding extends _i28.PageRouteInfo<OnboardingArgs> {
  Onboarding({
    _i29.Key? key,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          Onboarding.name,
          args: OnboardingArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'Onboarding';

  static const _i28.PageInfo<OnboardingArgs> page =
      _i28.PageInfo<OnboardingArgs>(name);
}

class OnboardingArgs {
  const OnboardingArgs({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return 'OnboardingArgs{key: $key}';
  }
}

/// generated route for
/// [_i15.OrderDetails]
class OrderDetails extends _i28.PageRouteInfo<void> {
  const OrderDetails({List<_i28.PageRouteInfo>? children})
      : super(
          OrderDetails.name,
          initialChildren: children,
        );

  static const String name = 'OrderDetails';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i16.OtpEditProfileVerificationView]
class OtpEditProfileVerificationView
    extends _i28.PageRouteInfo<OtpEditProfileVerificationViewArgs> {
  OtpEditProfileVerificationView({
    _i29.Key? key,
    required String countryCode,
    required String phoneNumber,
    List<_i28.PageRouteInfo>? children,
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

  static const _i28.PageInfo<OtpEditProfileVerificationViewArgs> page =
      _i28.PageInfo<OtpEditProfileVerificationViewArgs>(name);
}

class OtpEditProfileVerificationViewArgs {
  const OtpEditProfileVerificationViewArgs({
    this.key,
    required this.countryCode,
    required this.phoneNumber,
  });

  final _i29.Key? key;

  final String countryCode;

  final String phoneNumber;

  @override
  String toString() {
    return 'OtpEditProfileVerificationViewArgs{key: $key, countryCode: $countryCode, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i17.OtpLoginVerificationView]
class OtpLoginVerificationView
    extends _i28.PageRouteInfo<OtpLoginVerificationViewArgs> {
  OtpLoginVerificationView({
    _i29.Key? key,
    required String countryCode,
    required String phoneNumber,
    List<_i28.PageRouteInfo>? children,
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

  static const _i28.PageInfo<OtpLoginVerificationViewArgs> page =
      _i28.PageInfo<OtpLoginVerificationViewArgs>(name);
}

class OtpLoginVerificationViewArgs {
  const OtpLoginVerificationViewArgs({
    this.key,
    required this.countryCode,
    required this.phoneNumber,
  });

  final _i29.Key? key;

  final String countryCode;

  final String phoneNumber;

  @override
  String toString() {
    return 'OtpLoginVerificationViewArgs{key: $key, countryCode: $countryCode, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i18.OtpRegisterVerificationView]
class OtpRegisterVerificationView
    extends _i28.PageRouteInfo<OtpRegisterVerificationViewArgs> {
  OtpRegisterVerificationView({
    _i29.Key? key,
    required String countryCode,
    required String phoneNumber,
    List<_i28.PageRouteInfo>? children,
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

  static const _i28.PageInfo<OtpRegisterVerificationViewArgs> page =
      _i28.PageInfo<OtpRegisterVerificationViewArgs>(name);
}

class OtpRegisterVerificationViewArgs {
  const OtpRegisterVerificationViewArgs({
    this.key,
    required this.countryCode,
    required this.phoneNumber,
  });

  final _i29.Key? key;

  final String countryCode;

  final String phoneNumber;

  @override
  String toString() {
    return 'OtpRegisterVerificationViewArgs{key: $key, countryCode: $countryCode, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i19.PaymentMethod]
class PaymentMethod extends _i28.PageRouteInfo<PaymentMethodArgs> {
  PaymentMethod({
    _i29.Key? key,
    bool isFromChangePayment = false,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          PaymentMethod.name,
          args: PaymentMethodArgs(
            key: key,
            isFromChangePayment: isFromChangePayment,
          ),
          initialChildren: children,
        );

  static const String name = 'PaymentMethod';

  static const _i28.PageInfo<PaymentMethodArgs> page =
      _i28.PageInfo<PaymentMethodArgs>(name);
}

class PaymentMethodArgs {
  const PaymentMethodArgs({
    this.key,
    this.isFromChangePayment = false,
  });

  final _i29.Key? key;

  final bool isFromChangePayment;

  @override
  String toString() {
    return 'PaymentMethodArgs{key: $key, isFromChangePayment: $isFromChangePayment}';
  }
}

/// generated route for
/// [_i20.ProductDetailsView]
class ProductDetailsView extends _i28.PageRouteInfo<ProductDetailsViewArgs> {
  ProductDetailsView({
    _i29.Key? key,
    required String productId,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          ProductDetailsView.name,
          args: ProductDetailsViewArgs(
            key: key,
            productId: productId,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailsView';

  static const _i28.PageInfo<ProductDetailsViewArgs> page =
      _i28.PageInfo<ProductDetailsViewArgs>(name);
}

class ProductDetailsViewArgs {
  const ProductDetailsViewArgs({
    this.key,
    required this.productId,
  });

  final _i29.Key? key;

  final String productId;

  @override
  String toString() {
    return 'ProductDetailsViewArgs{key: $key, productId: $productId}';
  }
}

/// generated route for
/// [_i21.ProfileView]
class ProfileView extends _i28.PageRouteInfo<void> {
  const ProfileView({List<_i28.PageRouteInfo>? children})
      : super(
          ProfileView.name,
          initialChildren: children,
        );

  static const String name = 'ProfileView';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i22.RegisterScreen]
class RegisterScreen extends _i28.PageRouteInfo<void> {
  const RegisterScreen({List<_i28.PageRouteInfo>? children})
      : super(
          RegisterScreen.name,
          initialChildren: children,
        );

  static const String name = 'RegisterScreen';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i23.ReviewProductList]
class ReviewProductList extends _i28.PageRouteInfo<void> {
  const ReviewProductList({List<_i28.PageRouteInfo>? children})
      : super(
          ReviewProductList.name,
          initialChildren: children,
        );

  static const String name = 'ReviewProductList';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i24.SearchView]
class SearchView extends _i28.PageRouteInfo<void> {
  const SearchView({List<_i28.PageRouteInfo>? children})
      : super(
          SearchView.name,
          initialChildren: children,
        );

  static const String name = 'SearchView';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i25.ShippingAddress]
class ShippingAddresses extends _i28.PageRouteInfo<ShippingAddressesArgs> {
  ShippingAddresses({
    _i29.Key? key,
    bool isFromChangeAddress = false,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          ShippingAddresses.name,
          args: ShippingAddressesArgs(
            key: key,
            isFromChangeAddress: isFromChangeAddress,
          ),
          initialChildren: children,
        );

  static const String name = 'ShippingAddresses';

  static const _i28.PageInfo<ShippingAddressesArgs> page =
      _i28.PageInfo<ShippingAddressesArgs>(name);
}

class ShippingAddressesArgs {
  const ShippingAddressesArgs({
    this.key,
    this.isFromChangeAddress = false,
  });

  final _i29.Key? key;

  final bool isFromChangeAddress;

  @override
  String toString() {
    return 'ShippingAddressesArgs{key: $key, isFromChangeAddress: $isFromChangeAddress}';
  }
}

/// generated route for
/// [_i26.SplashPage]
class SplashPage extends _i28.PageRouteInfo<void> {
  const SplashPage({List<_i28.PageRouteInfo>? children})
      : super(
          SplashPage.name,
          initialChildren: children,
        );

  static const String name = 'SplashPage';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i27.SuccessScreen]
class SuccessScreen extends _i28.PageRouteInfo<SuccessScreenArgs> {
  SuccessScreen({
    _i29.Key? key,
    required String title,
    required String subTitle,
    String? image,
    List<_i28.PageRouteInfo>? children,
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

  static const _i28.PageInfo<SuccessScreenArgs> page =
      _i28.PageInfo<SuccessScreenArgs>(name);
}

class SuccessScreenArgs {
  const SuccessScreenArgs({
    this.key,
    required this.title,
    required this.subTitle,
    this.image,
  });

  final _i29.Key? key;

  final String title;

  final String subTitle;

  final String? image;

  @override
  String toString() {
    return 'SuccessScreenArgs{key: $key, title: $title, subTitle: $subTitle, image: $image}';
  }
}
