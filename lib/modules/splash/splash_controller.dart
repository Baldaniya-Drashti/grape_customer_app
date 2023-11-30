import 'package:get/get.dart';
import 'package:grape_customer_app/api/api_repository.dart';
import 'package:grape_customer_app/routes/app_pages.dart';
import 'package:grape_customer_app/shared/constants/png_image_constant.dart';

class SplashController extends GetxController {
  final ApiRepository repository;
  final logo = PngImageConstants.grape_logo.obs;
  SplashController({required this.repository});
  @override
  void onInit() async {
    // await Future.delayed(
    //   Duration(seconds: 3),
    //   () => Get.offAllNamed(Routes.MAIN),
    // );
    super.onInit();
  }
}
