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
    String? size,
    String? brand_name,
    int? price,
    int? available_qty,
    int? order_qty,
    int? total_qty,
    int? review_rate,
    List<dynamic>? reviews,
    String? product_form_json,
    List<Images>? images,
    List<Video>? video,
    String? shop_location,
  }) = _GetProductListResponse;

  factory GetProductListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProductListResponseFromJson(json);
}

@freezed
class Images with _$Images {
  const factory Images({
    int? product_image_id,
    String? image,
  }) = _Images;

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
}

@freezed
class Video with _$Video {
  const factory Video({
    int? product_video_id,
    String? video,
  }) = _Video;

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);
}
