part of 'favourite_bloc.dart';

@freezed
class FavouriteState with _$FavouriteState {
  const factory FavouriteState.initial() = _Initial;
  const factory FavouriteState.loadInProgress() = _LoadInProgress;
}