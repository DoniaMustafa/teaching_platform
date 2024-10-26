import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/auth/data/models/post_params_resume_model.dart';
import 'package:teaching/features/auth/data/models/step_no_respons_model.dart';
import 'package:teaching/features/auth/presentation/manager/education/program/prgram_cubit.dart';
import 'package:teaching/features/auth/presentation/manager/education/stage/stage_cubit.dart';
import 'package:teaching/features/auth/presentation/manager/education/subject/subject_cubit.dart';
import 'package:teaching/features/auth/presentation/pages/verification_screen.dart';
import 'package:teaching/features/auth/presentation/widgets/vrification/build_pin_code.dart';
import '../../../../../local_notification.dart';
import '../../../domain/use_cases/user_usecases.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({required this.userUsecases}) : super(SignupInitial());
  UserUseCases userUsecases;
  UserModel? user;
  UserDataModel? userDataModel;
  String currentScreen = '';

  ///*********************** cached data ***************************************\\\

  Future<bool> cacheToken(String token) async => (await managerExecute<bool?>(
          userUsecases.cacheToken(userDataModel!.accessToken!)))
      .orFalse;
  Future<UserModel?> getUser() async => managerExecute<UserModel?>(
        userUsecases.getUser(),
        onSuccess: (data) {
          user = data;
          print('user >>>>>>>>>$user');
        },
      );
  //
  Future<String> getToken() async =>
      (await managerExecute<String?>(userUsecases.getToken())).validate;

  ///*********************** Login ***************************************\\\

  login({required String phone, required String password}) async {
    bool isTokenCached = false;
    await executeWithDialog<UserDataModel?>(
      either: userUsecases.login(
        phone: phone,
        password: password,
      ),
      onStart: () => emit(SigninLoadingState()),
      startingMessage: AppStrings().login.trans,
      onError: (message) {
        print(message);
        emit(LoginErrorState(massage: message));
      },
      beforeSuccess: (data) async {
        userDataModel = data;
        if (userDataModel.isNotNull) {
          user = userDataModel!.user;
          isTokenCached = await cacheToken(userDataModel!.accessToken!);
        }
      },
      onSuccess: (data) async {
        if (isTokenCached.isTrue && userDataModel.isNotNull) {
          Routes.bottomNavigationRoute.pushAndRemoveAllUntil;
          getUser();
          getToken();
          //   AppService().getBlocData<BottomNavOperationCubit>().changeIndex(0);
        }
      },
    );
  }

  ///**************************register by phone*********************************\\\
  registerByPhone({
    required UserModel user,
  }) async {
    executeWithDialog<VerificationDataModel>(
      onStart: () => emit(SignUpByPhoneLoadingState()),
      either: userUsecases.registerByPhoneNumber(user: user),
      startingMessage: AppStrings().signUp.trans,
      onError: (message) {
        emit(SignUpByPhoneErrorState(massage: message));
      },
      onSuccess: (VerificationDataModel? code) async {
        if (code.isNotNull) {
          if (NotificationsService().isInitialized.isTrue) {
            await NotificationsService().showSimpleNotification(
              title: AppStrings().otpCode.trans,
              description: code!.verificationCode!,
            );
            Routes.verificationRoute.moveToWithArgs({
              VerificationScreen.phoneKey: user.phoneNumber,
              VerificationScreen.whichScreenKey: AppStrings().registerByPhone
            });
          } else {
            Routes.verificationRoute.moveToWithArgs({
              VerificationScreen.phoneKey: user.phoneNumber,
              VerificationScreen.whichScreenKey: AppStrings().registerByPhone
            });
          }

          Routes.verificationRoute.pushReplacementWithData({
            VerificationScreen.phoneKey: user.phoneNumber,
            VerificationScreen.whichScreenKey: AppStrings().registerByPhone
          });
          print(NotificationsService().isInitialized);
          emit(SignUpByPhoneSuccessState(otp: code!.verificationCode!));
        }
      },
    );
  }

  ///***********************************************************\\\
  verifyOTP({required UserModel user}) async {
    executeWithDialog<StepNoDataModel?>(
      onStart: () {
        emit(verifyOTPStartingState());
      },
      either: userUsecases.verifyOTP(user: user),
      startingMessage: AppStrings().verifying.trans,
      onError: (message) {
        print('message?????????????????????${message.toString()}');

        emit(VerifyOTPErrorState(massage: message));
      },
      onSuccess: (StepNoDataModel? data) {
        emit(VerifyOtpSuccessState(step: data!.stepNo!));
        Routes.signUpRoute.pushReplacementWithData(
            {SignUpScreen.phoneKey: VerificationScreen.phone});
        BuildPinCode.pinController.clear();
      },
    );
  }

  ///***********************************************************\\\

  register({
    UserModel? user,
    int? stepsNo,
    PostParamsResumeModel? resumeModel,
    PostParamsEducationModel? education,
  }) async {
    executeWithDialog<UserDataModel?>(
      onStart: () {
        emit(SignupLoadingState());
      },
      either: userUsecases.register(
          resumeModel: resumeModel,
          user: user,
          stepsNo: stepsNo,
          education: education),
      startingMessage: AppStrings().signUp.trans,
      onError: (message) {
        print('message>>>>>>>>>>$message');
        // print(user!.stepsNo);
        emit(SignupErrorState(massage: message));
      },
      onSuccess: (UserDataModel? data) {
        if (stepsNo == 2) {
          if (SignUpByPhoneScreen.userType == AppStrings().parent) {
            return Routes.loginRoute.pushAndRemoveAllUntil;
          } else {
            Routes.educationTypeRoute.pushAndRemoveAllUntil;
          }
          AppService()
              .getBlocData<ProgramCubit>()
              .educationProgramsData
              .clear();
          AppService().getBlocData<StageCubit>().stageData.clear();
          AppService().getBlocData<SubjectCubit>().subjectData.clear();
        } else if (stepsNo == 3) {
          if (SignUpByPhoneScreen.userType == AppStrings().student) {
            return Routes.loginRoute.pushAndRemoveAllUntil;
          }
          Routes.uploadResumeRoute.pushAndRemoveAllUntil;
        } else {
          return Routes.loginRoute.pushAndRemoveAllUntil;
        }

        emit(SignUpSuccessState(step: data!.stepNo.toString()));
      },
    );
  }

  logout() async {
    executeWithDialog<ResponseModel>(
      either: userUsecases.logout(),
      startingMessage: AppStrings().logout.trans,
      onSuccess: (data) {
        Routes.loginRoute.pushAndRemoveAllUntil;
        user = null;
      },
      onError: (message){
        print(message);
        emit(LogoutErrorState(message: message));
      }
    );
  }

  // Future<bool> cacheFcm(String fcmToken) async => (await managerExecute<bool?>(userUsecases.cacheFcmToken(fcmToken))).orFalse;

  ///****************************************///
  // updatePassword({required String oldPassword, required String newPassword}) async {
  //   executeWithDialog<ResponseModel>(
  //     onStart: () {
  //       emit(UpdatePasswordLoadingState());
  //     },
  //     either: userUsecases.updatePassword(oldPassword: oldPassword, newPassword: newPassword),
  //     startingMessage: " AppStrings().update.trans",
  //     onError: (message) {
  //       emit(UpdatePasswordErrorState(massage: message));
  //     },
  //     onSuccess: (data) {
  //       emit(UpdatePasswordLoadedState());
  //       AppService().pop();
  //     },
  //   );
  // }
  // addAccount({required UserModel user}) {
  //   executeWithDialog(
  //       either: userUsecases.addAccount(user: user),
  //       startingMessage: 'جاري اضافة الحساب',
  //       onSuccess: (data) {
  //         emit(AddAccountLoadedState(massage: ''));
  //       },
  //       onStart: () {
  //         emit(AddAccountLoadingState());
  //       },
  //       onError: (massage) {
  //         emit(AddAccountErrorState(massage: massage));
  //       });
  // }
  //
  // ///******************************************///
  //
  // int? otpCode;
  //
  // ///****************************************///
  //
  // ///****************************************///
  //
  // ///******************************************************///
  //
  // Future<String> getDeviceToken() async => (await managerExecute<String?>(userUsecases.getFcmToken())).validate;
  //
  // // String? image;
  // // updateUser({required UserModel user}) async {
  // //   await executeWithDialog<UserResponseModel>(
  // //     onStart: () {
  // //       emit(ChangingUserInformationSuccessState());
  // //     },
  // //     either: userUsecases.changeUserInfo(user: user),
  // //     startingMessage: "AppStrings().updateUserName.trans",
  // //     onError: (message) {
  // //       emit(ChangingUserInformationErrorState(massage: message));
  // //     },
  // //     onSuccess: (data) {
  // //       this.user = data[0];
  // //       emit(ChangingUserInformationSuccessState());
  // //       AppService().pop();
  // //     },
  // //   );
  // // }
  //
  // // void changeUserImage() async {
  // //   image = await showPickDialog(user!.image);
  // //   if (image!.isNotEqualTo(user!.image)) {
  // //     await executeWithDialog<UserResponseModel>(
  // //       onStart: () {
  // //         emit(ChangingUserInformationSuccessState());
  // //       },
  // //       either: userUsecases.changeUserInfo(user: user!.copyWith(image: image)),
  // //       startingMessage: "AppStrings().changeImage.trans",
  // //       onError: (message) {
  // //         emit(ChangingUserInformationErrorState(massage: message));
  // //       },
  // //       onSuccess: (data) {
  // //         this.user = data[0];
  // //         emit(ChangingUserInformationSuccessState());
  // //       },
  // //     );
  // //   }
  // // }
  //
  // register({
  //   required UserModel user,
  // }) async {
  //   currentScreen = Routes.signUpRoute;
  //   executeWithDialog<String>(
  //     either: userUsecases.signUp(user: user),
  //     startingMessage: AppStrings().signUp.trans,
  //     onError: (message) {
  //       emit(SignupErrorState(massage: message));
  //     },
  //     onSuccess: (code) async {
  //       if (code.isNotNull) {
  //         await NotificationsService().showSimpleNotification(
  //           title: AppStrings().otpCode.trans,
  //           description: code.toString(),
  //         );
  //         Routes.verificationRoute.pushReplacementWithData({
  //           "route": Routes.signUpRoute,
  //           "phone": user.phone,
  //         });
  //         emit(SignUpSuccessState(otp: code));
  //       }
  //     },
  //   );
  // }
  //

  //
  verifyForgetPassword(
      {required String phone, required String verificationCode}) async {
    executeWithDialog<StepNoDataModel?>(
      either: userUsecases.verifyForgetPassword(
          verificationCode: verificationCode, phone: phone),
      startingMessage: AppStrings().verifying.trans,
      onError: (message) {
        emit(VerifyOTPErrorState(massage: message));
      },
      onSuccess: (data) {
        Routes.resetPasswordRoute.pushReplacementWithData({
          "phone": phone,
        });
        BuildPinCode.pinController.clear();
      },
    );
  }

  forgetPassword({required String phone}) async {
    // currentScreen = Routes.forgetPassRoute;
    executeWithDialog<VerificationDataModel?>(
      onStart: () {
        emit(ForgetPasswordStartingState());
      },
      either: userUsecases.forgetPassword(
        phone: phone,
      ),
      startingMessage: AppStrings().loading,
      onError: (message) {
        emit(ForgetPasswordErrorState(massage: message));
      },
      onSuccess: (VerificationDataModel? data) {
        NotificationsService().showSimpleNotification(
            title: AppStrings().otpCode.trans,
            description: data!.verificationCode.toString());
        Routes.verificationRoute.pushReplacementWithData({
          VerificationScreen.phoneKey: phone,
          VerificationScreen.whichScreenKey: AppStrings().forgetPassword
        });

        emit(ForgetPasswordSuccessState());
      },
    );
  }

  //
  //
  //
  resetPassword({required UserModel user}) async {
    executeWithDialog<UserDataModel>(
      onStart: () {
        emit(ResetPasswordLoadingState());
      },
      either: userUsecases.resetPassword(user: user),
      startingMessage: AppStrings().done,
      beforeSuccess: (data) async {
        userDataModel = data;
        if (userDataModel.isNotNull) {
          user = userDataModel!.user!;
        }
      },
      onError: (message) {
        emit(ResetPasswordErrorState(massage: message));
      },
      onSuccess: (data) {
        Routes.loginRoute.pushAndRemoveAllUntil;
        emit(ResetPasswordLoadedState(userModel: user));
      },
    );
  }

  // editUserData({required UserModel user}) => executeWithDialog<UserModel>(
  //     either: userUsecases.editUserData(user: user),
  //     onStart: () => emit(EditUserDataLoadingState()),
  //     onSuccess: (data) {
  //       print('success');
  //       print('image >>>>>>>>>>>>> ${data!.image!}');
  //
  //       getUser();
  //       getToken();
  //       getDeviceToken();
  //       pop();
  //       print(getToken());
  //       print('image >>>>>>>>>>>>> ${user.image}');
  //
  //       emit(EditUserDataSuccessState());
  //     },
  //     onError: (message) => emit(EditUserDataErrorState(massage: message)),
  //     startingMessage: 'جاري تغيير البيانات');
}
