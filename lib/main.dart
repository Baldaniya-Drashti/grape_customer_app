import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:grape_customer_app/domain/core/environment/environment.dart';
import 'package:grape_customer_app/infrastructure/core/network/injectable_module.dart';
import 'package:grape_customer_app/presentation/core/app_router.dart';
import 'package:grape_customer_app/presentation/core/restart_widget.dart';
import 'package:grape_customer_app/setup_hive.dart';
import 'package:injectable/injectable.dart';
import 'package:grape_customer_app/injection.dart';
import 'package:grape_customer_app/presentation/core/app_widget.dart';
import 'dart:async';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      );

      await SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ],
      );
      getIt.registerSingleton<AppRouter>(AppRouter());
      await Firebase.initializeApp(
        options: Platform.isIOS
            ? null
            : const FirebaseOptions(
                apiKey: 'AIzaSyAEPe7upukbefIVDSmvNL90bc-MYfObF4I',
                appId: '1:568471335476:android:870d2cdcbf08727af09061',
                messagingSenderId: '568471335476',
                projectId: 'grape-market-place',
              ),
      ).catchError((e) {
        print(e);
        return e;
      }).then((v) async {
        await _initializeCrashlytics();

        await dotenv.load(fileName: ".env");
        configureInjection(Environment.dev);
        String environment = String.fromEnvironment(
          'ENVIRONMENT',
          defaultValue: Environment.dev,
        );
        EnvironmentCongig().initConfig(environment);
        await setupHive();
        ApiService.initAPIService();

        Stripe.publishableKey = dotenv.get("STIPE_TEST_KEY");
        runApp(RestartWidget(child: AppWidget()));
      });
    },
    (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack),
  );
}

Future<void> _initializeCrashlytics() async {
  if (!kIsWeb) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  }
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
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

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:keyboard_actions/keyboard_actions.dart';
// import 'package:keyboard_actions/keyboard_actions_item.dart';
// import 'package:keyboard_actions/keyboard_custom.dart';

// // Application entry-point
// void main() => runApp(MyApp());

// class Sample2 extends StatelessWidget {
//   final _focusSample = FocusNode();
//   final _textController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Sample 2"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
//         child: Center(
//           child: KeyboardActions(
//             tapOutsideBehavior: TapOutsideBehavior.translucentDismiss,
//             config: KeyboardActionsConfig(
//               keyboardSeparatorColor: Colors.purple,
//               actions: [
//                 KeyboardActionsItem(
//                   focusNode: _focusSample,
//                   displayArrows: false,
//                   displayActionBar: false,
//                   footerBuilder: (context) {
//                     return MyCustomBarWidget(
//                       node: _focusSample,
//                       controller: _textController,
//                     );
//                   },
//                 ),
//               ],
//             ),
//             child: ListView(
//               children: [
//                 TextField(
//                   controller: _textController,
//                   focusNode: _focusSample,
//                   keyboardType: TextInputType.phone,
//                   decoration: InputDecoration(
//                     labelText: "Sample Input",
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// /// Sample [Widget] demonstrating the usage of [KeyboardActionsConfig.defaultDoneWidget].
// class Sample3 extends StatelessWidget {
//   final _focusNodes =
//       Iterable<int>.generate(7).map((_) => FocusNode()).toList();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Sample 3"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
//         child: Center(
//           child: KeyboardActions(
//             tapOutsideBehavior: TapOutsideBehavior.translucentDismiss,
//             config: KeyboardActionsConfig(
//               // Define ``defaultDoneWidget`` only once in the config
//               defaultDoneWidget: _buildMyDoneWidget(),
//               actions: _focusNodes
//                   .map((focusNode) => KeyboardActionsItem(focusNode: focusNode))
//                   .toList(),
//             ),
//             child: ListView.separated(
//               itemBuilder: (ctx, idx) => TextField(
//                 focusNode: _focusNodes[idx],
//                 keyboardType: TextInputType.text,
//                 decoration: InputDecoration(
//                   labelText: "Field ${idx + 1}",
//                 ),
//               ),
//               separatorBuilder: (ctx, idx) => const SizedBox(height: 10.0),
//               itemCount: _focusNodes.length,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   /// Returns the custom [Widget] to be rendered as the *"Done"* button.
//   Widget _buildMyDoneWidget() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text('My Done Widget'),
//         const SizedBox(width: 10.0),
//         Icon(Icons.arrow_drop_down, size: 20.0),
//       ],
//     );
//   }
// }

// /// Sample [Widget] demonstrating the usage of [KeyboardActionsItem.toolbarAlignment].
// class Sample4 extends StatelessWidget {
//   final _focusSample = FocusNode();
//   final _textController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Sample 4"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
//         child: Center(
//           child: KeyboardActions(
//             tapOutsideBehavior: TapOutsideBehavior.translucentDismiss,
//             config: KeyboardActionsConfig(
//               actions: [
//                 KeyboardActionsItem(
//                   toolbarAlignment: MainAxisAlignment.spaceAround,
//                   focusNode: _focusSample,
//                   displayArrows: false,
//                   toolbarButtons: [
//                     (_) {
//                       return IconButton(
//                         icon: Icon(Icons.format_bold),
//                         onPressed: () {},
//                       );
//                     },
//                     (_) {
//                       return IconButton(
//                         icon: Icon(Icons.format_italic),
//                         onPressed: () {},
//                       );
//                     },
//                     (_) {
//                       return IconButton(
//                         icon: Icon(Icons.format_underline),
//                         onPressed: () {},
//                       );
//                     },
//                     (_) {
//                       return IconButton(
//                         icon: Icon(Icons.format_strikethrough),
//                         onPressed: () {},
//                       );
//                     },
//                   ],
//                 ),
//               ],
//             ),
//             child: ListView(
//               children: [
//                 TextField(
//                   controller: _textController,
//                   focusNode: _focusSample,
//                   decoration: InputDecoration(
//                     labelText: "Sample Input",
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// /// Sample [Widget] demonstrating the usage of [KeyboardActionsConfig.defaultDoneWidget].
// class Sample5 extends StatelessWidget {
//   final _focusNodes =
//       Iterable<int>.generate(7).map((_) => FocusNode()).toList();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Sample 5"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
//         child: Column(mainAxisSize: MainAxisSize.min, children: [
//           Expanded(
//               flex: 2,
//               child: Center(
//                 child: KeyboardActions(
//                   tapOutsideBehavior: TapOutsideBehavior.translucentDismiss,
//                   config: KeyboardActionsConfig(
//                     // Define ``defaultDoneWidget`` only once in the config
//                     defaultDoneWidget: _buildMyDoneWidget(),
//                     actions: _focusNodes
//                         .map((focusNode) =>
//                             KeyboardActionsItem(focusNode: focusNode))
//                         .toList(),
//                   ),
//                   child: ListView.separated(
//                     itemBuilder: (ctx, idx) => TextField(
//                       focusNode: _focusNodes[idx],
//                       keyboardType: TextInputType.text,
//                       decoration: InputDecoration(
//                         fillColor: Colors.red,
//                         filled: true,
//                         labelText: "Field ${idx + 1}",
//                       ),
//                     ),
//                     separatorBuilder: (ctx, idx) =>
//                         const SizedBox(height: 10.0),
//                     itemCount: _focusNodes.length,
//                   ),
//                 ),
//               )),
//           Expanded(
//               flex: 1,
//               child: Container(
//                   color: Colors.green,
//                   child: Center(
//                       child: TextButton(
//                     onPressed: () {},
//                     child: Text(
//                       'I take up space below the KeyboardActions',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ))))
//         ]),
//       ),
//     );
//   }

//   /// Returns the custom [Widget] to be rendered as the *"Done"* button.
//   Widget _buildMyDoneWidget() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text('My Done Widget'),
//         const SizedBox(width: 10.0),
//         Icon(Icons.arrow_drop_down, size: 20.0),
//       ],
//     );
//   }
// }

// class MyCustomBarWidget extends StatelessWidget implements PreferredSizeWidget {
//   final FocusNode node;
//   final TextEditingController controller;

//   const MyCustomBarWidget({
//     Key? key,
//     required this.node,
//     required this.controller,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         IconButton(
//             icon: Icon(Icons.access_alarm),
//             onPressed: () => print('hello world 1')),
//         IconButton(
//             icon: Icon(Icons.send), onPressed: () => print(controller.text)),
//         Spacer(),
//         IconButton(icon: Icon(Icons.close), onPressed: () => node.unfocus()),
//       ],
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(60);
// }

// //This could be StatelessWidget but it won't work on Dialogs for now until this issue is fixed: https://github.com/flutter/flutter/issues/45839
// class Content extends StatefulWidget {
//   final bool isDialog;

//   const Content({Key? key, this.isDialog = false}) : super(key: key);

//   @override
//   _ContentState createState() => _ContentState();
// }

// class _ContentState extends State<Content> {
//   final FocusNode _nodeText1 = FocusNode();

//   final FocusNode _nodeText2 = FocusNode();

//   final FocusNode _nodeText3 = FocusNode();

//   final FocusNode _nodeText4 = FocusNode();

//   final FocusNode _nodeText5 = FocusNode();

//   final FocusNode _nodeText6 = FocusNode();

//   final FocusNode _nodeText7 = FocusNode();

//   final FocusNode _nodeText8 = FocusNode();

//   final FocusNode _nodeText9 = FocusNode();

//   final FocusNode _nodeText10 = FocusNode();

//   final custom1Notifier = ValueNotifier<String>("0");

//   final custom2Notifier = ValueNotifier<Color>(Colors.blue);

//   final custom3Notifier = ValueNotifier<String>("");

//   /// Creates the [KeyboardActionsConfig] to hook up the fields
//   /// and their focus nodes to our [FormKeyboardActions].
//   KeyboardActionsConfig _buildConfig(BuildContext context) {
//     return KeyboardActionsConfig(
//       keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
//       keyboardBarColor: Colors.grey[200],
//       nextFocus: true,
//       actions: [
//         KeyboardActionsItem(
//           focusNode: _nodeText1,
//         ),
//         KeyboardActionsItem(focusNode: _nodeText2, toolbarButtons: [
//           (node) {
//             return GestureDetector(
//               onTap: () => node.unfocus(),
//               child: Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Icon(Icons.close),
//               ),
//             );
//           }
//         ]),
//         KeyboardActionsItem(
//           focusNode: _nodeText3,
//           onTapAction: () async {
//             await showDialog(
//                 context: context,
//                 builder: (context) {
//                   return AlertDialog(
//                     content: Text("Custom Action"),
//                     actions: <Widget>[
//                       TextButton(
//                         child: Text("OK"),
//                         onPressed: () => Navigator.of(context).pop(),
//                       )
//                     ],
//                   );
//                 });
//           },
//         ),
//         KeyboardActionsItem(
//           focusNode: _nodeText4,
//           displayDoneButton: false,
//         ),
//         KeyboardActionsItem(
//           focusNode: _nodeText5,
//           toolbarButtons: [
//             //button 1
//             (node) {
//               return GestureDetector(
//                 onTap: () => node.unfocus(),
//                 child: Container(
//                   color: Colors.white,
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(
//                     "CLOSE",
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 ),
//               );
//             },
//             //button 2
//             (node) {
//               return GestureDetector(
//                 onTap: () => node.unfocus(),
//                 child: Container(
//                   color: Colors.black,
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(
//                     "DONE",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               );
//             }
//           ],
//         ),
//         KeyboardActionsItem(
//           focusNode: _nodeText6,
//           footerBuilder: (_) => PreferredSize(
//               child: SizedBox(
//                   height: 40,
//                   child: Center(
//                     child: Text('Custom Footer'),
//                   )),
//               preferredSize: Size.fromHeight(40)),
//         ),
//         KeyboardActionsItem(
//           focusNode: _nodeText7,
//           displayActionBar: false,
//           footerBuilder: (_) => PreferredSize(
//               child: SizedBox(
//                   height: 40,
//                   child: Center(
//                     child: Text('Custom Footer'),
//                   )),
//               preferredSize: Size.fromHeight(40)),
//         ),
//         KeyboardActionsItem(
//           focusNode: _nodeText8,
//           footerBuilder: (_) => CounterKeyboard(
//             notifier: custom1Notifier,
//           ),
//         ),
//         KeyboardActionsItem(
//           focusNode: _nodeText9,
//           footerBuilder: (_) => ColorPickerKeyboard(
//             notifier: custom2Notifier,
//           ),
//         ),
//         KeyboardActionsItem(
//           focusNode: _nodeText10,
//           displayActionBar: false,
//           footerBuilder: (_) => NumericKeyboard(
//             focusNode: _nodeText10,
//             notifier: custom3Notifier,
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return KeyboardActions(
//       isDialog: widget.isDialog,
//       config: _buildConfig(context),
//       child: Container(
//         padding: const EdgeInsets.all(15.0),
//         child: Center(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               TextField(
//                 keyboardType: TextInputType.number,
//                 focusNode: _nodeText1,
//                 decoration: InputDecoration(
//                   hintText: "Input Number",
//                 ),
//               ),
//               TextField(
//                 keyboardType: TextInputType.text,
//                 focusNode: _nodeText2,
//                 decoration: InputDecoration(
//                   hintText: "Input Text with Custom Done Widget",
//                 ),
//               ),
//               TextField(
//                 keyboardType: TextInputType.number,
//                 focusNode: _nodeText3,
//                 decoration: InputDecoration(
//                   hintText: "Input Number with Custom Action",
//                 ),
//               ),
//               TextField(
//                 keyboardType: TextInputType.text,
//                 focusNode: _nodeText4,
//                 decoration: InputDecoration(
//                   hintText: "Input Text without Done Button",
//                 ),
//               ),
//               TextField(
//                 keyboardType: TextInputType.number,
//                 focusNode: _nodeText5,
//                 decoration: InputDecoration(
//                   hintText: "Input Number with Toolbar Buttons",
//                 ),
//               ),
//               TextField(
//                 keyboardType: TextInputType.number,
//                 focusNode: _nodeText6,
//                 decoration: InputDecoration(
//                   hintText: "Input Number with Custom Footer",
//                 ),
//               ),
//               TextField(
//                 keyboardType: TextInputType.number,
//                 focusNode: _nodeText7,
//                 decoration: InputDecoration(
//                   hintText: "Input Number with Custom Footer without Bar",
//                 ),
//               ),
//               KeyboardCustomInput<String>(
//                 focusNode: _nodeText8,
//                 height: 65,
//                 notifier: custom1Notifier,
//                 builder: (context, val, hasFocus) {
//                   return Container(
//                     alignment: Alignment.center,
//                     color: hasFocus == true ? Colors.grey[300] : Colors.white,
//                     child: Text(
//                       val,
//                       style:
//                           TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                     ),
//                   );
//                 },
//               ),
//               KeyboardCustomInput<Color>(
//                 focusNode: _nodeText9,
//                 height: 65,
//                 notifier: custom2Notifier,
//                 builder: (context, val, hasFocus) {
//                   return Container(
//                     width: double.maxFinite,
//                     color: val,
//                   );
//                 },
//               ),
//               KeyboardCustomInput<String>(
//                 focusNode: _nodeText10,
//                 height: 65,
//                 notifier: custom3Notifier,
//                 builder: (context, val, hasFocus) {
//                   return Container(
//                     alignment: Alignment.center,
//                     child: Text(
//                       val.isEmpty ? "Tap Here" : val,
//                       style:
//                           TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// /// A quick example "keyboard" widget for picking a color.
// class ColorPickerKeyboard extends StatelessWidget
//     with KeyboardCustomPanelMixin<Color>
//     implements PreferredSizeWidget {
//   final ValueNotifier<Color> notifier;
//   static const double _kKeyboardHeight = 200;

//   ColorPickerKeyboard({Key? key, required this.notifier}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final double rows = 3;
//     final double screenWidth = MediaQuery.of(context).size.width;
//     final int colorsCount = Colors.primaries.length;
//     final int colorsPerRow = (colorsCount / rows).ceil();
//     final double itemWidth = screenWidth / colorsPerRow;
//     final double itemHeight = _kKeyboardHeight / rows;

//     return Container(
//       height: _kKeyboardHeight,
//       child: Wrap(
//         children: <Widget>[
//           for (final color in Colors.primaries)
//             GestureDetector(
//               onTap: () {
//                 updateValue(color);
//               },
//               child: Container(
//                 color: color,
//                 width: itemWidth,
//                 height: itemHeight,
//               ),
//             )
//         ],
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(_kKeyboardHeight);
// }

// /// A quick example "keyboard" widget for Counter.
// class CounterKeyboard extends StatelessWidget
//     with KeyboardCustomPanelMixin<String>
//     implements PreferredSizeWidget {
//   final ValueNotifier<String> notifier;

//   CounterKeyboard({Key? key, required this.notifier}) : super(key: key);

//   @override
//   Size get preferredSize => Size.fromHeight(200);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: preferredSize.height,
//       child: Row(
//         children: [
//           Expanded(
//             child: InkWell(
//               onTap: () {
//                 int value = int.tryParse(notifier.value) ?? 0;
//                 value--;
//                 updateValue(value.toString());
//               },
//               child: FittedBox(
//                 child: Text(
//                   "-",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: InkWell(
//               onTap: () {
//                 int value = int.tryParse(notifier.value) ?? 0;
//                 value++;
//                 updateValue(value.toString());
//               },
//               child: FittedBox(
//                 child: Text(
//                   "+",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /// A quick example "keyboard" widget for Numeric.
// class NumericKeyboard extends StatelessWidget
//     with KeyboardCustomPanelMixin<String>
//     implements PreferredSizeWidget {
//   final ValueNotifier<String> notifier;
//   final FocusNode focusNode;

//   NumericKeyboard({
//     Key? key,
//     required this.notifier,
//     required this.focusNode,
//   }) : super(key: key);

//   @override
//   Size get preferredSize => Size.fromHeight(280);

//   final format = NumberFormat("0000");

//   String _formatValue(String value) {
//     final updatedValue = format.format(double.parse(value));
//     final finalValue = updatedValue.substring(0, updatedValue.length - 2) +
//         "." +
//         updatedValue.substring(updatedValue.length - 2, updatedValue.length);
//     return finalValue;
//   }

//   void _onTapNumber(String value) {
//     if (value == "Done") {
//       focusNode.unfocus();
//       return;
//     }
//     final currentValue = notifier.value.replaceAll(".", "");
//     final temp = currentValue + value;
//     updateValue(_formatValue(temp));
//   }

//   void _onTapBackspace() {
//     final currentValue = notifier.value.replaceAll(".", "");
//     final temp = currentValue.substring(0, currentValue.length - 1);
//     updateValue(_formatValue(temp));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: preferredSize.height,
//       color: Color(0xFF313131),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: GridView(
//           shrinkWrap: true,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 3,
//             childAspectRatio: 2.2,
//             crossAxisSpacing: 10,
//             mainAxisSpacing: 10,
//           ),
//           children: [
//             _buildButton(text: "7"),
//             _buildButton(text: "8"),
//             _buildButton(text: "9"),
//             _buildButton(text: "4"),
//             _buildButton(text: "5"),
//             _buildButton(text: "6"),
//             _buildButton(text: "1"),
//             _buildButton(text: "2"),
//             _buildButton(text: "3"),
//             _buildButton(icon: Icons.backspace, color: Colors.black),
//             _buildButton(text: "0"),
//             _buildButton(text: "Done", color: Colors.black),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildButton({
//     String? text,
//     IconData? icon,
//     Color? color,
//   }) =>
//       NumericButton(
//         text: text,
//         icon: icon,
//         color: color,
//         onTap: () => icon != null ? _onTapBackspace() : _onTapNumber(text!),
//       );
// }

// class NumericButton extends StatelessWidget {
//   final String? text;
//   final VoidCallback onTap;
//   final IconData? icon;
//   final Color? color;

//   const NumericButton({
//     Key? key,
//     this.text,
//     required this.onTap,
//     this.icon,
//     this.color,
//   })  : assert((icon != null) != (text != null)),
//         super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       borderRadius: BorderRadius.circular(5.0),
//       color: color ?? Color(0xFF4A4A4A),
//       elevation: 5,
//       child: InkWell(
//         onTap: onTap,
//         child: FittedBox(
//           child: Padding(
//             padding: const EdgeInsets.all(3.0),
//             child: icon != null
//                 ? Icon(
//                     icon,
//                     color: Colors.white,
//                   )
//                 : Text(
//                     text!,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w300,
//                     ),
//                   ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   _openWidget(BuildContext context, Widget widget) =>
//       Navigator.of(context).push(
//         MaterialPageRoute(builder: (_) => widget),
//       );

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         backgroundColor: Colors.amber,
//         body: Builder(
//           builder: (myContext) => Center(
//             child: Padding(
//               padding: const EdgeInsets.all(18.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   ElevatedButton(
//                     child: Text("Full Screen form"),
//                     onPressed: () => _openWidget(
//                       myContext,
//                       ScaffoldTest(),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 25,
//                   ),
//                   ElevatedButton(
//                     child: Text("Dialog form"),
//                     onPressed: () => _openWidget(
//                       myContext,
//                       DialogTest(),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 25,
//                   ),
//                   ElevatedButton(
//                     child: Text("Custom Sample 1"),
//                     onPressed: () => _openWidget(
//                       myContext,
//                       Sample(),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 25,
//                   ),
//                   ElevatedButton(
//                     child: Text("Custom Sample 2"),
//                     onPressed: () => _openWidget(
//                       myContext,
//                       Sample2(),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 25,
//                   ),
//                   ElevatedButton(
//                     child: Text("Custom Sample 3"),
//                     onPressed: () => _openWidget(
//                       myContext,
//                       Sample3(),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 25,
//                   ),
//                   ElevatedButton(
//                     child: Text("Custom Sample 4"),
//                     onPressed: () => _openWidget(
//                       myContext,
//                       Sample4(),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 25,
//                   ),
//                   ElevatedButton(
//                     child: Text("Custom Sample 5"),
//                     onPressed: () => _openWidget(
//                       myContext,
//                       Sample5(),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Sample extends StatelessWidget {
//   final _focusNodeName = FocusNode();
//   final _focusNodeQuantity = FocusNode();

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.place),
//         onPressed: () {
//           _focusNodeName.requestFocus();
//         },
//       ),
//       appBar: AppBar(
//         title: Text("KeyboardActions"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
//         child: Center(
//           child: Theme(
//             data: Theme.of(context).copyWith(
//               disabledColor: Colors.blue,
//               iconTheme: IconTheme.of(context).copyWith(
//                 color: Colors.red,
//                 size: 35,
//               ),
//             ),
//             child: KeyboardActions(
//               tapOutsideBehavior: TapOutsideBehavior.opaqueDismiss,
//               config: KeyboardActionsConfig(
//                 keyboardSeparatorColor: Colors.purple,
//                 actions: [
//                   KeyboardActionsItem(
//                     focusNode: _focusNodeName,
//                   ),
//                   KeyboardActionsItem(
//                     focusNode: _focusNodeQuantity,
//                   ),
//                 ],
//               ),
//               child: ListView(
//                 children: [
//                   SizedBox(
//                     height: size.height / 4,
//                     child: FlutterLogo(),
//                   ),
//                   TextField(
//                     focusNode: _focusNodeName,
//                     decoration: InputDecoration(
//                       labelText: "Product Name",
//                     ),
//                   ),
//                   TextField(
//                     focusNode: _focusNodeQuantity,
//                     keyboardType: TextInputType.phone,
//                     decoration: InputDecoration(
//                       labelText: "Quantity",
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// /// Displays our [TextField]s in a [Scaffold] with a [FormKeyboardActions].
// class ScaffoldTest extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Keyboard Actions Sample"),
//       ),
//       body: Content(),
//     );
//   }
// }

// /// Displays our [FormKeyboardActions] nested in a [AlertDialog].
// class DialogTest extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Keyboard Actions Sample"),
//       ),
//       body: Center(
//         child: TextButton(
//           child: Text('Launch dialog'),
//           onPressed: () => _launchInDialog(context),
//         ),
//       ),
//     );
//   }

//   void _launchInDialog(BuildContext context) async {
//     final height = MediaQuery.of(context).size.height / 3;
//     await showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Dialog test'),
//           content: SizedBox(
//             height: height,
//             child: Content(
//               isDialog: true,
//             ),
//           ),
//           actions: [
//             TextButton(
//               child: Text('Ok'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
