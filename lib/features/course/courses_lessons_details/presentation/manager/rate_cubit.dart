import 'package:bloc/bloc.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_lessons_details/domain/use_cases/rate_uescase.dart';

class RateCubit extends Cubit<CubitStates> {
  RateCubit(this.uesCase) : super(InitialState());
  RateUseCase uesCase;
  bool isRate = false;
  addVideoRate({int? videoId, int? rate, bool isCourse = true}) {
    executeWithDialog(
        either:
            uesCase.addRate(rate: rate, videoId: videoId, isCourse: isCourse),
        startingMessage: AppStrings().loading.trans,
        onSuccess: (data) {
          if (rate! < 1) {
            isRate = false;
          } else {
            isRate = true;
          }
          // isRate = !isRate;
          emit(LoadedState(data: data));
        },
        onStart: () {
          isRate = true;
          emit(LoadingState());
        },
        onError: (message) {
          isRate = false;
          emit(FailedState(message: message));
        });
  }
}
