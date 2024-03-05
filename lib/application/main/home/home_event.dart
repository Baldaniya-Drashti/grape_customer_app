part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  factory HomeEvent.getCurrentLocation() = GetCurrentLocation;
  factory HomeEvent.carousalChange(int tabIndex) = CarousalChange;
  factory HomeEvent.getProductList(bool isRefresh) = GetProductList;
 
}
