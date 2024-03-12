import 'package:dartz/dartz.dart';
import 'package:grape_customer_app/domain/main/main_failure.dart';
import 'package:grape_customer_app/infrastructure/core/common_response.dart';
import 'package:grape_customer_app/infrastructure/main/home_dto/get_product_list_response.dart';

abstract class IMainFacade {
  Future<Either<MainFailure, CommonResponse>> getProductListAPI(
      {required int page});
  Future<Either<MainFailure, CommonResponse>> searchProductListAPI(
      {required int page, String searchText = ''});
  Future<Either<MainFailure, GetProductListResponse>> getProductDetailsAPI({
    required String productId,
  });

  Future<Either<MainFailure, String>> addProductToCart({
    required String productId,
  });
  Future<Either<MainFailure, String>> deleteProductFromCart({
    required String productId,
  });
  Future<Either<MainFailure, String>> addProductToFavourite({
    required String productId,
  });
  Future<Either<MainFailure, CommonResponse>> getCartListAPI(
      {required int page});

  Future<Either<MainFailure, CommonResponse>> getFavouriteAPI(
      {required int page});
}
