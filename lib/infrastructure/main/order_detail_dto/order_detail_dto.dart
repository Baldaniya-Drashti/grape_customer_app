// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grape_customer_app/infrastructure/main/home_dto/get_product_list_response.dart';
import 'package:grape_customer_app/infrastructure/main/payemnt_method_dto/get_cards_dto.dart';
import 'package:grape_customer_app/infrastructure/main/shipping_address_dto/shipping_address_dto.dart';

part 'order_detail_dto.freezed.dart';
part 'order_detail_dto.g.dart';

@freezed
class OrderDetailDTO with _$OrderDetailDTO {
  const factory OrderDetailDTO({
    int? order_id,
    int? amount,
    int? quantity,
    int? shipping_charge,
    int? tax,
    int? status,
    int? order_date,
    int? packed_date,
    int? shipped_date,
    int? delivered_date,
    int? cancel_date,
    int? payment_status,
    String? payment_id,
    bool? is_return,
    ShippingAddressDTO? shipping_address,
    GetCardsDTO? payment_method,
    GetProductListResponse? product,
    int? vendor_id,
    bool? return_applicable,
  }) = _OrderDetailDTO;

  factory OrderDetailDTO.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailDTOFromJson(json);
}
