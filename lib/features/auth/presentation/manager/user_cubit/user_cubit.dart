import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/auth/data/models/step_no_respons_model.dart';
import 'package:teaching/features/auth/presentation/pages/verification_screen.dart';
import 'package:teaching/features/auth/presentation/widgets/vrification/build_pin_code.dart';
import '../../../../../local_notification.dart';
import '../../../domain/use_cases/user_usecases.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({required this.userUsecases}) : super(SignupInitial());
  UserUseCases userUsecases;
  UserModel? user;
  UserModel? userData;
  bool isTokenCached = false;
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
        },
      );

  Future<String> getToken() async =>
      (await managerExecute<String?>(userUsecases.getToken())).validate;
  Future<String> getUserRole() async =>
      (await managerExecute<String?>(userUsecases.getUserRole())).validate;
  getUsersData({bool isProfile = false}) async {
    await managerExecute<UserModel>(
      userUsecases.getUsersData(),
      onStart: () => emit(GetStudentDataLoadingState()),
      onFail: (message) {
        print(message);
        print(AppPrefs.token);
        emit(GetStudentDataErrorState(massage: message));
      },
      beforeSuccess: (data) {
        user = data;
      },
      onSuccess: (data) async {
        if (user.isNotNull) {
          if (isProfile.isTrue) {
            pop();
            getUser();
            getUserRole();
            getToken();
            print(AppPrefs.userRole);
            print(AppPrefs.user!.name);
            // pop()
          } else {
            Routes.bottomNavigationRoute.pushAndRemoveAllUntil;
            getUser();
            getUserRole();
            getToken();
          }
          emit(GetStudentDataSuccessState(user: data!));
        }
      },
    );
  }

  ///*********************** Login ***************************************\\\

  login({required String phone, required String password}) async {
    await executeWithDialog<UserDataModel?>(
      either: userUsecases.login(
        phone: phone,
        password: password,
      ),
      onStart: () {
        emit(SigninLoadingState());
      },
      startingMessage: AppStrings().login.trans,
      onError: (message) {
        print(message);
        emit(LoginErrorState(massage: message));
      },
      beforeSuccess: (data) async {
        userDataModel = data;
        getUserRole();
        getToken();
        if (AppPrefs.userRole == "2") {
          print(AppPrefs.userRole);
          Routes.bottomNavigationRoute.pushAndRemoveAllUntil;
          // getUser();
          // getUserRole();
          // getToken();
        } else {
          getUsersData();
        }

        // isTokenCached = await cacheToken(userDataModel!.accessToken!);
      },
      onSuccess: (data) async {
        emit(LoginSuccesState(user: data!.user!));
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
        onError: (message) {
          print(message);
          emit(LogoutErrorState(message: message));
        });
  }

  ///****************************************///
  updatePassword(
      {required String oldPassword,
      required String newPassword,
      required String confirmPassword}) async {
    executeWithDialog<ResponseModel>(
      onStart: () {
        emit(UpdatePasswordLoadingState());
      },
      either: userUsecases.updatePassword(
          oldPassword: oldPassword,
          newPassword: newPassword,
          confirmPassword: confirmPassword),
      startingMessage: AppStrings().loadingChangePassword.trans,
      onError: (message) {
        emit(UpdatePasswordErrorState(massage: message));
      },
      onSuccess: (data) {
        emit(UpdatePasswordLoadedState());
        pop();
      },
    );
  }

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

  editUserData({required UpdateProfileParamsModel user}) =>
      executeWithDialog<UserModel>(
          either: userUsecases.editUserData(user: user),
          onStart: () => emit(EditUserDataLoadingState()),
          onSuccess: (data) {
            getUsersData(isProfile: true);
            emit(EditUserDataSuccessState());
          },
          onError: (message) => emit(EditUserDataErrorState(massage: message)),
          startingMessage: AppStrings().loading.trans);

  changeUserImage({required String image}) => executeWithDialog<dynamic>(
      either: userUsecases.changeUserImage(image: image),
      onStart: () => emit(ChangeUserImageLoadingState()),
      onSuccess: (data) {
        getUsersData(isProfile: true);
        emit(ChangeUserImageSuccessState());
      },
      onError: (message) => emit(ChangeUserImageErrorState(massage: message)),
      startingMessage: AppStrings().loading.trans);
}
