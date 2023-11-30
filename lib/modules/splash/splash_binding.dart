import 'package:get/get.dart';
import 'package:grape_customer_app/modules/splash/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
        () => SplashController(repository: Get.find()));
  }
}
