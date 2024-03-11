part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  factory HomeEvent.getCurrentLocation() = GetCurrentLocation;
  factory HomeEvent.carousalChange(int tabIndex) = CarousalChange;
  factory HomeEvent.getProductList(bool isRefresh) = GetProductList;
  factory HomeEvent.searchProductList(bool isRefresh) = SearchProductList;
  const factory HomeEvent.changeSeachText(String searchText) = ChangeSeachText;
}
