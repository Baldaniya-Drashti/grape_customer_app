part of 'contact_support_bloc.dart';

@freezed
class CustomerSupportState with _$CustomerSupportState {
  const factory CustomerSupportState({
    required InputEmptyOrNot title,
    required InputEmptyOrNot help,
    required bool isShowError,
    required Option<Either<MainFailure, String>> failureOrSuccessOption,
    required bool isSubmitting,
    required bool isErrorInAPI,
  }) = _CustomerSupportState;

  factory CustomerSupportState.inital() => CustomerSupportState(
        title: InputEmptyOrNot(''),
        help: InputEmptyOrNot(''),
        isShowError: false,
        failureOrSuccessOption: none(),
        isSubmitting: false,
        isErrorInAPI: false,
      );
}
