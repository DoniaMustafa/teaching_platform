import '../../../../core/export/export.dart';
import '../models/user_response_model.dart';

abstract class UserLocalDataSource {
  Future<ResponseModel> getCachedUser();
  Future<ResponseModel> cacheImage({required String image});
  Future<ResponseModel> cacheUser({required UserModel user});
  Future<bool> clearCachedUser();
  Future<ResponseModel> cacheToken({required String token});
  Future<bool> clearCachedToken();
  Future<ResponseModel> getCachedToken();
  // Future<ResponseModel> cacheFcmToken({required String fcmToken});
  Future<bool> clearCachedDeviceToken();
  // Future<ResponseModel> getCachedFcmToken();
}

class UserImplWithPrefs implements UserLocalDataSource {
  final SharedPreferences sharedPreferences;
  UserImplWithPrefs({required this.sharedPreferences});

  @override
  Future<bool> clearCachedUser() async {
    bool isCleared = true;
    if (sharedPreferences.containsKey(AppPrefs.prefsUserKey)) {
      isCleared = await sharedPreferences.remove(AppPrefs.prefsUserKey);
      if (isCleared.isTrue) {
        AppPrefs.user = null;
      }
    }

    return isCleared;
  }

  @override
  Future<bool> clearCachedToken() async {
    bool isCleared = true;
    if (sharedPreferences.containsKey(AppPrefs.prefsTokenKey)) {
      isCleared = await sharedPreferences.remove(AppPrefs.prefsTokenKey);
      if (isCleared.isTrue) {
        AppPrefs.token = null;
      }
    }
    return isCleared;
  }

  @override
  Future<bool> clearCachedDeviceToken() async {
    bool isCleared = true;
    if (sharedPreferences.containsKey(AppPrefs.prefsDeviceTokenKey)) {
      isCleared = await sharedPreferences.remove(AppPrefs.prefsDeviceTokenKey);
      if (isCleared.isTrue) {
        AppPrefs.userToken = null;
      }
    }
    return isCleared;
  }

  @override
  Future<ResponseModel> cacheUser({required UserModel user}) => cacheWrite(
        sharedPreferences,
        AppPrefs.prefsUserKey,
        user.userToJson(),
        // afterCaching: (data) {
        //   AppPrefs.user = user;
        //   print('AppPrefs.user cacheUser>>>>>>>>>>>>>>> ${AppPrefs.user!.userRole}');
        // },
      );
  @override
  Future<ResponseModel> cacheToken({required String token}) => cacheWrite(
        sharedPreferences,
        AppPrefs.prefsTokenKey,
        token,
        afterCaching: (data) {
          AppPrefs.token = token;
        },
      );
  // @override
  // Future<ResponseModel> cacheFcmToken({required String fcmToken}) => cacheWrite(
  //       sharedPreferences,
  //       AppPrefs.prefsDeviceTokenKey,
  //       fcmToken,
  //       afterCaching: (data) {
  //         AppPrefs.userToken = fcmToken;
  //       },
  //     );
  @override
  Future<ResponseModel> getCachedUser() => cacheRead<UserModel?>(
        sharedPreferences,
        AppPrefs.prefsUserKey,
        fromJson: UserModel.fromJson,
        afterCaching: (data) {
          AppPrefs.user = data;
          // print('AppPrefs.user >>>>>>>>>>>>>>> ${AppPrefs.user!.userRole}');
        },
      );
  // @override
  // Future<ResponseModel> getCachedFcmToken() => cacheRead<String?>(
  //       sharedPreferences,
  //       AppPrefs.prefsDeviceTokenKey,
  //       afterCaching: (data) {
  //         AppPrefs.userToken = data;
  //       },
  //     );

  @override
  Future<ResponseModel> getCachedToken() => cacheRead<String?>(
        sharedPreferences,
        AppPrefs.prefsTokenKey,
        afterCaching: (data) {
          AppPrefs.token = data;
        },
      );

  @override
  Future<ResponseModel> cacheImage({required String image}) => cacheWrite(
        sharedPreferences,
        AppPrefs.profileImage!,
        image,
        afterCaching: (data) {
          // AppPrefs.profileImage = image;
        },
      );
}
