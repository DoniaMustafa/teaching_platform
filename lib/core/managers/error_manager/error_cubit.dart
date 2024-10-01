import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teaching/core/export/export.dart';

part 'error_state.dart';

enum Errors {
  PHONE_ERROR,
  NAME_ERROR,
  PASSWORD_ERROR,
  EMAIL_ERROR,IdentityL_ERROR,
  OTP_ERROR,
  CONFIRM_PASSWORD_ERROR,
  NONE,
}

Map<Errors, String> getError = {
  // Errors.IdentityL_ERROR: AppStrings().identityError,
  Errors.PHONE_ERROR: AppStrings().phoneError.trans,
  Errors.NAME_ERROR: AppStrings().nameError.trans,
  Errors.EMAIL_ERROR: AppStrings().emailError.trans,
  Errors.PASSWORD_ERROR: AppStrings().passwordError.trans,
  Errors.OTP_ERROR: AppStrings().otpCodeError.trans,
  Errors.CONFIRM_PASSWORD_ERROR: AppStrings().confirmPasswordError.trans
};

class ErrorCubit extends Cubit<ErrorState> {
  ErrorCubit() : super(ErrorInitial());
  List<Errors> errors = [];
  addValidatorError(Errors error) {
    if (errors.contains(error).isFalse) {
      print("added error $error");
      errors.add(error);
      emit(AddErrorState());
    }
  }

  removeError(Errors error) {
    if (errors.contains(error).isTrue) {
      print("error removed");
      errors.remove(error);

      emit(RemoveErrorState());
    }
  }

  get clearErrors {
    errors.clear();
    emit(ClearErrorsState());
  }
}
