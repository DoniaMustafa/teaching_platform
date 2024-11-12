import 'package:bloc/bloc.dart';
import 'package:teaching/core/export/export.dart';


class SubscriptionGroupsCubit extends Cubit<CubitStates> {
  SubscriptionGroupsCubit(this.useCase) : super(InitialState());
  SubscriptionUseCase useCase;

  CoursesDataModel? model;
  List<GroupsModel> groupModel = [];
  List<GroupsModel> searchGroupsResult = [];
  getStudentSubscriptionsGroups({TeacherModel? model}){
    managerExecute<List<GroupsModel>>(
      useCase.getStudentSubscriptionsGroups(model:model ),
      onStart: () {
        groupModel = [];
        emit(LoadingState());
      },
      onSuccess: (data) {
        groupModel = data!;
        searchGroupsResult = groupModel;

          emit(LoadedState<List<GroupsModel>>(data: groupModel));

      },
      onFail: (message) => emit(FailedState(message: message)),
    );
  }

  searchInList({required String query}) {
    final searchQuery = query.toLowerCase();
    if (searchQuery.isEmpty) {

        searchGroupsResult = groupModel;

    } else {

        searchGroupsResult = groupModel
            .where(
                (item) => item.teacherName!.toLowerCase().contains(searchQuery))
            .toList();

    }
    emit(LoadedState<List<GroupsModel>>(data: groupModel));
  }
}
