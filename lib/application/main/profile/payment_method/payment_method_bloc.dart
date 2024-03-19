import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grape_customer_app/application/main/profile/payment_method/payment_method_response.dart';
import 'package:grape_customer_app/domain/auth/auth_value_objects.dart';
import 'package:grape_customer_app/domain/main/i_main_facade.dart';
import 'package:grape_customer_app/domain/main/main_failure.dart';
import 'package:grape_customer_app/infrastructure/main/payemnt_method_dto/get_cards_dto.dart';
import 'package:grape_customer_app/presentation/common/utils/flushbar_creator.dart';
import 'package:injectable/injectable.dart';

part 'payment_method_state.dart';
part 'payment_method_event.dart';
part 'payment_method_bloc.freezed.dart';

@injectable
class PaymentMethodBloc extends Bloc<PaymentMethodEvent, PaymentMethodState> {
  final IMainFacade mainFacade;
  PaymentMethodBloc(this.mainFacade) : super(PaymentMethodState.initial()) {
    on<PaymentMethodEvent>(
      (event, emit) async {
        await event.map(
          saveButtonPressed: (value) async {
            Either<MainFailure, String>? failureOrSuccess;
            final isCardHolderNameValid = state.cardHoldersName.isValid();
            final isCardNumberValid = state.cardNumber.isValid();
            final isCardDateValid = state.cardDate.isValid();
            final isCvvValid = state.cvv.isValid();

            if (isCardHolderNameValid &&
                isCardNumberValid &&
                isCardDateValid &&
                isCvvValid) {
              emit(
                state.copyWith(
                  isSubmitting: true,
                  failureOrSuccessOption: none(),
                ),
              );
              try {
                CardDetails card = CardDetails(
                  number: state.cardNumber.getOrCrash()?.trim() ?? "",
                  expirationMonth: int.parse(
                      state.cardDate.getOrCrash()?.split('/')[0] ?? ""),
                  expirationYear: int.parse(
                      state.cardDate.getOrCrash()?.split('/')[1] ?? ""),
                  cvc: state.cvv.getOrCrash()?.trim() ?? "",
                );
                await Stripe.instance.dangerouslyUpdateCardDetails(card);
                final billingDetails = BillingDetails(
                  address: Address(
                    city: '',
                    country: '',
                    line1: '',
                    line2: '',
                    state: '',
                    postalCode: '',
                  ),
                ); // mocked data for tests

                final paymentMethod = await Stripe.instance.createPaymentMethod(
                    params: PaymentMethodParams.card(
                  paymentMethodData: PaymentMethodData(
                    billingDetails: billingDetails,
                  ),
                ));

                if (paymentMethod.id.isNotEmpty) {
                  failureOrSuccess = await mainFacade.addPaymentMethod(
                    paymentMethodId: paymentMethod.id,
                    isDefault: state.cardDetail.isEmpty ? true : false,
                  );
                }
              } catch (e) {
                log(e.toString());
                showError(message: e.toString()).show(value.context);
                emit(
                  state.copyWith(
                    showErrorMessages: true,
                    isSubmitting: false,
                    failureOrSuccessOption: none(),
                  ),
                );
              }
            }
            emit(
              state.copyWith(
                showErrorMessages: true,
                isSubmitting: false,
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          cardHolderNameChanged: (value) {
            emit(
              state.copyWith(cardHoldersName: Username(value.cardHolderName)),
            );
          },
          cardNumberChanged: (value) {
            emit(
              state.copyWith(cardNumber: CardNumber(value.cardNo)),
            );
          },
          validUpToChanged: (value) {
            emit(state.copyWith(
              cardDate: CardDate(value.date),
            ));
          },
          cvvChanged: (value) {
            emit(state.copyWith(
              cvv: CVV(value.cvv),
            ));
          },
          addCard: (value) {
            // emit(state.copyWith(
            //   cardDetail: List.of(state.cardDetail)
            //     ..add(value.paymentMethodResponse),
            // ));
          },
          changeCard: (value) {
            emit(
              state.copyWith(
                selectedCard: value.index,
              ),
            );
          },
          deleteCard: (value) async {
            Either<MainFailure, String>? failureOrSuccess;
            emit(
              state.copyWith(
                isSubmitting: true,
                failureOrSuccessOption: none(),
              ),
            );

            failureOrSuccess = await mainFacade.deleteCard(
              id: value.id,
            );

            emit(
              state.copyWith(
                isSubmitting: false,
                showErrorMessages: true,
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          getCardList: (GetCardList value) async {
            emit(
              state.copyWith(
                isLoading: true,
                failureOrSuccessOption: none(),
              ),
            );

            var res = await mainFacade.getPaymentMethod();

            res.fold(
              (l) => emit(
                state.copyWith(
                  isLoading: false,
                  isErrorInAPI: true,
                  failureOrSuccessOption: none(),
                ),
              ),
              (r) => emit(
                state.copyWith(
                  isLoading: false,
                  isErrorInAPI: false,
                  isNoDataFound: r.isEmpty,
                  failureOrSuccessOption: none(),
                  cardDetail: r,
                  selectedCard: r
                          .firstWhere((element) => element.is_default == true)
                          .payment_method_id ??
                      "",
                ),
              ),
            );
          },
          makeCardDefault: (MakeCardDefault value) async {
            Either<MainFailure, String>? failureOrSuccess;
            emit(
              state.copyWith(
                isSubmitting: true,
                failureOrSuccessOption: none(),
                defaultCardfailureOrSuccessOption: none(),
              ),
            );

            failureOrSuccess = await mainFacade.makeCardDefault(
              id: state.selectedCard,
            );

            emit(
              state.copyWith(
                  isSubmitting: false,
                  showErrorMessages: true,
                  failureOrSuccessOption: none(),
                  defaultCardfailureOrSuccessOption:
                      optionOf(failureOrSuccess)),
            );
          },
        );
      },
    );
  }
}
