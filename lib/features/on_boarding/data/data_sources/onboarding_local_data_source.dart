
import '../../../../core/export/export.dart';

abstract class OnBoardingLocalDataSource {
  Future<ResponseModel> cacheNewUser();
  Future<ResponseModel> getNewUser();
}

class OnBoardingLocalDataSourceImplWithPrefs extends OnBoardingLocalDataSource {
  SharedPreferences sharedPreferences;
  OnBoardingLocalDataSourceImplWithPrefs({required this.sharedPreferences});
  @override
  Future<ResponseModel> cacheNewUser() => cacheWrite(sharedPreferences, AppPrefs.prefsNewInstallKey, false);

  @override
  Future<ResponseModel> getNewUser() async => cacheRead<bool?>(sharedPreferences, AppPrefs.prefsNewInstallKey);
}
