// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grape_customer_app/infrastructure/main/home_dto/get_product_list_response.dart';
part 'search_product_dto.freezed.dart';
part 'search_product_dto.g.dart';

@freezed
class SearchProductDTO with _$SearchProductDTO {
  factory SearchProductDTO({
    List<GetProductListResponse>? products,
    FilterData? filter_data,
  }) = _SearchProductDTO;

  factory SearchProductDTO.fromJson(Map<String, dynamic> json) =>
      _$SearchProductDTOFromJson(json);
}

@freezed
class FilterData with _$FilterData {
  factory FilterData({
    List<String>? sub_category,
    List<String>? inner_sub_category,
    List<String>? color,
    List<String>? size,
    List<String>? brand,
  }) = _FilterData;

  factory FilterData.fromJson(Map<String, dynamic> json) =>
      _$FilterDataFromJson(json);
}

@freezed
class FilterList with _$FilterList {
  factory FilterList({
    String? name,
    @Default(false) final bool isSelected,
  }) = _FilterList;

  factory FilterList.fromJson(Map<String, dynamic> json) =>
      _$FilterListFromJson(json);
}
