import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grape_customer_app/application/main/profile/customer_support/contact_support_bloc.dart';
import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
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
      create: (context) => CustomerSupportBloc(),
      child: BlocConsumer<CustomerSupportBloc, CustomerSupportState>(
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(
              title: AppLocalizations.of(context).customerSupport,
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: getSize(18)),
              child: Form(
                autovalidateMode: state.isShowError
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                child: Column(
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
                      onPressed: () {
                        context.read<CustomerSupportBloc>().add(
                              CustomerSupportEvent.sendButtonPressed(),
                            );
                      },
                      buttonText: AppLocalizations.of(context).send,
                    ),
                    Spacer(),
                    Row(
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
                    SizedBox(
                      height: getSize(50),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {},
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
