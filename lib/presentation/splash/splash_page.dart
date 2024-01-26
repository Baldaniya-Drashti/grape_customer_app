import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:grape_customer_app/application/auth/auth_status/auth_status_bloc.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';

import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/png_image_constants.dart';

import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';

@RoutePage(name: 'splashPage')
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthStatusBloc, AuthStatusState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          authenticated: (_) async {
            await Future.delayed(
              Duration(seconds: 3),
              () =>
                  context.router.replace(const PageRouteInfo(MainTabView.name)),
            );
          },
          unauthenticated: (_) async {
            await Future.delayed(
              Duration(seconds: 3),
              () => context.router.replace(const PageRouteInfo(LoginPage.name)),
            );
          },
          introScreenVisibilty: (IntroScreenVisibilty value) async {
            await Future.delayed(
              Duration(seconds: 3),
              () =>
                  context.router.replace(const PageRouteInfo(Onboarding.name)),
            );
          },
        );
      },
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [
                AppColors.splashColor1,
                AppColors.splashColor2,
              ],
              radius: 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                PngImageConstants.grape_logo,
                height: getSize(415),
                width: getSize(237),
              ),
              Center(
                child: Image.asset(
                  PngImageConstants.grape_text,
                  height: getSize(34),
                  width: getSize(125),
                ),
              ),
              SizedBox(
                height: getSize(5),
              ),
              BaseText(
                text: 'Company',
                isUpperCase: true,
                fontSize: 14,
                letterSpacing: 8,
                textColor: AppColors.black.withOpacity(0.60),
              )
            ],
          ),
        ),
      ),
    );
  }
}
