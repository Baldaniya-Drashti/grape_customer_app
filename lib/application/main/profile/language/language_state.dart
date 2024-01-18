part of 'language_bloc.dart';

@freezed
class LanguageState with _$LanguageState {
  const factory LanguageState(Locale locale) = _LocaleState;
}
