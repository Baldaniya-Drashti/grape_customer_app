part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    // required String currentLocation,
    // double? currentLatitude,
    // double? currentLongitude,
    required int carousalIndex,
    required bool isLoading,
    required bool isNoDataFound,
    required bool isErrorInAPI,
    required InputEmptyOrNot searchText,
    required List<GetProductListResponse> getProductList,
    required SearchProductDTO searchProductDTO,
    required List<MapEntry<String, dynamic>> filterList,
    required List<MapEntry<String, dynamic>> selectedFilterList,
  }) = _HomeState;
  factory HomeState.initial() => HomeState(
        //  currentLocation: '',
        carousalIndex: 0,
        getProductList: [],
        isLoading: false,
        isErrorInAPI: false,
        searchText: InputEmptyOrNot(''),
        searchProductDTO: SearchProductDTO(),
        isNoDataFound: false,
        filterList: [], selectedFilterList: [],
      );

  // const factory HomeState.loadAPISuccess(
  //     List<MapEntry<String, dynamic>> selectedFilterList) = LoadAPISuccess;
  // const factory HomeState.loadInProgress() = DataTransferInProgress;
  // const factory HomeState.loadAPIFailure() = LoadAPIFailure;
}
