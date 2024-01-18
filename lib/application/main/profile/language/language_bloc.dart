import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'language_state.dart';
part 'language_event.dart';
part 'language_bloc.freezed.dart';

@injectable
class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageState(Locale('en'))) {
    on<LanguageEvent>(
      (event, emit) async {
        await event.map(
          changeLanguage: (value) async {
            emit(
              state.copyWith(
                locale:
                    state.locale == Locale('en') ? Locale('so') : Locale('en'),
              ),
            );
          },
        );
      },
    );
  }
}
