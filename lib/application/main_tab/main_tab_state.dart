part of 'main_tab_bloc.dart';

@freezed
class MainTabState with _$MainTabState {
  const factory MainTabState({
    required int selectedTab,
  }) = _MainTabState;
  factory MainTabState.initial() => MainTabState(
        selectedTab: 0,
      );
}
