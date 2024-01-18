import 'package:dartz/dartz.dart';

import 'package:grape_customer_app/domain/auth/auth_failure.dart';
import 'package:grape_customer_app/domain/auth/auth_value_objects.dart';

abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> register({
    required Username firstName,
    required Username lastName,
    required EmailAddress emailAddress,
    required String countryCode,
    required MobileNumber mobileNumber,
  });

  Future<Either<AuthFailure, Unit>> login({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<bool> checkAuthenticated();

  Future<void> logout();

  Future<Either<AuthFailure, Unit>> changePassword({
    required Password oldPassword,
    required Password newPassword,
    required Password confirmNewPassword,
  });

  Future<Either<AuthFailure, Unit>> forgotPassword({
    required EmailAddress emailAddress,
  });
}
