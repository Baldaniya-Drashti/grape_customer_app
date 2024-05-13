// ignore_for_file: non_constant_identifier_names, invalid_annotation_target

import 'package:chewie/chewie.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:video_player/video_player.dart';

part 'get_product_list_response.freezed.dart';
part 'get_product_list_response.g.dart';

@freezed
class GetProductListResponse with _$GetProductListResponse {
  factory GetProductListResponse({
    int? id,
    String? category,
    String? sub_category,
    String? inner_sub_category,
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
    bool? is_favorite,
    int? review_rate,
    List<Reviews>? reviews,
    String? product_form_json,
    List<Images>? images,
    List<Media>? media,
    String? seller_name,
    int? shop_id,
    String? shop_location,
    int? seller_total_product,
    int? cart_id,
    @JsonKey(includeFromJson: true) num? quantity,
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
class Media with _$Media {
  factory Media({
    int? product_media_id,
    String? media,
    String? short_path,
    String? thumbnail,
    int? media_type,
    @JsonKey(includeFromJson: false)
    VideoPlayerController? videoPlayerController,
    @JsonKey(includeFromJson: false) ChewieController? chewieController,
  }) = _Media;

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
}

@freezed
class Reviews with _$Reviews {
  const factory Reviews({
    int? review_id,
    String? fullname,
    num? rate,
    String? review,
    int? created_at,
  }) = _Reviews;

  factory Reviews.fromJson(Map<String, dynamic> json) =>
      _$ReviewsFromJson(json);
}

@freezed
class Images with _$Images {
  factory Images({
    int? product_image_id,
    String? image,
  }) = _Images;

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
}
