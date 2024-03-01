// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_product_list_response.freezed.dart';
part 'get_product_list_response.g.dart';

@freezed
class GetProductListResponse with _$GetProductListResponse {
  const factory GetProductListResponse({
    int? id,
    String? category,
    String? sub_category,
    String? inner_sub_category,
    String? product_name,
    String? color,
    DateTime? size,
    String? brand_name,
    String? model_name,
    int? price,
    int? available_qty,
    int? order_qty,
    int? total_qty,
    int? review_rate,
    List<dynamic>? reviews,
    String? product_form_json,
    List<dynamic>? images,
    List<dynamic>? video,
    String? shop_location,
  }) = _GetProductListResponse;

  factory GetProductListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProductListResponseFromJson(json);
}
