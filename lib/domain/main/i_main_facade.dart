import 'package:dartz/dartz.dart';
import 'package:grape_customer_app/domain/main/main_failure.dart';
import 'package:grape_customer_app/infrastructure/core/common_response.dart';

abstract class IMainFacade {
  Future<Either<MainFailure, CommonResponse>> getProductListAPI();
}
