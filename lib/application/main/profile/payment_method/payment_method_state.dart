part of 'payment_method_bloc.dart';

@freezed
class PaymentMethodState with _$PaymentMethodState {
  const factory PaymentMethodState({
    required Username cardHoldersName,
    required CardNumber cardNumber,
    required CardDate cardDate,
    required bool showErrorMessages,
    required CVV cvv,
    required List<PaymentMethodResponse> cardDetail,
    required int selectedCard,
  }) = _PaymentMethodState;
  factory PaymentMethodState.initial() => PaymentMethodState(
        cardHoldersName: Username(''),
        cardNumber: CardNumber(''),
        cardDate: CardDate(''),
        showErrorMessages: false,
        cvv: CVV(''),
        cardDetail: [],
        selectedCard: 0,
      );
}
