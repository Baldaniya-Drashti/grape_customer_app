import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/auth/register_form/register_form_bloc.dart';
import 'package:grape_customer_app/injection.dart';
import 'package:grape_customer_app/presentation/auth/register/register_form.dart';
import 'package:grape_customer_app/presentation/common/utils/app_focus.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_app_bar.dart';

@RoutePage(name: 'RegisterScreen')
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: ''),
      body: BlocProvider(
        create: (context) => getIt<RegisterFormBloc>(),
        child: GestureDetector(
          onTap: () {
            AppFocus.unfocus(context);
          },
          child: RegisterForm(),
        ),
      ),
    );
  }
}
