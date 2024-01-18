import 'package:hive/hive.dart';
import 'package:grape_customer_app/domain/account/account.dart';

part 'account_entity.g.dart';

@HiveType(typeId: 0)
class AccountEntity extends HiveObject {
  @HiveField(0)
  final int? userId;
  @HiveField(1)
  final String? firstName;
  @HiveField(2)
  final String? lastName;
  @HiveField(3)
  final String? email;
  @HiveField(4)
  final DateTime? countryCode;
  @HiveField(5)
  final int? phone;
  @HiveField(6)
  final bool? isEmailVerified;
  @HiveField(7)
  final bool? isMobileVerified;
  @HiveField(8)
  final int? role;
  @HiveField(9)
  final String? rememberToken;

  AccountEntity(
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.countryCode,
    this.phone,
    this.isEmailVerified,
    this.isMobileVerified,
    this.role,
    this.rememberToken,
  );

  Account toDomain() {
    return Account(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      email: email,
      countryCode: countryCode,
      phone: phone,
      isEmailVerified: isEmailVerified,
      isMobileVerified: isMobileVerified,
      role: role,
      rememberToken: rememberToken,
    );
  }

  factory AccountEntity.fromDomain(Account account) {
    return AccountEntity(
      account.userId,
      account.firstName,
      account.lastName,
      account.email,
      account.countryCode,
      account.phone,
      account.isEmailVerified,
      account.isMobileVerified,
      account.role,
      account.rememberToken,
    );
  }
}
