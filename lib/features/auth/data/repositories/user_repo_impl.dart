import 'package:dartz/dartz.dart';

import '../../../../core/export/export.dart';
import '../../domain/repositories/user_repo.dart';
import '../data_sources/user_local_datasource.dart';
import '../data_sources/user_remote_datasource.dart';
import '../models/user_response_model.dart';

class UserRepoImpl extends UserRepo {
  UserRemoteDataSource userRemoteDataSource;
  UserLocalDataSource userLocalDataSource;
  UserRepoImpl(
      {required this.userRemoteDataSource, required this.userLocalDataSource});
  @override
  Future<Either<Failure, ResponseModel>> login({
    required String phone,
    required String password,
    String? fcmToken,
  }) =>
      execute(
          () async => userRemoteDataSource.login(
                phone: phone,
                password: password,
              ),
          local: (data) => userLocalDataSource.cacheUser(user: data.user));
//   @override
//   Future<Either<Failure, ResponseModel>> forgetPassword({
//     required String phone,
//   }) =>
//       execute(() => userRemoteDataSource.forgetPassword(
//             phone: phone,
//           ));
//
//   // @override
//   // Future<Either<Failure, ResponseModel>> updatePassword(
//   //     {required String oldPassword, required String newPassword}) async {
//   //   try {
//   //     ResponseModel response =
//   //         await userRemoteDataSource.updatePassword(oldPassword: oldPassword, newPassword: newPassword);
//   //     return Right(response);
//   //   } on ServerException {
//   //     return Left(ServerFailure());
//   //   }
//   // }
//
//   // @override
//   // Future<Either<Failure, OtpResponseModel>> resendOTP({required String phone}) async {
//   //   try {
//   //     OtpResponseModel otp = await userRemoteDataSource.resendOTP(phone: phone);
//   //     return Right(otp);
//   //   } on ServerException {
//   //     return Left(ServerFailure());
//   //   }
//   // }
//
//   @override
//   Future<Either<Failure, ResponseModel>> logout() async => execute(() async {
//         ResponseModel response = await userRemoteDataSource.logout();
//         if (response.status.isTrue) {
//           userLocalDataSource.clearCachedUser();
//           userLocalDataSource.clearCachedDeviceToken();
//           userLocalDataSource.clearCachedToken();
//           AppPrefs.user = null;
//           AppPrefs.token = null;
//           AppPrefs.deviceToken = null;
//         }
//         return response;
//       });
//
//   @override
//   Future<Either<Failure, ResponseModel>> resetPassword(
//           String phone, String newPassword) async =>
//       execute(() => userRemoteDataSource.resetPassword(phone, newPassword));
//
//   /* Future<Either<Failure, LoginUserResponseModel>> executeAndCacheUser(
//       {required Future<LoginUserResponseModel> Function() function}) {
//     return execute<LoginUserResponseModel>(() async {
//       LoginUserResponseModel userResponse = await function.call();
//       bool isCached = await userLocalDataSource.cacheUser(userResponse.user!);
//       if (isCached) {
//         AppPrefs.user = userResponse.user!;
//       }
//       return userResponse;
//     });
//   }
// */
//
//   // @override
//   // Future<Either<Failure, UserResponseModel>> changeUserInfo({required UserModel user}) =>
//   //     execute<UserResponseModel>(() async {
//   //       UserResponseModel userResponse = await userRemoteDataSource.changeUserInfo(user: user);
//   //       if (userResponse.success!) {
//   //         debugPrint('start caching');
//   //         await userLocalDataSource.cacheUser(user: userResponse.data[0]);
//   //       }
//   //       return userResponse;
//   //     });
//
  @override
  Future<Either<Failure, ResponseModel>> getUser() async =>
      executeCache(() => userLocalDataSource.getCachedUser());
//
//   @override
//   Future<Either<Failure, ResponseModel>> signUp({UserModel? user}) =>
//       execute(() => userRemoteDataSource.register(user: user!));
//   @override
//   Future<Either<Failure, ResponseModel>> verifyOTP(
//           {required String phone,
//           required String verificationCode,
//           required String fcmToken}) =>
//       execute(
//         () async => userRemoteDataSource.verifyOTP(
//             phone: phone,
//             verificationCode: verificationCode,
//             fcmToken: fcmToken),
//       );
//   @override
//   Future<Either<Failure, ResponseModel>> addAccount(
//       {required UserModel user}) =>
//       execute(() => userRemoteDataSource.addAccount(user: user),
//           local: (data) => userLocalDataSource.cacheUser(user: data));
//   @override
//   Future<Either<Failure, ResponseModel>> deleteAccount() => execute(() async {
//     ResponseModel response = await userRemoteDataSource.deleteAccount();
//     if (response.status.isTrue) {
//       userLocalDataSource.clearCachedUser();
//       userLocalDataSource.clearCachedDeviceToken();
//       userLocalDataSource.clearCachedToken();
//
//       AppPrefs.user = null;
//       AppPrefs.token = null;
//       AppPrefs.deviceToken = null;
//     }
//     return response;
//   });
//   @override
//   Future<Either<Failure, ResponseModel>> getFcmToken() =>
//       executeCache(() => userLocalDataSource.getCachedFcmToken());
//
//   @override
  Future<Either<Failure, ResponseModel>> getToken() =>
      executeCache(() => userLocalDataSource.getCachedToken());

//   @override
//   Future<Either<Failure, ResponseModel>> cacheFcmToken(String fcmToken) =>
//       executeCache(() => userLocalDataSource.cacheFcmToken(fcmToken: fcmToken));
//
  @override
  Future<Either<Failure, ResponseModel>> cacheToken(String token) =>
      executeCache(() => userLocalDataSource.cacheToken(token: token));
//
//   @override
//   Future<Either<Failure, ResponseModel>> cacheImage(String image) =>
//       executeCache(() => userLocalDataSource.cacheImage(image: image));
//

//
//   @override
//   Future<Either<Failure, ResponseModel>> verifyForgetPassword(
//           {required String phone, required String verificationCode}) =>
//       execute(
//         () async => userRemoteDataSource.verifyForgetPassword(
//             phone: phone, verificationCode: verificationCode),
//       );
//
//   @override
//   Future<Either<Failure, ResponseModel>> editUserData(
//           {required UserModel user}) =>
//       execute(
//         () => userRemoteDataSource.editUserData(user: user),
//         local: (data) {
//           userLocalDataSource.cacheUser(user: data);
//           userLocalDataSource.cacheFcmToken(fcmToken: AppPrefs.deviceToken!);
//           return userLocalDataSource.cacheToken(token: AppPrefs.token!);
//         },
//       );
}
