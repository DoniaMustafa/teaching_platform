import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/Task/Tasks/domain/use_cases/student_tasks_use_case.dart';


class StudentTasksCubit extends Cubit<CubitStates> {
  StudentTasksCubit(this.useCase) : super(InitialState());
  StudentTasksUseCase useCase;
  getStudentTasks(){}

}
