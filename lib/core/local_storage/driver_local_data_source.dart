import 'package:hive/hive.dart';
import 'package:teaching/core/model/response_model.dart';

abstract class DriverLocalDataSource {
  // Future<ResponseModel> getCachedDriver();
  //
  // // Future<ResponseModel> cacheDriver({required DriverModel driver});
  // Future<ResponseModel> getCachedSteps();
  // Future<ResponseModel> cacheDriverStatus({required bool status});
  // Future<ResponseModel> getDriverStatus();
  // Future<bool> clearStatus();
  //
  // Future<bool> clearCachedDriver();
  // Future<ResponseModel> cacheToken({required String token});
  // Future<bool> clearCachedToken();
  // Future<ResponseModel> getCachedToken();
  // Future<ResponseModel> cacheFcmToken({required String fcmToken});
  // Future<bool> clearCachedDeviceToken();
  // Future<ResponseModel> getCachedFcmToken();
}

class DriverImplWithPrefs implements DriverLocalDataSource {

  // final SharedPreferences sharedPreferences;
  // DriverImplWithPrefs({required this.sharedPreferences});
  //
  // @override
  // Future<bool> clearCachedDriver() async {
  //   bool isCleared = true;
  //   if (sharedPreferences.containsKey(AppPrefs.prefsDriverKey)) {
  //     isCleared = await sharedPreferences.remove(AppPrefs.prefsDriverKey);
  //     if (isCleared.isTrue) {
  //       AppPrefs.driver = null;
  //     }
  //   }
  //
  //   return isCleared;
  // }
  //
  // @override
  // Future<bool> clearCachedToken() async {
  //   bool isCleared = true;
  //   if (sharedPreferences.containsKey(AppPrefs.prefsTokenKey)) {
  //     isCleared = await sharedPreferences.remove(AppPrefs.prefsTokenKey);
  //     if (isCleared.isTrue) {
  //       AppPrefs.token = null;
  //     }
  //   }
  //   return isCleared;
  // }
  //
  // @override
  // Future<bool> clearCachedDeviceToken() async {
  //   bool isCleared = true;
  //   if (sharedPreferences.containsKey(AppPrefs.prefsDeviceTokenKey)) {
  //     isCleared = await sharedPreferences.remove(AppPrefs.prefsDeviceTokenKey);
  //     if (isCleared.isTrue) {
  //       AppPrefs.deviceToken = null;
  //     }
  //   }
  //   return isCleared;
  // }
  //
  // @override
  // Future<ResponseModel> cacheDriver({required DriverModel driver}) {
  //   print('driver caching');
  //   return cacheWrite(
  //     sharedPreferences,
  //     AppPrefs.prefsDriverKey,
  //     driver.toJson(),
  //     /*  afterCaching: () {
  //       AppPrefs.driver = driver;
  //     },*/
  //   );
  // }
  //
  // @override
  // Future<ResponseModel> cacheToken({required String token}) => cacheWrite(
  //       sharedPreferences,
  //       AppPrefs.prefsTokenKey,
  //       token,
  //       afterCaching: (data) {
  //         AppPrefs.token = token;
  //       },
  //     );
  //
  // @override
  // Future<ResponseModel> cacheFcmToken({required String fcmToken}) => cacheWrite(
  //       sharedPreferences,
  //       AppPrefs.prefsDeviceTokenKey,
  //       fcmToken,
  //       afterCaching: (data) {
  //         AppPrefs.deviceToken = fcmToken;
  //       },
  //     );
  // @override
  // Future<ResponseModel> getCachedDriver() => cacheRead<DriverModel>(
  //       sharedPreferences,
  //       AppPrefs.prefsDriverKey,
  //       fromJson: DriverModel.fromJson,
  //       afterCaching: (data) {
  //         AppPrefs.driver = data;
  //       },
  //     );
  // @override
  // Future<ResponseModel> getCachedFcmToken() => cacheRead<String?>(
  //       sharedPreferences,
  //       AppPrefs.prefsDeviceTokenKey,
  //       afterCaching: (data) {
  //         AppPrefs.deviceToken = data;
  //       },
  //     );
  //
  // @override
  // Future<ResponseModel> getCachedToken() => cacheRead<String?>(
  //       sharedPreferences,
  //       AppPrefs.prefsTokenKey,
  //       afterCaching: (data) {
  //         AppPrefs.token = data;
  //       },
  //     );
  //
  // @override
  // Future<ResponseModel> getCachedSteps() => cacheRead<String?>(
  //       sharedPreferences,
  //       AppPrefs.prefsStepKey,
  //       afterCaching: (data) {
  //         AppPrefs.step = data;
  //       },
  //     );
  //
  // ///******************************************************************\\\
  // @override
  // Future<ResponseModel> cacheDriverStatus({required bool status}) => cacheWrite(
  //       sharedPreferences,
  //       AppPrefs.prefsStatusKey,
  //       status,
  //     );
  // @override
  // Future<ResponseModel> getDriverStatus() => cacheRead<bool?>(
  //       sharedPreferences,
  //       AppPrefs.prefsStatusKey,
  //       afterCaching: (data) {
  //         AppPrefs.status = data;
  //       },
  //     );
  // @override
  // Future<bool> clearStatus() async {
  //   bool isCleared = true;
  //   if (sharedPreferences.containsKey(AppPrefs.prefsTokenKey)) {
  //     isCleared = await sharedPreferences.remove(AppPrefs.prefsTokenKey);
  //     if (isCleared.isTrue) {
  //       AppPrefs.token = null;
  //     }
  //   }
  //   return isCleared;
  // }
}
