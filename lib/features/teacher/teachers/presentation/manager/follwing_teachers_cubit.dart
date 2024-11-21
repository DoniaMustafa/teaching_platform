import 'package:bloc/bloc.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/teacher/teachers/domain/use_cases/teacher_of_parent_use_case.dart';
import 'package:teaching/features/teacher/teachers/domain/use_cases/teacher_of_student_use_case.dart';

import '../../data/models/teacher_respons_model.dart';

class FollowingTeachersCubit extends Cubit<CubitStates> {
  FollowingTeachersCubit(this.useCase) : super(InitialState());
  TeacherOfParentUseCase useCase;

  List<TeacherModel> model = [];
  // List<TeacherModel>? searchResult;
  String teacherName = '';

  getFollowingTeachers() {
    managerExecute<List<TeacherModel>>(
      onStart: () {
        model = [];
        // searchResult = [];
        emit(LoadingState());
      },
      useCase.getFollowingTeachers(),
      onSuccess: (List<TeacherModel>? data) {
        // model = data!;
        // searchResult = model;
        emit(LoadedState<List<TeacherModel>>(data: data!));
      },
      onFail: (message) {
        emit(FailedState(message: message));
      },
    );
  }

  // searchInList(String query) {
  //   final searchQuery = query.toLowerCase();
  //   teacherName = query;
  //   if (searchQuery.isEmpty) {
  //     searchResult = model; // Display all items when search text is cleared
  //     print(searchResult);
  //   } else {
  //     searchResult = model
  //         .where((item) => item.name!.toLowerCase().contains(searchQuery))
  //         .toList();
  //     print(searchResult);
  //   }
  //   emit(LoadedState<List<TeacherDataModel>>(data: searchResult!));
  // }
}
