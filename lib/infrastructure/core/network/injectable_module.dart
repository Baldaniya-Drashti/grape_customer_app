import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:grape_customer_app/domain/core/api_constants.dart';

import 'package:grape_customer_app/infrastructure/core/common_response.dart';
import 'package:grape_customer_app/infrastructure/core/network/interceptor/api_error_interceptors.dart';
import 'package:grape_customer_app/infrastructure/core/network/interceptor/dio_connectivity_request_retrier.dart';
import 'package:grape_customer_app/presentation/common/utils/get_cookie.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiService {
  CommonResponse commonResponse = CommonResponse();
  static Dio dio = Dio();

  static Dio initAPIService({bool isMultipart = false}) {
    final interceptor = InterceptorsWrapper(
      onRequest: (options, handler) {
        String? userToken = getUserToken();
        if (userToken != null) {
          options.headers.addAll({
            "Authorization": "Bearer $userToken",
          });
        }

        return handler.next(options); //continue
      },
      onResponse: (response, handler) {
        return handler.next(response); // continue
      },
      onError: (DioException e, handler) {
        return handler.next(e); //continue
      },
    );
    final BaseOptions options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(milliseconds: 5000), //5s
      receiveTimeout: const Duration(milliseconds: 15000), //15s
      contentType: isMultipart
          ? Headers.multipartFormDataContentType
          : Headers.jsonContentType,
    );

    dio = Dio(options)
      ..interceptors.addAll([
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
        AppInterceptors(
            requestRetrier: DioConnectivityRequestRetrier(
          dio: dio,
          connectivity: Connectivity(),
        )),
        interceptor,
      ]);

    return dio;
  }

  Future<CommonResponse?> postMethod(String path, dynamic data,
      {bool isMultipart = false,
      FormData? formData,
      Map<String, dynamic>? queryParameters}) async {
    dio = initAPIService(isMultipart: isMultipart);
    return await dio
        .post(
      path,
      data: isMultipart ? formData : data,
      queryParameters: queryParameters,
    )
        .then((value) {
      if (value.statusCode == 200) {
        return CommonResponse.fromJson(value.data);
      }
      return null;
    }).catchError((error) {
      return error;
    });
  }

  Future<CommonResponse?> getMethod(String path,
      {Map<String, dynamic>? queryParameters}) async {
    dio = initAPIService();
    return await dio
        .get(
      path,
      queryParameters: queryParameters,
    )
        .then((value) {
      if (value.statusCode == 200) {
        return CommonResponse.fromJson(value.data);
      }
      return null;
    }).catchError((error) {
      return error;
    });
  }

  Future defaultGetMethod(String path,
      {Map<String, dynamic>? queryParameters}) async {
    dio = initAPIService();

    return await dio
        .get(
      path,
      queryParameters: queryParameters,
    )
        .then((value) {
      if (value.statusCode == 200) {
        return value;
      }
    }).catchError((error) {
      return error;
    });
  }

  Future<CommonResponse?> putMethod(String path,
      {Map<String, dynamic>? queryParameters,
      dynamic data,
      bool isMultipart = false,
      FormData? formData}) async {
    dio = initAPIService(isMultipart: isMultipart);
    return await dio
        .put(
      path,
      data: isMultipart ? formData : data,
      queryParameters: queryParameters,
    )
        .then((value) {
      if (value.statusCode == 200) {
        return CommonResponse.fromJson(value.data);
      }
      return null;
    }).catchError((error) {
      return error;
    });
  }

  Future<CommonResponse?> deleteMethod(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    dio = initAPIService();
    await dio
        .delete(
      path,
      data: data,
      queryParameters: queryParameters,
    )
        .then((value) {
      if (value.statusCode == 200) {
        return CommonResponse.fromJson(value.data);
      }
      return null;
    }).catchError((error) {
      return error;
    });
    return null;
  }
}
