import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_lessons_details/data/models/course_Lesson_details_response_model.dart';
import 'package:teaching/features/course/courses_lessons_details/data/models/vimeo_video_response_model.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/manager/lessons_details/vimeo_video_cubit.dart';

import '../../../domain/use_cases/lessons_details_use_case.dart';

part 'lessons_details_state.dart';

class LessonsDetailsCubit extends Cubit<LessonsDetailsState> {
  LessonsDetailsCubit(this.useCase) : super(LessonsDetailsInitial());

  LessonsDetailsUseCase useCase;
  CourseLessonDataMode? lessonData;
  List<String> videoImage = [];
  List<FirstLessonVideoCommentModel> comments = [];
  getLessons({required int lessonId}) {
    managerExecute<CourseLessonDataMode>(
        useCase.getLessonsDetails(lessonId: lessonId),
        onStart: () {
          comments = [];
          emit(LessonsDetailsLoadingState());
        },
        onFail: (message) => emit(LessonsDetailsErrorState(message: message)),
        beforeSuccess: (data) {
          lessonData = data;
          AppService().getBlocData<VideoOperationCubit>().videoId =
              lessonData!.courseVideos![0].courseVideoId;
          AppService().getBlocData<VideoOperationCubit>().videoTitle =
              AppService().getBlocData<LanguageCubit>().isEn.isFalse
                  ? lessonData!.courseVideos![0].title ?? ''
                  : lessonData!.courseVideos![0].titleEn ?? '';
          AppService().getBlocData<VideoOperationCubit>().url =
              lessonData!.courseVideos![0].videoUrl;
          lessonData!.firstLessonVideoComments!.forEach((elemnt) {
            comments.add(elemnt);
          });
        },
        onSuccess: (data) {
          if (AppService()
              .getBlocData<VideoOperationCubit>()
              .url!
              .contains('vimeo')
              .isTrue) {
            RegExp regex = RegExp(r'/(\d+)');
            Match match = regex.firstMatch(
                AppService().getBlocData<VideoOperationCubit>().url!) as Match;

            String videoId = match.group(1)!;
            AppService().getBlocData<VimeoVideoCubit>().getVimeoVideo(
                vimeoId: videoId.toInt, whichScreen: AppStrings().course);
            print('videoId  >>>>>>>>>> ${videoId}');
          }

          print(
              'Lessons Details url>>>>>>>>>> ${AppService().getBlocData<VideoOperationCubit>().url}');

          emit(LessonsDetailsLoadedState(data: data!));
        });
  }
}
