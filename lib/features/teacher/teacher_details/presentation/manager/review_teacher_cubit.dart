import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/teacher/teacher_details/data/models/teacher_details_model.dart';
import 'package:teaching/features/teacher/teacher_details/domain/use_cases/teacher_details_use_case.dart';
import 'package:teaching/features/teacher/teacher_details/presentation/manager/teacher_details_cubit.dart';

class ReviewTeacherCubit extends Cubit<CubitStates> {
  ReviewTeacherCubit(this.useCase) : super(InitialState());
  TeacherDetailsUseCase useCase;
  addTeachersReview({PostRateParamsModel? model}) {
    executeWithDialog<dynamic>(
        either: useCase.addTeachersReview(model: model),
        startingMessage: AppStrings().loading.trans,
        onStart: () => emit(LoadingState()),
        onError: (message) => emit(FailedState(message: message)),
        onSuccess: (data) {
          pop();
          // AppService().getBlocData<TeacherDetailsCubit>().getTeacherDetails(
          //     model: TeacherModel(teacherId: model!.teacherId));
          emit(LoadedState<dynamic>(data: data));
        });
  }
}
