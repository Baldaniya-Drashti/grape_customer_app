import 'package:dartz/dartz.dart';
import 'package:grape_customer_app/domain/main/i_main_facade.dart';
import 'package:grape_customer_app/domain/main/main_failure.dart';
import 'package:grape_customer_app/infrastructure/core/common_response.dart';
import 'package:grape_customer_app/infrastructure/core/network/injectable_module.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IMainFacade)
class MainFacade implements IMainFacade {
  final ApiService apiService;

  MainFacade({required this.apiService});
  @override
  Future<Either<MainFailure, CommonResponse>> getProductListAPI() {
    throw UnimplementedError();
  }
}
