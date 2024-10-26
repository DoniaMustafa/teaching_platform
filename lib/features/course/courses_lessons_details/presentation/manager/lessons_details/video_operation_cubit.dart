import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/manager/lessons_details/lessons_details_cubit.dart';
import 'package:teaching/features/exam/presentation/manager/exam_cubit.dart';

import '../../../../../../core/list_states.dart';

class VideoOperationCubit extends Cubit<CubitStates> {
  VideoOperationCubit() : super(InitialState());

  String? url;
  int? videoId;
  int selectedIndex = 0;
  void onFetchUrl(String urlPath, int courseId, int lessonId, int videoCourseId,
      int index) {
    selectedIndex = index;

    url = urlPath;
    videoId = videoCourseId;
    print(
        'onFetchUrl >>>>>>>>>>>>>>>>>>>>> ${AppService().getBlocData<VideoOperationCubit>().url!.split('=').last} >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    // AppService()
    //     .getBlocData<LessonsDetailsCubit>()
    //     .getLessons(lessonId: lessonId);
    AppService().getBlocData<ExamCubit>().getExams(
        model: ExamParamsModel(courseId: courseId, courseLessonId: lessonId));

    emit(LoadedState<dynamic>(data: url));
  }
}
