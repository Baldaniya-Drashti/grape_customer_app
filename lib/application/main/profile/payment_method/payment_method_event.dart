part of 'payment_method_bloc.dart';

@freezed
class PaymentMethodEvent with _$PaymentMethodEvent {
  const factory PaymentMethodEvent.cardHolderNameChanged(
      String cardHolderName) = CardHolderNameChanged;

  const factory PaymentMethodEvent.cardNumberChanged(String cardNo) =
      CardNumberChanged;

  const factory PaymentMethodEvent.validUpToChanged(String date) =
      ValidUpToChanged;

  const factory PaymentMethodEvent.cvvChanged(
      String cvv, BuildContext context) = CvvChanged;

  const factory PaymentMethodEvent.saveButtonPressed(BuildContext context) =
      SaveButtonPressed;
  const factory PaymentMethodEvent.addCard(
      PaymentMethodResponse paymentMethodResponse) = AddCard;

  const factory PaymentMethodEvent.deleteCard(String id) = DeleteCard;
  const factory PaymentMethodEvent.makeCardDefault() = MakeCardDefault;

  const factory PaymentMethodEvent.getCardList() = GetCardList;

  const factory PaymentMethodEvent.changeCard(String index) = ChangedCard;
}
