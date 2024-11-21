import 'package:dartz/dartz.dart';

import '../../../../core/export/export.dart';
import '../../domain/repositories/user_repo.dart';
import '../data_sources/user_local_datasource.dart';
import '../data_sources/user_remote_datasource.dart';
import '../models/post_params_resume_model.dart';
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
              ), local: (data) {

        userLocalDataSource.cacheUser(user: data.user!);
        userLocalDataSource.cacheUserRole(userRole: data.user!.userRoles!);
        return userLocalDataSource.cacheToken(token: data.accessToken);

      });

  @override
  Future<Either<Failure, ResponseModel>> registerByPhoneNumber(
          {required UserModel user}) async =>
      execute(
        () => userRemoteDataSource.registerByPhoneNumber(user: user),
      );

  @override
  Future<Either<Failure, ResponseModel>> register({
    UserModel? user,
    int? stepsNo,
    PostParamsResumeModel? resumeModel,
    PostParamsEducationModel? education,
  }) async =>
      execute(
        () => userRemoteDataSource.register(
            resumeModel: resumeModel,
            user: user,
            stepsNo: stepsNo,
            education: education),
      );

  @override
  Future<Either<Failure, ResponseModel>> verifyOTP(
          {required UserModel user}) async =>
      execute(
        () => userRemoteDataSource.verifyOTP(user: user),
      );

  @override
  Future<Either<Failure, ResponseModel>> forgetPassword({
    required String phone,
  }) =>
      execute(() => userRemoteDataSource.forgetPassword(
            phone: phone,
          ));
  @override
  Future<Either<Failure, ResponseModel>> verifyForgetPassword(
          {required String phone, required String verificationCode}) =>
      execute(
        () async => userRemoteDataSource.verifyForgetPassword(
            phone: phone, verificationCode: verificationCode),
      );
  @override
  Future<Either<Failure, ResponseModel>> resetPassword(
          {required UserModel user}) async =>
      execute(() => userRemoteDataSource.resetPassword(user: user));
  @override
  Future<Either<Failure, ResponseModel>> logout() async => execute(() async {
        ResponseModel response = await userRemoteDataSource.logout();
        if (response.success.isTrue) {
          userLocalDataSource.clearCachedUser();
          userLocalDataSource.clearCachedToken();
          userLocalDataSource.clearUserRole();
          AppPrefs.user = null;
          AppPrefs.userRole = null;
          AppPrefs.token = null;
        }
        return response;
      });
  // @override
  // Future<Either<Failure, ResponseModel>> updateDriverImage(
  //     {required String image}) async {
  //   return await execute(
  //       () => userRemoteDataSource.updateDriverImage(image: image));
  // }
  @override
  Future<Either<Failure, ResponseModel>> updatePassword(
          {required String oldPassword,
          required String newPassword,
          required String confirmPassword}) =>
      execute(() => userRemoteDataSource.updatePassword(
          newPassword: newPassword,
          confirmPassword: confirmPassword,
          oldPassword: oldPassword));
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

  /* Future<Either<Failure, LoginUserResponseModel>> executeAndCacheUser(
      {required Future<LoginUserResponseModel> Function() function}) {
    return execute<LoginUserResponseModel>(() async {
      LoginUserResponseModel userResponse = await function.call();
      bool isCached = await userLocalDataSource.cacheUser(userResponse.user!);
      if (isCached) {
        AppPrefs.user = userResponse.user!;
      }
      return userResponse;
    });
  }
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

  @override
  Future<Either<Failure, ResponseModel>> getToken() =>
      executeCache(() => userLocalDataSource.getCachedToken());

  @override
  Future<Either<Failure, ResponseModel>> cacheToken(String token) =>
      executeCache(() => userLocalDataSource.cacheToken(token: token));
  @override
  Future<Either<Failure, ResponseModel>> cacheUserRole(
          {required String userRole}) =>
      executeCache(() => userLocalDataSource.cacheUserRole(userRole: userRole));

  //  @override
  // logout() {
  //    userLocalDataSource.clearCachedUser();
  //    userLocalDataSource.clearCachedToken();
  //    AppPrefs.user = null;
  //    AppPrefs.token = null;
  //  }

//
//   @override
//   Future<Either<Failure, ResponseModel>> cacheImage(String image) =>
//       executeCache(() => userLocalDataSource.cacheImage(image: image));
//

//

//
  @override
  Future<Either<Failure, ResponseModel>> editUserData(
          {required UpdateProfileParamsModel user}) =>
      execute(
        () => userRemoteDataSource.editUserData(user: user),
      );

  @override
  Future<Either<Failure, ResponseModel>> getUsersData() => execute(
        () => userRemoteDataSource.getUsersData(),
        local: (data) {
          userLocalDataSource.cacheUser(user: data);
          userLocalDataSource.cacheUserRole(userRole: AppPrefs.userRole!);
          return userLocalDataSource.cacheToken(token: AppPrefs.token!);
        },
      );

  @override
  Future<Either<Failure, ResponseModel>> getUserRole() =>
      executeCache(() => userLocalDataSource.getUserRole());

  @override
  Future<Either<Failure, ResponseModel>> changeUserImage(
          {required String image}) =>
      execute(
        () => userRemoteDataSource.changeUserImage(image: image),

      );
}
