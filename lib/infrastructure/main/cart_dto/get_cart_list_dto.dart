import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grape_customer_app/infrastructure/main/home_dto/get_product_list_response.dart';

part 'get_cart_list_dto.freezed.dart';
part 'get_cart_list_dto.g.dart';

@freezed
class GetCartListDTO with _$GetCartListDTO {
  factory GetCartListDTO({
    int? id,
    GetProductListResponse? product,
  }) = _GetCartListDTO;

  factory GetCartListDTO.fromJson(Map<String, dynamic> json) =>
      _$GetCartListDTOFromJson(json);
}
