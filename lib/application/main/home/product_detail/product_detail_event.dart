part of 'product_detail_bloc.dart';

@freezed
class ProductDetailEvent with _$ProductDetailEvent {
  factory ProductDetailEvent.increaseProductQuantity() =
      IncreaseProductQuantity;
  factory ProductDetailEvent.decreaseProductQuantity() =
      DecreaseProductQuantity;
}
