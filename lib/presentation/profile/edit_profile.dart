import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/profile/edit_profile/edit_profile_bloc.dart';
import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/injection.dart';
import 'package:grape_customer_app/presentation/common/utils/app_focus.dart';
import 'package:grape_customer_app/presentation/common/utils/flushbar_creator.dart';
import 'package:grape_customer_app/presentation/core/widgets/buttons/common_button.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_app_bar.dart';
import 'package:grape_customer_app/presentation/profile/edit_profile_form.dart';

@RoutePage(name: 'EditProfileScreen')
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EditProfileBloc>(),
      child: BlocConsumer<EditProfileBloc, EditProfileState>(
        listener: (context, state) {
          state.authFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold((l) {
              showError(
                  message: l.maybeMap(
                badRequest: (value) => value.error,
                orElse: () => 'Server Error. Try again later.',
              ));
            }, (r) => null),
          );
        },
        builder: (context, state) {
          return Scaffold(
            appBar:
                CustomAppBar(title: AppLocalizations.of(context).editProfile),
            body: GestureDetector(
              onTap: () => AppFocus.unfocus(context),
              child: EditProfileForm(state: state),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.only(
                bottom: getSize(46),
                left: getSize(18),
                right: getSize(18),
              ),
              child: CommonButton(
                isSubmitting: state.isSubmitting,
                buttonText: AppLocalizations.of(context).save,
                onPressed: () {
                  context
                      .read<EditProfileBloc>()
                      .add(EditProfileEvent.saveButtonPressed());
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
