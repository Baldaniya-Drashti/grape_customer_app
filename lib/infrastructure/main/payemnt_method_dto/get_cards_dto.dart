// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_cards_dto.freezed.dart';
part 'get_cards_dto.g.dart';

@freezed
class GetCardsDTO with _$GetCardsDTO {
  const factory GetCardsDTO({
    String? payment_method_id,
    String? brand,
    int? exp_month,
    int? exp_year,
    String? last4,
    bool? is_default,
  }) = _GetCardsDTO;

  factory GetCardsDTO.fromJson(Map<String, dynamic> json) =>
      _$GetCardsDTOFromJson(json);
}
