import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grape_customer_app/domain/main/i_main_facade.dart';

import 'package:grape_customer_app/infrastructure/main/home_dto/get_product_list_response.dart';
import 'package:grape_customer_app/presentation/core/helper/location_helper.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'home_state.dart';
part 'home_event.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  int page = 1;
  int lastPage = 1;

  bool isFetching = false;
  final RefreshController refreshController = RefreshController();
  final IMainFacade mainFacade;
  final imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  HomeBloc(this.mainFacade) : super(HomeState.initial()) {
    on<HomeEvent>((event, emit) async {
      await event.map(
        getCurrentLocation: (value) async {
          await LocationHelper().getCurrentLocation().then(
            (value) {
              emit(
                state.copyWith(
                  currentLocation: value.$1 ?? "",
                  currentLatitude: value.$2,
                  currentLongitude: value.$3,
                ),
              );
            },
          );
        },
        carousalChange: (CarousalChange value) async {
          emit(state.copyWith(carousalIndex: value.tabIndex));
        },
        getProductList: (GetProductList e) async {
          if (e.isRefresh) {
            page = 1;
            emit(state.copyWith(getProductList: []));
            refreshController.resetNoData();
          } else {
            if (page > lastPage) {
              refreshController.loadNoData();
              return;
            }
          }

          emit(state.copyWith(isLoading: true));

          var res = await mainFacade.getProductListAPI(page: page);

          page++;

          res.fold(
            (l) => emit(
              state.copyWith(
                isErrorInAPI: true,
                isLoading: false,
                getProductList: [],
              ),
            ),
            (r) {
              lastPage = r.meta?.lastPage ?? 1;
              return emit(
                state.copyWith(
                  isLoading: false,
                  isErrorInAPI: false,
                  getProductList: (r.data as List<dynamic>)
                      .map((e) => GetProductListResponse.fromJson(e))
                      .toList(),
                ),
              );
            },
          );
        },
      );
    });
  }
}
