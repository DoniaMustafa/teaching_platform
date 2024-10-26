import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/sessions/student_group_sessions/data/models/sessions_of_group_response_model.dart';
import 'package:teaching/features/sessions/student_group_sessions/domain/use_cases/sessions_of_group_use_case.dart';

class SessionsOfGroupCubit extends Cubit<CubitStates> {
  SessionsOfGroupCubit(this.useCase) : super(InitialState());

  SessionsOfGroupUseCase useCase;
  List<SessionsOfGroupData> videos = [];
  getSessionsOfGroup({required int groupId}) {
    managerExecute<List<SessionsOfGroupData>>(
        useCase.getSessionsOfGroup(groupId: groupId),
        onStart: () => emit(LoadingState()),
        onFail: (message) => emit(FailedState(message: message)),
        beforeSuccess: (data)async{
          // videos= data;
          if (data!.isNotEmpty) {
            for (var element in data) {
              DateTime date1 = DateTime(element.classAt!.year,
                  element.classAt!.month, element.classAt!.day);
              DateTime date2 = DateTime(DateTime.now().year,
                  DateTime.now().month, DateTime.now().day);

              if (date1.isBefore(date2) || date1.isEqualTo(date2)) {
                for (var sessionsElement in data) {
                  videos.addAll({sessionsElement});
                  print('${AppStrings().previousClasses.trans} $videos');
                }
              } else {
                for (var sessionsElement in data) {
                  videos.addAll({sessionsElement});
                  print('${AppStrings().nextClasses.trans} $videos');
                }
              }

            }
          } else {
            videos = [];

          }

        },
        onSuccess: (List<SessionsOfGroupData>? data) {
          // emit(LoadedState<List<SessionsOfGroupData>>(data: videos));
        });
  }
}
