import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grape_customer_app/domain/core/environment/environment.dart';

import 'package:grape_customer_app/infrastructure/core/network/injectable_module.dart';
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
      await Firebase.initializeApp().catchError((e) {
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
