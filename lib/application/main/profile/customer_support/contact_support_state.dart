part of 'contact_support_bloc.dart';

@freezed
class CustomerSupportState with _$CustomerSupportState {
  const factory CustomerSupportState({
    required InputEmptyOrNot title,
    required InputEmptyOrNot help,
    required bool isShowError,
  }) = _CustomerSupportState;

  factory CustomerSupportState.inital() => CustomerSupportState(
        title: InputEmptyOrNot(''),
        help: InputEmptyOrNot(''),
        isShowError: false,
      );
}
