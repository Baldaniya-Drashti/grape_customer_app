import 'package:freezed_annotation/freezed_annotation.dart'; 

part 'accounte.freezed.dart';
part 'accounte.g.dart';

@freezed
class accounte with _$accounte {
	const factory accounte({
int? user_id,
String? first_name,
String? last_name,
Profile? profile,
String? email,
DateTime? country_code,
int? phone,
bool? is_email_verified,
bool? is_mobile_verified,
int? role,

String? remember_token,
Auth? auth,
	}) = _accounte;

	factory accounte.fromJson(Map<String, dynamic> json) => _$accounteFromJson(json);
}


@freezed
class Auth with _$Auth {
	const factory Auth({
String? token_type,
int? expires_in,
String? access_token,
String? refresh_token,
	}) = _Auth;

	factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
}