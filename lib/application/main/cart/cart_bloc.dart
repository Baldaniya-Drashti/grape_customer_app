import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grape_customer_app/domain/main/i_main_facade.dart';
import 'package:grape_customer_app/domain/main/main_failure.dart';
import 'package:grape_customer_app/infrastructure/main/cart_dto/get_cart_list_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'cart_state.dart';
part 'cart_event.dart';
part 'cart_bloc.freezed.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  int page = 1;
  int lastPage = 1;
  bool isFetching = false;
  final RefreshController refreshController = RefreshController();
  final IMainFacade mainFacade;
  CartBloc(this.mainFacade) : super(CartState.initial()) {
    on<CartEvent>(
      (event, emit) async {
        await event.map(
          getCartList: (value) async {
            if (value.isRefresh) {
              page = 1;
              emit(
                state.copyWith(
                  cartListDTO: [],
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

            var res = await mainFacade.getCartListAPI(page: page);

            page++;

            res.fold(
              (l) => emit(
                state.copyWith(
                  isErrorInAPI: true,
                  isLoading: false,
                  cartListDTO: [],
                  failureOrSuccessOption: none(),
                ),
              ),
              (r) {
                var cartList = (r.data as List<dynamic>)
                    .map((e) => GetCartListDTO.fromJson(e))
                    .toList();

                num cartTotal = 0;
                lastPage = r.meta?.lastPage ?? 1;
                for (var i = 0; i < cartList.length; i++) {
                  cartTotal += (cartList[i].product?.price ?? 0);
                }

                ///log('====cartTotal : $cartTotal');
                return emit(
                  state.copyWith(
                    isLoading: false,
                    isErrorInAPI: false,
                    failureOrSuccessOption: none(),
                    isNoDataFound: (r.data as List<dynamic>)
                        .map((e) => GetCartListDTO.fromJson(e))
                        .toList()
                        .isEmpty,
                    cartListDTO: cartList,
                    cartTotal: cartTotal,
                  ),
                );
              },
            );
          },
          removeProductFromCart: (RemoveProductFromCart value) async {
            emit(
              state.copyWith(
                failureOrSuccessOption: none(),
              ),
            );
            Either<MainFailure, String>? failureOrSuccess;
            failureOrSuccess =
                await mainFacade.deleteProductFromCart(productId: value.cartId);

            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
        );
      },
    );
  }
}
