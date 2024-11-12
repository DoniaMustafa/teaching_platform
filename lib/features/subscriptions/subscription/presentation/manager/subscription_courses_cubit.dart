import 'package:bloc/bloc.dart';
import 'package:teaching/core/export/export.dart';

class SubscriptionCoursesCubit extends Cubit<CubitStates> {
  SubscriptionCoursesCubit(this.useCase) : super(InitialState());
  SubscriptionUseCase useCase;

  List<CoursesModel> coursesModel = [];
  List<CoursesModel> searchCoursesResult = [];
  getSubscriptionCourses({TeacherModel? model}) {
    managerExecute<List<CoursesModel>>(
      useCase.getStudentSubscriptionsCourses(model: model),
      onStart: () {
        emit(LoadingState());
      },
      onSuccess: (data) {
        coursesModel = data!;

        searchCoursesResult = coursesModel;

        emit(LoadedState<List<CoursesModel>>(data: searchCoursesResult));
      },
      onFail: (message) => emit(FailedState(message: message)),
    );
  }

  searchInList({required String query}) {
    final searchQuery = query.toLowerCase();
    if (searchQuery.isEmpty) {
      searchCoursesResult = coursesModel;
    } else {
      searchCoursesResult = coursesModel
          .where(
              (item) => item.teacherName!.toLowerCase().contains(searchQuery))
          .toList();
    }

    emit(LoadedState<List<CoursesModel>>(data: coursesModel));
  }
}
