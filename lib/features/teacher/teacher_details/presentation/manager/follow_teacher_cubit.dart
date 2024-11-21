import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/core/helper/toast_healper.dart';
import 'package:teaching/features/parent_children/presentation/widgets/build_children_drop_down_list.dart';
import 'package:teaching/features/teacher/teacher_details/data/models/teacher_details_model.dart';
import 'package:teaching/features/teacher/teacher_details/domain/use_cases/teacher_details_use_case.dart';
import 'package:teaching/features/teacher/teacher_details/presentation/manager/teacher_details_cubit.dart';

class FollowTeacherCubit extends Cubit<CubitStates> {
  FollowTeacherCubit(this.useCase) : super(InitialState());
  TeacherDetailsUseCase useCase;
  bool isFollow = false;
  followingTeacher({TeacherModel? model}) {
    managerExecute<dynamic>(useCase.followTeachers(model: model), onStart: () {
      emit(LoadingState());
    }, onFail: (message) {
      isFollow = false;
      ToastHelper.buildToast(
        text: message,
        tColor: ToastColors.ERROR,
      );
      emit(FailedState(message: message));
    }, onSuccess: (data) {
      // pop();
      isFollow = !isFollow;
      print(isFollow);
      AppService().getBlocData<TeacherDetailsCubit>().getTeacherDetails(
            model: TeacherModel(
                infoType: AppPrefs.userRole == "3" ? 3 : null,
                studentId: AppPrefs.userRole == "3"
                    ? BuildChildrenDropDownList.childrenId
                    : null,
                teacherId: model!.teacherId),
          );
      emit(LoadedState<dynamic>(data: data));
    });
  }
}
