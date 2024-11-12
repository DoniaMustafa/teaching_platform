import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_details/data/models/course_details_response_model.dart';
import 'package:teaching/features/course/courses_details/domain/use_cases/courses_details_use_case.dart';
import 'package:teaching/features/subscriptions/subscription_details/domain/use_cases/subscription_details_use_Case.dart';

part 'courses_details_state.dart';

class CoursesDetailsCubit extends Cubit<CubitStates> {
  CoursesDetailsCubit(this.useCase) : super(InitialState());
  CoursesDetailsUseCase useCase;
  getCoursesDetails(TeacherModel model) {
    managerExecute<List<TeacherModel>>(useCase.getCourseDetails(model: model),
        onStart: () => emit(LoadingState()),
        onFail: (message) => emit(FailedState(message: message)),
        onSuccess: (List<TeacherModel>? data) {
          AppService().getBlocData<CoursesGroupOperationCubit>().subjectName =
              data![0].subjectName;
          emit(LoadedState<List<TeacherModel>>(data: data));
        });
  }


  // getSubscribeCourseDetails({TeacherModel? model}) {
  //   managerExecute<List<TeacherCourse>>(
  //       subscriptionUseCase.getSubscribeCourseDetails(model: model!),
  //       onSuccess: (data) {
  //         data!.forEach((element) {
  //           element.courseLessons!.forEach((lessons) {
  //             lessons.free = true;
  //             lessons.isSubscribed = true;
  //           });
  //         });
  //         emit(LoadedState<List<TeacherCourse>>(data: data));
  //       },
  //       onFail: (message) => emit(FailedState(message: message)),
  //       onStart: () => emit(LoadingState()));
  // }
}
