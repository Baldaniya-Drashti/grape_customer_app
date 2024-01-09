import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/auth/auth_status/auth_status_bloc.dart';

import 'package:grape_customer_app/injection.dart';
import 'package:grape_customer_app/presentation/core/app_router.dart';
import 'package:grape_customer_app/presentation/core/app_theme.dart';
import 'package:grape_customer_app/presentation/core/widgets/utility/life_cycle_watcher.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
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

class _App extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    // if (doesCurrentUserExist()) {
    //   use(UserSocketHook(context));
    // }
    return LifecycleWatcher(
      child: MaterialApp(
        title: 'Grape App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        initialRoute: '/',
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}
