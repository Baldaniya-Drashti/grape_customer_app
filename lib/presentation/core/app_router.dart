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
        AutoRoute(page: OtpEditProfileVerificationView.page),
        AutoRoute(page: SuccessScreen.page),
        AutoRoute(
          page: MainTabView.page,
          children: [
            AutoRoute(page: HomeView.page),
            AutoRoute(page: FavouriteView.page),
            AutoRoute(page: CartView.page),
            AutoRoute(page: NotificationView.page),
            AutoRoute(page: ProfileView.page),
          ],
        ),
        AutoRoute(page: EditProfileScreen.page),
        AutoRoute(page: ShippingAddresses.page),
        AutoRoute(page: AddNewAddress.page),
        AutoRoute(page: PaymentMethod.page),
        AutoRoute(page: AddNewCard.page),
        AutoRoute(page: SearchView.page),
        AutoRoute(page: ProductDetailsView.page),
        AutoRoute(page: CheckoutView.page),
        AutoRoute(page: PaymentMethod.page),
        AutoRoute(page: AddNewCard.page),
        AutoRoute(page: MyOrders.page),
        AutoRoute(page: OrderDetails.page),
        AutoRoute(page: SearchView.page),
        AutoRoute(page: ProductDetailsView.page),
        AutoRoute(page: CheckoutView.page),
        AutoRoute(page: ChatView.page),
        AutoRoute(page: ReviewProductList.page),
        AutoRoute(page: MyOrders.page),
        AutoRoute(page: OrderDetails.page),
        AutoRoute(page: ChatView.page),
        AutoRoute(page: ReviewProductList.page),
        AutoRoute(page: CustomerSupport.page),
        AutoRoute(page: ShopDetailView.page),
      ];
}
//grapecustomer.page.link