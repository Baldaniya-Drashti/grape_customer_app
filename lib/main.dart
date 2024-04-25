// import 'dart:io';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:grape_customer_app/domain/core/environment/environment.dart';
// import 'package:grape_customer_app/infrastructure/core/network/injectable_module.dart';
// import 'package:grape_customer_app/presentation/core/app_router.dart';
// import 'package:grape_customer_app/presentation/core/restart_widget.dart';
// import 'package:grape_customer_app/setup_hive.dart';
// import 'package:injectable/injectable.dart';
// import 'package:grape_customer_app/injection.dart';
// import 'package:grape_customer_app/presentation/core/app_widget.dart';
// import 'dart:async';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

// Future<void> main() async {
//   runZonedGuarded<Future<void>>(
//     () async {
//       WidgetsFlutterBinding.ensureInitialized();
//       SystemChrome.setSystemUIOverlayStyle(
//         SystemUiOverlayStyle.dark.copyWith(
//           statusBarColor: Colors.transparent,
//           statusBarIconBrightness: Brightness.dark,
//           statusBarBrightness: Brightness.light,
//         ),
//       );

//       await SystemChrome.setPreferredOrientations(
//         [
//           DeviceOrientation.portraitUp,
//           DeviceOrientation.portraitDown,
//         ],
//       );
//       getIt.registerSingleton<AppRouter>(AppRouter());
//       await Firebase.initializeApp(
//         options: Platform.isIOS
//             ? null
//             : const FirebaseOptions(
//                 apiKey: 'AIzaSyAEPe7upukbefIVDSmvNL90bc-MYfObF4I',
//                 appId: '1:568471335476:android:870d2cdcbf08727af09061',
//                 messagingSenderId: '568471335476',
//                 projectId: 'grape-market-place',
//               ),
//       ).catchError((e) {
//         print(e);
//         return e;
//       }).then((v) async {
//         await _initializeCrashlytics();

//         await dotenv.load(fileName: ".env");
//         configureInjection(Environment.dev);
//         String environment = String.fromEnvironment(
//           'ENVIRONMENT',
//           defaultValue: Environment.dev,
//         );
//         EnvironmentCongig().initConfig(environment);
//         await setupHive();
//         ApiService.initAPIService();

//         Stripe.publishableKey = dotenv.get("STIPE_TEST_KEY");
//         runApp(RestartWidget(child: AppWidget()));
//       });
//     },
//     (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack),
//   );
// }

// Future<void> _initializeCrashlytics() async {
//   if (!kIsWeb) {
//     await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
//   }
//   FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
// }
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MpesaPaymentScreen extends StatefulWidget {
  @override
  _MpesaPaymentScreenState createState() => _MpesaPaymentScreenState();
}

class _MpesaPaymentScreenState extends State<MpesaPaymentScreen> {
  String _statusMessage = '';

  Future<void> initiateMpesaPayment() async {
    // Obtain Access Token
    String? accessToken = await getAccessToken();

    // Use Access Token to initiate payment
    if (accessToken != null) {
      try {
        var url =
            'https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest';
        var headers = {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json'
        };
        var payload = {
          "BusinessShortCode": "174379",
          "Password":
              "MTc0Mzc5YmZiMjc5ZjlhYTliZGJjZjE1OGU5N2RkNzFhNDY3Y2QyZTBjODkzMDU5YjEwZjc4ZTZiNzJhZGExZWQyYzkxOTIwMTYwMjE2MTY1NjI3",
          "Timestamp": "20160216165627",
          "TransactionType": "CustomerPayBillOnline",
          "Amount": "100",
          "PartyA": "254708374149",
          "PartyB": "174379",
          "PhoneNumber": "254708374149",
          "CallBackURL": "https://mydomain.com/pat",
          "AccountReference": "Test",
          "TransactionDesc": "Test"
        };

        var response = await http.post(Uri.tryParse(url)!,
            headers: headers, body: json.encode(payload));
        log(response.body);
        if (response.statusCode == 200) {
          // Payment initiated successfully, handle response
          var jsonResponse = json.decode(response.body);
          setState(() {
            _statusMessage = 'Payment initiated successfully: $jsonResponse';
          });
        } else {
          // Handle error
          setState(() {
            _statusMessage =
                'Request failed with status: ${response.statusCode}';
          });
        }
      } catch (e) {
        // Handle network or other errors
        setState(() {
          _statusMessage = 'Error: $e';
        });
      }
    } else {
      setState(() {
        _statusMessage = 'Failed to obtain access token';
      });
    }
  }

  Future<String?> getAccessToken() async {
    // M-Pesa API credentials
    String username = 'ptq463Fi9OYJd68BBfHKpJGxN4dZ6N8e6pVKbjlOdXzA7hkh';
    String password =
        'LhF4gEoGhCwsb5w8BaGSGai9QEXaFD4zCWZYTqpke9aFgqmzOohuDN1xkx1kKA9T';

    // Base64 encode the username and password
    String basicAuth = base64Encode(utf8.encode('$username:$password'));

    // API endpoint for generating access token
    String url =
        'https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials';

    try {
      // Make the POST request to generate access token
      final response = await http.get(
        Uri.tryParse(url)!,
        headers: <String, String>{
          'Authorization': 'Basic $basicAuth',
          'Content-Type': 'application/json',
        },
      );
      log('response : ${response.body}');
      if (response.statusCode == 200) {
        // Parse the JSON response
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        // Extract and return the access token
        return jsonResponse['access_token'];
      } else {
        // Handle error response
        print('Failed to generate access token: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // Handle network or other errors
      print('Error generating access token: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('M-Pesa Payment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: initiateMpesaPayment,
              child: Text('Initiate M-Pesa Payment'),
            ),
            SizedBox(height: 20),
            Text(_statusMessage),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MpesaPaymentScreen(),
  ));
}

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class MpesaPaymentScreen extends StatefulWidget {
//   @override
//   _MpesaPaymentScreenState createState() => _MpesaPaymentScreenState();
// }

// class _MpesaPaymentScreenState extends State<MpesaPaymentScreen> {
//   String _statusMessage = '';

//   Future<void> _initiateMpesaPayment() async {
//     try {
//       var url =
//           'https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest';
//       var headers = {
//         'Authorization': 'Bearer YOUR_ACCESS_TOKEN',
//         'Content-Type': 'application/json'
//       };
//       var payload = {
//         "BusinessShortCode": "YOUR_BUSINESS_SHORTCODE",
//         "Password": "YOUR_PASSWORD",
//         "Timestamp": "YYYYMMDDHHmmss",
//         "TransactionType": "CustomerPayBillOnline",
//         "Amount": "AMOUNT",
//         "PartyA": "YOUR_PHONE_NUMBER",
//         "PartyB": "YOUR_BUSINESS_SHORTCODE",
//         "PhoneNumber": "YOUR_PHONE_NUMBER",
//         "CallBackURL": "YOUR_CALLBACK_URL",
//         "AccountReference": "YOUR_ACCOUNT_REFERENCE",
//         "TransactionDesc": "YOUR_TRANSACTION_DESCRIPTION"
//       };

//       var response = await http.post(Uri.tryParse(url)!,
//           headers: headers, body: json.encode(payload));

//       if (response.statusCode == 200) {
//         var jsonResponse = json.decode(response.body);
//         setState(() {
//           _statusMessage = 'Payment initiated successfully: $jsonResponse';
//         });
//       } else {
//         setState(() {
//           _statusMessage = 'Request failed with status: ${response.statusCode}';
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _statusMessage = 'Error: $e';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('M-Pesa Payment'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: _initiateMpesaPayment,
//               child: Text('Initiate M-Pesa Payment'),
//             ),
//             SizedBox(height: 20),
//             Text(_statusMessage),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: MpesaPaymentScreen(),
//   ));
// }
