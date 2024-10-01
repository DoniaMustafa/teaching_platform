import 'package:bloc/bloc.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/home/domain/use_cases/student/teacher_of_student_use_case.dart';

import '../../data/models/teacher_respons_model.dart';



class TeachersOfStudentCubit extends Cubit<CubitStates> {
  TeachersOfStudentCubit(this.useCase) : super(InitialState());
  TeacherOfStudentUseCase useCase;


  getTeacherOfStudent() {
    managerExecute<List<TeacherDataModel>>(
      useCase.getTeacherOfStudent(),
      onSuccess: (data) =>
          emit(LoadedState<List<TeacherDataModel>>(data: data!)),
      onFail: (message) => emit(FailedState(message: message)),
    );}
}
