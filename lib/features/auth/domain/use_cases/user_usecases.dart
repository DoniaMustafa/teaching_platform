// import '../../../../exports.dart';
import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/auth/data/models/post_params_resume_model.dart';

import '../../data/models/user_response_model.dart';
import '../repositories/user_repo.dart';

class UserUseCases {
  UserRepo repo;
  UserUseCases({required this.repo});
  Future<Either<Failure, ResponseModel>> registerByPhoneNumber(
          {required UserModel user}) async =>
      await repo.registerByPhoneNumber(user: user);
  Future<Either<Failure, ResponseModel>> register({
    PostParamsResumeModel? resumeModel,
    UserModel? user,
    int? stepsNo,
    PostParamsEducationModel? education,
  }) async =>
      repo.register(
          user: user,
          stepsNo: stepsNo,
          education: education,
          resumeModel: resumeModel);
  Future<Either<Failure, ResponseModel>> forgetPassword({
    required String phone,
  }) async =>
      await repo.forgetPassword(
        phone: phone,
      );
  Future<Either<Failure, ResponseModel>> logout() async => await repo.logout();
  Future<Either<Failure, ResponseModel>> verifyOTP(
          {required UserModel user}) async =>
      await repo.verifyOTP(user: user);
  Future<Either<Failure, ResponseModel>> login({
    required String phone,
    required String password,
  }) async =>
      await repo.login(
        phone: phone,
        password: password,
      );

  Future<Either<Failure, ResponseModel>> getUsersData() async =>
      await repo.getUsersData();
  Future<Either<Failure, ResponseModel>> resetPassword(
          {required UserModel user}) async =>
      await repo.resetPassword(user: user);
  Future<Either<Failure, ResponseModel>> verifyForgetPassword(
          {required String verificationCode, required String phone}) =>
      repo.verifyForgetPassword(
          phone: phone, verificationCode: verificationCode);
  // Future<Either<Failure, ResponseModel>> updateDriverImage(
  //         {required String image}) async =>
  //     await repo.updateDriverImage(image: image);

  // // Future<Either<Failure, OtpResponseModel>> resendOTP({required String phone}) async =>
  // //     await repositories.resendOTP(phone: phone);

  // Future<Either<Failure, ResponseModel>> deleteAccount() =>
  //     repo.deleteAccount();
  // Future<Either<Failure, ResponseModel>> addAccount({required UserModel user}) =>
  //     repo.addAccount(user: user);
  // // Future<Either<Failure, UserResponseModel>> changeUserInfo({required UserModel user}) async =>
  // //     await repositories.changeUserInfo(user: user);
  Future<Either<Failure, ResponseModel>> updatePassword(
          {required String oldPassword,
          required String newPassword,
          required String confirmPassword}) async =>
      await repo.updatePassword(
          newPassword: newPassword,
          oldPassword: oldPassword,
          confirmPassword: confirmPassword);
  Future<Either<Failure, ResponseModel>> getUser() => repo.getUser();
  Future<Either<Failure, ResponseModel>> getToken() => repo.getToken();
  Future<Either<Failure, ResponseModel>> getUserRole() => repo.getUserRole();
  Future<Either<Failure, ResponseModel>> editUserData(
          {required UpdateProfileParamsModel user}) =>
      repo.editUserData(user: user);
  Future<Either<Failure, ResponseModel>> cacheToken(String token) async =>
      repo.cacheToken(token);
  Future<Either<Failure, ResponseModel>> changeUserImage(
          {required String image}) async =>
      repo.changeUserImage(image: image);
  // logout()=>repo.logout();
  // Future<Either<Failure, ResponseModel>> cacheFcmToken(String fcmToken) async => await repo.cacheFcmToken(fcmToken);
}
