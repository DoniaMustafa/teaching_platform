part of 'language_cubit.dart';

@immutable
abstract class LanguageState {
  const LanguageState();
}

class LanguageInitialState extends LanguageState {
  const LanguageInitialState();
}

class LanguageChangingState extends LanguageState {
  const LanguageChangingState();
}

class LanguageChangedState extends LanguageInitialState {
  final Locale locale;
  const LanguageChangedState({required this.locale});
}

class LanguageLoadedState extends LanguageInitialState {
  final Locale locale;
  const LanguageLoadedState({required this.locale});
}

class GettingLanguageState extends LanguageInitialState {
  const GettingLanguageState();
}

class GettingLanguageEnState extends LanguageInitialState {
  const GettingLanguageEnState();
}

class GettingLanguageArState extends LanguageInitialState {
  const GettingLanguageArState();
}
