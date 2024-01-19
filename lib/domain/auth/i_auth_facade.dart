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
    required String countryCode,
    required MobileNumber mobileNumber,
  });

  Future<bool> checkAuthenticated();

  Future<Either<AuthFailure, Unit>> logout();

  Future<Either<AuthFailure, Unit>> changePassword({
    required Password oldPassword,
    required Password newPassword,
    required Password confirmNewPassword,
  });
  Future<Either<AuthFailure, Unit>> registerForPush({
    required String fcmToken,
  });
  Future<Either<AuthFailure, Unit>> verifyOtp({
    required String countryCode,
    required MobileNumber mobileNumber,
    required OTPText otp,
  });
  Future<Either<AuthFailure, Unit>> resendOtp({
    required String countryCode,
    required MobileNumber mobileNumber,
  });
}
