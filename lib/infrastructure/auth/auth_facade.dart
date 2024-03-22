import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grape_customer_app/domain/core/api_constants.dart';
import 'package:grape_customer_app/infrastructure/account/current_user_dto.dart';
import 'package:grape_customer_app/infrastructure/core/common_response.dart';
import 'package:grape_customer_app/infrastructure/core/network/injectable_module.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:grape_customer_app/domain/account/account.dart';
import 'package:grape_customer_app/domain/auth/auth_failure.dart';
import 'package:grape_customer_app/domain/auth/auth_value_objects.dart';
import 'package:grape_customer_app/domain/auth/i_auth_facade.dart';

import 'package:grape_customer_app/infrastructure/account/account_entity.dart';
import 'package:grape_customer_app/infrastructure/core/field_error.dart';
import 'package:grape_customer_app/infrastructure/core/hive_box_names.dart';
import 'package:grape_customer_app/presentation/common/utils/get_cookie.dart';

@LazySingleton(as: IAuthFacade)
class AuthFacade implements IAuthFacade {
  final ApiService apiService;

  AuthFacade(this.apiService);

  @override
  Future<Either<AuthFailure, String>> login({
    required String countryCode,
    required MobileNumber mobileNumber,
  }) async {
    try {
      final response = await apiService.postMethod(
        ApiConstants.login,
        {
          "role": 2,
          "country_code": countryCode,
          "mobile": mobileNumber.getOrCrash(),
        },
      );

      final account = CurrentUserDto.fromJson(response.data).toDomain();
      setRememberToken(account.rememberToken ?? "");
      _setUserData(account);
      return right(response.dioMessage ?? "");
    } on DioException catch (err) {
      if (err.response != null) {
        var commonRespose = CommonResponse.fromJson(err.response?.data);

        if (commonRespose.dioMessage != null) {
          return left(
              AuthFailure.showAPIResponseMessage(commonRespose.dioMessage!));
        }
      } else if (err.type == DioExceptionType.connectionError) {
        return left(const AuthFailure.networkError());
      }

      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, String>> register({
    required Username firstName,
    required Username lastName,
    required String emailAddress,
    required String countryCode,
    required MobileNumber mobileNumber,
  }) async {
    try {
      var mapData = {
        "role": 2,
        "first_name": firstName.getOrCrash(),
        "last_name": lastName.getOrCrash(),
        "country_code": countryCode,
        "mobile": mobileNumber.getOrCrash()
      };

      if (emailAddress.isNotEmpty) {
        mapData.addAll({
          "email": emailAddress,
        });
      }
      final response = await apiService.postMethod(
        ApiConstants.register,
        mapData,
      );

      final account = CurrentUserDto.fromJson(response.data).toDomain();
      setRememberToken(account.rememberToken ?? "");
      _setUserData(account);
      return right(response.dioMessage ?? "");
    } on DioException catch (err) {
      if (err.response != null) {
        var commonRespose = CommonResponse.fromJson(err.response?.data);

        if (commonRespose.dioMessage != null) {
          return left(
              AuthFailure.showAPIResponseMessage(commonRespose.dioMessage!));
        }
      }

      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<bool> checkAuthenticated() async {
    log('getUserToken() : ${getUserToken()}');
    // getCookie returns null as a String, so it has to be checked like this.
    return getUserToken() != null;
  }

  @override
  Future<Either<AuthFailure, String>> logout() async {
    try {
      return apiService.postMethod(ApiConstants.logout,
          {"device_id": await getDeviceId()}).then((value) async {
        Hive.box(BoxNames.settingsBox).clear();
        Hive.box<AccountEntity>(BoxNames.currentUser).clear();
        await Hive.box(BoxNames.settingsBox).put(BoxKeys.isUserShowIntro, true);
        return right(value.dioMessage ?? "");
      });
      // await Future.wait([

      // ]);
      //  return right('');
    } on DioException catch (err) {
      if (err.response != null) {
        var commonRespose = CommonResponse.fromJson(err.response?.data);

        if (commonRespose.dioMessage != null) {
          return left(
              AuthFailure.showAPIResponseMessage(commonRespose.dioMessage!));
        }
      }

      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> changePassword({
    required Password oldPassword,
    required Password newPassword,
    required Password confirmNewPassword,
  }) async {
    final oldPasswordStr = oldPassword.getOrCrash();
    final newPasswordStr = newPassword.getOrCrash();
    final confirmNewPasswordStr = confirmNewPassword.getOrCrash();

    try {
      await apiService.putMethod(
        '/account/change-password',
        data: {
          "currentPassword": oldPasswordStr,
          "newPassword": newPasswordStr,
          "confirmNewPassword": confirmNewPasswordStr
        },
      );

      return right(unit);
    } on DioException catch (err) {
      switch (err.response?.statusCode) {
        case 400:
          final errors = FieldError.getErrors(err.response!);
          if (errors.isNotEmpty) {
            return left(AuthFailure.badRequest(errors[0].message));
          }
          break;
        case 401:
          final error = FieldError.getError(err.response!);
          return left(AuthFailure.badRequest(error.message));
      }
      return left(const AuthFailure.serverError());
    } on SocketException catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, String>> verifyOtp({
    required String countryCode,
    required MobileNumber mobileNumber,
    required OTPText otp,
  }) async {
    try {
      final response = await apiService.postMethod(
        ApiConstants.verifyOtp,
        {
          "remember_token": getRememberToken(),
          "type": 2,
          "country_code": countryCode,
          "mobile": mobileNumber.getOrCrash(),
          "otp": otp.getOrCrash(),
        },
      );

      final account = CurrentUserDto.fromJson(response.data).toDomain();
      setUserToken(account.auth?.accessToken ?? "");
      _setUserData(account);
      return right(response.dioMessage ?? "");
    } on DioException catch (err) {
      if (err.response != null) {
        var commonRespose = CommonResponse.fromJson(err.response?.data);

        if (commonRespose.dioMessage != null) {
          return left(
              AuthFailure.showAPIResponseMessage(commonRespose.dioMessage!));
        }
      }

      return left(const AuthFailure.serverError());
    }
  }

  Future<void> setRememberToken(String authToken) async {
    // Hacky solution to allow testing
    if (!Platform.environment.containsKey('FLUTTER_TEST')) {
      if (authToken.isNotEmpty) {
        await Hive.box(BoxNames.settingsBox)
            .put(BoxKeys.rememberToken, authToken);
      }
    }
  }

  Future<void> setUserToken(String authToken) async {
    // Hacky solution to allow testing
    if (!Platform.environment.containsKey('FLUTTER_TEST')) {
      if (authToken.isNotEmpty) {
        await Hive.box(BoxNames.settingsBox).put(BoxKeys.userToken, authToken);
      }
    }
  }

  void _setUserData(Account account) {
    // Hacky solution to allow testing
    if (!Platform.environment.containsKey('FLUTTER_TEST')) {
      final box = Hive.box<AccountEntity>(BoxNames.currentUser);
      box.put(BoxKeys.currentKey, AccountEntity.fromDomain(account));
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> registerForPush(
      {required String fcmToken}) async {
    try {
      await apiService.postMethod(
        ApiConstants.registerForPush,
        {
          "device_id": await getDeviceId(),
          "device_type": Platform.isAndroid ? "1" : "2",
          "token": fcmToken,
        },
      );

      return right(unit);
    } on DioException catch (err) {
      if (err.response != null) {
        var commonRespose = CommonResponse.fromJson(err.response?.data);

        if (commonRespose.dioMessage != null) {
          return left(
              AuthFailure.showAPIResponseMessage(commonRespose.dioMessage!));
        }
      }

      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, String>> resendOtp({
    required String countryCode,
    required MobileNumber mobileNumber,
  }) async {
    try {
      final response = await apiService.postMethod(
        ApiConstants.sendOtp,
        {
          "is_forgot_password": false,
          "remember_token": getRememberToken(),
          "type": 2,
          "country_code": countryCode,
          "mobile": mobileNumber.getOrCrash(),
        },
      );

      final account = CurrentUserDto.fromJson(response.data).toDomain();
      setUserToken(account.auth?.accessToken ?? "");
      _setUserData(account);
      return right(response.dioMessage ?? "");
    } on DioException catch (err) {
      if (err.response != null) {
        var commonRespose = CommonResponse.fromJson(err.response?.data);

        if (commonRespose.dioMessage != null) {
          return left(
              AuthFailure.showAPIResponseMessage(commonRespose.dioMessage!));
        }
      }

      return left(const AuthFailure.serverError());
    }
  }
}
