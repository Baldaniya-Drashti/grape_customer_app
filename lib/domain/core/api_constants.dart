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
}
