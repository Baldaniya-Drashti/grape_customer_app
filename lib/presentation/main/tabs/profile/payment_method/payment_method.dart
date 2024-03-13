import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grape_customer_app/application/main/profile/payment_method/payment_method_bloc.dart';
import 'package:grape_customer_app/application/main/profile/payment_method/payment_method_response.dart';
import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/injection.dart';
import 'package:grape_customer_app/presentation/common/utils/flushbar_creator.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/core/widgets/buttons/common_button.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_app_bar.dart';

@RoutePage(name: 'PaymentMethod')
class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PaymentMethodBloc>(),
      child: BlocConsumer<PaymentMethodBloc, PaymentMethodState>(
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
                showSuccess(message: r).show(context).then((value) {
                  // context
                  //     .read<PaymentMethodBloc>()
                  //     .add(PaymentMethodEvent.getShippingAddress());
                });
              },
            ),
          );
        },
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(
              title: AppLocalizations.of(context).paymentMethods,
              actions: [
                GestureDetector(
                  onTap: () async {
                    var res = await context.router
                            .push(PageRouteInfo(AddNewCard.name))
                        as PaymentMethodResponse;
                    context
                        .read<PaymentMethodBloc>()
                        .add(PaymentMethodEvent.addCard(res));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: getSize(16)),
                    child: SvgPicture.asset(SvgImageConstant.addIcon),
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getSize(18),
                vertical: getSize(40),
              ),
              child: state.isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryOrange,
                      ),
                    )
                  : state.isErrorInAPI
                      ? Center(
                          child: BaseText(
                              text: 'Something went wrong. Please try again'),
                        )
                      : state.isNoDataFound
                          ? Center(
                              child: BaseText(
                                text: 'No shipping addresses found.',
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BaseText(
                                  text: AppLocalizations.of(context)
                                      .creditDebitCard,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                                SizedBox(
                                  height: getSize(10),
                                ),
                                Expanded(
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        padding: EdgeInsets.zero,
                                        decoration: BoxDecoration(
                                            color:
                                                AppColors.grey.withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: state.selectedCard == index
                                                ? Border.all(
                                                    color:
                                                        AppColors.primaryOrange,
                                                  )
                                                : null),
                                        child: RadioListTile(
                                          contentPadding: EdgeInsets.zero,
                                          activeColor: AppColors.primaryOrange,
                                          title: Row(
                                            children: [
                                              Image.asset(
                                                'assets/png/mastercard.png',
                                                height: 30,
                                                width: 30,
                                              ),
                                              SizedBox(
                                                width: getSize(8),
                                              ),
                                              BaseText(
                                                text:
                                                    '**** **** **** ${state.cardDetail[index].cardNumber?.substring(state.cardDetail[index].cardNumber!.length - 4)}',
                                                fontSize: 12,
                                              ),
                                            ],
                                          ),
                                          value: index,
                                          groupValue: state.selectedCard,
                                          onChanged: (index) => context
                                              .read<PaymentMethodBloc>()
                                              .add(
                                                PaymentMethodEvent.changeCard(
                                                    index ?? -1),
                                              ),
                                          secondary: GestureDetector(
                                            onTap: () => context
                                                .read<PaymentMethodBloc>()
                                                .add(
                                                  PaymentMethodEvent.deleteCard(
                                                      state.cardDetail[index]
                                                              .id ??
                                                          ''),
                                                ),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  right: getSize(12)),
                                              child: SvgPicture.asset(
                                                  SvgImageConstant.deleteIcon),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                      height: getSize(18),
                                    ),
                                    itemCount: state.cardDetail.length,
                                  ),
                                ),
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
                  onPressed: () {},
                  buttonText: AppLocalizations.of(context).save,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
