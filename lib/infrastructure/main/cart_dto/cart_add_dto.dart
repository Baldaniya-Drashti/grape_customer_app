import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grape_customer_app/infrastructure/main/home_dto/get_product_list_response.dart';

part 'cart_add_dto.freezed.dart';
part 'cart_add_dto.g.dart';

@freezed
class CartAddDTO with _$CartAddDTO {
  const factory CartAddDTO({
    int? id,
    GetProductListResponse? product,
  }) = _CartAddDTO;

  factory CartAddDTO.fromJson(Map<String, dynamic> json) =>
      _$CartAddDTOFromJson(json);
}
