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
    required Option<Either<MainFailure, String>> failureOrSuccessOption,
    required int selectedCard,
    required bool isSubmitting,
    required bool isLoading,
    required bool isErrorInAPI,
    required bool isNoDataFound,
  }) = _PaymentMethodState;
  factory PaymentMethodState.initial() => PaymentMethodState(
        cardHoldersName: Username(''),
        cardNumber: CardNumber(''),
        cardDate: CardDate(''),
        showErrorMessages: false,
        cvv: CVV(''),
        cardDetail: [],
        selectedCard: 0,
        failureOrSuccessOption: none(),
        isSubmitting: false,
        isLoading: false,
        isErrorInAPI: false,
        isNoDataFound: false,
      );
}
