import 'package:teaching/core/export/export.dart';
import '../../../domain/use_cases/user_usecases.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({required this.userUsecases}) : super(SignupInitial());
  UserUsecases userUsecases;
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
          Routes.bottomNavigationRoute.pushAndRemoveAllUntil();
          //   AppService().getBlocData<BottomNavOperationCubit>().changeIndex(0);
        }
      },
    );
  }

  ///***********************************************************\\\

// logout() async {
  //   executeWithDialog<ResponseModel>(
  //     either: userUsecases.logout(),
  //     startingMessage: AppStrings().logout,
  //     onSuccess: (data) {
  //       Routes.loginRoute.pushAndRemoveAllUntil();
  //       user = null;
  //     },
  //   );
  // }

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
  // verifyOTP({required String phone, required String verificationCode}) async {
  //   String fcmToken = (await FirebaseService().getDeviceToken())!;
  //   bool isTokenCached = false;
  //   bool isFcmTokenCached = false;
  //   executeWithDialog<UserDataModel?>(
  //     onStart: () {
  //       emit(verifyOTPStartingState());
  //     },
  //     either: userUsecases.verifyOTP(verificationCode: verificationCode, phone: phone, fcmToken: fcmToken),
  //     startingMessage: AppStrings().verifying.trans,
  //     onError: (message) {
  //       emit(VerifyOTPErrorState(massage: message));
  //     },
  //     beforeSuccess: (data) async {
  //       userDataModel = data;
  //       if (userDataModel.isNotNull) {
  //         user = userDataModel!.user;
  //         isTokenCached = await cacheToken(userDataModel!.token!);
  //         isFcmTokenCached = await cacheFcm(fcmToken);
  //       }
  //     },
  //     onSuccess: (data) {
  //       if (data.isNotNull) {
  //         user = data!.user;
  //
  //         if (isTokenCached.isTrue && isFcmTokenCached.isTrue && userDataModel.isNotNull) {
  //           // AppService().getBlocData<BottomNavOperationCubit>().changeIndex(0);
  //           Routes.bottomNavigationRoute.moveToAndRemoveCurrent();
  //         }
  //
  //         emit(VerifyOtpSuccessState(user: data.user!));
  //       }
  //     },
  //   );
  // }
  //
  // verifyForgetPassword({required String phone, required String verificationCode}) async {
  //   executeWithDialog<UserDataModel?>(
  //     either: userUsecases.verifyForgetPassword(verificationCode: verificationCode, phone: phone),
  //     startingMessage: AppStrings().verifying.trans,
  //     onError: (message) {
  //       emit(VerifyOTPErrorState(massage: message));
  //     },
  //     onSuccess: (data) {
  //       Routes.resetPasswordRoute.pushReplacementWithData({
  //         "phone": phone,
  //       });
  //     },
  //   );
  // }
  //
  // forgetPassword({required String phone}) async {
  //   currentScreen = Routes.forgetPassRoute;
  //   executeWithDialog<String?>(
  //     onStart: () {
  //       emit(ForgetPasswordStartingState());
  //     },
  //     either: userUsecases.forgetPassword(
  //       phone: phone,
  //     ),
  //     startingMessage: AppStrings().loading,
  //     onError: (message) {
  //       emit(ForgetPasswordErrorState(massage: message));
  //     },
  //     onSuccess: (data) {
  //       // NotificationsService().showSimpleNotification(title: AppStrings().otpCode, description: data.toString());
  //       Routes.verificationRoute.pushReplacementWithData({
  //         "route": Routes.forgetPassRoute,
  //         "phone": phone,
  //       });
  //       emit(ForgetPasswordSuccessState());
  //     },
  //   );
  // }
  //
  //
  //
  // resetPassword({required String phone, required String newPassword}) async {
  //   String fcmToken = (await FirebaseService().getDeviceToken())!;
  //   bool isTokenCached = false;
  //   bool isFcmTokenCached = false;
  //   executeWithDialog<UserDataModel>(
  //     onStart: () {
  //       emit(ResetPasswordLoadingState());
  //     },
  //     either: userUsecases.resetPassword(phone, newPassword),
  //     startingMessage: AppStrings().done,
  //     beforeSuccess: (data) async {
  //       userDataModel = data;
  //       if (userDataModel.isNotNull) {
  //         user = userDataModel!.user;
  //         isTokenCached = await cacheToken(userDataModel!.token!);
  //         isFcmTokenCached = await cacheFcm(fcmToken);
  //       }
  //     },
  //     onError: (message) {
  //       emit(ResetPasswordErrorState(massage: message));
  //     },
  //     onSuccess: (data) {
  //       if (isTokenCached.isTrue && isFcmTokenCached.isTrue && userDataModel.isNotNull) {
  //         Routes.bottomNavigationRoute.pushAndRemoveAllUntil();
  //         //  emit(ResetPasswordLoadedState(userModel: user));
  //         //   AppService().getBlocData<BottomNavOperationCubit>().changeIndex(0);
  //       }
  //     },
  //   );
  // }
  //
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
