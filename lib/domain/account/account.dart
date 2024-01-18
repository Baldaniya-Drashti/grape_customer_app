import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';

@freezed
class Account with _$Account {
  const Account._();

  const factory Account({
    int? userId,
    String? firstName,
    String? lastName,
    String? email,
    DateTime? countryCode,
    int? phone,
    bool? isEmailVerified,
    bool? isMobileVerified,
    int? role,
    String? rememberToken,
  }) = _Account;

  factory Account.empty() => Account();

  // Option<ValueFailure<dynamic>> get failureOption {
  //   return username.failureOrUnit
  //       .andThen(email.failureOrUnit)
  //       .fold((f) => some(f), (_) => none());
  // }
}
