import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/language/domain/use_cases/language_usecases.dart';

import '../../../../../config/localization_constants.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  final LanguageUseCases languageUseCases;
  bool isEn = true;
  Locale locale = AppLocalizationsConstants().enLocale;

  LanguageCubit({required this.languageUseCases})
      : super(const LanguageInitialState());
  /*get saved language */
  Future<bool> getSavedLanguage() async {
    bool isLanguageSaved = false;
    await managerExecute<String?>(
      languageUseCases.getSavedLanguage(),
      onSuccess: (data) {
        if (data.isNotNull) {
          isEn =
              data.isEqualTo(AppLocalizationsConstants().enLocale.languageCode);
          locale = isEn
              ? AppLocalizationsConstants().enLocale
              : AppLocalizationsConstants().arLocale;
          isLanguageSaved = true;
        }
      },
    );

    print('isEn >>> $isEn');
    print('isEn >>> $isLanguageSaved');

    return isLanguageSaved;
  }

  /*change language */
  Future<bool> _changeLanguage({required bool isEnglish}) async {
    Locale loc = isEnglish
        ? AppLocalizationsConstants().enLocale
        : AppLocalizationsConstants().arLocale;
    return (await managerExecute<bool>(
      languageUseCases.changeLanguage(language: loc.languageCode),
      onSuccess: (data) {
        locale = loc;
        isEn = isEnglish;
        emit(LanguageChangedState(locale: locale));
      },
    ))
        .orFalse;
  }

  Future<void> toEnglish() async {
    _changeLanguage(isEnglish: true);
    emit(const GettingLanguageEnState());
  }

  Future<void> toArabic() async {
    _changeLanguage(isEnglish: false);
    emit(const GettingLanguageArState());
  }
}
