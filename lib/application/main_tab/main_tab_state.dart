part of 'main_tab_bloc.dart';

@freezed
class MainTabState with _$MainTabState {
  factory MainTabState({
    required int selectedTab,
   
    required int pageIndex,
    required String homePage,
    required String myCartPage,
    required String notificationPage,
    required String favouritesPage,
    required String profilePage,
  }) = _MainTabState;
  factory MainTabState.initial() => MainTabState(
        selectedTab: 0,
   
        pageIndex: 0,
        homePage: HomeView.name,
        myCartPage: CartView.name,
        notificationPage: NotificationView.name,
        favouritesPage: FavouriteView.name,
        profilePage: ProfileView.name,
      );
}
