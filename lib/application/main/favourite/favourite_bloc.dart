import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grape_customer_app/domain/main/i_main_facade.dart';
import 'package:grape_customer_app/domain/main/main_failure.dart';
import 'package:grape_customer_app/infrastructure/main/cart_dto/get_cart_list_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'favourite_state.dart';
part 'favourite_event.dart';
part 'favourite_bloc.freezed.dart';

@injectable
class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  int page = 1;
  int lastPage = 1;
  bool isFetching = false;
  final RefreshController refreshController = RefreshController();
  final IMainFacade mainFacade;
  FavouriteBloc(this.mainFacade) : super(FavouriteState.initial()) {
    on<FavouriteEvent>(
      (event, emit) async {
        await event.map(
          getFavouriteList: (value) async {
            if (value.isRefresh) {
              page = 1;
              emit(
                state.copyWith(
                  favouriteListDTO: [],
                  failureOrSuccessOption: none(),
                ),
              );
              refreshController.resetNoData();
            } else {
              if (page > lastPage) {
                refreshController.loadNoData();
                return;
              }
            }

            emit(state.copyWith(isLoading: true));

            var res = await mainFacade.getFavouriteAPI(page: page);

            page++;

            res.fold(
              (l) => emit(
                state.copyWith(
                  isErrorInAPI: true,
                  isLoading: false,
                  favouriteListDTO: [],
                  failureOrSuccessOption: none(),
                ),
              ),
              (r) {
                var cartList = (r.data as List<dynamic>)
                    .map((e) => GetCartListDTO.fromJson(e))
                    .toList();
                lastPage = r.meta?.lastPage ?? 1;
                return emit(
                  state.copyWith(
                    isLoading: false,
                    isErrorInAPI: false,
                    failureOrSuccessOption: none(),
                    isNoDataFound: (r.data as List<dynamic>)
                        .map((e) => GetCartListDTO.fromJson(e))
                        .toList()
                        .isEmpty,
                    favouriteListDTO: cartList,
                  ),
                );
              },
            );
          },
          removeProductFromFavourite: (value) async {},
        );
      },
    );
  }
}
