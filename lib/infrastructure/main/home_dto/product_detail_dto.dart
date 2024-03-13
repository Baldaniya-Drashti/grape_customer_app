// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grape_customer_app/infrastructure/main/home_dto/get_product_list_response.dart';

part 'product_detail_dto.freezed.dart';
part 'product_detail_dto.g.dart';

@freezed
class ProductDetailDTO with _$ProductDetailDTO {
  const factory ProductDetailDTO({
    GetProductListResponse? product,
    VendorDetails? vendor_details,
    List<SimilarProduct>? similar_product,
    List<SameStore>? same_store,
  }) = _ProductDetailDTO;

  factory ProductDetailDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailDTOFromJson(json);
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
class VendorDetails with _$VendorDetails {
  const factory VendorDetails({
    String? seller_name,
    String? profile,
    int? shop_id,
    String? shop_location,
    int? seller_total_product,
    Review? review,
  }) = _VendorDetails;

  factory VendorDetails.fromJson(Map<String, dynamic> json) =>
      _$VendorDetailsFromJson(json);
}

@freezed
class Review with _$Review {
  const factory Review() = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}

@freezed
class SimilarProduct with _$SimilarProduct {
  const factory SimilarProduct({
    int? id,
    String? product_name,
    String? color,
    String? size,
    String? discount,
    int? price,
    int? review_rate,
    int? available_qty,
    int? order_qty,
    int? total_qty,
    bool? is_cart,
    bool? is_favorite,
    List<Images>? images,
    String? shop_location,
  }) = _SimilarProduct;

  factory SimilarProduct.fromJson(Map<String, dynamic> json) =>
      _$SimilarProductFromJson(json);
}

@freezed
class SameStore with _$SameStore {
  const factory SameStore({
    int? id,
    String? product_name,
    String? color,
    String? size,
    String? discount,
    int? price,
    int? review_rate,
    int? available_qty,
    int? order_qty,
    int? total_qty,
    bool? is_cart,
    bool? is_favorite,
    List<Images>? images,
    String? shop_location,
  }) = _SameStore;

  factory SameStore.fromJson(Map<String, dynamic> json) =>
      _$SameStoreFromJson(json);
}
