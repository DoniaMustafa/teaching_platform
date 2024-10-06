import 'package:dartz/dartz.dart';
import '../../../../core/export/export.dart';

abstract class UserRepo {
  Future<Either<Failure, ResponseModel>> registerByPhoneNumber(
      {required UserModel user});
  Future<Either<Failure, ResponseModel>> login({required String phone, required String password, String fcmToken});
  Future<Either<Failure, ResponseModel>> register({UserModel? user,int? stepsNo});


  //   // Future<Either<Failure, ResponseModel>> updatePassword({required String oldPassword, required String newPassword});
 // logout();
  // Future<Either<Failure, ResponseModel>> logout();
//   // Future<Either<Failure, UserResponseModel>> changeUserInfo({required UserModel user});
  Future<Either<Failure, ResponseModel>> verifyOTP({required UserModel user});
//   Future<Either<Failure, ResponseModel>> forgetPassword({
//     required String phone,
//   });
//   Future<Either<Failure,ResponseModel>> deleteAccount();
//
//   Future<Either<Failure, ResponseModel>> addAccount({required UserModel user});
//
  Future<Either<Failure, ResponseModel>> getUser();
  Future<Either<Failure, ResponseModel>> getToken();
//   Future<Either<Failure, ResponseModel>> getFcmToken();
  Future<Either<Failure, ResponseModel>> cacheToken(String token);
//   Future<Either<Failure, ResponseModel>> cacheImage(String image);
//   Future<Either<Failure, ResponseModel>> cacheFcmToken(String fcmToken);
//   Future<Either<Failure,ResponseModel>> editUserData({required UserModel user});
//   Future<Either<Failure, ResponseModel>> resetPassword(String phone, String newPassword);
//   Future<Either<Failure, ResponseModel>> verifyForgetPassword({required String phone, required String verificationCode});
}
