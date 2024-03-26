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
import 'package:grape_customer_app/domain/account/account_failure.dart';
import 'package:grape_customer_app/domain/account/i_account_repository.dart';
import 'package:grape_customer_app/domain/auth/auth_value_objects.dart';

import 'package:grape_customer_app/infrastructure/account/account_entity.dart';
import 'package:grape_customer_app/infrastructure/core/hive_box_names.dart';

@LazySingleton(as: IAccountRepository)
class AccountRepository extends IAccountRepository {
  final ApiService apiService;

  AccountRepository(this.apiService);

  @override
  Future<Either<AccountFailure, List>> updateUser({
    required Username firstName,
    required Username lastName,
    required String emailAddress,
    required String countryCode,
    required MobileNumber mobileNumber,
    String? profileImage,
  }) async {
    try {
      log('${emailAddress.isEmpty}');
      var formData = FormData.fromMap({
        "first_name": firstName.getOrCrash(),
        "last_name": lastName.getOrCrash(),
        "country_code": countryCode,
        "email": emailAddress.isEmpty ? null : emailAddress,
        "mobile": mobileNumber.getOrCrash(),
      });
      log('formData : ${formData.fields.map((e) => e)}');
      if (profileImage != null &&
          profileImage.isNotEmpty &&
          !profileImage.contains('https')) {
        var multipartFile = await MultipartFile.fromFile(
          profileImage,
          filename: 'profile.png',
          headers: {
            'contentType': ['image/png'],
          },
        );
        formData.files.add(MapEntry('profile', multipartFile));
      }
      final response = await apiService.postMethod(ApiConstants.updateUser, {},
          formData: formData, isMultipart: true);

      if (response.data != null) {
        final account = CurrentUserDto.fromJson(response.data).toDomain();

        _setUserData(account);
        return right([account, response.dioMessage]);
      } else {
        return left(const AccountFailure.serverError());
      }
    } on DioException catch (err) {
      if (err.response != null) {
        var commonRespose = CommonResponse.fromJson(err.response?.data);

        if (commonRespose.dioMessage != null) {
          return left(
              AccountFailure.showAPIResponseMessage(commonRespose.dioMessage!));
        }
      }

      return left(const AccountFailure.serverError());
    }
  }

  @override
  Future<Either<AccountFailure, Account>> getCurrentUserApi() async {
    try {
      final response = await apiService.getMethod(
        ApiConstants.getUser,
      );
      if (response != null && response.data != null) {
        final account = CurrentUserDto.fromJson(response.data).toDomain();
        _setUserData(account);
        return right(account);
      } else {
        return left(const AccountFailure.serverError());
      }

      //  setUserToken(account.auth?.accessToken ?? "");
      //_setUserData(account);
    } on DioException catch (err) {
      if (err.response != null) {
        var commonRespose = CommonResponse.fromJson(err.response?.data);

        if (commonRespose.dioMessage != null) {
          return left(
              AccountFailure.showAPIResponseMessage(commonRespose.dioMessage!));
        }
      }

      return left(const AccountFailure.serverError());
    }
  }

  void _setUserData(Account account) {
    // Hacky solution to allow testing
    if (!Platform.environment.containsKey('FLUTTER_TEST')) {
      final box = Hive.box<AccountEntity>(BoxNames.currentUser);
      box.put(BoxKeys.currentKey, AccountEntity.fromDomain(account));
    }
  }
}
