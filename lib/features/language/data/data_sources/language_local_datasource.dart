import '../../../../core/export/export.dart';

abstract class LanguageLocalDataSource {

  Future<ResponseModel> changeLanguage({required String language});

  Future<ResponseModel> getSavedLanguage();

}

class LanguageImplWithPrefs extends LanguageLocalDataSource {

  final SharedPreferences sharedPreferences;

  LanguageImplWithPrefs({required this.sharedPreferences});

  @override
  Future<ResponseModel> changeLanguage({required String language}) =>
      cacheWrite(sharedPreferences, AppPrefs.prefsLanguageKey, language);

  @override
  Future<ResponseModel> getSavedLanguage() =>
      cacheRead<String?>(sharedPreferences, AppPrefs.prefsLanguageKey);

}
