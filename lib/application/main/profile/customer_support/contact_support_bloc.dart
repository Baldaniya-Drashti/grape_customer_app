import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grape_customer_app/domain/auth/auth_value_objects.dart';
import 'package:grape_customer_app/domain/main/i_main_facade.dart';
import 'package:grape_customer_app/domain/main/main_failure.dart';
import 'package:injectable/injectable.dart';

part 'contact_support_state.dart';
part 'contact_support_event.dart';
part 'contact_support_bloc.freezed.dart';

@injectable
class CustomerSupportBloc
    extends Bloc<CustomerSupportEvent, CustomerSupportState> {
  final IMainFacade mainFacade;
  CustomerSupportBloc(this.mainFacade) : super(CustomerSupportState.inital()) {
    on<CustomerSupportEvent>((event, emit) async {
      await event.map(
        sendButtonPressed: (value) async {
          Either<MainFailure, String>? failureOrSuccess;

          final isTitleValid = state.title.isValid();
          final isHelpValid = state.help.isValid();
          if (isTitleValid && isHelpValid) {
            emit(
              state.copyWith(
                isShowError: false,
                isSubmitting: true,
                failureOrSuccessOption: none(),
              ),
            );

            failureOrSuccess = await mainFacade.addContactSupport(
              title: state.title,
              message: state.help,
            );
          }
          emit(
            state.copyWith(
              isShowError: true,
              isSubmitting: false,
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          );
        },
        titleChanged: (value) async {
          emit(state.copyWith(
            title: InputEmptyOrNot(value.title),
          ));
        },
        helpChanged: (value) {
          emit(state.copyWith(
            help: InputEmptyOrNot(value.help),
          ));
        },
      );
    });
  }
}
