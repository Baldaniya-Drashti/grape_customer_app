import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/auth/auth_status/auth_status_bloc.dart';

import 'package:grape_customer_app/presentation/auth/start_up_screen.dart';
import 'package:grape_customer_app/presentation/main/home_view.dart';

class SplashPage extends StatelessWidget {
  static const routeName = '/';

  const SplashPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthStatusBloc, AuthStatusState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          authenticated: (_) {
            Navigator.pushReplacementNamed(context, HomeView.routeName);
          },
          unauthenticated: (_) {
            Navigator.pushReplacementNamed(context, StartUpScreen.routeName);
          },
        );
      },
      child: const Scaffold(
        body: Center(
          child: Image(
            height: 100,
            image: AssetImage('assets/logo.png'),
          ),
        ),
      ),
    );
  }
}
