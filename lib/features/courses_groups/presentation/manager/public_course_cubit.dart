import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/courses_groups/domain/use_cases/public_groups_courses_use_case.dart';

class PublicCourseCubit extends Cubit<CubitStates> {
  PublicCourseCubit(this.useCase) : super(InitialState());
  PublicGroupsCoursesUseCase useCase;
  List<CoursesModel> model = [];
  List<CoursesModel> searchResult = [];
  String teacherName = '';
  getPublicCourses({TeacherModel? dataModel}) {
    model = [];
    managerExecute<List<CoursesModel>>(
        useCase.getPublicCourses(model: dataModel),
        onStart: () => emit(LoadingState()),
        onFail: (message) => emit(FailedState(message: message)),
        onSuccess: (data) {
          model = data!;
          searchResult = model;
          emit(LoadedState<List<CoursesModel>>(data: data));
        });
  }

  searchInList(String query) {
    final searchQuery = query.toLowerCase();
    teacherName = query;
    if (searchQuery.isEmpty) {
      searchResult = model; // Display all items when search text is cleared
      print(searchResult);
    } else {
      searchResult = model
          .where(
              (item) => item.teacherName!.toLowerCase().contains(searchQuery))
          .toList();
      print(searchResult);
    }
    emit(LoadedState<List<CoursesModel>>(data: searchResult));
  }
}
