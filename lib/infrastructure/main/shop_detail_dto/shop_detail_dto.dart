import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grape_customer_app/infrastructure/main/home_dto/get_product_list_response.dart';
import 'package:grape_customer_app/infrastructure/main/home_dto/product_detail_dto.dart';

part 'shop_detail_dto.freezed.dart';
part 'shop_detail_dto.g.dart';

@freezed
class ShopDetailDTO with _$ShopDetailDTO {
  const factory ShopDetailDTO({
    VendorDetails? vendor,
    List<GetProductListResponse>? product,
    List<String>? categories,
  }) = _ShopDetailDTO;

  factory ShopDetailDTO.fromJson(Map<String, dynamic> json) =>
      _$ShopDetailDTOFromJson(json);
}
