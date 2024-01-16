import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_tab_state.dart';
part 'main_tab_event.dart';
part 'main_tab_bloc.freezed.dart';

class MainTabBloc extends Bloc<MainTabEvent, MainTabState> {
  MainTabBloc() : super(MainTabState.initial()) {
    on<MainTabEvent>((event, emit) async {
      event.map(
        tabChange: (value) => emit(state.copyWith(selectedTab: value.tabIndex)),
      );
    });
  }
}
