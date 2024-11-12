import 'package:teaching/features/auth/data/models/post_params_education_model.dart';

import '../../../../core/export/export.dart';
import '../models/post_params_resume_model.dart';
import '../models/step_no_respons_model.dart';
import '../models/update_profile_params_model.dart';

abstract class UserRemoteDataSource {
  Future<ResponseModel> registerByPhoneNumber({required UserModel user});
  Future<ResponseModel> verifyOTP({required UserModel user});

  Future<ResponseModel> register({
    UserModel? user,
    int? stepsNo,
    PostParamsResumeModel? resumeModel,
    PostParamsEducationModel? education,
  });

  Future<ResponseModel> login({
    required String phone,
    required String password,
  });
  Future<ResponseModel> forgetPassword({
    required String phone,
  });
  Future<ResponseModel> verifyForgetPassword(
      {required String phone, required String verificationCode});
  Future<ResponseModel> resetPassword({required UserModel user});
  Future<ResponseModel> logout();
  Future<ResponseModel> editUserData({required UpdateProfileParamsModel user});

  Future<ResponseModel> getUsersData();

// Future<ResponseModel> deleteAccount();
  // Future<ResponseModel> addAccount({required UserModel user});
  //
  Future<ResponseModel> updatePassword(
      {required String oldPassword,
      required String newPassword,
      required String confirmPassword});
  // // Future<OtpResponseModel> resendOTP({required String phone});

  Future<ResponseModel> changeUserImage({required String image});
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  DioConsumer dioConsumer;
  UserRemoteDataSourceImpl({required this.dioConsumer});
  // @override
  // Future<ResponseModel> updateDriverImage({required String image}) async =>
  //     remoteExecute(
  //         request: dioConsumer.postRequest(
  //           path: EndPoints.updateProfileImage,
  //           body: {"file": image},
  //           isFormData: true,
  //         ),
  //         fromJsonFunction: ResponseModel.fromJson);
  @override
  Future<ResponseModel> registerByPhoneNumber(
          {required UserModel user}) async =>
      await remoteExecute(
          request: dioConsumer.postRequest(
            path: EndPoints.registerByPhone,
            body: {"PhoneNumber": user.phoneNumber, "UserType": user.userRoles},
          ),
          fromJsonFunction: (data) => VerificationResponseModel.fromJson(data));
  @override
  Future<ResponseModel> verifyOTP({required UserModel user}) => remoteExecute(
      request: dioConsumer.postRequest(
          path: EndPoints.verifyPhoneRegistration,
          body: {
            "PhoneNumber": "${user.phoneNumber}",
            "Code": "${user.verifyCode}"
          }),
      fromJsonFunction: StepNoResponseModel.fromJson);
  @override
  Future<ResponseModel> register({
    UserModel? user,
    PostParamsResumeModel? resumeModel,
    int? stepsNo,
    PostParamsEducationModel? education,
  }) async =>
      remoteExecute(
        request: dioConsumer.postRequest(
          path: EnumService.registrationEndPointType(
              SignUpByPhoneScreen.userType),
          queryParams: {"StepNo": '$stepsNo'},
          isFormData: stepsNo == 4 ? true : false,
          body: stepsNo == 2
              ? user!.toJson()
              : stepsNo == 4
                  ? resumeModel!.toJson()
                  : education!.toJson(),
        ),
        fromJsonFunction: LoginUserResponseModel.fromJson,
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
        fromJsonFunction: (data) => LoginUserResponseModel.fromJson(data),
      );
  //
  @override
  Future<ResponseModel> forgetPassword({
    required String phone,
  }) async =>
      remoteExecute(
        request: dioConsumer.postRequest(path: EndPoints.forgetPassword, body: {
          "PhoneNumber": phone,
        }),
        fromJsonFunction: VerificationResponseModel.fromJson,
      );
  @override
  Future<ResponseModel> verifyForgetPassword(
          {required String phone, required String verificationCode}) =>
      remoteExecute(
          request: dioConsumer
              .postRequest(path: EndPoints.verifyForgetPassword, body: {
            "PhoneNumber": phone,
            "Code": verificationCode,
          }),
          fromJsonFunction: StepNoResponseModel.fromJson);

  @override
  Future<ResponseModel> resetPassword({required UserModel user}) =>
      remoteExecute(
        request: dioConsumer.postRequest(
            path: EndPoints.resetPassword, body: user.toJson()),
        fromJsonFunction: ResponseModel.fromJson,
      );
//
  @override
  Future<ResponseModel> logout() async => remoteExecute(
        request: dioConsumer.postRequest(path: EndPoints.logout),
        fromJsonFunction: ResponseModel.fromJson,
      );
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

  @override
  Future<ResponseModel> editUserData(
      {required UpdateProfileParamsModel user}) async {
    return remoteExecute(
      request: dioConsumer.postRequest(
        path: AppPrefs.userRole == "1"
            ? EndPoints.editProfile
            : EndPoints.editParentProfile,
        body: user.toJson(),
      ),
      fromJsonFunction: ResponseModel.fromJson,
    );
  }

  @override
  Future<ResponseModel> getUsersData() async => remoteExecute(
      request: dioConsumer.getRequest(
          path: AppPrefs.userRole == "1"
              ? EndPoints.getStudentData
              : EndPoints.getParentData),
      fromJsonFunction: UserResponseModel.fromJson);

  @override
  Future<ResponseModel> changeUserImage({required String image}) async =>
      remoteExecute(
          request: dioConsumer.postRequest(
              path: EndPoints.updateProfileImage,
              isFormData: true,
              body: {"file": image}),
          fromJsonFunction: ResponseModel.fromJson);

  @override
  Future<ResponseModel> updatePassword(
          {required String oldPassword,
          required String newPassword,
          required String confirmPassword}) async =>
      remoteExecute(
          request:
              dioConsumer.postRequest(path: EndPoints.changePassword, body: {
            "OldPassword": oldPassword,
            "NewPassword": newPassword,
            "ConfirmPassword": confirmPassword
          }),
          fromJsonFunction: ResponseModel.fromJson);

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
