import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grape_customer_app/application/auth/auth_status/auth_status_bloc.dart';
import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';

import 'package:grape_customer_app/injection.dart';
import 'package:grape_customer_app/presentation/core/app_router.dart';
import 'package:grape_customer_app/presentation/core/app_theme.dart';
import 'package:grape_customer_app/presentation/core/widgets/utility/life_cycle_watcher.dart';

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
    // if (doesCurrentUserExist()) {
    //   use(UserSocketHook(context));
    // }

    return LifecycleWatcher(
      child: ScreenUtilInit(
        ensureScreenSize: true,
        child: MaterialApp.router(
          // routerDelegate: _appRouter.delegate(),
          // routeInformationParser: _appRouter.defaultRouteParser(),
          title: 'Grape Customer App',
          debugShowCheckedModeBanner: false, theme: ThemeConfig.lightTheme,
          // theme: AppTheme.light,
          // darkTheme: AppTheme.dark,
          routerConfig: _appRouter.config(
            navigatorObservers: () =>
                [FirebaseAnalyticsObserver(analytics: analytics)],
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
  }
}
