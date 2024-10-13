import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/helper/app_helper.dart';
import '../../../../core/list_states.dart';
import '../../../../core/model/groups_model.dart';
import '../../domain/use_cases/student/groups_use_case.dart';


class GroupsCubit extends Cubit<CubitStates> {
  GroupsCubit(this.useCase) : super(InitialState());
  GroupsUseCase useCase;

  getGroups({int? subjectId}) {
    managerExecute<List<GroupsModel>>(
      useCase.getGroups(subjectId: subjectId),
      onStart: () => emit(LoadingState()),
      onSuccess: (data) =>
          emit(LoadedState<List<GroupsModel>>(data: data!)),
      onFail: (message) => emit(FailedState(message: message)),
    );
  }
}
