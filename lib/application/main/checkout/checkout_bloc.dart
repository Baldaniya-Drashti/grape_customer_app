import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grape_customer_app/domain/main/i_main_facade.dart';
import 'package:grape_customer_app/domain/main/main_failure.dart';
import 'package:grape_customer_app/infrastructure/main/checkout_dto/checkout_dto.dart';
import 'package:grape_customer_app/infrastructure/main/home_dto/get_product_list_response.dart';
import 'package:grape_customer_app/infrastructure/main/payemnt_method_dto/get_cards_dto.dart';
import 'package:grape_customer_app/infrastructure/main/shipping_address_dto/shipping_address_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'checkout_state.dart';
part 'checkout_event.dart';
part 'checkout_bloc.freezed.dart';

@injectable
class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  int page = 1;
  int lastPage = 1;
  final IMainFacade mainFacade;
  final RefreshController refreshController = RefreshController();
  CheckoutBloc(this.mainFacade) : super(CheckoutState.initial()) {
    on<CheckoutEvent>(
      (event, emit) async {
        await event.map(
          isFromCart: (IsFromCart value) async {
            emit(
              state.copyWith(
                isFromCart: value.isFromCart,
                productId: value.productId,
                quantity: value.quantity,
              ),
            );
          },
          getCheckoutDetail: (GetCheckoutDetail value) async {
            if (value.isRefresh) {
              page = 1;
              emit(state.copyWith(getProductList: []));
              refreshController.resetNoData();
            } else {
              if (page > lastPage) {
                refreshController.loadNoData();
                return;
              }
            }
            emit(
              state.copyWith(
                isLoading: true,
                failureOrSuccessOption: none(),
              ),
            );

            var res = await mainFacade.orderCheckoutAPI(
              page: page,
              isFromcart: state.isFromCart,
              productId: state.productId,
              quantity: state.quantity.toString(),
            );
            page++;

            res.fold(
              (l) => emit(
                state.copyWith(
                  isErrorInAPI: true,
                  isLoading: false,
                  checkoutDTO: CheckoutDTO(),
                ),
              ),
              (r) {
                var productDetailRes = CheckoutDTO.fromJson(r.data);
                var productList = productDetailRes.products ?? [];
                lastPage = r.meta?.perPage ?? 0;
                num cartTotal = 0;

                for (var i = 0; i < productList.length; i++) {
                  cartTotal += (productList[i].price! * state.quantity);

                  // productList[i].copyWith(quantity: state.quantity);
                }
                var updatedProductList = productList
                    .map((e) => e.copyWith(quantity: state.quantity))
                    .toList();
                final updateCheckoutDto =
                    productDetailRes.copyWith(products: updatedProductList);
                return emit(
                  state.copyWith(
                    isLoading: false,
                    isErrorInAPI: false,
                    checkoutDTO: updateCheckoutDto,
                    getProductList: updatedProductList,
                    cartTotal: cartTotal,
                    orderTotal: cartTotal +
                        (productDetailRes.shipping_charge ?? 0) +
                        (productDetailRes.tax ?? 0),
                    failureOrSuccessOption: none(),
                  ),
                );
              },
            );
          },
          removeCheckoutProduct: (ChangePaymentMethod value) async {
            final updatedList =
                List<GetProductListResponse>.from(state.getProductList)
                  ..removeWhere(
                      (element) => element.id.toString() == value.productId);
            final updateCheckoutDto =
                state.checkoutDTO.copyWith(products: updatedList);
            num cartTotal = 0;

            for (var i = 0; i < updatedList.length; i++) {
              cartTotal += (updatedList[i].price! * state.quantity);
            }

            emit(
              state.copyWith(
                checkoutDTO: updateCheckoutDto,
                getProductList: updatedList,
                cartTotal: cartTotal,
                orderTotal: cartTotal +
                    (state.checkoutDTO.shipping_charge ?? 0) +
                    (state.checkoutDTO.tax ?? 0),
                failureOrSuccessOption: none(),
              ),
            );
          },
          orderPlace: (OrderPlace value) async {
            Either<MainFailure, String>? failureOrSuccess;

            emit(
              state.copyWith(
                isSubmitting: true,
                failureOrSuccessOption: none(),
              ),
            );

            failureOrSuccess =
                await mainFacade.orderPlacetAPI(checkoutDTO: state.checkoutDTO);

            emit(
              state.copyWith(
                isSubmitting: false,
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          changeShippingAddress: (ChangeShippingAddress value) async {
            var updateCheckoutDTO = state.checkoutDTO.copyWith(
              shipping_address: value.shippingAddressDTO,
            );
            emit(
              state.copyWith(
                checkoutDTO: updateCheckoutDTO,
                failureOrSuccessOption: none(),
              ),
            );
          },
          changePaymentMethod: (ChangePaymentMethodEvent value) async {
            var updateCheckoutDTO = state.checkoutDTO.copyWith(
              payment_method: value.getCartListDTO,
            );
            emit(
              state.copyWith(
                checkoutDTO: updateCheckoutDTO,
                failureOrSuccessOption: none(),
              ),
            );
          },
        );
      },
    );
  }
}
