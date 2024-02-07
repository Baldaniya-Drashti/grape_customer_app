import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grape_customer_app/application/main/profile/payment_method/payment_method_response.dart';
import 'package:grape_customer_app/domain/auth/auth_value_objects.dart';

part 'payment_method_state.dart';
part 'payment_method_event.dart';
part 'payment_method_bloc.freezed.dart';

class PaymentMethodBloc extends Bloc<PaymentMethodEvent, PaymentMethodState> {
  PaymentMethodBloc() : super(PaymentMethodState.initial()) {
    on<PaymentMethodEvent>(
      (event, emit) async {
        event.map(
          saveButtonPressed: (value) {
            final isCardHolderNameValid = state.cardHoldersName.isValid();
            final isCardNumberValid = state.cardNumber.isValid();
            final isCardDateValid = state.cardDate.isValid();
            final isCvvValid = state.cvv.isValid();

            if (isCardHolderNameValid &&
                isCardNumberValid &&
                isCardDateValid &&
                isCvvValid) {
              value.context.router.pop(PaymentMethodResponse(
                id: DateTime.now().toString(),
                cardNumber: state.cardNumber.getValue(),
              ));
            }
            emit(state.copyWith(
              showErrorMessages: true,
            ));
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
            emit(state.copyWith(
              cardDetail: List.of(state.cardDetail)
                ..add(value.paymentMethodResponse),
            ));
          },
          changeCard: (value) {
            emit(state.copyWith(
              selectedCard: value.index,
            ));
          },
          deleteCard: (value) {
            emit(state.copyWith(
                cardDetail: List.of(state.cardDetail)
                  ..removeWhere(
                    (element) => element.id == value.id,
                  )));
          },
        );
      },
    );
  }
}
