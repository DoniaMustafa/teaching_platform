import 'package:bloc/bloc.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/teacher/teachers/domain/use_cases/teacher_of_student_use_case.dart';

import '../../data/models/teacher_respons_model.dart';

class TeachersOfStudentCubit extends Cubit<CubitStates> {
  TeachersOfStudentCubit(this.useCase) : super(InitialState());
  TeacherOfStudentUseCase useCase;

  List<TeacherDataModel> model = [];
  List<TeacherDataModel> searchResult = [];
  String teacherName = '';

  getTeacherOfStudent({TeacherModel? teacher}) {
    managerExecute<List<TeacherDataModel>>(
      onStart: () {
        model = [];
        emit(LoadingState());
      },
      useCase.getTeacherOfStudent(model: teacher),
      onSuccess: (List<TeacherDataModel>? data) {
        model = data!;
        searchResult = model;
        emit(LoadedState<List<TeacherDataModel>>(data: searchResult));
      },
      onFail: (message) {
        emit(FailedState(message: message));
      },
    );
  }

  searchInList(String query) {
    final searchQuery = query.toLowerCase();
    teacherName = query;
    if (searchQuery.isEmpty) {
      searchResult = model; // Display all items when search text is cleared
      print(searchResult);
    } else {
      searchResult = model
          .where((item) => item.name!.toLowerCase().contains(searchQuery))
          .toList();
      print(searchResult);
    }
    emit(LoadedState<List<TeacherDataModel>>(data: searchResult));
  }
}
