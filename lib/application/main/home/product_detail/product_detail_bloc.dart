import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_detail_state.dart';
part 'product_detail_event.dart';
part 'product_detail_bloc.freezed.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc() : super(ProductDetailState.initial()) {
    on<ProductDetailEvent>(
      (event, emit) async {
        await event.map(
          increaseProductQuantity: (IncreaseProductQuantity value) async {
            emit(state.copyWith(productQuantity: state.productQuantity + 1));
          },
          decreaseProductQuantity: (DecreaseProductQuantity value) async {
            emit(
              state.copyWith(
                productQuantity:
                    state.productQuantity != 1 ? state.productQuantity - 1 : 1,
              ),
            );
          },
        );
      },
    );
  }
}
