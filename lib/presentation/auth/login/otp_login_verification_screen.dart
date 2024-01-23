import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/auth/login_form/login_form_bloc.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/png_image_constants.dart';
import 'package:grape_customer_app/injection.dart';
import 'package:grape_customer_app/presentation/common/utils/app_focus.dart';
import 'package:grape_customer_app/presentation/common/utils/flushbar_creator.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/core/widgets/buttons/common_button.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_app_bar.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/inputs.dart';

@RoutePage(name: 'OtpLoginVerificationView')
class OtpLoginVerificationView extends StatelessWidget {
  final String countryCode;
  final String phoneNumber;
  const OtpLoginVerificationView(
      {super.key, required this.countryCode, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: ''),
      body: BlocProvider(
        create: (context) => getIt<LoginFormBloc>()
          ..add(LoginFormEvent.startCountdown())
          ..add(
              LoginFormEvent.getPrefilledPhoneNumber(countryCode, phoneNumber)),
        child: BlocConsumer<LoginFormBloc, LoginFormState>(
          listener: (context, state) {
            state.authFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  context.read<LoginFormBloc>().timer.cancel();
                  showError(
                    message: failure.maybeMap(
                      showAPIResponseMessage: (value) => value.message,
                      networkError: (value) =>
                          'Please check your internet connectivity',
                      orElse: () => "Server Error. Try again later.",
                    ),
                  ).show(context);
                },
                (r) {
                  context.read<LoginFormBloc>().timer.cancel();
                  showSuccess(message: r).show(context).then(
                    (value) {
                      context.router.replaceAll(
                        [
                          const PageRouteInfo(MainTabView.name),
                        ],
                      );
                    },
                  );
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
                child: ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: getSize(18)),
                  //  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Image.asset(
                        PngImageConstants.grape_login_logo,
                        height: getSize(156),
                        width: getSize(128),
                      ),
                    ),
                    SizedBox(
                      height: getSize(68),
                    ),
                    BaseText(
                      text: 'OTP Verification',
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      textColor: AppColors.authBlack,
                    ),
                    SizedBox(
                      height: getSize(20),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: getFontSize(12),
                          fontWeight: FontWeight.w400,
                          color: AppColors.black.withOpacity(0.5),
                          fontFamily: 'SFPro',
                        ),
                        children: [
                          TextSpan(
                            text:
                                'Enter the verification code we just sent on your mobile number ',
                          ),
                          TextSpan(
                            text:
                                '(${state.selectedCountrycode}) ${state.mobileNumber.getValue()}',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getSize(77),
                    ),
                    CustomPinField(
                      labelWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BaseText(
                            text: 'Enter 4 digit OTP code',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          BaseText(
                            text: '00:${state.secondsRemaining}',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            textColor: AppColors.black.withOpacity(0.6),
                          ),
                        ],
                      ),
                      onChanged: (value) => context
                          .read<LoginFormBloc>()
                          .add(LoginFormEvent.changeOTP(value)),
                      validator: (_, context) => context
                          .read<LoginFormBloc>()
                          .state
                          .enteredOTP
                          .value
                          .fold(
                            (f) => f.maybeMap(
                              empty: (value) => 'Please enter otp',
                              exceedingLength: (value) =>
                                  'Otp should be 4 digit',
                              orElse: () => null,
                            ),
                            (_) => null,
                          ),
                    ),
                    Opacity(
                      opacity: state.secondsRemaining == 0 ? 1 : 0.5,
                      child: GestureDetector(
                        onTap: state.secondsRemaining == 0
                            ? () {
                                context
                                    .read<LoginFormBloc>()
                                    .add(LoginFormEvent.resendOtp());
                              }
                            : null,
                        child: BaseText(
                          text: 'Resend',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          textColor: AppColors.primaryOrange,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getSize(40),
                    ),
                    CommonButton(
                      isSubmitting: state.isSubmitting,
                      onPressed: () {
                        //  context.read<LoginFormBloc>().timer.cancel();
                        context
                            .read<LoginFormBloc>()
                            .add(LoginFormEvent.verifyOtp());
                      },
                      buttonText: 'Verify',
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
