part of 'favourite_bloc.dart';

@freezed
class FavouriteState with _$FavouriteState {
  factory FavouriteState({
    required List<GetCartListDTO> favouriteListDTO,
    required bool isLoading,
    required bool isNoDataFound,
    required bool isErrorInAPI,
    required Option<Either<MainFailure, String>> failureOrSuccessOption,
  }) = _FavouriteState;
  factory FavouriteState.initial() => FavouriteState(
        favouriteListDTO: [],
        isLoading: false,
        isNoDataFound: false,
        isErrorInAPI: false,
        failureOrSuccessOption: none(),
      );
}
