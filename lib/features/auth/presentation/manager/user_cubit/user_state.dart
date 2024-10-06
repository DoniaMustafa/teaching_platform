part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class SignupInitial extends UserState {}

class SignUpByPhoneLoadingState extends UserState {}

class SignUpByPhoneSuccessState extends UserState {
  final String? otp;
  SignUpByPhoneSuccessState({required this.otp});
}

class SignUpByPhoneErrorState extends UserState {
  final String massage;

  SignUpByPhoneErrorState({required this.massage});
}
///*************************************///

class SignupLoadingState extends UserState {}

class SignUpSuccessState extends UserState {
  final String? step;
  SignUpSuccessState({required this.step});
}

class SignupErrorState extends UserState {
  final String massage;

  SignupErrorState({required this.massage});
}

///*************************************///
// class AddAccountLoadingState extends UserState {
//
// }class AddAccountLoadedState extends UserState {
//   final String massage;
//
//   AddAccountLoadedState({required this.massage});
// }
// class AddAccountErrorState extends UserState {
//   final String massage;
//
//   AddAccountErrorState({required this.massage});
// }
///*************************************///
class SigninLoadingState extends UserState {}

class LoginSuccesState extends UserState {
  final UserModel user;
  LoginSuccesState({required this.user});
}

class LoginErrorState extends UserState {
  final String massage;

  LoginErrorState({required this.massage});
}

// ///*************************************///
// class UpdateUserLoadingState extends UserState {}
//
// class UpdateUserLoadedState extends UserState {
//   final LoginUserResponseModel response;
//   UpdateUserLoadedState({required this.response});
// }
//
// class UpdateUserErrorState extends UserState {
//   final String massage;
//
//   UpdateUserErrorState({required this.massage});
// }
//
// ///*************UpdatePassword*******************///
//
// class UpdatePasswordLoadingState extends UserState {}
//
// class UpdatePasswordLoadedState extends UserState {
//   // final String massage;
//   //  UpdatePasswordLoadedState({required this.massage});
// }
//
// class UpdatePasswordErrorState extends UserState {
//   String massage;
//
//   UpdatePasswordErrorState({required this.massage});
// }
//
// ///*************************///
// class ResetPasswordLoadingState extends UserState {}
//
// class ResetPasswordLoadedState extends UserState {
//   // ResponseModel response;
//   UserModel userModel;
//   ResetPasswordLoadedState({required this.userModel});
// }
//
// class ResetPasswordErrorState extends UserState {
//   String massage;
//
//   ResetPasswordErrorState({required this.massage});
// }
//
// ///*****************************************///
// class OtpLoadingState extends UserState {}
//
// class OtpLoadedState extends UserState {
//   final OtpResponseModel response;
//   OtpLoadedState({required this.response});
// }
//
// class OtpErrorState extends UserState {
//   final String massage;
//
//   OtpErrorState({required this.massage});
// }

class verifyOTPStartingState extends UserState {}

class VerifyOtpSuccessState extends UserState {
  final int step;

  VerifyOtpSuccessState({required this.step});
}

class VerifyOTPErrorState extends UserState {
  final String massage;

  VerifyOTPErrorState({required this.massage});
}
//
// class ForgetPasswordStartingState extends UserState {}
//
// class ForgetPasswordSuccessState extends UserState {
//   // final OtpResponseModel response;
//
//   ForgetPasswordSuccessState();
// }
//
// class ForgetPasswordErrorState extends UserState {
//   final String massage;
//
//   ForgetPasswordErrorState({required this.massage});
// }
//
// class LogoutLoadingState extends UserState {}
//
// class LogoutLoadedState extends UserState {}
//
// class LogoutErrorState extends UserState {
//   String message;
//
//   LogoutErrorState({required this.message});
// }
//
// /******************** getting user states **************************/
// class GettingUserState extends UserState {
//   GettingUserState();
// }
//
// class UserLoadedState extends UserState {
//   final UserModel user;
//   UserLoadedState({required this.user});
// }
//
// class UserNotAuthenticated extends UserState {
//   UserNotAuthenticated();
// }
//
// /******************** change User Image **************************/
// class ChangingUserInformationSuccessState extends UserState {}
//
// class ChangingUserInformationErrorState extends UserState {
//   final String massage;
//
//   ChangingUserInformationErrorState({required this.massage});
// }
//
// //////////////////////////////////////////////////////
// class ConfirmCodeLoadingState extends UserState {}
//
// class ConfirmCodeSuccessState extends UserState {}
//
// class ConfirmCodeErrorState extends UserState {
//   final String massage;
//
//   ConfirmCodeErrorState({required this.massage});
// }
// class EditUserDataLoadingState extends UserState {}
//
// class EditUserDataSuccessState extends UserState {}
//
// class EditUserDataErrorState extends UserState {
//   final String massage;
//
//   EditUserDataErrorState({required this.massage});
// }
