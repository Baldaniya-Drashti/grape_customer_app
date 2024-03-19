// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grape_customer_app/infrastructure/main/home_dto/get_product_list_response.dart';
import 'package:grape_customer_app/infrastructure/main/payemnt_method_dto/get_cards_dto.dart';
import 'package:grape_customer_app/infrastructure/main/shipping_address_dto/shipping_address_dto.dart';

part 'checkout_dto.freezed.dart';
part 'checkout_dto.g.dart';

@freezed
class CheckoutDTO with _$CheckoutDTO {
  const factory CheckoutDTO({
    List<GetProductListResponse>? products,
    String? quantity,
    int? shipping_charge,
    int? tax,
    ShippingAddressDTO? shipping_address,
    GetCardsDTO? payment_method,
  }) = _CheckoutDTO;

  factory CheckoutDTO.fromJson(Map<String, dynamic> json) =>
      _$CheckoutDTOFromJson(json);
}
