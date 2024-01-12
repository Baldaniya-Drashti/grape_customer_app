import 'package:auto_route/auto_route.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/auth/login_form/login_form_bloc.dart';
import 'package:grape_customer_app/presentation/common/utils/app_focus.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';

import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/png_image_constants.dart';
import 'package:grape_customer_app/presentation/common/utils/flushbar_creator.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/common/widgets/common_country_code_picker.dart';

import 'package:grape_customer_app/presentation/core/restart_widget.dart';
import 'package:grape_customer_app/presentation/core/widgets/buttons/common_button.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_text_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginFormBloc, LoginFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              showError(
                message: failure.maybeMap(
                  invalidCredentials: (_) => "Invalid Credentials",
                  orElse: () => "Server Error. Try again later.",
                ),
              ).show(context);
            },
            (_) {
              RestartWidget.restartApp(context);
            },
          ),
        );
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            AppFocus.unfocus(context);
          },
          child: Form(
            autovalidateMode: state.showErrorMessages
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: getSize(18)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Center(
                    child: Image.asset(
                      PngImageConstants.grape_login_logo,
                      height: getSize(156),
                      width: getSize(128),
                    ),
                  ),
                  Spacer(),
                  BaseText(
                    text: 'Welcome to\nGrape Company',
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    textColor: AppColors.authBlack,
                  ),
                  Spacer(),
                  BaseText(
                    text:
                        'Please confirm your country code and enter your mobile number',
                    fontSize: 12,
                    textColor: AppColors.black.withOpacity(0.5),
                  ),
                  Spacer(),
                  CustomTextField(
                    labelText: 'Mobile Number',
                    hintText: 'Mobile Number',
                    keyboardType: TextInputType.phone,
                    onChanged: (value) => context
                        .read<LoginFormBloc>()
                        .add(LoginFormEvent.mobileNumberChanged(value)),
                    validator: (_, context) => context
                        .read<LoginFormBloc>()
                        .state
                        .mobileNumber
                        .value
                        .fold(
                          (f) => f.maybeMap(
                            empty: (value) => 'Please enter mobile number',
                            invalidMobileNumber: (_) =>
                                'Please enter valid mobile number',
                            orElse: () => null,
                          ),
                          (_) => null,
                        ),
                    prefixIcon: CommonCountryCodePicker(
                      initialSelection: state.selectedCountrycode,
                      onChanged: (CountryCode countryCode) {
                        context.read<LoginFormBloc>().add(
                              LoginFormEvent.selectCountryCode(
                                  countryCode.dialCode ?? ""),
                            );
                      },
                    ),
                  ),
                  Spacer(),
                  CommonButton(
                    isSubmitting: state.isSubmitting,
                    onPressed: () {
                      // context.router.push(
                      //   PageRouteInfo(
                      //     OtpLoginVerificationView.name,
                      //     args: OtpLoginVerificationViewArgs(
                      //       countryCode: state.selectedCountrycode,
                      //       phoneNumber: state.mobileNumber.getValue(),
                      //     ),
                      //   ),
                      // );
                      context
                          .read<LoginFormBloc>()
                          .add(LoginFormEvent.loginPressed());
                    },
                    buttonText: 'Continue',
                  ),
                  Spacer(),
                  Center(
                    child: Text.rich(
                      TextSpan(
                        text: 'Don’t have an account? ',
                        style: TextStyle(
                          color: AppColors.black.withOpacity(0.5),
                          fontSize: getFontSize(12),
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: "Create Account",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.router
                                    .push(PageRouteInfo(RegisterScreen.name));
                              },
                            style: TextStyle(
                              fontSize: getFontSize(12),
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
