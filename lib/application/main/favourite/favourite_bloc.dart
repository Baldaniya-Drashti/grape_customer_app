import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'favourite_state.dart';
part 'favourite_event.dart';
part 'favourite_bloc.freezed.dart';

@injectable
class FavouriteBloc extends Bloc<FavouriteEvent,FavouriteState>{
  FavouriteBloc() : super(const FavouriteState.initial());
}