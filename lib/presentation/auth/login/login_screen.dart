import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/auth/login_form/login_form_bloc.dart';
import 'package:grape_customer_app/injection.dart';
import 'package:grape_customer_app/presentation/auth/login/login_form.dart';
import 'package:grape_customer_app/presentation/common/utils/app_focus.dart';

@RoutePage(name: 'loginPage')
class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: AppColors.appBackground,
      // ),
      body: BlocProvider(
        create: (context) => getIt<LoginFormBloc>(),
        child: GestureDetector(
          onTap: () {
            AppFocus.unfocus(context);
          },
          child: LoginForm(),
        ),
      ),
    );
  }
}
