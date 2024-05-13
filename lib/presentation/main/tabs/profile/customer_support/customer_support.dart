import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grape_customer_app/application/main/profile/customer_support/contact_support_bloc.dart';
import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/injection.dart';
import 'package:grape_customer_app/presentation/common/utils/app_focus.dart';
import 'package:grape_customer_app/presentation/common/utils/flushbar_creator.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/core/widgets/buttons/common_button.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_app_bar.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_text_field.dart';

@RoutePage(name: "CustomerSupport")
class CustomerSupport extends StatelessWidget {
  const CustomerSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CustomerSupportBloc>(),
      child: BlocConsumer<CustomerSupportBloc, CustomerSupportState>(
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(
              title: AppLocalizations.of(context).customerSupport,
            ),
            body: GestureDetector(
              onTap: () {
                AppFocus.unfocus(context);
              },
              child: Form(
                autovalidateMode: state.isShowError
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: getSize(18)),
                  physics: BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      height: getSize(40),
                    ),
                    titleTextFiled(context),
                    SizedBox(
                      height: getSize(20),
                    ),
                    helpTextFiled(context),
                    SizedBox(
                      height: getSize(40),
                    ),
                    CommonButton(
                      isSubmitting: state.isSubmitting,
                      onPressed: () {
                        context.read<CustomerSupportBloc>().add(
                              CustomerSupportEvent.sendButtonPressed(),
                            );
                      },
                      buttonText: AppLocalizations.of(context).send,
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.symmetric(vertical: getSize(18)),
              child: GestureDetector(
                onTap: () {
                  context.router.push(
                    PageRouteInfo(
                      ChatView.name,
                      args: ChatViewArgs(
                          fromLiveChatSupport: true, recieverID: '-1'),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      SvgImageConstant.message,
                      colorFilter: ColorFilter.mode(
                          AppColors.primaryOrange, BlendMode.srcIn),
                    ),
                    SizedBox(
                      width: getSize(10),
                    ),
                    BaseText(
                      text: 'Ask Help?',
                      textColor: AppColors.primaryOrange,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {
          state.failureOrSuccessOption.fold(
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
                showSuccess(message: r)
                    .show(context)
                    .then((value) => context.router.back());
                // context.router.push(
                //   PageRouteInfo(
                //     OtpRegisterVerificationView.name,
                //     args: OtpRegisterVerificationViewArgs(
                //       countryCode: state.selectedCountrycode,
                //       phoneNumber: state.mobileNumber.getValue(),
                //     ),
                //   ),
                // );

                // RestartWidget.restartApp(context);
              },
            ),
          );
        },
      ),
    );
  }

  CustomTextField helpTextFiled(BuildContext context) {
    return CustomTextField(
      labelText: AppLocalizations.of(context).howCanWeHelpYou,
      minLines: 2,
      maxLines: 3,
      onChanged: (help) => context.read<CustomerSupportBloc>().add(
            CustomerSupportEvent.helpChanged(help),
          ),
      validator: (p0, p1) =>
          context.read<CustomerSupportBloc>().state.help.value.fold(
                (l) => l.maybeMap(
                  empty: (value) => 'Enter the detail',
                  orElse: () => null,
                ),
                (r) => null,
              ),
    );
  }

  CustomTextField titleTextFiled(BuildContext context) {
    return CustomTextField(
      labelText: AppLocalizations.of(context).title,
      onChanged: (title) => context
          .read<CustomerSupportBloc>()
          .add(CustomerSupportEvent.titleChanged(title)),
      validator: (p0, p1) =>
          context.read<CustomerSupportBloc>().state.title.value.fold(
              (l) => l.maybeMap(
                    empty: (value) => 'Enter the title',
                    orElse: () => null,
                  ),
              (r) => null),
    );
  }
}
