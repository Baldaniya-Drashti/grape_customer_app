// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_product_from_json_response.freezed.dart';
part 'common_product_from_json_response.g.dart';

@freezed
class ProductFromJson with _$ProductFromJson {
  factory ProductFromJson({
    bool? shipping_charge,
    String? minimum_amount,
    String? maximum_amount,
    String? qty,
    @Default(<Data>[]) List<Data> data,
  }) = _ProductFromJson;

  factory ProductFromJson.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJsonFromJson(json);
}

@freezed
class Data with _$Data {
  factory Data({
    String? name,
    String? hint,
    int? fieldType,
    List<String>? list,
    String? value,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
