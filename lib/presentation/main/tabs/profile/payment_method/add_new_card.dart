import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/profile/payment_method/payment_method_bloc.dart';
import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/common/utils/app_focus.dart';
import 'package:grape_customer_app/presentation/core/widgets/buttons/common_button.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_app_bar.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_text_field.dart';
import 'package:grape_customer_app/presentation/core/widgets/utility/card_input_formetter.dart';

@RoutePage(name: 'AddNewCard')
class AddNewCard extends StatelessWidget {
  const AddNewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentMethodBloc(),
      child: BlocConsumer<PaymentMethodBloc, PaymentMethodState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () => AppFocus.unfocus(context),
            child: Scaffold(
              appBar:
                  CustomAppBar(title: AppLocalizations.of(context).addNewCard),
              body: Form(
                autovalidateMode: state.showErrorMessages
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: getSize(18),
                    vertical: getSize(32),
                  ),
                  children: [
                    cardHolderNameTextFiled(context),
                    SizedBox(
                      height: getSize(20),
                    ),
                    cardNumberTextFiled(context),
                    SizedBox(
                      height: getSize(20),
                    ),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                validUpToTextFiled(context),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: getSize(19),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                cvvTextFiled(context),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              bottomNavigationBar: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getSize(18),
                    vertical: isFullScreenDevice(context) ? 0 : getSize(18),
                  ),
                  child: CommonButton(
                    onPressed: () {
                      context
                          .read<PaymentMethodBloc>()
                          .add(PaymentMethodEvent.saveButtonPressed(context));
                    },
                    buttonText: AppLocalizations.of(context).save,
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }

  CustomTextField cvvTextFiled(BuildContext context) {
    return CustomTextField(
      labelText: AppLocalizations.of(context).cvv,
      hintText: AppLocalizations.of(context).cvv,
      maxLength: 4,
      keyboardType: TextInputType.number,
      obscureText: true,
      onChanged: (cvv) => context
          .read<PaymentMethodBloc>()
          .add(PaymentMethodEvent.cvvChanged(cvv)),
      validator: (p0, p1) =>
          context.read<PaymentMethodBloc>().state.cvv.value.fold(
              (l) => l.maybeMap(
                    invalidCvv: (value) =>
                        AppLocalizations.of(context).enterCvv,
                    orElse: () => null,
                  ),
              (r) => null),
    );
  }

  CustomTextField validUpToTextFiled(BuildContext context) {
    return CustomTextField(
      errorMaxLines: 2,
      labelText: AppLocalizations.of(context).validUpTo,
      hintText: AppLocalizations.of(context).validUpToHintText,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(4),
        CardMonthInputFormatter(),
      ],
      onChanged: (date) => context.read<PaymentMethodBloc>().add(
            PaymentMethodEvent.validUpToChanged(
              date,
            ),
          ),
      validator: (p0, p1) =>
          context.read<PaymentMethodBloc>().state.cardDate.value.fold(
              (l) => l.maybeMap(
                    orElse: () => null,
                    empty: (value) =>
                        AppLocalizations.of(context).enterCardDate,
                    invalidaCardMonth: (value) =>
                        AppLocalizations.of(context).enterCardDate,
                    invalidaCardYear: (value) =>
                        AppLocalizations.of(context).enterCardDate,
                    cardExpired: (value) =>
                        AppLocalizations.of(context).enterCardDate,
                  ),
              (r) => null),
    );
  }

  CustomTextField cardNumberTextFiled(BuildContext context) {
    return CustomTextField(
      labelText: AppLocalizations.of(context).cardNumber,
      hintText: AppLocalizations.of(context).cardNumberHintText,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(19),
        CardNumberInputFormatter(),
      ],
      onChanged: (cardNo) => context
          .read<PaymentMethodBloc>()
          .add(PaymentMethodEvent.cardNumberChanged(cardNo)),
      validator: (p0, p1) =>
          context.read<PaymentMethodBloc>().state.cardNumber.value.fold(
              (l) => l.maybeMap(
                    empty: (value) =>
                        AppLocalizations.of(context).enterCardNumber,
                    invalidCardNumber: (value) =>
                        AppLocalizations.of(context).enterCardNumber,
                    orElse: () => null,
                  ),
              (r) => null),
    );
  }

  CustomTextField cardHolderNameTextFiled(BuildContext context) {
    return CustomTextField(
      labelText: AppLocalizations.of(context).cardHoldersName,
      hintText: AppLocalizations.of(context).cardHolderHintText,
      textCapitalization: TextCapitalization.words,
      onChanged: (cardHolderName) => context
          .read<PaymentMethodBloc>()
          .add(PaymentMethodEvent.cardHolderNameChanged(cardHolderName)),
      validator: (p0, p1) =>
          context.read<PaymentMethodBloc>().state.cardHoldersName.value.fold(
              (l) => l.maybeMap(
                    empty: (value) =>
                        AppLocalizations.of(context).enterCardHolderName,
                    invalidUsername: (value) =>
                        AppLocalizations.of(context).enterCardHolderName,
                    orElse: () => null,
                  ),
              (r) => null),
    );
  }
}
