part of 'payment_method_bloc.dart';

@freezed
class PaymentMethodState with _$PaymentMethodState {
  const factory PaymentMethodState({
    required Username cardHoldersName,
    required CardNumber cardNumber,
    required CardDate cardDate,
    required bool showErrorMessages,
    required CVV cvv,
    required List<GetCardsDTO> cardDetail,
    required Option<Either<MainFailure, String>> failureOrSuccessOption,
    required Option<Either<MainFailure, String>>
        defaultCardfailureOrSuccessOption,
    required String selectedCard,
    required bool isSubmitting,
    required bool isLoading,
    required bool isErrorInAPI,
    required bool isNoDataFound,
    required FocusNode mobileNumberFocusNode,
    required FocusNode cvvNumberFocusNode,
    required FocusNode validUptoFocusNode,
  }) = _PaymentMethodState;
  factory PaymentMethodState.initial() => PaymentMethodState(
        cardHoldersName: Username(''),
        cardNumber: CardNumber(''),
        cardDate: CardDate(''),
        showErrorMessages: false,
        cvv: CVV(''),
        cardDetail: [],
        selectedCard: '',
        failureOrSuccessOption: none(),
        isSubmitting: false,
        isLoading: false,
        isErrorInAPI: false,
        isNoDataFound: false,
        defaultCardfailureOrSuccessOption: none(),
        mobileNumberFocusNode: FocusNode(),
        cvvNumberFocusNode: FocusNode(),
        validUptoFocusNode: FocusNode(),
      );
}
