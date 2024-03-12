import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grape_customer_app/domain/core/api_constants.dart';
import 'package:grape_customer_app/domain/main/i_main_facade.dart';
import 'package:grape_customer_app/domain/main/main_failure.dart';
import 'package:grape_customer_app/infrastructure/core/common_response.dart';
import 'package:grape_customer_app/infrastructure/core/network/injectable_module.dart';
import 'package:grape_customer_app/infrastructure/main/home_dto/get_product_list_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IMainFacade)
class MainFacade implements IMainFacade {
  final ApiService apiService;
  static const int _perPage = 25;

  MainFacade({required this.apiService});

  @override
  Future<Either<MainFailure, CommonResponse>> getProductListAPI(
      {required int page}) async {
    try {
      final res = await apiService
          .getMethod(ApiConstants.getCustomerProducts, queryParameters: {
        'page': page,
        'limit': _perPage,
      });

      if (res != null) {
        return right(res);
      } else {
        return left(const MainFailure.serverError());
      }
    } on DioException catch (err) {
      if (err.response != null) {
        var commonRespose = CommonResponse.fromJson(err.response?.data);

        if (commonRespose.dioMessage != null) {
          return left(
              MainFailure.showAPIResponseMessage(commonRespose.dioMessage!));
        }
      } else if (err.type == DioExceptionType.connectionError) {
        return left(const MainFailure.networkError());
      }

      return left(const MainFailure.serverError());
    }
  }

  @override
  Future<Either<MainFailure, GetProductListResponse>> getProductDetailsAPI(
      {required String productId}) async {
    try {
      final res = await apiService.getMethod(
        '${ApiConstants.getCustomerProductsDetails}/$productId',
      );

      if (res != null && res.data != null) {
        return right(GetProductListResponse.fromJson(res.data));
      } else {
        return left(const MainFailure.serverError());
      }
    } on DioException catch (err) {
      if (err.response != null) {
        var commonRespose = CommonResponse.fromJson(err.response?.data);

        if (commonRespose.dioMessage != null) {
          return left(
              MainFailure.showAPIResponseMessage(commonRespose.dioMessage!));
        }
      } else if (err.type == DioExceptionType.connectionError) {
        return left(const MainFailure.networkError());
      }

      return left(const MainFailure.serverError());
    }
  }

  @override
  Future<Either<MainFailure, CommonResponse>> searchProductListAPI(
      {required int page, String searchText = ''}) async {
    try {
      var mapData = <String, dynamic>{
        'page': page,
        'limit': _perPage,
      };
      if (searchText.isNotEmpty) {
        mapData.addAll({'product': searchText.trim()});
      }
      final res = await apiService.getMethod(ApiConstants.searchProduct,
          queryParameters: mapData);

      if (res != null) {
        return right(res);
      } else {
        return left(const MainFailure.serverError());
      }
    } on DioException catch (err) {
      if (err.response != null) {
        var commonRespose = CommonResponse.fromJson(err.response?.data);

        if (commonRespose.dioMessage != null) {
          return left(
              MainFailure.showAPIResponseMessage(commonRespose.dioMessage!));
        }
      } else if (err.type == DioExceptionType.connectionError) {
        return left(const MainFailure.networkError());
      }

      return left(const MainFailure.serverError());
    }
  }

  @override
  Future<Either<MainFailure, String>> addProductToCart(
      {required String productId}) async {
    try {
      final res = await apiService
          .postMethod(ApiConstants.addProductToCart, {"product_id": productId});

      if (res.dioMessage != null) {
        return right(res.dioMessage ?? "");
      } else {
        return left(const MainFailure.serverError());
      }
    } on DioException catch (err) {
      if (err.response != null) {
        var commonRespose = CommonResponse.fromJson(err.response?.data);

        if (commonRespose.dioMessage != null) {
          return left(
              MainFailure.showAPIResponseMessage(commonRespose.dioMessage!));
        }
      } else if (err.type == DioExceptionType.connectionError) {
        return left(const MainFailure.networkError());
      }

      return left(const MainFailure.serverError());
    }
  }

  @override
  Future<Either<MainFailure, String>> deleteProductFromCart(
      {required String productId}) async {
    try {
      final res = await apiService
          .deleteMethod('${ApiConstants.removeProductFromCart}/$productId');

      if (res != null && res.dioMessage != null) {
        return right(res.dioMessage ?? "");
      } else {
        return left(const MainFailure.serverError());
      }
    } on DioException catch (err) {
      if (err.response != null) {
        var commonRespose = CommonResponse.fromJson(err.response?.data);

        if (commonRespose.dioMessage != null) {
          return left(
              MainFailure.showAPIResponseMessage(commonRespose.dioMessage!));
        }
      } else if (err.type == DioExceptionType.connectionError) {
        return left(const MainFailure.networkError());
      }

      return left(const MainFailure.serverError());
    }
  }

  @override
  Future<Either<MainFailure, CommonResponse>> getCartListAPI(
      {required int page}) async {
    try {
      var mapData = <String, dynamic>{
        'page': page,
        'limit': _perPage,
      };

      final res = await apiService.getMethod(ApiConstants.getCartList,
          queryParameters: mapData);

      if (res != null) {
        return right(res);
      } else {
        return left(const MainFailure.serverError());
      }
    } on DioException catch (err) {
      if (err.response != null) {
        var commonRespose = CommonResponse.fromJson(err.response?.data);

        if (commonRespose.dioMessage != null) {
          return left(
              MainFailure.showAPIResponseMessage(commonRespose.dioMessage!));
        }
      } else if (err.type == DioExceptionType.connectionError) {
        return left(const MainFailure.networkError());
      }

      return left(const MainFailure.serverError());
    }
  }
}
