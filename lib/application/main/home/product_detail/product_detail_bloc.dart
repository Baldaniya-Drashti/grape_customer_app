import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grape_customer_app/domain/main/i_main_facade.dart';
import 'package:grape_customer_app/domain/main/main_failure.dart';
import 'package:grape_customer_app/infrastructure/core/common_product_from_json_response.dart';
import 'package:grape_customer_app/infrastructure/main/home_dto/get_product_list_response.dart';
import 'package:grape_customer_app/infrastructure/main/home_dto/product_detail_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'product_detail_state.dart';
part 'product_detail_event.dart';
part 'product_detail_bloc.freezed.dart';

@injectable
class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final IMainFacade mainFacade;
  int page = 1;
  int lastPage = 1;

  bool isFetching = false;

  int pageForProductYoumayLike = 1;
  int lastPageForProductYoumayLike = 1;

  bool isFetchingForProductYoumayLike = false;
  final RefreshController similarProductRefreshController = RefreshController();
  final RefreshController productYouMayLikeRefreshController =
      RefreshController();

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
            if (value.isRefresh) {
              page = 1;
              emit(state.copyWith(similarProduct: []));
              similarProductRefreshController.resetNoData();
            } else {
              if (page > lastPage) {
                similarProductRefreshController.loadNoData();
                return;
              }
            }
            emit(
              state.copyWith(
                isLoading: true,
                failureOrSuccessOption: none(),
              ),
            );

            var res = await mainFacade.getProductDetailsAPI(
                productId: value.productId, page: page);
            page++;
            res.fold(
              (l) => emit(
                state.copyWith(
                  isErrorInAPI: true,
                  isLoading: false,
                  getProductDetails: ProductDetailDTO(),
                  failureOrSuccessOption: none(),
                ),
              ),
              (r) {
                var productFromJson = ProductFromJson();
                var dataList = <Data>[];
                var productDetailRes = ProductDetailDTO.fromJson(r.data);
                if (productDetailRes.product?.product_form_json != null) {
                  productFromJson = ProductFromJson.fromJson(
                    jsonDecode(
                        productDetailRes.product?.product_form_json ?? ""),
                  );

                  if (productFromJson.data.isNotEmpty) {
                    dataList.addAll(productFromJson.data);

                    dataList.removeWhere(
                        (element) => element.name!.contains('Product Title'));
                  }
                }
                add(ProductDetailEvent.getProductYouMayAlsoLikeProductList(
                    true));
                return emit(
                  state.copyWith(
                    isLoading: false,
                    isErrorInAPI: false,
                    getProductDetails: productDetailRes,
                    dataList: dataList,
                    similarProduct: productDetailRes.similar_product ?? [],
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
              productId: value.productId ??
                  state.getProductDetails.product?.id.toString() ??
                  "",
            );

            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          removeProductFromFavourite: (value) async {
            emit(
              state.copyWith(
                failureOrSuccessOption: none(),
              ),
            );
            Either<MainFailure, String>? failureOrSuccess;
            failureOrSuccess = await mainFacade.deleteProductFromFavourite(
                productId: value.productId ??
                    state.getProductDetails.product?.id.toString() ??
                    "");

            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          addToFavourite: (AddToFavourite value) async {
            emit(
              state.copyWith(
                failureOrSuccessOption: none(),
              ),
            );
            Either<MainFailure, String>? failureOrSuccess;
            failureOrSuccess = await mainFacade.addProductToFavourite(
                productId: value.productId ??
                    state.getProductDetails.product?.id.toString() ??
                    "");

            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          getProductYouMayAlsoLikeProductList:
              (GetProductYouMayAlsoLikeProductList value) async {
            if (value.isRefresh) {
              pageForProductYoumayLike = 1;
              emit(state.copyWith(getProductList: []));
              productYouMayLikeRefreshController.resetNoData();
            } else {
              if (pageForProductYoumayLike > lastPageForProductYoumayLike) {
                productYouMayLikeRefreshController.loadNoData();
                return;
              }
            }

            emit(state.copyWith(isLoading: true));

            var res = await mainFacade.getProductListAPI(
                page: pageForProductYoumayLike,
                productId:
                    state.getProductDetails.product?.id.toString() ?? "");

            pageForProductYoumayLike++;

            res.fold(
              (l) => emit(
                state.copyWith(
                  isErrorInAPI: true,
                  isLoading: false,
                  getProductList: [],
                ),
              ),
              (r) {
                lastPageForProductYoumayLike = r.meta?.lastPage ?? 1;

                return emit(
                  state.copyWith(
                    isLoading: false,
                    isErrorInAPI: false,
                    isNoDataFound: (r.data as List<dynamic>)
                        .map((e) => GetProductListResponse.fromJson(e))
                        .toList()
                        .isEmpty,
                    getProductList: (r.data as List<dynamic>)
                        .map((e) => GetProductListResponse.fromJson(e))
                        .toList(),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
