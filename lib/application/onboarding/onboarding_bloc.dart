import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'onboarding_state.dart';
part 'onboarding_event.dart';
part 'onboarding_bloc.freezed.dart';

@injectable
class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingState(currentPage: 0)) {
    on<OnboardingEvent>((event, emit) async {
      event.map(
        nextPage: (value) => emit(state.copyWith(currentPage: event.page)),
      );
    });
  }
}
