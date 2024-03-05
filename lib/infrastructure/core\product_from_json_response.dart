import 'package:freezed_annotation/freezed_annotation.dart'; 

part 'product_from_json_response.freezed.dart';
part 'product_from_json_response.g.dart';

@freezed
class ProductFromJson with _$ProductFromJson {
	const factory ProductFromJson({
bool? shipping_charge,
DateTime? minimum_amount,
DateTime? maximum_amount,
int? qty,
List<Data>? data,
	}) = _ProductFromJson;

	factory ProductFromJson.fromJson(Map<String, dynamic> json) => _$ProductFromJsonFromJson(json);
}

@freezed
class Data with _$Data {
	const factory Data({
String? name,
String? hint,
int? fieldType,
List<String>? list,
String? value,
	}) = _Data;

	factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}