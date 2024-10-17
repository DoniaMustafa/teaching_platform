import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/teacher/teacher_details/data/models/teacher_details_model.dart';
import 'package:teaching/features/teacher/teacher_details/domain/use_cases/teacher_details_use_case.dart';
import 'package:teaching/features/teacher/teacher_details/presentation/manager/teacher_details_cubit.dart';

class FollowTeacherCubit extends Cubit<CubitStates> {
  FollowTeacherCubit(this.useCase) : super(InitialState());
  TeacherDetailsUseCase useCase;
  bool isFollow=false;
  followingTeacher({TeacherModel? model}) {
    isFollow=true;
    managerExecute<dynamic>(
        useCase.followTeachers(model: model),
        onStart: () => emit(LoadingState()),
        onFail: (message) {   isFollow=false;
          emit(FailedState(message: message));
        },
        onSuccess: (data) {
          // pop();
          isFollow = !isFollow;
          // AppService().getBlocData<TeacherDetailsCubit>().getTeacherDetails(
          //     model: TeacherModel(teacherId: model!.teacherId));
          emit(LoadedState<dynamic>(data: data));
        });
  }
}
