part of 'product_detail_bloc.dart';

@freezed
class ProductDetailState with _$ProductDetailState {
  factory ProductDetailState({
    required int productQuantity,
  }) = _ProductDetailState;
  factory ProductDetailState.initial() =>
      ProductDetailState(productQuantity: 1);
}
