part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  //factory HomeEvent.getCurrentLocation() = GetCurrentLocation;
  factory HomeEvent.carousalChange(int tabIndex) = CarousalChange;
  factory HomeEvent.getProductList(bool isRefresh) = GetProductList;
  factory HomeEvent.searchProductList(bool isRefresh) = SearchProductList;
  factory HomeEvent.changeSeachText(String searchText) = ChangeSeachText;
  factory HomeEvent.changeBrandFilter(String selectedBrandFilter) =
      ChangeBrandFilter;
  factory HomeEvent.addFilterInList(Map<String, dynamic> selectedBrandFilter) =
      AddFilterInList;

  factory HomeEvent.addBrandFilterInList(List<String> selectedBrandFilter) =
      AddBrandFilterInList;
  factory HomeEvent.addSubCategoryFilterInList(
      List<String> selectedBrandFilterr) = AddSubCategoryFilterInList;
  factory HomeEvent.addInnerSubCategoryFilterInList(
      List<String> selectedBrandFilter) = AddInnerSubCategoryFilterInList;
  factory HomeEvent.addColorFilterInList(List<String> selectedBrandFilter) =
      AddColorFilterInList;
  factory HomeEvent.addSizeFilterInList(List<String> selectedBrandFilter) =
      AddSizeFilterInList;
}
