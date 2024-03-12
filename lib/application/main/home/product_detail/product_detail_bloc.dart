import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grape_customer_app/domain/main/i_main_facade.dart';
import 'package:grape_customer_app/domain/main/main_failure.dart';
import 'package:grape_customer_app/infrastructure/core/common_product_from_json_response.dart';
import 'package:grape_customer_app/infrastructure/main/home_dto/get_product_list_response.dart';
import 'package:injectable/injectable.dart';

part 'product_detail_state.dart';
part 'product_detail_event.dart';
part 'product_detail_bloc.freezed.dart';

@injectable
class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final IMainFacade mainFacade;
  ProductDetailBloc(this.mainFacade) : super(ProductDetailState.initial()) {
    on<ProductDetailEvent>(
      (event, emit) async {
        await event.map(
          increaseProductQuantity: (IncreaseProductQuantity value) async {
            emit(state.copyWith(productQuantity: state.productQuantity + 1));
          },
          decreaseProductQuantity: (DecreaseProductQuantity value) async {
            emit(
              state.copyWith(
                productQuantity:
                    state.productQuantity != 1 ? state.productQuantity - 1 : 1,
              ),
            );
          },
          getProductDetails: (GetProductDetails value) async {
            emit(state.copyWith(
              isLoading: true,
              failureOrSuccessOption: none(),
            ));

            var res = await mainFacade.getProductDetailsAPI(
                productId: value.productId);

            res.fold(
              (l) => emit(
                state.copyWith(
                  isErrorInAPI: true,
                  isLoading: false,
                  getProductDetails: GetProductListResponse(),
                  failureOrSuccessOption: none(),
                ),
              ),
              (r) {
                var productFromJson = ProductFromJson();
                var dataList = <Data>[];
                if (r.product_form_json != null) {
                  productFromJson = ProductFromJson.fromJson(
                    jsonDecode(r.product_form_json ?? ""),
                  );

                  if (productFromJson.data.isNotEmpty) {
                    dataList.addAll(productFromJson.data);

                    dataList.removeWhere(
                        (element) => element.name!.contains('Product Title'));
                  }
                }
                return emit(
                  state.copyWith(
                    isLoading: false,
                    isErrorInAPI: false,
                    getProductDetails: r,
                    dataList: dataList,
                    failureOrSuccessOption: none(),
                  ),
                );
              },
            );
          },
          selectImage: (SelectImage value) {
            emit(state.copyWith(selectedImageIndex: value.index));
          },
          addProductToCart: (AddProductToCart value) async {
            emit(
              state.copyWith(
                failureOrSuccessOption: none(),
              ),
            );
            Either<MainFailure, String>? failureOrSuccess;
            failureOrSuccess = await mainFacade.addProductToCart(
                productId: state.getProductDetails.id.toString());

            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          removeProductFromCart: (RemoveProductFromCart value) async {
            emit(
              state.copyWith(
                failureOrSuccessOption: none(),
              ),
            );
            Either<MainFailure, String>? failureOrSuccess;
            failureOrSuccess = await mainFacade.deleteProductFromCart(
                productId: state.getProductDetails.id.toString());

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
