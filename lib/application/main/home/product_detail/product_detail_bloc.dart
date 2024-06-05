// ignore_for_file: unused_result

import 'dart:convert';

import 'package:chewie/chewie.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grape_customer_app/domain/main/i_main_facade.dart';
import 'package:grape_customer_app/domain/main/main_failure.dart';
import 'package:grape_customer_app/infrastructure/core/common_product_from_json_response.dart';
import 'package:grape_customer_app/infrastructure/main/home_dto/get_product_list_response.dart';
import 'package:grape_customer_app/infrastructure/main/home_dto/product_detail_dto.dart';
import 'package:grape_customer_app/infrastructure/main/shop_detail_dto/shop_detail_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:video_player/video_player.dart';

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
  final descriptionTooltipController = SuperTooltipController();
  bool isFetchingForProductYoumayLike = false;
  final RefreshController similarProductRefreshController = RefreshController();
  final RefreshController productYouMayLikeRefreshController =
      RefreshController();
  final RefreshController productReviewRefreshController = RefreshController();
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
              emit(state.copyWith(
                similarProduct: [],
                isLoading: value.showLoading ? true : false,
                failureOrSuccessOption: none(),
              ));
              similarProductRefreshController.resetNoData();
            } else {
              if (page > lastPage) {
                similarProductRefreshController.loadNoData();
                return;
              }
            }

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
              (r) async {
                var productFromJson = ProductFromJson();
                var dataList = <Data>[];
                var productDetailRes = ProductDetailDTO.fromJson(r.data);
                lastPage = r.meta?.lastPage ?? 1;

                if (value.isRefresh) {
                  List.from(productDetailRes.similar_product ?? []).clear();
                }
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

                return emit(
                  state.copyWith(
                    isLoading: false,
                    isErrorInAPI: false,
                    getProductDetails: productDetailRes,
                    dataList: dataList,
                    similarProduct:
                        List.from(productDetailRes.similar_product ?? [])
                          ..addAll(productDetailRes.similar_product ?? []),
                    failureOrSuccessOption: none(),
                  ),
                );
              },
            );
            var updatedMediaList = List<Media>.from(
                state.getProductDetails.product?.media?.toList() ?? <Media>[]);
            if (value.isFromFullImageView) {
              for (var i = 0; i < (updatedMediaList.length); i++) {
                if (updatedMediaList[i].media_type == 2) {
                  final media = updatedMediaList[i];

                  final mediaUrl = media.media;
                  if (mediaUrl != null && mediaUrl.isNotEmpty) {
                    final videoPlayerController =
                        VideoPlayerController.networkUrl(
                            Uri.tryParse(mediaUrl)!);

                    await videoPlayerController.initialize().then((value) {
                      var updatedMedia = media.copyWith(
                        videoPlayerController: videoPlayerController,
                        chewieController: ChewieController(
                          videoPlayerController: videoPlayerController,
                          aspectRatio: videoPlayerController.value.aspectRatio,
                        ),
                      );
                      updatedMediaList[i] = updatedMedia;
                    });
                  }
                }
              }
            }
            if (!value.isFromFullImageView) {
              add(ProductDetailEvent.getProductYouMayAlsoLikeProductList(true));
            }

            return emit(
              state.copyWith(
                getProductDetails: state.getProductDetails.copyWith(
                  product: state.getProductDetails.product
                      ?.copyWith(media: updatedMediaList),
                ),
              ),
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
            var updatedList = <GetProductListResponse>[];
            var updatedDetail = ProductDetailDTO();
            if (value.productId != null) {
              updatedList = state.getProductList.map((product) {
                if (product.id.toString() == value.productId) {
                  return product.copyWith(is_cart: true);
                }
                return product;
              }).toList();
            } else {
              updatedDetail = state.getProductDetails.copyWith(
                  product:
                      state.getProductDetails.product?.copyWith(is_cart: true));
            }

            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                getProductList: updatedList,
                getProductDetails: updatedDetail,
              ),
            );
            if (value.isMainProductAddedToCart == true) {
              add(
                ProductDetailEvent.getProductDetails(
                  state.getProductDetails.product?.id.toString() ?? "",
                  true,
                  true,
                  false,
                ),
              );
            }
            // // add(ProductDetailEvent.getProductYouMayAlsoLikeProductList(true));
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
            var updatedList = state.getProductList.map((product) {
              if (product.id.toString() == value.productId) {
                return product.copyWith(is_favorite: false);
              }
              return product;
            }).toList();
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                getProductList: updatedList,
              ),
            );
            //  add(ProductDetailEvent.getProductYouMayAlsoLikeProductList(true));
          },
          addToFavourite: (AddToFavourite value) async {
            emit(
              state.copyWith(
                isLoading: false,
                failureOrSuccessOption: none(),
              ),
            );
            Either<MainFailure, String>? failureOrSuccess;
            failureOrSuccess = await mainFacade.addProductToFavourite(
                productId: value.productId ??
                    state.getProductDetails.product?.id.toString() ??
                    "");
            var updatedList = state.getProductList.map((product) {
              if (product.id.toString() == value.productId) {
                return product.copyWith(is_favorite: true);
              }
              return product;
            }).toList();

            //  log('updatedList : ${updatedList}');

            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                getProductList: updatedList,
              ),
            );

            //   add(ProductDetailEvent.getProductYouMayAlsoLikeProductList(true));
          },
          getProductYouMayAlsoLikeProductList:
              (GetProductYouMayAlsoLikeProductList value) async {
            if (value.isRefresh) {
              pageForProductYoumayLike = 1;
              emit(
                state.copyWith(
                  getProductList: [],
                  isProductYouMayLikeLoading: value.isRefresh,
                ),
              );
              productYouMayLikeRefreshController.resetNoData();
            } else {
              if (pageForProductYoumayLike > lastPageForProductYoumayLike) {
                productYouMayLikeRefreshController.loadNoData();
                return;
              }
            }

            //  emit(state.copyWith(isLoading: true));

            var res = await mainFacade.getProductListAPI(
                page: pageForProductYoumayLike,
                productId:
                    state.getProductDetails.product?.id.toString() ?? "");

            pageForProductYoumayLike++;

            res.fold(
              (l) => emit(
                state.copyWith(
                  isErrorInAPI: true,
                  isProductYouMayLikeLoading: false,
                  getProductList: [],
                ),
              ),
              (r) {
                lastPageForProductYoumayLike = r.meta?.lastPage ?? 1;
                if (value.isRefresh) {
                  List.from(state.getProductList).clear();
                }
                return emit(
                  state.copyWith(
                    isProductYouMayLikeLoading: false,
                    isErrorInAPI: false,
                    isNoDataFound: (r.data as List<dynamic>)
                        .map((e) => GetProductListResponse.fromJson(e))
                        .toList()
                        .isEmpty,
                    getProductList: List.from(state.getProductList)
                      ..addAll((r.data as List<dynamic>)
                          .map((e) => GetProductListResponse.fromJson(e))
                          .toList()),
                  ),
                );
              },
            );
          },
          getShopDetailAPI: (GetShopDetailAPI value) async {
            if (value.isRefresh) {
              page = 1;
              emit(
                state.copyWith(
                  getProductList: [],
                  isShopDetailLoading: true,
                ),
              );
              productYouMayLikeRefreshController.resetNoData();
            } else {
              if (page > lastPage) {
                productYouMayLikeRefreshController.loadNoData();
                return;
              }
            }
            var res = await mainFacade.getShopDetailAPI(
              page: page,
              shopID: value.shopId ?? "",
            );

            page++;

            res.fold(
              (l) => emit(
                state.copyWith(
                  isErrorInAPI: true,
                  isShopDetailLoading: false,
                  shopDetailDTO: ShopDetailDTO(),
                  getProductList: [],
                ),
              ),
              (r) {
                lastPage = r.meta?.lastPage ?? 1;
                var searchRes = ShopDetailDTO.fromJson(r.data);
                var filterAPIList = <MapEntry<String, dynamic>>[];
                filterAPIList.addAll(
                  [
                    MapEntry('All', ['']),
                    MapEntry('New', ['']),
                    MapEntry('Top Selling', ['']),
                    MapEntry('Categories',
                        searchRes.categories?.map((e) => e).toList()),
                    MapEntry('Price \u{2191}', ['']),
                    MapEntry('Price \u{2193}', ['']),
                  ],
                );
                if (value.isRefresh) {
                  List.from(state.getProductList).clear();
                }
                return emit(
                  state.copyWith(
                    isShopDetailLoading: false,
                    isErrorInAPI: false,
                    shopDetailDTO: searchRes,
                    filterList: filterAPIList,
                    isNoDataFound: searchRes.product?.isEmpty ?? false,
                    getProductList: List.from(state.getProductList)
                      ..addAll(searchRes.product ?? []),
                    //  selectedFilterList: updatedSelectedFilter,
                  ),
                );
              },
            );
          },
          addFilterInList: (AddFilterInList value) async {
            var updateList = <MapEntry<String, dynamic>>[];

            if (List<MapEntry<String, dynamic>>.from(state.selectedFilterList)
                .toList()
                .map((e) => e)
                .toList()
                .map((e) => e.key.contains(value.addFilter.key))
                .contains(true)) {
              updateList = List<MapEntry<String, dynamic>>.from(
                  state.selectedFilterList)
                ..removeWhere((element) => element.key == value.addFilter.key);
            } else {
              updateList =
                  List<MapEntry<String, dynamic>>.from(state.selectedFilterList)
                    ..clear()
                    ..add(value.addFilter);
            }

            emit(
              state.copyWith(selectedFilterList: updateList),
            );
            add(ProductDetailEvent.getShopDetailFilterAPI(
                state.shopDetailDTO.vendor?.shop_id.toString() ?? "", true));
          },
          getShopDetailFilterAPI: (GetShopDetailFilterAPI value) async {
            if (value.isRefresh) {
              page = 1;
              emit(
                state.copyWith(
                  getProductList: [],
                  isLoading: true,
                ),
              );
              productYouMayLikeRefreshController.resetNoData();
            } else {
              if (page > lastPage) {
                productYouMayLikeRefreshController.loadNoData();
                return;
              }
            }
            var res = await mainFacade.getShopDetailFilterAPI(
              page: page,
              shopID: value.shopId ?? "",
              selectedFilterList: state.selectedFilterList,
            );

            page++;

            res.fold(
              (l) => emit(
                state.copyWith(
                  isErrorInAPI: true,
                  isLoading: false,
                  shopDetailDTO: ShopDetailDTO(),
                  getProductList: [],
                ),
              ),
              (r) {
                lastPage = r.meta?.lastPage ?? 1;
                var list = r.data as List;
                var filterData = list
                    .map((e) => GetProductListResponse.fromJson(e))
                    .toList();

                return emit(
                  state.copyWith(
                    isLoading: false,
                    isErrorInAPI: false,
                    isNoDataFound: filterData.isEmpty,
                    getProductList: filterData,
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
            var updatedList = <GetProductListResponse>[];
            var updatedDetail = ProductDetailDTO();
            if (state.getProductDetails.product?.cart_id.toString() ==
                value.cartId) {
              updatedDetail = state.getProductDetails.copyWith(
                  product: state.getProductDetails.product
                      ?.copyWith(is_cart: false));
            } else {
              updatedList = state.getProductList.map((product) {
                if (product.cart_id.toString() == value.cartId) {
                  return product.copyWith(is_cart: false);
                }
                return product;
              }).toList();
            }

            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                getProductList: updatedList,
                getProductDetails: updatedDetail,
              ),
            );
            //  add(ProductDetailEvent.getProductYouMayAlsoLikeProductList(true));
          },
          disposeController: (DisposeController value) async {
            var updateList =
                List<Media>.from(state.getProductDetails.product?.media ?? []);
            await updateList[state.selectedImageIndex]
                .videoPlayerController
                ?.dispose();
            updateList[state.selectedImageIndex].chewieController?.dispose();
            emit(
              state.copyWith(
                getProductDetails: state.getProductDetails.copyWith(
                  product: state.getProductDetails.product
                      ?.copyWith(media: updateList),
                ),
              ),
            );
          },
          getProductReviews: (GetProductReviews value) async {
            if (value.isRefresh) {
              page = 1;
              emit(state.copyWith(
                reviewList: [],
                isLoading: value.isRefresh,
                failureOrSuccessOption: none(),
              ));
              productReviewRefreshController.resetNoData();
            } else {
              if (page > lastPage) {
                productReviewRefreshController.loadNoData();
                return;
              }
            }

            var res = await mainFacade.getProductReviewAPI(
                productId: value.productId, page: page);
            page++;
            res.fold(
              (l) => emit(
                state.copyWith(
                  isErrorInAPI: true,
                  isLoading: false,
                ),
              ),
              (r) {
                lastPage = r.meta?.lastPage ?? 1;
                var list = r.data as List;
                var filterData = list.map((e) => Reviews.fromJson(e)).toList();

                return emit(
                  state.copyWith(
                    isLoading: false,
                    isErrorInAPI: false,
                    isNoDataFound: filterData.isEmpty,
                    reviewList: filterData,
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
