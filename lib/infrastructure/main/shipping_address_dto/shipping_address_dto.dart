// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'shipping_address_dto.freezed.dart';
part 'shipping_address_dto.g.dart';

@freezed
class ShippingAddressDTO with _$ShippingAddressDTO {
  factory ShippingAddressDTO({
    int? id,
    String? full_name,
    String? country_code,
    String? mobile,
    String? address,
    String? landmark,
    String? state,
    String? city,
    String? pincode,
  }) = _ShippingAddressDTO;

  factory ShippingAddressDTO.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressDTOFromJson(json);
}
