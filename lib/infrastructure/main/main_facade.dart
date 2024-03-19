import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grape_customer_app/domain/auth/auth_value_objects.dart';
import 'package:grape_customer_app/domain/core/api_constants.dart';
import 'package:grape_customer_app/domain/main/i_main_facade.dart';
import 'package:grape_customer_app/domain/main/main_failure.dart';
import 'package:grape_customer_app/infrastructure/core/common_response.dart';
import 'package:grape_customer_app/infrastructure/core/network/injectable_module.dart';
import 'package:grape_customer_app/infrastructure/main/shipping_address_dto/shipping_address_dto.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IMainFacade)
class MainFacade implements IMainFacade {
  final ApiService apiService;
  static const int _perPage = 25;

  MainFacade({required this.apiService});

  @override
  Future<Either<MainFailure, CommonResponse>> getProductListAPI({
    required int page,
    String? productId,
  }) async {
    try {
      Map<String, dynamic> mapData = {
        'page': page,
        'limit': _perPage,
      };
      if (productId != null) {
        mapData.addAll({
          'is_like_list': "1",
          'product_id': productId,
        });
      }
      final res = await apiService.getMethod(ApiConstants.getCustomerProducts,
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
  Future<Either<MainFailure, CommonResponse>> getProductDetailsAPI({
    required String productId,
    required int page,
  }) async {
    try {
      final res = await apiService.getMethod(
          '${ApiConstants.getCustomerProductsDetails}/$productId',
          queryParameters: {
            'page': page,
            'limit': _perPage,
          });

      if (res != null && res.data != null) {
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
  Future<Either<MainFailure, CommonResponse>> searchProductListAPI({
    required int page,
    String searchText = '',
    required List<MapEntry<String, dynamic>> selectedFilterList,
  }) async {
    try {
      var mapData = <String, dynamic>{
        'page': page,
        'limit': _perPage,
      };

      if (selectedFilterList.isNotEmpty) {
        mapData.addEntries(selectedFilterList);
      }
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

  @override
  Future<Either<MainFailure, String>> addProductToFavourite(
      {required String productId}) async {
    try {
      final res = await apiService.postMethod(ApiConstants.addFavourite, {
        'product_id': productId,
      });

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
  Future<Either<MainFailure, CommonResponse>> getFavouriteAPI(
      {required int page}) async {
    try {
      var mapData = <String, dynamic>{
        'page': page,
        'limit': _perPage,
      };

      final res = await apiService.getMethod(ApiConstants.getFavouriteList,
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
  Future<Either<MainFailure, String>> addShippingAddress(
      {required Username fullName,
      required MobileNumber mobileNumber,
      required String countryCode,
      required InputEmptyOrNot address,
      required InputEmptyOrNot landMark,
      required InputEmptyOrNot state,
      required InputEmptyOrNot city,
      required InputEmptyOrNot pinCode}) async {
    try {
      final res = await apiService.postMethod(
        ApiConstants.addShippingAddress,
        {
          "full_name": fullName.getOrCrash(),
          "country_code": countryCode,
          "mobile": mobileNumber.getOrCrash(),
          "address": address.getOrCrash(),
          "landmark": landMark.getOrCrash(),
          "state": state.getOrCrash(),
          "city": city.getOrCrash(),
          "pincode": pinCode.getOrCrash(),
        },
      );

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
  Future<Either<MainFailure, List<ShippingAddressDTO>>>
      getShippingAddressAPI() async {
    try {
      final res = await apiService.getMethod(
        ApiConstants.getShippingAddressList,
      );

      if (res != null && res.data != null) {
        var list = res.data as List<dynamic>;
        return right(list.map((e) => ShippingAddressDTO.fromJson(e)).toList());
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
  Future<Either<MainFailure, String>> editShippingAddress(
      {required String id,
      required Username fullName,
      required MobileNumber mobileNumber,
      required String countryCode,
      required InputEmptyOrNot address,
      required InputEmptyOrNot landMark,
      required InputEmptyOrNot state,
      required InputEmptyOrNot city,
      required InputEmptyOrNot pinCode}) async {
    try {
      final res = await apiService.postMethod(
        ApiConstants.updateShippingAddress,
        {
          "id": id,
          "full_name": fullName.getOrCrash(),
          "country_code": countryCode,
          "mobile": mobileNumber.getOrCrash(),
          "address": address.getOrCrash(),
          "landmark": landMark.getOrCrash(),
          "state": state.getOrCrash(),
          "city": city.getOrCrash(),
          "pincode": pinCode.getOrCrash(),
        },
      );

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
  Future<Either<MainFailure, String>> deleteShippinAddress(
      {required String id}) async {
    try {
      final res = await apiService.deleteMethod(
        '${ApiConstants.deleteShippingAddress}/$id',
      );

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
  Future<Either<MainFailure, String>> addPaymentMethod(
      {required Username cardHoldersName,
      required CardNumber cardNumber,
      required CardDate cardDate,
      required CVV cvv}) async {
    try {
      // log(cardDate.getOrCrash()?.split('/')[0] ?? "");
      final res = await apiService.postMethod(
        ApiConstants.addPaymentMethod,
        {
          "card_holder_name": cardHoldersName.getOrCrash(),
          "card_number": cardNumber.getOrCrash(),
          "expiry_month": cardDate.getOrCrash()?.split('/')[0],
          "expiry_year": cardDate.getOrCrash()?.split('/')[1],
          "cvv": cvv.getOrCrash(),
        },
      );

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
  Future<Either<MainFailure, List<ShippingAddressDTO>>>
      getPaymentMethod() async {
    try {
      final res = await apiService.getMethod(
        ApiConstants.getPaymentMethod,
      );

      if (res != null && res.data != null) {
        var list = res.data as List<dynamic>;
        return right(list.map((e) => ShippingAddressDTO.fromJson(e)).toList());
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
  Future<Either<MainFailure, String>> deleteProductFromFavourite(
      {required String productId}) async {
    try {
      final res = await apiService
          .deleteMethod('${ApiConstants.removeFavourite}/$productId');

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
  Future<Either<MainFailure, String>> addContactSupport(
      {required InputEmptyOrNot title,
      required InputEmptyOrNot message}) async {
    try {
      // log(cardDate.getOrCrash()?.split('/')[0] ?? "");
      final res = await apiService.postMethod(
        ApiConstants.contactSupport,
        {
          "title": title.getOrCrash(),
          "description": title.getOrCrash(),
        },
      );

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
}
