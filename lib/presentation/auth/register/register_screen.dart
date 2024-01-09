import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/auth/register_form/register_form_bloc.dart';
import 'package:grape_customer_app/injection.dart';
import 'package:grape_customer_app/presentation/auth/register/register_form.dart';
import 'package:grape_customer_app/presentation/core/colors.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = '/register';

  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.appBackground,
      ),
      body: BlocProvider(
        create: (context) => getIt<RegisterFormBloc>(),
        child: RegisterForm(),
      ),
    );
  }
}
