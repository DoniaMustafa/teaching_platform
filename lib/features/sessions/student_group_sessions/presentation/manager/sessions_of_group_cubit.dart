import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/sessions/student_group_sessions/data/models/sessions_of_group_response_model.dart';
import 'package:teaching/features/sessions/student_group_sessions/domain/use_cases/sessions_of_group_use_case.dart';
import 'package:teaching/features/sessions/student_group_sessions/presentation/manager/sessions_of_group_operation_cubit.dart';

class SessionsOfGroupCubit extends Cubit<CubitStates> {
  SessionsOfGroupCubit(this.useCase) : super(InitialState());

  SessionsOfGroupUseCase useCase;
  List<SessionsOfGroupData> previousVideos = [];
  List<SessionsOfGroupData> nextVideos = [];
  getSessionsOfGroup({required int groupId}) {
    managerExecute<List<SessionsOfGroupData>>(
        useCase.getSessionsOfGroup(groupId: groupId),
        onStart: () {
          previousVideos = [];
          nextVideos = [];
          emit(LoadingState());
        },
        onFail: (message) => emit(FailedState(message: message)),
        beforeSuccess: (List<SessionsOfGroupData>? data) {
          for (var element in data!) {
            DateTime date1 = DateTime(
                element.classAt!.year,
                element.classAt!.month,
                element.classAt!.day,
                element.classAt!.hour,
                element.classAt!.minute,
                element.classAt!.second);
            DateTime date2 = DateTime(
                DateTime.now().year,
                DateTime.now().month,
                DateTime.now().day,
                DateTime.now().hour,
                DateTime.now().minute,
                DateTime.now().second);
            if (date1.isBefore(date2) || date1.isEqualTo(date2)) {
              previousVideos.addAll({element});
            } else {
              nextVideos.addAll({element});
            }
          }
        },
        onSuccess: (List<SessionsOfGroupData>? data) {
          emit(LoadedState<List<SessionsOfGroupData>>(data: data!));
        });
  }
}
