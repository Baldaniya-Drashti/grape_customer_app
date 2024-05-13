import 'dart:developer';

import 'package:country_picker/country_picker.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grape_customer_app/application/auth/auth_status/auth_status_bloc.dart';
import 'package:grape_customer_app/application/chat/chat_bloc.dart';
import 'package:grape_customer_app/application/main/profile/language/language_bloc.dart';
import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';

import 'package:grape_customer_app/injection.dart';
import 'package:grape_customer_app/presentation/core/app_router.dart';
import 'package:grape_customer_app/presentation/core/app_theme.dart';
import 'package:grape_customer_app/presentation/core/widgets/utility/life_cycle_watcher.dart';
import 'package:intl/intl.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return bloc.MultiBlocProvider(
      providers: [
        bloc.BlocProvider(
          create: (context) => getIt<AuthStatusBloc>()
            ..add(
              const AuthStatusEvent.authCheckRequested(),
            ),
        ),
        bloc.BlocProvider(
          create: (context) => getIt<LanguageBloc>(),
        ),
        bloc.BlocProvider(
          create: (context) => getIt<ChatBloc>(),
        )
      ],
      child: _App(),
    );
  }
}

class _App extends StatefulWidget {
  @override
  State<_App> createState() => _AppState();
}

class _AppState extends State<_App> {
  final AppRouter _appRouter = AppRouter();
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    print('Locale : ${Intl.getCurrentLocale()}');
    // if (doesCurrentUserExist()) {
    //   use(UserSocketHook(context));
    // }

    return bloc.BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state1) {
        print('Locale : ${state1.locale}');
        return LifecycleWatcher(
          child: ScreenUtilInit(
            ensureScreenSize: true,
            child: MaterialApp.router(
              title: 'Grape Customer App',
              debugShowCheckedModeBanner: false,
              theme: ThemeConfig.lightTheme,
              locale: state1.locale,
              routerConfig: _appRouter.config(
                navigatorObservers: () =>
                    [FirebaseAnalyticsObserver(analytics: analytics)],
                deepLinkBuilder: (deepLink) {
                  log(deepLink.path);
                  return deepLink;
                },
              ),
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: [
                CountryLocalizations.delegate,
                ...AppLocalizations.localizationsDelegates,
              ],
              localeResolutionCallback: (locale, supportedLocales) {
                for (final supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale!.languageCode &&
                      supportedLocale.countryCode == locale.countryCode) {
                    return supportedLocale;
                  }
                }

                return supportedLocales.first;
              },
            ),
          ),
        );
      },
    );
  }
}
