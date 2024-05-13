// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i32;
import 'package:chewie/chewie.dart' as _i36;
import 'package:flutter/material.dart' as _i33;
import 'package:grape_customer_app/infrastructure/main/payemnt_method_dto/get_cards_dto.dart'
    as _i35;
import 'package:grape_customer_app/infrastructure/main/shipping_address_dto/shipping_address_dto.dart'
    as _i34;
import 'package:grape_customer_app/presentation/auth/login/login_screen.dart'
    as _i12;
import 'package:grape_customer_app/presentation/auth/login/otp_login_verification_screen.dart'
    as _i19;
import 'package:grape_customer_app/presentation/auth/register/otp_register_verification_screen.dart'
    as _i20;
import 'package:grape_customer_app/presentation/auth/register/register_screen.dart'
    as _i25;
import 'package:grape_customer_app/presentation/core/widgets/layout/success_view.dart'
    as _i31;
import 'package:grape_customer_app/presentation/main/chat/chat_view.dart'
    as _i4;
import 'package:grape_customer_app/presentation/main/main_tab_view.dart'
    as _i13;
import 'package:grape_customer_app/presentation/main/tabs/cart/cart_view.dart'
    as _i3;
import 'package:grape_customer_app/presentation/main/tabs/favourite/favourite_view.dart'
    as _i8;
import 'package:grape_customer_app/presentation/main/tabs/home/checkout/checkout_view.dart'
    as _i5;
import 'package:grape_customer_app/presentation/main/tabs/home/home_view.dart'
    as _i11;
import 'package:grape_customer_app/presentation/main/tabs/home/product_details/product_details_view.dart'
    as _i22;
import 'package:grape_customer_app/presentation/main/tabs/home/product_details/shop_detail/shop_detail_view.dart'
    as _i29;
import 'package:grape_customer_app/presentation/main/tabs/home/product_details/widget/full_image_view.dart'
    as _i9;
import 'package:grape_customer_app/presentation/main/tabs/home/product_details/widget/review_product_list.dart'
    as _i26;
import 'package:grape_customer_app/presentation/main/tabs/home/search/search_view.dart'
    as _i27;
import 'package:grape_customer_app/presentation/main/tabs/notification/notification_view.dart'
    as _i15;
import 'package:grape_customer_app/presentation/main/tabs/profile/customer_support/customer_support.dart'
    as _i6;
import 'package:grape_customer_app/presentation/main/tabs/profile/edit_profile/edit_profile.dart'
    as _i7;
import 'package:grape_customer_app/presentation/main/tabs/profile/edit_profile/otp_edit_profile_verification_screen.dart'
    as _i18;
import 'package:grape_customer_app/presentation/main/tabs/profile/my_orders/my_orders.dart'
    as _i14;
import 'package:grape_customer_app/presentation/main/tabs/profile/my_orders/order_details_view.dart'
    as _i17;
import 'package:grape_customer_app/presentation/main/tabs/profile/my_orders/widgets/return-refund/help_view.dart'
    as _i10;
import 'package:grape_customer_app/presentation/main/tabs/profile/my_orders/widgets/return-refund/refund_request_view.dart'
    as _i24;
import 'package:grape_customer_app/presentation/main/tabs/profile/payment_method/add_new_card.dart'
    as _i2;
import 'package:grape_customer_app/presentation/main/tabs/profile/payment_method/payment_method.dart'
    as _i21;
import 'package:grape_customer_app/presentation/main/tabs/profile/profile_view.dart'
    as _i23;
import 'package:grape_customer_app/presentation/main/tabs/profile/shipping_addresses/add_new_address.dart'
    as _i1;
import 'package:grape_customer_app/presentation/main/tabs/profile/shipping_addresses/shipping_addresses.dart'
    as _i28;
import 'package:grape_customer_app/presentation/onboarding/onboarding_page.dart'
    as _i16;
import 'package:grape_customer_app/presentation/splash/splash_page.dart'
    as _i30;

abstract class $AppRouter extends _i32.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i32.PageFactory> pagesMap = {
    AddNewAddress.name: (routeData) {
      final args = routeData.argsAs<AddNewAddressArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AddNewAddress(
          key: args.key,
          shippingAddressResponce: args.shippingAddressResponce,
          isFromAuthFlow: args.isFromAuthFlow,
        ),
      );
    },
    AddNewCard.name: (routeData) {
      final args = routeData.argsAs<AddNewCardArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AddNewCard(
          key: args.key,
          getCardsDTO: args.getCardsDTO,
        ),
      );
    },
    CartView.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CartView(),
      );
    },
    ChatView.name: (routeData) {
      final args = routeData.argsAs<ChatViewArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ChatView(
          key: args.key,
          fromLiveChatSupport: args.fromLiveChatSupport,
          recieverID: args.recieverID,
        ),
      );
    },
    CheckoutView.name: (routeData) {
      final args = routeData.argsAs<CheckoutViewArgs>(
          orElse: () => const CheckoutViewArgs());
      return _i32.AutoRoutePage<dynamic>(
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
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.CustomerSupport(),
      );
    },
    EditProfileScreen.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.EditProfileScreen(),
      );
    },
    FavouriteView.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.FavouriteView(),
      );
    },
    FullImageView.name: (routeData) {
      final args = routeData.argsAs<FullImageViewArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.FullImageView(
          key: args.key,
          imageUrl: args.imageUrl,
          chewieController: args.chewieController,
        ),
      );
    },
    HelpView.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.HelpView(),
      );
    },
    HomeView.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.HomeView(),
      );
    },
    LoginPage.name: (routeData) {
      final args =
          routeData.argsAs<LoginPageArgs>(orElse: () => const LoginPageArgs());
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.LoginScreen(key: args.key),
      );
    },
    MainTabView.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.MainTabView(),
      );
    },
    MyOrders.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.MyOrders(),
      );
    },
    NotificationView.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.NotificationView(),
      );
    },
    Onboarding.name: (routeData) {
      final args = routeData.argsAs<OnboardingArgs>(
          orElse: () => const OnboardingArgs());
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.OnBoardingPage(key: args.key),
      );
    },
    OrderDetails.name: (routeData) {
      final args = routeData.argsAs<OrderDetailsArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.OrderDetails(
          key: args.key,
          orderId: args.orderId,
        ),
      );
    },
    OtpEditProfileVerificationView.name: (routeData) {
      final args = routeData.argsAs<OtpEditProfileVerificationViewArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.OtpEditProfileVerificationView(
          key: args.key,
          countryCode: args.countryCode,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    OtpLoginVerificationView.name: (routeData) {
      final args = routeData.argsAs<OtpLoginVerificationViewArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.OtpLoginVerificationView(
          key: args.key,
          countryCode: args.countryCode,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    OtpRegisterVerificationView.name: (routeData) {
      final args = routeData.argsAs<OtpRegisterVerificationViewArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i20.OtpRegisterVerificationView(
          key: args.key,
          countryCode: args.countryCode,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    PaymentMethod.name: (routeData) {
      final args = routeData.argsAs<PaymentMethodArgs>(
          orElse: () => const PaymentMethodArgs());
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.PaymentMethod(
          key: args.key,
          isFromChangePayment: args.isFromChangePayment,
        ),
      );
    },
    ProductDetailsView.name: (routeData) {
      final args = routeData.argsAs<ProductDetailsViewArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i22.ProductDetailsView(
          key: args.key,
          productId: args.productId,
        ),
      );
    },
    ProfileView.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.ProfileView(),
      );
    },
    RefundRequestView.name: (routeData) {
      final args = routeData.argsAs<RefundRequestViewArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i24.RefundRequestView(
          key: args.key,
          orderId: args.orderId,
        ),
      );
    },
    RegisterScreen.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i25.RegisterScreen(),
      );
    },
    ReviewProductList.name: (routeData) {
      final args = routeData.argsAs<ReviewProductListArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i26.ReviewProductList(
          key: args.key,
          productId: args.productId,
        ),
      );
    },
    SearchView.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i27.SearchView(),
      );
    },
    ShippingAddresses.name: (routeData) {
      final args = routeData.argsAs<ShippingAddressesArgs>(
          orElse: () => const ShippingAddressesArgs());
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i28.ShippingAddress(
          key: args.key,
          isFromChangeAddress: args.isFromChangeAddress,
        ),
      );
    },
    ShopDetailView.name: (routeData) {
      final args = routeData.argsAs<ShopDetailViewArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.ShopDetailView(
          key: args.key,
          shopId: args.shopId,
        ),
      );
    },
    SplashPage.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i30.SplashPage(),
      );
    },
    SuccessScreen.name: (routeData) {
      final args = routeData.argsAs<SuccessScreenArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.SuccessScreen(
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
class AddNewAddress extends _i32.PageRouteInfo<AddNewAddressArgs> {
  AddNewAddress({
    _i33.Key? key,
    required _i34.ShippingAddressDTO shippingAddressResponce,
    bool isFromAuthFlow = false,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          AddNewAddress.name,
          args: AddNewAddressArgs(
            key: key,
            shippingAddressResponce: shippingAddressResponce,
            isFromAuthFlow: isFromAuthFlow,
          ),
          initialChildren: children,
        );

  static const String name = 'AddNewAddress';

  static const _i32.PageInfo<AddNewAddressArgs> page =
      _i32.PageInfo<AddNewAddressArgs>(name);
}

class AddNewAddressArgs {
  const AddNewAddressArgs({
    this.key,
    required this.shippingAddressResponce,
    this.isFromAuthFlow = false,
  });

  final _i33.Key? key;

  final _i34.ShippingAddressDTO shippingAddressResponce;

  final bool isFromAuthFlow;

  @override
  String toString() {
    return 'AddNewAddressArgs{key: $key, shippingAddressResponce: $shippingAddressResponce, isFromAuthFlow: $isFromAuthFlow}';
  }
}

/// generated route for
/// [_i2.AddNewCard]
class AddNewCard extends _i32.PageRouteInfo<AddNewCardArgs> {
  AddNewCard({
    _i33.Key? key,
    required _i35.GetCardsDTO getCardsDTO,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          AddNewCard.name,
          args: AddNewCardArgs(
            key: key,
            getCardsDTO: getCardsDTO,
          ),
          initialChildren: children,
        );

  static const String name = 'AddNewCard';

  static const _i32.PageInfo<AddNewCardArgs> page =
      _i32.PageInfo<AddNewCardArgs>(name);
}

class AddNewCardArgs {
  const AddNewCardArgs({
    this.key,
    required this.getCardsDTO,
  });

  final _i33.Key? key;

  final _i35.GetCardsDTO getCardsDTO;

  @override
  String toString() {
    return 'AddNewCardArgs{key: $key, getCardsDTO: $getCardsDTO}';
  }
}

/// generated route for
/// [_i3.CartView]
class CartView extends _i32.PageRouteInfo<void> {
  const CartView({List<_i32.PageRouteInfo>? children})
      : super(
          CartView.name,
          initialChildren: children,
        );

  static const String name = 'CartView';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ChatView]
class ChatView extends _i32.PageRouteInfo<ChatViewArgs> {
  ChatView({
    _i33.Key? key,
    bool fromLiveChatSupport = false,
    required String recieverID,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          ChatView.name,
          args: ChatViewArgs(
            key: key,
            fromLiveChatSupport: fromLiveChatSupport,
            recieverID: recieverID,
          ),
          initialChildren: children,
        );

  static const String name = 'ChatView';

  static const _i32.PageInfo<ChatViewArgs> page =
      _i32.PageInfo<ChatViewArgs>(name);
}

class ChatViewArgs {
  const ChatViewArgs({
    this.key,
    this.fromLiveChatSupport = false,
    required this.recieverID,
  });

  final _i33.Key? key;

  final bool fromLiveChatSupport;

  final String recieverID;

  @override
  String toString() {
    return 'ChatViewArgs{key: $key, fromLiveChatSupport: $fromLiveChatSupport, recieverID: $recieverID}';
  }
}

/// generated route for
/// [_i5.CheckoutView]
class CheckoutView extends _i32.PageRouteInfo<CheckoutViewArgs> {
  CheckoutView({
    _i33.Key? key,
    bool isFromCart = false,
    String productId = '',
    num quantity = 1,
    List<_i32.PageRouteInfo>? children,
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

  static const _i32.PageInfo<CheckoutViewArgs> page =
      _i32.PageInfo<CheckoutViewArgs>(name);
}

class CheckoutViewArgs {
  const CheckoutViewArgs({
    this.key,
    this.isFromCart = false,
    this.productId = '',
    this.quantity = 1,
  });

  final _i33.Key? key;

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
class CustomerSupport extends _i32.PageRouteInfo<void> {
  const CustomerSupport({List<_i32.PageRouteInfo>? children})
      : super(
          CustomerSupport.name,
          initialChildren: children,
        );

  static const String name = 'CustomerSupport';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i7.EditProfileScreen]
class EditProfileScreen extends _i32.PageRouteInfo<void> {
  const EditProfileScreen({List<_i32.PageRouteInfo>? children})
      : super(
          EditProfileScreen.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileScreen';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i8.FavouriteView]
class FavouriteView extends _i32.PageRouteInfo<void> {
  const FavouriteView({List<_i32.PageRouteInfo>? children})
      : super(
          FavouriteView.name,
          initialChildren: children,
        );

  static const String name = 'FavouriteView';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i9.FullImageView]
class FullImageView extends _i32.PageRouteInfo<FullImageViewArgs> {
  FullImageView({
    _i33.Key? key,
    required String imageUrl,
    _i36.ChewieController? chewieController,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          FullImageView.name,
          args: FullImageViewArgs(
            key: key,
            imageUrl: imageUrl,
            chewieController: chewieController,
          ),
          initialChildren: children,
        );

  static const String name = 'FullImageView';

  static const _i32.PageInfo<FullImageViewArgs> page =
      _i32.PageInfo<FullImageViewArgs>(name);
}

class FullImageViewArgs {
  const FullImageViewArgs({
    this.key,
    required this.imageUrl,
    this.chewieController,
  });

  final _i33.Key? key;

  final String imageUrl;

  final _i36.ChewieController? chewieController;

  @override
  String toString() {
    return 'FullImageViewArgs{key: $key, imageUrl: $imageUrl, chewieController: $chewieController}';
  }
}

/// generated route for
/// [_i10.HelpView]
class HelpView extends _i32.PageRouteInfo<void> {
  const HelpView({List<_i32.PageRouteInfo>? children})
      : super(
          HelpView.name,
          initialChildren: children,
        );

  static const String name = 'HelpView';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i11.HomeView]
class HomeView extends _i32.PageRouteInfo<void> {
  const HomeView({List<_i32.PageRouteInfo>? children})
      : super(
          HomeView.name,
          initialChildren: children,
        );

  static const String name = 'HomeView';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i12.LoginScreen]
class LoginPage extends _i32.PageRouteInfo<LoginPageArgs> {
  LoginPage({
    _i33.Key? key,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          LoginPage.name,
          args: LoginPageArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginPage';

  static const _i32.PageInfo<LoginPageArgs> page =
      _i32.PageInfo<LoginPageArgs>(name);
}

class LoginPageArgs {
  const LoginPageArgs({this.key});

  final _i33.Key? key;

  @override
  String toString() {
    return 'LoginPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i13.MainTabView]
class MainTabView extends _i32.PageRouteInfo<void> {
  const MainTabView({List<_i32.PageRouteInfo>? children})
      : super(
          MainTabView.name,
          initialChildren: children,
        );

  static const String name = 'MainTabView';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i14.MyOrders]
class MyOrders extends _i32.PageRouteInfo<void> {
  const MyOrders({List<_i32.PageRouteInfo>? children})
      : super(
          MyOrders.name,
          initialChildren: children,
        );

  static const String name = 'MyOrders';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i15.NotificationView]
class NotificationView extends _i32.PageRouteInfo<void> {
  const NotificationView({List<_i32.PageRouteInfo>? children})
      : super(
          NotificationView.name,
          initialChildren: children,
        );

  static const String name = 'NotificationView';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i16.OnBoardingPage]
class Onboarding extends _i32.PageRouteInfo<OnboardingArgs> {
  Onboarding({
    _i33.Key? key,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          Onboarding.name,
          args: OnboardingArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'Onboarding';

  static const _i32.PageInfo<OnboardingArgs> page =
      _i32.PageInfo<OnboardingArgs>(name);
}

class OnboardingArgs {
  const OnboardingArgs({this.key});

  final _i33.Key? key;

  @override
  String toString() {
    return 'OnboardingArgs{key: $key}';
  }
}

/// generated route for
/// [_i17.OrderDetails]
class OrderDetails extends _i32.PageRouteInfo<OrderDetailsArgs> {
  OrderDetails({
    _i33.Key? key,
    required String orderId,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          OrderDetails.name,
          args: OrderDetailsArgs(
            key: key,
            orderId: orderId,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderDetails';

  static const _i32.PageInfo<OrderDetailsArgs> page =
      _i32.PageInfo<OrderDetailsArgs>(name);
}

class OrderDetailsArgs {
  const OrderDetailsArgs({
    this.key,
    required this.orderId,
  });

  final _i33.Key? key;

  final String orderId;

  @override
  String toString() {
    return 'OrderDetailsArgs{key: $key, orderId: $orderId}';
  }
}

/// generated route for
/// [_i18.OtpEditProfileVerificationView]
class OtpEditProfileVerificationView
    extends _i32.PageRouteInfo<OtpEditProfileVerificationViewArgs> {
  OtpEditProfileVerificationView({
    _i33.Key? key,
    required String countryCode,
    required String phoneNumber,
    List<_i32.PageRouteInfo>? children,
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

  static const _i32.PageInfo<OtpEditProfileVerificationViewArgs> page =
      _i32.PageInfo<OtpEditProfileVerificationViewArgs>(name);
}

class OtpEditProfileVerificationViewArgs {
  const OtpEditProfileVerificationViewArgs({
    this.key,
    required this.countryCode,
    required this.phoneNumber,
  });

  final _i33.Key? key;

  final String countryCode;

  final String phoneNumber;

  @override
  String toString() {
    return 'OtpEditProfileVerificationViewArgs{key: $key, countryCode: $countryCode, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i19.OtpLoginVerificationView]
class OtpLoginVerificationView
    extends _i32.PageRouteInfo<OtpLoginVerificationViewArgs> {
  OtpLoginVerificationView({
    _i33.Key? key,
    required String countryCode,
    required String phoneNumber,
    List<_i32.PageRouteInfo>? children,
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

  static const _i32.PageInfo<OtpLoginVerificationViewArgs> page =
      _i32.PageInfo<OtpLoginVerificationViewArgs>(name);
}

class OtpLoginVerificationViewArgs {
  const OtpLoginVerificationViewArgs({
    this.key,
    required this.countryCode,
    required this.phoneNumber,
  });

  final _i33.Key? key;

  final String countryCode;

  final String phoneNumber;

  @override
  String toString() {
    return 'OtpLoginVerificationViewArgs{key: $key, countryCode: $countryCode, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i20.OtpRegisterVerificationView]
class OtpRegisterVerificationView
    extends _i32.PageRouteInfo<OtpRegisterVerificationViewArgs> {
  OtpRegisterVerificationView({
    _i33.Key? key,
    required String countryCode,
    required String phoneNumber,
    List<_i32.PageRouteInfo>? children,
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

  static const _i32.PageInfo<OtpRegisterVerificationViewArgs> page =
      _i32.PageInfo<OtpRegisterVerificationViewArgs>(name);
}

class OtpRegisterVerificationViewArgs {
  const OtpRegisterVerificationViewArgs({
    this.key,
    required this.countryCode,
    required this.phoneNumber,
  });

  final _i33.Key? key;

  final String countryCode;

  final String phoneNumber;

  @override
  String toString() {
    return 'OtpRegisterVerificationViewArgs{key: $key, countryCode: $countryCode, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i21.PaymentMethod]
class PaymentMethod extends _i32.PageRouteInfo<PaymentMethodArgs> {
  PaymentMethod({
    _i33.Key? key,
    bool isFromChangePayment = false,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          PaymentMethod.name,
          args: PaymentMethodArgs(
            key: key,
            isFromChangePayment: isFromChangePayment,
          ),
          initialChildren: children,
        );

  static const String name = 'PaymentMethod';

  static const _i32.PageInfo<PaymentMethodArgs> page =
      _i32.PageInfo<PaymentMethodArgs>(name);
}

class PaymentMethodArgs {
  const PaymentMethodArgs({
    this.key,
    this.isFromChangePayment = false,
  });

  final _i33.Key? key;

  final bool isFromChangePayment;

  @override
  String toString() {
    return 'PaymentMethodArgs{key: $key, isFromChangePayment: $isFromChangePayment}';
  }
}

/// generated route for
/// [_i22.ProductDetailsView]
class ProductDetailsView extends _i32.PageRouteInfo<ProductDetailsViewArgs> {
  ProductDetailsView({
    _i33.Key? key,
    required String productId,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          ProductDetailsView.name,
          args: ProductDetailsViewArgs(
            key: key,
            productId: productId,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailsView';

  static const _i32.PageInfo<ProductDetailsViewArgs> page =
      _i32.PageInfo<ProductDetailsViewArgs>(name);
}

class ProductDetailsViewArgs {
  const ProductDetailsViewArgs({
    this.key,
    required this.productId,
  });

  final _i33.Key? key;

  final String productId;

  @override
  String toString() {
    return 'ProductDetailsViewArgs{key: $key, productId: $productId}';
  }
}

/// generated route for
/// [_i23.ProfileView]
class ProfileView extends _i32.PageRouteInfo<void> {
  const ProfileView({List<_i32.PageRouteInfo>? children})
      : super(
          ProfileView.name,
          initialChildren: children,
        );

  static const String name = 'ProfileView';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i24.RefundRequestView]
class RefundRequestView extends _i32.PageRouteInfo<RefundRequestViewArgs> {
  RefundRequestView({
    _i33.Key? key,
    required String orderId,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          RefundRequestView.name,
          args: RefundRequestViewArgs(
            key: key,
            orderId: orderId,
          ),
          initialChildren: children,
        );

  static const String name = 'RefundRequestView';

  static const _i32.PageInfo<RefundRequestViewArgs> page =
      _i32.PageInfo<RefundRequestViewArgs>(name);
}

class RefundRequestViewArgs {
  const RefundRequestViewArgs({
    this.key,
    required this.orderId,
  });

  final _i33.Key? key;

  final String orderId;

  @override
  String toString() {
    return 'RefundRequestViewArgs{key: $key, orderId: $orderId}';
  }
}

/// generated route for
/// [_i25.RegisterScreen]
class RegisterScreen extends _i32.PageRouteInfo<void> {
  const RegisterScreen({List<_i32.PageRouteInfo>? children})
      : super(
          RegisterScreen.name,
          initialChildren: children,
        );

  static const String name = 'RegisterScreen';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i26.ReviewProductList]
class ReviewProductList extends _i32.PageRouteInfo<ReviewProductListArgs> {
  ReviewProductList({
    _i33.Key? key,
    required String productId,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          ReviewProductList.name,
          args: ReviewProductListArgs(
            key: key,
            productId: productId,
          ),
          initialChildren: children,
        );

  static const String name = 'ReviewProductList';

  static const _i32.PageInfo<ReviewProductListArgs> page =
      _i32.PageInfo<ReviewProductListArgs>(name);
}

class ReviewProductListArgs {
  const ReviewProductListArgs({
    this.key,
    required this.productId,
  });

  final _i33.Key? key;

  final String productId;

  @override
  String toString() {
    return 'ReviewProductListArgs{key: $key, productId: $productId}';
  }
}

/// generated route for
/// [_i27.SearchView]
class SearchView extends _i32.PageRouteInfo<void> {
  const SearchView({List<_i32.PageRouteInfo>? children})
      : super(
          SearchView.name,
          initialChildren: children,
        );

  static const String name = 'SearchView';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i28.ShippingAddress]
class ShippingAddresses extends _i32.PageRouteInfo<ShippingAddressesArgs> {
  ShippingAddresses({
    _i33.Key? key,
    bool isFromChangeAddress = false,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          ShippingAddresses.name,
          args: ShippingAddressesArgs(
            key: key,
            isFromChangeAddress: isFromChangeAddress,
          ),
          initialChildren: children,
        );

  static const String name = 'ShippingAddresses';

  static const _i32.PageInfo<ShippingAddressesArgs> page =
      _i32.PageInfo<ShippingAddressesArgs>(name);
}

class ShippingAddressesArgs {
  const ShippingAddressesArgs({
    this.key,
    this.isFromChangeAddress = false,
  });

  final _i33.Key? key;

  final bool isFromChangeAddress;

  @override
  String toString() {
    return 'ShippingAddressesArgs{key: $key, isFromChangeAddress: $isFromChangeAddress}';
  }
}

/// generated route for
/// [_i29.ShopDetailView]
class ShopDetailView extends _i32.PageRouteInfo<ShopDetailViewArgs> {
  ShopDetailView({
    _i33.Key? key,
    required String shopId,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          ShopDetailView.name,
          args: ShopDetailViewArgs(
            key: key,
            shopId: shopId,
          ),
          initialChildren: children,
        );

  static const String name = 'ShopDetailView';

  static const _i32.PageInfo<ShopDetailViewArgs> page =
      _i32.PageInfo<ShopDetailViewArgs>(name);
}

class ShopDetailViewArgs {
  const ShopDetailViewArgs({
    this.key,
    required this.shopId,
  });

  final _i33.Key? key;

  final String shopId;

  @override
  String toString() {
    return 'ShopDetailViewArgs{key: $key, shopId: $shopId}';
  }
}

/// generated route for
/// [_i30.SplashPage]
class SplashPage extends _i32.PageRouteInfo<void> {
  const SplashPage({List<_i32.PageRouteInfo>? children})
      : super(
          SplashPage.name,
          initialChildren: children,
        );

  static const String name = 'SplashPage';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i31.SuccessScreen]
class SuccessScreen extends _i32.PageRouteInfo<SuccessScreenArgs> {
  SuccessScreen({
    _i33.Key? key,
    required String title,
    required String subTitle,
    String? image,
    List<_i32.PageRouteInfo>? children,
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

  static const _i32.PageInfo<SuccessScreenArgs> page =
      _i32.PageInfo<SuccessScreenArgs>(name);
}

class SuccessScreenArgs {
  const SuccessScreenArgs({
    this.key,
    required this.title,
    required this.subTitle,
    this.image,
  });

  final _i33.Key? key;

  final String title;

  final String subTitle;

  final String? image;

  @override
  String toString() {
    return 'SuccessScreenArgs{key: $key, title: $title, subTitle: $subTitle, image: $image}';
  }
}
