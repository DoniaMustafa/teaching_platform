import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_details/domain/use_cases/subscribe_courses_use_case.dart';

import 'courses_details/courses_details_cubit.dart';

// part 'subscribe_course_state.dart';

class SubscribeCourseCubit extends Cubit<CubitStates> {
  SubscribeCourseCubit(this.useCase) : super(InitialState());
  SubscribeCoursesUseCase useCase;

  addSubscribeCourseOrLesson(
      {TeacherCourse? teacherCourse, required int? teacherId}) {
    executeWithDialog(
        either: useCase.addSubscribeCourse(teacherCourse: teacherCourse),
        startingMessage: AppStrings().loading.trans,
        onSuccess: (data) {
          AppService()
              .getBlocData<CoursesDetailsCubit>()
              .getCoursesDetails(TeacherModel(
                teacherId: teacherId,
              ));

          emit(LoadedState(data: data));
          pop();
        },
        onStart: () {
          emit(LoadingState());
        },
        onError: (message) => emit(FailedState(message: message)));
  }
}
