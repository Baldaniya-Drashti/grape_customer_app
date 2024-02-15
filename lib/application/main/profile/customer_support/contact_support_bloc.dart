import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grape_customer_app/domain/auth/auth_value_objects.dart';

part 'contact_support_state.dart';
part 'contact_support_event.dart';
part 'contact_support_bloc.freezed.dart';

class CustomerSupportBloc
    extends Bloc<CustomerSupportEvent, CustomerSupportState> {
  CustomerSupportBloc() : super(CustomerSupportState.inital()) {
    on<CustomerSupportEvent>((event, emit) async {
      await event.map(
        sendButtonPressed: (value) {
          final isTitleValid = state.title.isValid();
          final isHelpValid = state.help.isValid();
          if (isTitleValid && isHelpValid) {}
          emit(state.copyWith(
            isShowError: true,
          ));
        },
        titleChanged: (value) async {
          emit(state.copyWith(
            title: InputEmptyOrNot(value.title),
          ));
        },
        helpChanged: (value) {
          emit(state.copyWith(
            title: InputEmptyOrNot(value.help),
          ));
        },
      );
    });
  }
}
