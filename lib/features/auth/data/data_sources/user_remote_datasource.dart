import 'package:teaching/features/auth/data/models/post_params_education_model.dart';

import '../../../../core/export/export.dart';
import '../models/step_no_respons_model.dart';

abstract class UserRemoteDataSource {
  Future<ResponseModel> registerByPhoneNumber({required UserModel user});
  Future<ResponseModel> verifyOTP({required UserModel user});

  Future<ResponseModel> register({UserModel? user});
  Future<ResponseModel> sendEducationData({PostParamsEducationModel? user});

  Future<ResponseModel> login({
    required String phone,
    required String password,
  });
  // Future<ResponseModel> editUserData({required UserModel user});
  // Future<ResponseModel> forgetPassword({
  //   required String phone,
  // });
  // Future<ResponseModel> resetPassword(String phone, String newPassword);
  // Future<ResponseModel> deleteAccount();
  // Future<ResponseModel> addAccount({required UserModel user});
  //
  // // Future<ResponseModel> updatePassword({required String oldPassword, required String newPassword});
  // // Future<OtpResponseModel> resendOTP({required String phone});
  // Future<ResponseModel> verifyOTP({required String phone, required String verificationCode, required String fcmToken});
  // Future<ResponseModel> verifyForgetPassword({required String phone, required String verificationCode});
  // Future<ResponseModel> logout();
  // // Future<UserResponseModel> changeUserInfo({required UserModel user});
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  DioConsumer dioConsumer;
  UserRemoteDataSourceImpl({required this.dioConsumer});

  @override
  Future<ResponseModel> registerByPhoneNumber(
          {required UserModel user}) async =>
      await remoteExecute(
          request: dioConsumer.postRequest(
            path: EndPoints.registerByPhone,
            body: user.toJson(),
          ),
          fromJsonFunction: (data) => VerificationResponseModel.fromJson(data));
  @override
  Future<ResponseModel> verifyOTP({required UserModel user}) => remoteExecute(
      request: dioConsumer.postRequest(path: EndPoints.verify, body: {
        "PhoneNumber": "${user.phoneNumber}",
        "Code": "${user.verifyCode}"
      }),
      fromJsonFunction: StepNoResponseModel.fromJson);
  @override
  Future<ResponseModel> register({UserModel? user}) async => remoteExecute(
        request: dioConsumer.postRequest(
          path: EndPoints.registerStudent,
          queryParams: user!.toJson(),
          body: user.toJson(),
        ),
        fromJsonFunction: ResponseModel.fromJson,
      );

  @override
  Future<ResponseModel> sendEducationData(
          {PostParamsEducationModel? user}) async =>
      remoteExecute(
        request: dioConsumer.postRequest(
          path: EndPoints.registerStudent,
          body: user!.toJson(),
          queryParams: {"StepNo": user.stepsNo},
        ),
        fromJsonFunction: ResponseModel.fromJson,
      );

  @override
  Future<ResponseModel> login(
          {required String phone, required String password}) async =>
      await remoteExecute(
          request: dioConsumer.postRequest(
            path: EndPoints.login,
            body: {
              "UserName": phone,
              "Password": password,
              "grant_type": "password",
            },
          ),
          fromJsonFunction: (data) => LoginUserResponseModel.fromJson(data));
  //
  // @override
  // Future<ResponseModel> forgetPassword({
  //   required String phone,
  // }) async =>
  //     remoteExecute(
  //       request: dioConsumer.postRequest(path: EndPoints.forgetPassword, body: {
  //         "phone": phone,
  //       }),
  //       fromJsonFunction: (data) => OtpResponseModel.fromJson(data),
  //     );
  //
  // @override
  // Future<ResponseModel> logout() async => remoteExecute(
  //       request: dioConsumer.postRequest(path: EndPoints.userLogout),
  //       fromJsonFunction: (data) => ResponseModel.fromJson(data),
  //     );
  //
  // @override
  // Future<ResponseModel> resetPassword(String phone, String newPassword) => remoteExecute(
  //       request: dioConsumer.postRequest(path: EndPoints.resetPassword, body: {"phone": phone, "password": newPassword}),
  //       fromJsonFunction: LoginUserResponseModel.fromJson,
  //     );
  //
  // @override
  // Future<ResponseModel> verifyAfterForget({required String phone, required String verificationCode}) async => remoteExecute(
  //     request: dioConsumer.postRequest(path: EndPoints.confirmationCode, body: {
  //       "phone": phone,
  //       "verification_code": verificationCode,
  //     }),
  //     fromJsonFunction: ResponseModel.fromJson);
  //

  //
  // @override
  // Future<ResponseModel> verifyForgetPassword({required String phone, required String verificationCode}) => remoteExecute(
  //     request: dioConsumer.postRequest(path: EndPoints.verifyForgetPassword, body: {
  //       "phone": phone,
  //       "otp": verificationCode,
  //     }),
  //     fromJsonFunction: ResponseModel.fromJson);
  // @override
  // Future<ResponseModel> editUserData({required UserModel user}) async {
  //   return remoteExecute(
  //     request: dioConsumer.postRequest(
  //       path: EndPoints.editProfile,
  //       isFormData: true,
  //       body:user.toJson() ,
  //
  //     ),
  //     fromJsonFunction:UserResponseModel.fromJson, );
  // }
  //
  // @override
  // Future<ResponseModel> deleteAccount() async => remoteExecute(
  //     request: dioConsumer.postRequest(path: EndPoints.deleteAccount),
  //     fromJsonFunction: ResponseModel.fromJson);
  //
  // @override
  // Future<ResponseModel> addAccount({required UserModel user}) async =>
  //     remoteExecute(
  //         request: dioConsumer.postRequest(
  //             path: EndPoints.addAccount, body: user.toJson()),
  //         fromJsonFunction: ResponseModel.fromJson);
}
