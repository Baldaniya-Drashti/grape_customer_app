// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_product_list_response.freezed.dart';
part 'get_product_list_response.g.dart';

@freezed
class GetProductListResponse with _$GetProductListResponse {
  factory GetProductListResponse({
    int? id,
    String? category,
    String? sub_category,
    InnerSubCategory? inner_sub_category,
    String? product_name,
    String? discount,
    String? color,
    String? size,
    String? brand_name,
    String? model_name,
    int? price,
    int? available_qty,
    int? order_qty,
    int? total_qty,
    bool? is_cart,
    int? review_rate,
    List<dynamic>? reviews,
    String? product_form_json,
    List<Images>? images,
    List<dynamic>? video,
    String? seller_name,
    int? shop_id,
    String? shop_location,
    int? seller_total_product,
  }) = _GetProductListResponse;

  factory GetProductListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProductListResponseFromJson(json);
}

@freezed
class InnerSubCategory with _$InnerSubCategory {
  factory InnerSubCategory() = _InnerSubCategory;

  factory InnerSubCategory.fromJson(Map<String, dynamic> json) =>
      _$InnerSubCategoryFromJson(json);
}

@freezed
class Images with _$Images {
  factory Images({
    int? product_image_id,
    String? image,
  }) = _Images;

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
}
