import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_review_product_dto.freezed.dart';
part 'get_review_product_dto.g.dart';

@freezed
class GetReviewProductDTO with _$GetReviewProductDTO {
  const factory GetReviewProductDTO({
    int? id,
    String? name,
    List<Images>? images,
  }) = _GetReviewProductDTO;

  factory GetReviewProductDTO.fromJson(Map<String, dynamic> json) =>
      _$GetReviewProductDTOFromJson(json);
}

@freezed
class Images with _$Images {
  const factory Images({
    int? product_image_id,
    String? image,
    String? short_path,
  }) = _Images;

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
}
