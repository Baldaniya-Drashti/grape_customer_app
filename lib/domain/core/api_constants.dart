import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String baseUrl = dotenv.env['DEV_API_BASE_URL']!;
  //core
  static String registerForPush = 'register-for-push';

  //auth
  static String register = 'auth/register';
  static String login = 'auth/login';
  static String sendOtp = 'auth/send-otp';
  static String verifyOtp = 'auth/verify-otp';
  static String logout = 'auth/logout';

  static String getUser = 'user/info';

  //edit user
  static String updateUser = 'edit/user';
  static String editUserSendOtp = 'edit/user/send/otp';
  static String editUserVerifyOtp = 'edit/user/verify/otp';

  //products
  static String getCustomerProducts = 'customer/products';
  static String getCustomerProductsDetails = 'customer/products/view';
}
