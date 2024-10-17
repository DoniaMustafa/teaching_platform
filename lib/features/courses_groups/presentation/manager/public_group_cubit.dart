import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/courses_groups/domain/use_cases/public_groups_courses_use_case.dart';


class PublicGroupCubit extends Cubit<CubitStates> {
  PublicGroupCubit(this.useCase) : super(InitialState());
  PublicGroupsCoursesUseCase useCase;

  List<GroupsModel> model = [];
  List<GroupsModel> searchResult = [];
  getPublicGroups({TeacherModel? dataModel}) {
    model = [];
    managerExecute<List<GroupsModel>>(
        useCase.getPublicGroups(model: dataModel),
        onStart: () => emit(LoadingState()),
        onFail: (message) => emit(FailedState(message: message)),
        onSuccess: (data) {
          model = data!;
          searchResult = model;

          emit(LoadedState<List<GroupsModel>>(data: data));
        });
  }

  searchInList(String query) {
    final searchQuery = query.toLowerCase();
    if (searchQuery.isEmpty) {
      searchResult = model; // Display all items when search text is cleared
    } else {
      searchResult = model
          .where(
              (item) => item.teacherName!.toLowerCase().contains(searchQuery))
          .toList();
    }
    emit(LoadedState<List<GroupsModel>>(data: searchResult));
  }
}
