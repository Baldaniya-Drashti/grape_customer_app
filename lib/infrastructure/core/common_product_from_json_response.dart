// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_product_from_json_response.freezed.dart';
part 'common_product_from_json_response.g.dart';

@freezed
class CommonProductFromJsonResponse with _$CommonProductFromJsonResponse {
  const factory CommonProductFromJsonResponse({
    ProductFormJson? product_form_json,
  }) = _CommonProductFromJsonResponse;

  factory CommonProductFromJsonResponse.fromJson(Map<String, dynamic> json) =>
      _$CommonProductFromJsonResponseFromJson(json);
}

@freezed
class ProductFormJson with _$ProductFormJson {
  const factory ProductFormJson({
    bool? shipping_charge,
    String? minimum_amount,
    String? maximum_amount,
    int? qty,
    List<Data>? data,
  }) = _ProductFormJson;

  factory ProductFormJson.fromJson(Map<String, dynamic> json) =>
      _$ProductFormJsonFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    String? name,
    String? hint,
    int? fieldType,
    List<dynamic>? list,
    String? value,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
