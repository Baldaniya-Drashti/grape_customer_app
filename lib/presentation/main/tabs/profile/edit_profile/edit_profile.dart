import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/profile/edit_profile/edit_profile_bloc.dart';
import 'package:grape_customer_app/application/main/profile/get_account/account_cubit.dart';

import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/injection.dart';
import 'package:grape_customer_app/presentation/common/utils/app_focus.dart';
import 'package:grape_customer_app/presentation/common/utils/flushbar_creator.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/widgets/buttons/common_button.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_app_bar.dart';
import 'package:grape_customer_app/presentation/main/tabs/profile/edit_profile/edit_profile_form.dart';

@RoutePage(name: 'EditProfileScreen')
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EditProfileBloc>(),
      child: BlocConsumer<EditProfileBloc, EditProfileState>(
        listener: (context, state) {
          state.otpFailureOrSuccessOption.fold(
            () => null,
            (a) => a.fold(
              (l) {
                context.read<EditProfileBloc>().timer.cancel();

                showError(
                  message: l.maybeMap(
                    showAPIResponseMessage: (value) => value.message,
                    networkError: (value) =>
                        'Please check your internet connectivity',
                    orElse: () => "Server Error. Try again later.",
                  ),
                ).show(context);
              },
              (r) async {
                var res = await context.router.push(
                  PageRouteInfo(
                    OtpEditProfileVerificationView.name,
                    args: OtpEditProfileVerificationViewArgs(
                      countryCode: state.countryCode,
                      phoneNumber: state.mobileNumber.getValue(),
                    ),
                  ),
                );
                if (res != null && res == true) {
                  context.read<AccountCubit>().getAccount();
                }
              },
            ),
          );
          state.authFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (l) {
                showError(
                    message: l.maybeMap(
                  showAPIResponseMessage: (value) => value.message,
                  networkError: (value) =>
                      'Please check your internet connectivity',
                  orElse: () => "Server Error. Try again later.",
                )).show(context);
              },
              (r) {
                showSuccess(message: r[1])
                    .show(context)
                    .then((value) => context.router.pop(r[0]));
              },
            ),
          );
        },
        builder: (context, state) {
          return Scaffold(
            appBar:
                CustomAppBar(title: AppLocalizations.of(context).editProfile),
            body: GestureDetector(
              onTap: () => AppFocus.unfocus(context),
              child: EditProfileForm(),
            ),
            bottomNavigationBar: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: getSize(isFullScreenDevice(context) ? 0 : 18),
                  left: getSize(18),
                  right: getSize(18),
                ),
                child: CommonButton(
                  isSubmitting: state.isSubmitting,
                  buttonText: AppLocalizations.of(context).save,
                  onPressed: () {
                    context.read<EditProfileBloc>().add(
                          EditProfileEvent.saveButtonPressed(),
                        );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
