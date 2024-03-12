part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    required String currentLocation,
    double? currentLatitude,
    double? currentLongitude,
    required int carousalIndex,
    required bool isLoading,
    required bool isNoDataFound,
    required bool isErrorInAPI,
    required InputEmptyOrNot searchText,
    required List<GetProductListResponse> getProductList,
    required SearchProductDTO searchProductDTO,
    required final List<String> brandFilter,
  }) = _HomeState;
  factory HomeState.initial() => HomeState(
        currentLocation: '',
        carousalIndex: 0,
        getProductList: [],
        isLoading: false,
        isErrorInAPI: false,
        searchText: InputEmptyOrNot(''),
        searchProductDTO: SearchProductDTO(),
        isNoDataFound: false,
        brandFilter: [],
      );

  // const factory HomeState.loadAPISuccess(List<GetProductListResponse> apiList) =
  //     LoadAPISuccess;
  // const factory HomeState.loadInProgress() = DataTransferInProgress;
  // const factory HomeState.loadAPIFailure() = LoadAPIFailure;
}
