
import 'package:teaching/core/export/export.dart';

class AppPrefs {
  static String? token='';
  static String? step;
  static String language = 'ar';
  static String? userToken;
  static String? profileImage;

  static UserModel? user;
  static bool? status;

  static const String prefsDriverKey = 'CACHED_DRIVER';
  static const String isLanguageSelectedKey = 'Language_SELECTED';
  static const String prefsLocationKey = 'CACHED_LOCATION';
  static const String prefsLanguageKey = 'LANGUAGE';
  static const String prefsUsersAddressKey = 'CACHED_USERS_ADDRESS';
  static const String prefsFavouriteKey = 'CACHED_FAVOURITE';
  static const String prefsLoggedInKey = "IS_LOGGED_IN";
  static const String prefsGetStatedKey = "GET_STARTED";
  static const String governoratesKey = "cities";
  static const String _newUserKey = "new user";
  static const String prefsUserKey = "User id";
  static const String userFavouritesKey = "User favourites";
  static const String prefsTokenKey = 'TOKEN';
  static const String prefsDeviceTokenKey = 'DEVICE_TOKEN';
  static const String prefsStepKey = 'Step_TOKEN';
  static const String prefsStatusKey = 'CACHED_DRIVER_Status';

  static const String prefsNewInstallKey = 'NEW_INSTALLATION';

// static const String currentAppLoca


  // static UserModel? user;
  // static UserModel? get userw {
  //   String? cachedUser = _preferences.getString(AppPrefs.prefsUserKey);
  //   UserModel? userModel;
  //   if (cachedUser != null) userModel = UserModel.fromJson(cachedUser.fromStringToJson);
  //   return userModel;
  // }
}
