// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grape_customer_app/infrastructure/main/home_dto/get_product_list_response.dart';

part 'my_order_dto.freezed.dart';
part 'my_order_dto.g.dart';

@freezed
class MyOrderDTO with _$MyOrderDTO {
  const factory MyOrderDTO({
    int? order_id,
    num? amount,
    int? quantity,
    int? order_date,
    GetProductListResponse? product,
    bool? is_return,
    int? status,
  }) = _MyOrderDTO;

  factory MyOrderDTO.fromJson(Map<String, dynamic> json) =>
      _$MyOrderDTOFromJson(json);
}
