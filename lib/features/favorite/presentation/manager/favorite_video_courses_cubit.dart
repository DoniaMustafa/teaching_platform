import 'package:bloc/bloc.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/favorite/data/models/favorite_videos_response_model.dart';
import 'package:teaching/features/favorite/domain/use_cases/favorite_video_courses_use_case.dart';

class FavoriteVideoCoursesCubit extends Cubit<CubitStates> {
  FavoriteVideoCoursesCubit(this.useCase) : super(InitialState());
  FavoriteVideoCoursesUseCase useCase;
  List url = [];

  var fileName;
  getFavoriteVideoCourses() {
    managerExecute<List<FavoriteVideoData>>(
      useCase.getFavoriteVideoCourses(),
      onStart: () => emit(LoadingState()),
      onSuccess: (List<FavoriteVideoData>? data) {
        data!.forEach((element) async {

          // fileName = await VideoThumbnail.thumbnailFile(
          //   video: element.videoUrl!,
          //   thumbnailPath: (await getTemporaryDirectory()).path,
          //   imageFormat: ImageFormat.WEBP,
          //   maxHeight:
          //       64, // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
          //   quality: 75,
          // );
          url.addAll({element.videoUrl});
          print(url);
        });

        emit(LoadedState<List<FavoriteVideoData>>(data: data!));
      },
      onFail: (message) => emit(FailedState(message: message)),
    );
  }
}
