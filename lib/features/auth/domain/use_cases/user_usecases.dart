// import '../../../../exports.dart';
import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';

import '../../data/models/user_response_model.dart';
import '../repositories/user_repo.dart';

class UserUsecases {
  UserRepo repo;
  UserUsecases({required this.repo});
  // Future<Either<Failure, ResponseModel>> signUp({UserModel? user}) async => await repo.signUp(user: user);
  // Future<Either<Failure, ResponseModel>> forgetPassword({
  //   required String phone,
  // }) async =>
  //     await repo.forgetPassword(
  //       phone: phone,
  //     );
  // Future<Either<Failure, ResponseModel>> logout() async => await repo.logout();
  // // Future<Either<Failure, OtpResponseModel>> resendOTP({required String phone}) async =>
  // //     await repositories.resendOTP(phone: phone);
  // Future<Either<Failure, ResponseModel>> verifyOTP(
  //         {required String phone, required String verificationCode, required String fcmToken}) async =>
  //     await repo.verifyOTP(phone: phone, verificationCode: verificationCode, fcmToken: fcmToken);
  Future<Either<Failure, ResponseModel>> login({required String phone, required String password,}) async =>
      await repo.login(phone: phone, password: password,);
  // Future<Either<Failure, ResponseModel>> resetPassword(String phone, String newPassword) async =>
  //     await repo.resetPassword(phone, newPassword);
  // Future<Either<Failure, ResponseModel>> verifyForgetPassword({required String verificationCode, required String phone}) =>
  //     repo.verifyForgetPassword(phone: phone, verificationCode: verificationCode);
  // Future<Either<Failure, ResponseModel>> deleteAccount() =>
  //     repo.deleteAccount();
  // Future<Either<Failure, ResponseModel>> addAccount({required UserModel user}) =>
  //     repo.addAccount(user: user);
  // // Future<Either<Failure, UserResponseModel>> changeUserInfo({required UserModel user}) async =>
  // //     await repositories.changeUserInfo(user: user);
  //
  // // Future<Either<Failure, ResponseModel>> updatePassword(
  // //         {required String oldPassword, required String newPassword}) async =>
  // //     await repositories.updatePassword(newPassword: newPassword, oldPassword: oldPassword);
  Future<Either<Failure, ResponseModel>> getUser() => repo.getUser();
  Future<Either<Failure, ResponseModel>> getToken() => repo.getToken();
  // Future<Either<Failure, ResponseModel>> getFcmToken() => repo.getFcmToken();
  // Future<Either<Failure,ResponseModel>> editUserData({required UserModel user})=>repo.editUserData(user: user);
  Future<Either<Failure, ResponseModel>> cacheToken(String token) async => repo.cacheToken(token);
  // Future<Either<Failure, ResponseModel>> cacheFcmToken(String fcmToken) async => await repo.cacheFcmToken(fcmToken);
}
