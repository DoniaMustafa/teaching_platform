import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_details/domain/use_cases/subscribe_courses_use_case.dart';

import 'courses_details/courses_details_cubit.dart';

// part 'subscribe_course_state.dart';

class SubscribeCourseCubit extends Cubit<CubitStates> {
  SubscribeCourseCubit(this.useCase) : super(InitialState());
  SubscribeCoursesUseCase useCase;
  bool? isSubscribe = false;

  addSubscribeCourseOrLesson({
    TeacherCourse? teacherCourse,
  }) {
    executeWithDialog(
        either: useCase.addSubscribeCourse(teacherCourse: teacherCourse),
        startingMessage: AppStrings().loading.trans,
        onSuccess: (data) {
          // AppService()
          //     .getBlocData<CoursesDetailsCubit>()
          //     .getCoursesDetails(TeacherModel(
          //       teacherId: teacherId,
          //     ));
          isSubscribe = true;
          emit(LoadedState(data: data));
          pop();
        },
        onStart: () {
          emit(LoadingState());
        },
        onError: (message) {
          isSubscribe = false;
          emit(FailedState(message: message));
        });
  }
}
