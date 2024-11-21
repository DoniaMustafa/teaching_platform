import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/private/domain/use_cases/private_groups_use_case.dart';

class PrivateGroupsCubit extends Cubit<CubitStates> {
  PrivateGroupsCubit(this.useCase) : super(InitialState());
  PrivateGroupsUseCase useCase;
  List<GroupsModel> privateGroups = [];
  List<GroupsModel> searchResult = [];
  String groupName = '';
  getPrivateGroups({TeacherModel? model}) {
    managerExecute<List<GroupsModel>>(
        useCase.getPrivateGroups(
          model: model,
        ),
        onStart: () {
          privateGroups = [];
          emit(LoadingState());
        },
        onSuccess: (data) {
          privateGroups = data!;
          searchResult = privateGroups;
          print('dvdvdsdvdvdsdvdvdsdvdvdsdvdvdsdvdvdsdvdvdsdvdvds');
          emit(LoadedState<List<GroupsModel>>(data: data));
        },
        onFail: (message) => emit(FailedState(message: message)));
  }

  searchInList(String query) {
    final searchQuery = query.toLowerCase();
    groupName = query;
    if (searchQuery.isEmpty) {
      searchResult =
          privateGroups; // Display all items when search text is cleared
      print(searchResult);
    } else {
      searchResult = privateGroups
          .where(
              (item) => item.teacherName!.toLowerCase().contains(searchQuery))
          .toList();
      print(searchResult);
    }
    emit(LoadedState<List<GroupsModel>>(data: searchResult));
  }
}
