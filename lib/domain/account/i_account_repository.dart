import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:grape_customer_app/domain/account/account.dart';
import 'package:grape_customer_app/domain/account/account_failure.dart';
import 'package:grape_customer_app/domain/auth/auth_failure.dart';
import 'package:grape_customer_app/domain/auth/auth_value_objects.dart';

abstract class IAccountRepository {
  Future<Either<AccountFailure, Unit>> getCurrentUserApi();
  Future<Either<AccountFailure, Unit>> updateUser({
    required Username firstName,
    required Username lastName,
    required EmailAddress emailAddress,
    required String countryCode,
    required MobileNumber mobileNumber,
    String? profileImage,
  });
}
