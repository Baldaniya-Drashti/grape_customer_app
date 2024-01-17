part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    required String currentLocation,
    double? currentLatitude,
    double? currentLongitude,
    required int carousalIndex,
  }) = _HomeState;
  factory HomeState.initial() =>
      HomeState(currentLocation: '', carousalIndex: 0);
}
