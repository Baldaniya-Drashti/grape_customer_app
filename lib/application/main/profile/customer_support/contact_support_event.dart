part of 'contact_support_bloc.dart';

@freezed
class CustomerSupportEvent with _$CustomerSupportEvent {
  const factory CustomerSupportEvent.titleChanged(String title) = TitleChanged;
  const factory CustomerSupportEvent.helpChanged(String help) = HelpChanged;
  const factory CustomerSupportEvent.sendButtonPressed() = SendButtonPressed;
}
