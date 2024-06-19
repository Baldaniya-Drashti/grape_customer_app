import 'package:auto_route/auto_route.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/auth/register_form/register_form_bloc.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/common/utils/flushbar_creator.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/common/widgets/common_country_code_picker.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';

import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/core/widgets/buttons/common_button.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_keboard_config.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_text_field.dart';
import 'package:grape_customer_app/presentation/core/widgets/layout/common_url_launcher.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterFormBloc, RegisterFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              showError(
                message: failure.maybeMap(
                  badRequest: (value) => value.error,
                  showAPIResponseMessage: (value) => value.message,
                  networkError: (value) =>
                      'Please check your internet connectivity',
                  orElse: () => "Server Error. Try again later.",
                ),
              ).show(context);
            },
            (r) {
              context.router.push(
                PageRouteInfo(
                  OtpRegisterVerificationView.name,
                  args: OtpRegisterVerificationViewArgs(
                    countryCode: state.selectedCountrycode,
                    phoneNumber: state.mobileNumber.getValue(),
                  ),
                ),
              );

              // RestartWidget.restartApp(context);
            },
          ),
        );
      },
      builder: (context, state) {
        return KeyboardActions(
          config: CustomKeyboardConfig(focusNode: [state.mobileNumberFocusNode])
              .buildConfig(context),
          child: Form(
            autovalidateMode: state.showErrorMessages
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: getSize(18)),
              physics: BouncingScrollPhysics(),
              children: [
                BaseText(
                  text: 'Create Account',
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  textColor: AppColors.authBlack,
                ),
                SizedBox(
                  height: getSize(30),
                ),
                firstNameTextFieldView(context, state),
                SizedBox(
                  height: getSize(20),
                ),
                lasttNameTextFieldView(context, state),
                SizedBox(
                  height: getSize(20),
                ),
                emailTextFieldView(context, state),
                SizedBox(
                  height: getSize(20),
                ),
                mobileNumberTextFieldView(context, state),
                SizedBox(
                  height: getSize(30),
                ),
                CommonButton(
                  isSubmitting: state.isSubmitting,
                  onPressed: () {
                    context
                        .read<RegisterFormBloc>()
                        .add(RegisterFormEvent.registerPressed());
                  },
                  buttonText: 'Continue',
                ),
                SizedBox(
                  height: getSize(30),
                ),
                getPrivacyPolicyText(),
                SizedBox(
                  height: getSize(20),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Center getPrivacyPolicyText() {
    return Center(
      child: Text.rich(
        TextSpan(
          style: TextStyle(
            fontSize: getFontSize(12),
            fontWeight: FontWeight.w400,
            color: AppColors.black.withOpacity(0.6),
            fontFamily: 'SFPro',
          ),
          children: [
            TextSpan(
              text: 'By clicking continue, I agree to ',
            ),
            TextSpan(
              text: 'Terms and Conditions',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  CommonUrlLauncher.launchAppUrl(
                      'https://www.termsfeed.com/blog/terms-conditions-url/');
                },
              style: TextStyle(
                color: AppColors.primaryOrange,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primaryOrange,
              ),
            ),
            TextSpan(
              text: ' and ',
            ),
            TextSpan(
              text: 'Privacy Policy.',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  CommonUrlLauncher.launchAppUrl(
                      'https://www.termsfeed.com/blog/terms-conditions-url/');
                },
              style: TextStyle(
                color: AppColors.primaryOrange,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primaryOrange,
              ),
            ),
          ],
        ),
        textScaler: TextScaler.linear(1),
        textAlign: TextAlign.center,
      ),
    );
  }

  CustomTextField firstNameTextFieldView(
      BuildContext context, RegisterFormState state) {
    return CustomTextField(
      labelText: 'First Name',
      hintText: 'First Name',
      textCapitalization: TextCapitalization.words,
      onChanged: (value) => context
          .read<RegisterFormBloc>()
          .add(RegisterFormEvent.firstNameChanged(value)),
      validator: (_, context) =>
          context.read<RegisterFormBloc>().state.firstName.value.fold(
                (f) => f.maybeMap(
                  empty: (value) => 'Please enter first name',
                  invalidUsername: (_) => 'Please enter valid first name',
                  orElse: () => null,
                ),
                (_) => null,
              ),
    );
  }

  CustomTextField lasttNameTextFieldView(
      BuildContext context, RegisterFormState state) {
    return CustomTextField(
      labelText: 'Last Name',
      hintText: 'Last Name',
      textCapitalization: TextCapitalization.words,
      onChanged: (value) => context
          .read<RegisterFormBloc>()
          .add(RegisterFormEvent.lastNameChanged(value)),
      validator: (_, context) =>
          context.read<RegisterFormBloc>().state.lastName.value.fold(
                (f) => f.maybeMap(
                  empty: (value) => 'Please enter last name',
                  invalidUsername: (_) => 'Please enter valid last name',
                  orElse: () => null,
                ),
                (_) => null,
              ),
    );
  }

  CustomTextField emailTextFieldView(
      BuildContext context, RegisterFormState state) {
    return CustomTextField(
      labelText: 'Email Address',
      hintText: 'Email Address',
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) => context
          .read<RegisterFormBloc>()
          .add(RegisterFormEvent.emailChanged(value)),
      // validator: (_, context) =>
      //     context.read<RegisterFormBloc>().state.emailAddress.value.fold(
      //           (f) => f.maybeMap(
      //             empty: (value) => 'Please enter email',
      //             invalidEmail: (_) => 'Please enter valid email address',
      //             orElse: () => null,
      //           ),
      //           (_) => null,
      //         ),
    );
  }

  CustomTextField mobileNumberTextFieldView(
      BuildContext context, RegisterFormState state) {
    return CustomTextField(
      labelText: 'Mobile Number',
      hintText: 'Mobile Number',
      keyboardType: TextInputType.phone,
      errorMaxLines: 2,
      focusNode: state.mobileNumberFocusNode,
      onChanged: (value) => context
          .read<RegisterFormBloc>()
          .add(RegisterFormEvent.mobileNumberChanged(value)),
      validator: (_, context) =>
          context.read<RegisterFormBloc>().state.mobileNumber.value.fold(
                (f) => f.maybeMap(
                  empty: (value) => 'Please enter mobile number',
                  invalidMobileNumber: (_) =>
                      'Phone number should be between 8 and 15 digits',
                  orElse: () => null,
                ),
                (_) => null,
              ),
      prefixIcon: CommonCountryCodePicker(
        initialSelection: state.selectedCountrycode,
        onChanged: (countryCode) {
          context.read<RegisterFormBloc>().add(
                RegisterFormEvent.selectCountryCode(countryCode.phoneCode),
              );
        },
      ),
    );
  }
}
