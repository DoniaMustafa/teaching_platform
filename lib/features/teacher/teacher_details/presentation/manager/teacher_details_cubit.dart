import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/teacher/teacher_details/data/models/teacher_details_model.dart';
import 'package:teaching/features/teacher/teacher_details/domain/use_cases/teacher_details_use_case.dart';

import 'follow_teacher_cubit.dart';

class TeacherDetailsCubit extends Cubit<CubitStates> {
  TeacherDetailsCubit(this.useCase) : super(InitialState());
  TeacherDetailsUseCase useCase;
  getTeacherDetails({TeacherModel? model}) {
    managerExecute<TeacherDetailsData>(useCase.getTeachersDetails(model: model),
        onStart: () => emit(LoadingState()),
        onFail: (message) => emit(FailedState(message: message)),
        onSuccess: (data) {
      AppService().getBlocData<FollowTeacherCubit>().isFollow=data!.isFollowed!;
      // <FollowTeacherCubit>().isFollow =
      //
          emit(LoadedState<TeacherDetailsData>(data: data));
        });
  }
}
