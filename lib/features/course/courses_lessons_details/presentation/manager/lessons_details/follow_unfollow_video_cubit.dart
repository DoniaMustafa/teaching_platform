import 'package:bloc/bloc.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_lessons_details/domain/use_cases/favorite_unfavorite_video_use_case.dart';
import 'package:teaching/features/course/courses_lessons_details/domain/use_cases/rate_uescase.dart';

class FavoriteUnFavoriteVideoCubit extends Cubit<CubitStates> {
  FavoriteUnFavoriteVideoCubit(this.uesCase) : super(InitialState());
  FavoriteUnfavoriteVideoUseCase uesCase;
  bool isFavorite = false;

  addFavoriteUnFavoriteVideo({int? videoId, bool isCourse = true}) {
    managerExecute(
        uesCase.addFavoriteUnFavoriteVideo(
            videoId: videoId, isCourse: isCourse),
        // startingMessage: AppStrings().loading.trans,
        onSuccess: (data) {
      isFavorite = !isFavorite;

      emit(LoadedState(data: data));
    }, onStart: () {
      isFavorite = true;
      emit(LoadingState());
    }, onFail: (message) {
      isFavorite = false;
      emit(FailedState(message: message));
    });
  }
}