import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grape_customer_app/application/main/profile/my_orders/return_reson_dto.dart';
import 'package:grape_customer_app/domain/main/i_main_facade.dart';
import 'package:grape_customer_app/domain/main/main_failure.dart';
import 'package:grape_customer_app/infrastructure/main/my_order_dto/my_order_dto.dart';
import 'package:grape_customer_app/infrastructure/main/order_detail_dto/order_detail_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'my_orders_state.dart';
part 'my_orders_event.dart';
part 'my_orders_bloc.freezed.dart';

@injectable
class MyOrdersBloc extends Bloc<MyOrdersEvent, MyOrdersState> {
  int page = 1;
  int lastPage = 1;
  bool isFetching = false;
  final RefreshController refreshController = RefreshController();
  final IMainFacade mainFacade;
  MyOrdersBloc(this.mainFacade) : super(MyOrdersState.initial()) {
    on<MyOrdersEvent>(
      (event, emit) async {
        await event.map(
          getMyOrdersList: (value) async {
            if (value.isRefresh) {
              page = 1;
              emit(
                state.copyWith(
                  getMyOrderList: [],
                  failureOrSuccessOption: none(),
                ),
              );
              refreshController.resetNoData();
            } else {
              if (page > lastPage) {
                refreshController.loadNoData();
                return;
              }
            }

            emit(state.copyWith(isLoading: true));

            var res = await mainFacade.getMyOrdersAPI(page: page);

            page++;

            res.fold(
              (l) => emit(
                state.copyWith(
                  isErrorInAPI: true,
                  isLoading: false,
                  getMyOrderList: [],
                  failureOrSuccessOption: none(),
                ),
              ),
              (r) {
                var cartList = (r.data as List<dynamic>)
                    .map((e) => MyOrderDTO.fromJson(e))
                    .toList();
                lastPage = r.meta?.lastPage ?? 1;
                return emit(
                  state.copyWith(
                    isLoading: false,
                    isErrorInAPI: false,
                    failureOrSuccessOption: none(),
                    isNoDataFound: (r.data as List<dynamic>)
                        .map((e) => MyOrderDTO.fromJson(e))
                        .toList()
                        .isEmpty,
                    getMyOrderList: cartList,
                  ),
                );
              },
            );
          },
          getOrderDetail: (GetOrderDetail value) async {
            emit(state.copyWith(isLoading: true));

            var res =
                await mainFacade.getOrderDetailAPI(orderId: value.orderId);
            res.fold(
              (l) => emit(
                state.copyWith(
                  isErrorInAPI: true,
                  isLoading: false,
                  failureOrSuccessOption: none(),
                ),
              ),
              (r) {
                return emit(
                  state.copyWith(
                    isLoading: false,
                    isErrorInAPI: false,
                    failureOrSuccessOption: none(),
                    orderDetailDTO: r,
                  ),
                );
              },
            );
          },
          cancelOrder: (CancelOrder value) async {
            Either<MainFailure, String>? failureOrSuccess;
            emit(
              state.copyWith(
                isSubmitting: true,
                failureOrSuccessOption: none(),
              ),
            );

            failureOrSuccess = await mainFacade.cancelOrderAPI(
              id: value.orderId,
            );

            emit(
              state.copyWith(
                isSubmitting: false,
                showErrorMessages: true,
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          changeReturnReason: (ChangeReturnReason value) async {
            emit(state.copyWith(selectedRefundReason: value.index));
          },
          addRefundPhoto: (AddRefundPhoto value) async {
            var updatedList = List<String>.from(state.uploadImageList);
            updatedList.insert(0, value.path);
            emit(state.copyWith(uploadImageList: updatedList));
          },
          removeRefundPhoto: (RemoveRefundPhoto value) async {
            var updatedList = List<String>.from(state.uploadImageList);
            updatedList.removeAt(value.index);
            emit(state.copyWith(uploadImageList: updatedList));
          },
          additionalCommentChange: (AdditionalCommentChange value) {
            emit(
              state.copyWith(
                additonalComment: value.input,
                failureOrSuccessOption: none(),
              ),
            );
          },
          submitRefundRequest: (SubmitRefundRequest value) async {
            Either<MainFailure, String>? failureOrSuccess;

            emit(
              state.copyWith(
                isSubmitting: true,
                failureOrSuccessOption: none(),
              ),
            );

            failureOrSuccess = await mainFacade.returnRequestAPI(
              orderId: state.orderDetailDTO.order_id.toString(),
              reasonId: state.refundReasonList[state.selectedRefundReason].id
                  .toString(),
              imageList: state.uploadImageList,
              comment: state.additonalComment,
            );

            emit(
              state.copyWith(
                isSubmitting: false,
                showErrorMessages: true,
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          getReasonRefundList: (GetReasonRefundList value) async {
            emit(state.copyWith(isLoading: true));

            var res = await mainFacade.geReasonRefundList();
            res.fold(
              (l) => emit(
                state.copyWith(
                  isLoading: false,
                  isErrorInAPI: true,
                ),
              ),
              (r) => emit(
                state.copyWith(
                  refundReasonList: r,
                  isErrorInAPI: false,
                  isLoading: false,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
