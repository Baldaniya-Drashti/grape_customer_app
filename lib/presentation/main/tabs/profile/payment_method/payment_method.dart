import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grape_customer_app/application/main/profile/payment_method/payment_method_bloc.dart';
import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/infrastructure/main/payemnt_method_dto/get_cards_dto.dart';
import 'package:grape_customer_app/injection.dart';
import 'package:grape_customer_app/presentation/common/utils/flushbar_creator.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/core/widgets/buttons/common_button.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_app_bar.dart';

@RoutePage(name: 'PaymentMethod')
class PaymentMethod extends StatelessWidget {
  final bool isFromChangePayment;
  const PaymentMethod({super.key, this.isFromChangePayment = false});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<PaymentMethodBloc>()..add(PaymentMethodEvent.getCardList()),
      child: BlocConsumer<PaymentMethodBloc, PaymentMethodState>(
        listener: (context, state) {
          state.defaultCardfailureOrSuccessOption.fold(
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
              (r) async {
                await showSuccess(message: r).show(context).then((value) {
                  context.router.pop(state.cardDetail.firstWhere((element) =>
                      element.payment_method_id == state.selectedCard));
                });
              },
            ),
          );
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
                  context
                      .read<PaymentMethodBloc>()
                      .add(PaymentMethodEvent.getCardList());
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
                    var res = await context.router.push(
                      PageRouteInfo(
                        AddNewCard.name,
                        args: AddNewCardArgs(
                          getCardsDTO: GetCardsDTO(),
                        ),
                      ),
                    );
                    if (res != null && res == true) {
                      context
                          .read<PaymentMethodBloc>()
                          .add(PaymentMethodEvent.getCardList());
                    }
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
                vertical: getSize(20),
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
                                text: 'No cards found.',
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
                                Expanded(
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.symmetric(
                                        vertical: getSize(20)),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          context.read<PaymentMethodBloc>().add(
                                                PaymentMethodEvent.changeCard(
                                                    state.cardDetail[index]
                                                            .payment_method_id ??
                                                        ""),
                                              );
                                        },
                                        child: Container(
                                          padding: EdgeInsets.zero,
                                          decoration: BoxDecoration(
                                              color: AppColors.grey
                                                  .withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: state.cardDetail[index]
                                                          .payment_method_id ==
                                                      state.selectedCard
                                                  ? Border.all(
                                                      color: AppColors
                                                          .primaryOrange,
                                                    )
                                                  : null),
                                          child: Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  context
                                                      .read<PaymentMethodBloc>()
                                                      .add(
                                                        PaymentMethodEvent
                                                            .changeCard(state
                                                                    .cardDetail[
                                                                        index]
                                                                    .payment_method_id ??
                                                                ""),
                                                      );
                                                },
                                                icon: SvgPicture.asset(
                                                  state.cardDetail[index]
                                                              .payment_method_id !=
                                                          state.selectedCard
                                                      ? SvgImageConstant
                                                          .selectedRadio
                                                      : SvgImageConstant
                                                          .emptyRadio,
                                                ),
                                              ),
                                              SizedBox(
                                                width: getSize(8),
                                              ),
                                              getCardIcon(state
                                                          .cardDetail[index]
                                                          .brand ??
                                                      "") ??
                                                  Container(),
                                              SizedBox(
                                                width: getSize(8),
                                              ),
                                              BaseText(
                                                text:
                                                    '**** **** **** ${state.cardDetail[index].last4}',
                                                fontSize: 12,
                                              ),
                                              Spacer(),
                                              IconButton(
                                                onPressed: () {
                                                  context
                                                      .read<PaymentMethodBloc>()
                                                      .add(
                                                        PaymentMethodEvent
                                                            .deleteCard(state
                                                                    .cardDetail[
                                                                        index]
                                                                    .payment_method_id ??
                                                                ''),
                                                      );
                                                },
                                                icon: SvgPicture.asset(
                                                  SvgImageConstant.deleteIcon,
                                                ),
                                              )
                                            ],
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
                  onPressed: state.cardDetail.isEmpty
                      ? () {}
                      : () {
                          context
                              .read<PaymentMethodBloc>()
                              .add(PaymentMethodEvent.makeCardDefault());
                          // context.router.pop(state.cardDetail[state.selectedCard]);
                        },
                  isSubmitting: state.isSubmitting,
                  buttonText: AppLocalizations.of(context).save,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget? getCardIcon(String cardType) {
    String img = "";
    Widget? icon;
    switch (cardType) {
      case 'mastercard':
        img = 'mastercard.png';
        break;
      case 'visa':
        img = 'visa.png';
        break;
      case 'verve':
        img = 'verve.png';
        break;
      case 'amex':
        img = 'american_express.png';
        break;
      case 'discover':
        img = 'discover.png';
        break;
      case 'diners':
        img = 'dinners_club.png';
        break;
      case 'jcb':
        img = 'jcb.png';
        break;
      case 'Others':
        icon = Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.credit_card,
            size: getSize(20),
            color: Colors.grey[600],
          ),
        );
        break;
      default:
        icon = Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.warning,
            size: 40.0,
            color: Colors.grey[600],
          ),
        );
        break;
    }
    Widget? widget;
    if (img.isNotEmpty) {
      widget = Image.asset(
        'assets/png/$img',
        alignment: Alignment.centerLeft,
        height: getSize(32),
        width: getSize(32),
        //fit: BoxFit.cover,
      );
    } else {
      widget = icon;
    }
    return widget;
  }
}
