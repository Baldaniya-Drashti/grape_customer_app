part of 'favourite_bloc.dart';

@freezed
class FavouriteEvent with _$FavouriteEvent {
  factory FavouriteEvent.getFavouriteList(bool isRefresh) = GetFavouriteList;
  factory FavouriteEvent.removeProductFromFavourite() =
      RemoveProductFromFavourite;
}
