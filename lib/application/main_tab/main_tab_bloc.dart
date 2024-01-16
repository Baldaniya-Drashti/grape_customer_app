import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/helper/location_helper.dart';

part 'main_tab_state.dart';
part 'main_tab_event.dart';
part 'main_tab_bloc.freezed.dart';

class MainTabBloc extends Bloc<MainTabEvent, MainTabState> {
  final List<String> pageList = [HomeView.name];
  MainTabBloc() : super(MainTabState.initial()) {
    on<MainTabEvent>(
      (event, emit) async {
        await event.map(
          tabChange: (value) async {
            emit(state.copyWith(selectedTab: value.tabIndex));

            switch (value.tabIndex) {
              case 0:
                if (!pageList.contains(state.homePage)) {
                  pageList.add(state.homePage);
                }
                emit(state.copyWith(
                    pageIndex: pageList.indexOf(state.homePage)));
                break;
              case 1:
                if (!pageList.contains(state.favouritesPage)) {
                  pageList.add(state.favouritesPage);
                }
                emit(state.copyWith(
                    pageIndex: pageList.indexOf(state.favouritesPage)));
                break;
              case 2:
                if (!pageList.contains(state.myCartPage)) {
                  pageList.add(state.myCartPage);
                }
                emit(state.copyWith(
                    pageIndex: pageList.indexOf(state.myCartPage)));
                break;
              case 3:
                if (!pageList.contains(state.notificationPage)) {
                  pageList.add(state.notificationPage);
                }
                emit(state.copyWith(
                    pageIndex: pageList.indexOf(state.notificationPage)));
                break;
              case 4:
                if (!pageList.contains(state.profilePage)) {
                  pageList.add(state.profilePage);
                }
                emit(state.copyWith(
                    pageIndex: pageList.indexOf(state.profilePage)));
                break;
              default:
            }
          },
          getCurrentLocation: (GetCurrentLocation value) async {
            await LocationHelper().getCurrentLocation().then(
              (value) {
                emit(
                  state.copyWith(
                    currentLocation: value.$1 ?? "",
                    currentLatitude: value.$2,
                    currentLongitude: value.$3,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
