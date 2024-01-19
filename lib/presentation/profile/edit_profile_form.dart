import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grape_customer_app/application/main/profile/edit_profile/edit_profile_bloc.dart';

import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/presentation/common/utils/image_picker_utils.dart';
import 'package:grape_customer_app/presentation/common/widgets/common_country_code_picker.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/common/widgets/image_chosser.dialog.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/inputs.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileBloc, EditProfileState>(
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: getSize(18)),
            children: [
              profileSection(state, context),
              SizedBox(
                height: getSize(25),
              ),
              firstNameTextFiled(context, state),
              SizedBox(
                height: getSize(20),
              ),
              lastNameTextFiled(context, state),
              SizedBox(
                height: getSize(20),
              ),
              emailAddressTextFiled(context, state),
              SizedBox(
                height: getSize(20),
              ),
              mobileNumberTextfiled(context, state),
            ],
          ),
        );
      },
    );
  }

  CustomTextField mobileNumberTextfiled(
      BuildContext context, EditProfileState state) {
    return CustomTextField(
      hintText: AppLocalizations.of(context).mobileNumber,
      labelText: AppLocalizations.of(context).mobileNumber,
      keyboardType: TextInputType.number,
      initialValue: state.currentUser.phone?.toString() ?? "",
      onChanged: (mobileNumber) => context
          .read<EditProfileBloc>()
          .add(EditProfileEvent.mobileNumberChanged(mobileNumber)),
      validator: (p0, context) =>
          context.read<EditProfileBloc>().state.mobileNumber.value.fold(
                (l) => l.maybeMap(
                  empty: (value) => AppLocalizations.of(context).enterMobile,
                  invalidMobileNumber: (_) =>
                      AppLocalizations.of(context).enterMobile,
                  orElse: () => null,
                ),
                (r) => null,
              ),
      prefixIcon: CommonCountryCodePicker(
        initialSelection: state.countryCode,
        onChanged: (code) => context.read<EditProfileBloc>().add(
              EditProfileEvent.countryCodeChanged(
                code.dialCode ?? '',
              ),
            ),
      ),
    );
  }

  emailAddressTextFiled(BuildContext context, EditProfileState state) {
    return AbsorbPointer(
      child: CustomTextField(
        hintText: AppLocalizations.of(context).emailAddress,
        labelText: AppLocalizations.of(context).emailAddress,
        keyboardType: TextInputType.emailAddress,
        initialValue: state.currentUser.email,
        onChanged: (email) => context
            .read<EditProfileBloc>()
            .add(EditProfileEvent.emailAddressChanged(email)),
        validator: (_, context) =>
            context.read<EditProfileBloc>().state.emailAddress.value.fold(
                  (l) => l.maybeMap(
                    empty: (value) => AppLocalizations.of(context).enterEmail,
                    invalidEmail: (value) =>
                        AppLocalizations.of(context).enterEmail,
                    orElse: () => null,
                  ),
                  (r) => null,
                ),
      ),
    );
  }

  CustomTextField lastNameTextFiled(
      BuildContext context, EditProfileState state) {
    return CustomTextField(
      labelText: AppLocalizations.of(context).lastName,
      hintText: AppLocalizations.of(context).lastName,
      textCapitalization: TextCapitalization.words,
      initialValue: state.currentUser.lastName,
      onChanged: (p0) => context
          .read<EditProfileBloc>()
          .add(EditProfileEvent.lastNameChanged(p0)),
      validator: (p0, p1) =>
          context.read<EditProfileBloc>().state.lastName.value.fold(
                (f) => f.maybeMap(
                  empty: (value) => AppLocalizations.of(context).enterLastName,
                  invalidUsername: (_) =>
                      AppLocalizations.of(context).enterLastName,
                  orElse: () => null,
                ),
                (_) => null,
              ),
    );
  }

  Widget firstNameTextFiled(BuildContext context, EditProfileState state) {
    return CustomTextField(
      labelText: AppLocalizations.of(context).firstName,
      hintText: AppLocalizations.of(context).firstName,
      initialValue: state.currentUser.firstName,
      textCapitalization: TextCapitalization.words,
      onChanged: (value) => context
          .read<EditProfileBloc>()
          .add(EditProfileEvent.firstNameChanged(value)),
      validator: (p0, p1) =>
          context.read<EditProfileBloc>().state.firstName.value.fold(
                (f) => f.maybeMap(
                  empty: (value) => AppLocalizations.of(context).enterFirstName,
                  invalidUsername: (_) =>
                      AppLocalizations.of(context).enterFirstName,
                  orElse: () => null,
                ),
                (_) => null,
              ),
    );
  }

  Widget profileSection(EditProfileState state, BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Center(
          child: Container(
            height: getSize(100),
            width: getSize(100),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.primaryOrange,
                width: getSize(1),
              ),
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: state.selectImage.isNotEmpty &&
                        !state.selectImage.contains('https')
                    ? FileImage(File(state.selectImage)) as ImageProvider
                    : CachedNetworkImageProvider(state.selectImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -10,
          child: GestureDetector(
            onTap: () {
              ImageChooserDialog().showImageChooserDialog(
                takePhotoCallback: () async {
                  String path = await ImagePickerUtils().pickImage(
                          imageSource: ImageSource.camera, context: context) ??
                      '';

                  if (path.isNotEmpty) {
                    context.read<EditProfileBloc>().add(
                          EditProfileEvent.changeProfilePicture(path),
                        );
                  }
                  context.router.pop();
                },
                selectPhotoCallback: () async {
                  String path = await ImagePickerUtils().pickImage(
                          imageSource: ImageSource.gallery, context: context) ??
                      '';
                  if (path.isNotEmpty) {
                    context.read<EditProfileBloc>().add(
                          EditProfileEvent.changeProfilePicture(path),
                        );
                  }
                  context.router.pop();
                },
                context: context,
              );
            },
            child: Container(
              height: getSize(28),
              width: getSize(28),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
                border: Border.all(
                  color: AppColors.primaryOrange,
                  width: getSize(1),
                ),
              ),
              child: SvgPicture.asset(SvgImageConstant.editProfileIcon),
            ),
          ),
        )
      ],
    );
  }
}
