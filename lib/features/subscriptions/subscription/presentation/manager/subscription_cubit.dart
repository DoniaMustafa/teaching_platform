import 'package:bloc/bloc.dart';
import 'package:teaching/core/export/export.dart';


class SubscriptionCubit extends Cubit<CubitStates> {
  SubscriptionCubit(this.useCase) : super(InitialState());
  SubscriptionUseCase useCase;

  CoursesDataModel? model;
  List<GroupsModel> groupModel = [];
  List<CoursesModel> coursesModel = [];
  List<GroupsModel> searchGroupsResult = [];
  List<CoursesModel> searchCoursesResult = [];
  getSubscription({bool isCourse = false,bool isModel=true}) {
    managerExecute<CoursesDataModel>(
      useCase.getSubscription(),
      onStart: () {
        groupModel = [];
        coursesModel = [];
        emit(LoadingState());
      },
      onSuccess: (data) {
        model = data;
        groupModel = data!.groups!;
        coursesModel = data.courses!;
        searchGroupsResult = groupModel;
        searchCoursesResult = coursesModel;
        if (isModel.isTrue) {
          emit(LoadedState<CoursesDataModel>(data: model!));
        } else {
          isCourse.isTrue
              ? emit(LoadedState<List<CoursesModel>>(data: coursesModel))
              : emit(LoadedState<List<GroupsModel>>(data: groupModel));
        }
      },
      onFail: (message) => emit(FailedState(message: message)),
    );
  }

  searchInList({required String query, bool isCourse = false}) {
    final searchQuery = query.toLowerCase();
    if (searchQuery.isEmpty) {
      if (isCourse.isTrue) {
        searchCoursesResult = coursesModel;
      } else {
        searchGroupsResult = groupModel;
      }
    } else {
      if (isCourse.isTrue) {
        searchCoursesResult = coursesModel
            .where(
                (item) => item.teacherName!.toLowerCase().contains(searchQuery))
            .toList();
      } else {
        searchGroupsResult = groupModel
            .where(
                (item) => item.teacherName!.toLowerCase().contains(searchQuery))
            .toList();
      }
    }
    isCourse.isTrue
        ? emit(LoadedState<List<CoursesModel>>(data: coursesModel))
        : emit(LoadedState<List<GroupsModel>>(data: groupModel));
  }
}
