import 'package:teaching/agora/live_screen.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/home_work/presentation/manager/homework_operation_cubit.dart';
import 'package:teaching/features/private/presentation/manager/private_groups_operation_cubit.dart';

class EnumService {
  static String registerType(type) {
    print(type);
    switch (RoleType.values.byName(type)) {
      case RoleType.ProfessionalLecturer:
        return '${AppStrings().create.trans} ${AppStrings().lecture.trans} ${AppStrings().account.trans}';
      case RoleType.Teacher:
        return '${AppStrings().create.trans} ${AppStrings().teacher.trans} ${AppStrings().account.trans}';
      case RoleType.Student:
        return '${AppStrings().create.trans} ${AppStrings().student.trans} ${AppStrings().account.trans}';
      case RoleType.Parent:
        return '${AppStrings().create.trans} ${AppStrings().parent.trans} ${AppStrings().account.trans}';
      case RoleType.Assistant:
        return '${AppStrings().create.trans} ${AppStrings().assistant.trans} ${AppStrings().account.trans}';
      case RoleType.School:
        return '${AppStrings().create.trans} ${AppStrings().school.trans} ${AppStrings().account.trans}';
      default:
        return '${AppStrings().create.trans} ${AppStrings().professionalCourse.trans} ${AppStrings().account.trans}';
    }
  }

  static List<GenericModel> userDrawerType(String type, context) {
    print(type);
    switch (type) {
      case '1':
        return AppListsConstant.studentDrawerItems = [
          GenericModel(
            onTap: () => Routes.publicCoursesGroupsRoute.moveTo,
            // image: AppAssets().teacher,
            // role: 'lecture',
            title: AppStrings().courses.trans,
          ),
          GenericModel(
            onTap: () {
              AppService()
                  .getBlocData<BottomNavBarOperationCubit>()
                  .onSelectedItem(2);
              // Routes.bottomNavigationRoute.moveTo;
              Scaffold.of(context).closeDrawer();
            },
            title: AppStrings().mySubscriptions.trans,
          ),
          GenericModel(
            onTap: () {
              Routes.teachersRoute.moveTo;
            },
            // image: AppAssets().student,
            // role: 'student',
            title: AppStrings().teachers.trans,
          ),

          GenericModel(
            onTap: () {
              Routes.myGradesRoute.moveTo;
            },
            // image: AppAssets().teacher,
            // role: 'lecture',
            title: AppStrings().myGrades.trans,
          ),
          GenericModel(
            onTap: () {},
            // image: AppAssets().student,
            // role: 'student',
            title: AppStrings().challenges.trans,
          ),

          GenericModel(
            onTap: () {},
            // image: AppAssets().teacher,
            // role: 'lecture',
            title: AppStrings().firstStudents.trans,
          ),
          //
          GenericModel(
            onTap: () {
              Routes.parentsRoute.moveTo;
            },
            // image: AppAssets().teacher,
            // role: 'lecture',
            title: AppStrings().parent.trans,
          ),

          GenericModel(
            onTap: () => Routes.teachersRoute.moveTo,
            // image: AppAssets().teacher,
            // role: 'lecture',
            title: AppStrings().tasks.trans,
          ),
          GenericModel(
            onTap: () {
              Routes.settingsRoute.moveTo;
              // Scaffold.of(context).closeDrawer();
              print(Scaffold.of(context).isDrawerOpen);
            },
            // image: AppAssets().teacher,
            // role: 'lecture',
            title: AppStrings().settings.trans,
          ),
        ];
      case '2':
        print('dvav');
        return AppListsConstant.drawerItems;
      case '3':
        return AppListsConstant.parentDrawerItems = [
          GenericModel(
            onTap: () => Routes.publicCoursesGroupsRoute.moveTo,
            // image: AppAssets().teacher,
            // role: 'lecture',
            title: AppStrings().courses.trans,
          ),
          GenericModel(
            onTap: () {
              AppService()
                  .getBlocData<BottomNavBarOperationCubit>()
                  .onSelectedItem(2);
              // Routes.bottomNavigationRoute.moveTo;
              Scaffold.of(context).closeDrawer();
            },
            title: AppStrings().mySubscriptions.trans,
          ),
          GenericModel(
            onTap: () {
              Routes.teachersRoute.moveTo;
            },
            // image: AppAssets().student,
            // role: 'student',
            title: AppStrings().teacher.trans,
          ),
          GenericModel(
            onTap: () {
              Routes.myGradesRoute.moveTo;
            },
            // image: AppAssets().teacher,
            // role: 'lecture',
            title: AppStrings().myGrades.trans,
          ),
          GenericModel(
            onTap: () {},
            // image: AppAssets().teacher,
            // role: 'lecture',
            title: AppStrings().firstStudents.trans,
          ),
          GenericModel(
            onTap: () {
              Routes.settingsRoute.moveTo;
              // Scaffold.of(context).closeDrawer();
              print(Scaffold.of(context).isDrawerOpen);
            },
            // image: AppAssets().teacher,
            // role: 'lecture',
            title: AppStrings().settings.trans,
          ),
        ];
      case '6':
        return AppListsConstant.studentDrawerItems;
      case '7':
        return AppListsConstant.studentDrawerItems; // case RoleType.School:
      //   return '${AppStrings().create.trans} ${AppStrings().school.trans} ${AppStrings().account.trans}';
      default:
        return AppListsConstant.studentDrawerItems;
    }
  }

  static List<GenericModel> userCategoryType(String type) {
    print(type);
    switch (type) {
      case "1":
        return AppListsConstant.listOfStudentCategories = [
          GenericModel(
            onTap: () {
              Routes.examsRoute.moveTo;
            },
            image: AppAssets().student,
            // role: 'student',
            title: AppStrings().testYourself.trans,
          ),
          GenericModel(
            onTap: () {
              Routes.myGradesRoute.moveTo;
            },
            title: AppStrings().myGrades.trans,
          ),
          GenericModel(
            onTap: () => Routes.notesRoute.moveTo,
            title: AppStrings().notes.trans,
          ),
          GenericModel(
            onTap: () {AppService().getBlocData<PrivateGroupsOperationCubit>().privateIndex=0;
              Routes.privateGroupsRoute.moveTo;
            },
            title: AppStrings().private.trans,
          ),
          GenericModel(
            onTap: () {
              Routes.liveRoute.moveToWithArgs({LiveScreen.hostKey: true});
            },
            title: AppStrings().live.trans,
          ),
          GenericModel(
            onTap: () {
              AppService()
                  .getBlocData<CoursesGroupOperationCubit>()
                  .selectedIndex = null;
              AppService().getBlocData<HomeworkOperationCubit>().tapIndex = 0;
              Routes.homeWorkRoute.moveTo;
            },
            title: AppStrings().homeWork.trans,
          ),
          GenericModel(
            onTap: () {
              Routes.liveRoute.moveToWithArgs({LiveScreen.hostKey: false});
              // Routes.studentTasksRoute.moveTo;
            },
            title: AppStrings().tasks.trans,
          ),
        ];
      case '2':
        return AppListsConstant.listOfTeacherCategories = [
          GenericModel(
            // image: AppAssets().student,
            // role: 'student',
            title: AppStrings().tests.trans,
          ),
          GenericModel(
            // image: AppAssets().teacher,
            // role: 'lecture',
            title: AppStrings().notes.trans,
          ),
          GenericModel(
            // image: AppAssets().teacher,
            // role: 'lecture',
            title: AppStrings().myGrades.trans,
          ),
          GenericModel(
            // image: AppAssets().teacher,
            // role: 'lecture',
            title: AppStrings().homeWork.trans,
          ),
          GenericModel(
            // image: AppAssets().teacher,
            // role: 'lecture',
            title: AppStrings().questions.trans,
          ),
          GenericModel(
            // image: AppAssets().teacher,
            // role: 'lecture',
            title: AppStrings().live.trans,
          ),
          GenericModel(
            // image: AppAssets().teacher,
            // role: 'lecture',
            title: AppStrings().tasks.trans,
          ),
        ];
      case '3':
        return AppListsConstant.listOfSParentCategories = [
          GenericModel(
            onTap: () => Routes.notesRoute.moveTo,
            title: AppStrings().notes.trans,
          ),
          GenericModel(
            onTap: () => Routes.myGradesRoute.moveTo,
            title: AppStrings().childrenGrades.trans,
          ),
          GenericModel(
            onTap: () => Routes.homeWorkRoute.moveTo,
            title: AppStrings().childrenHomeWork.trans,
          ),
          GenericModel(
            onTap: () => Routes.statisticsRoute.moveTo,
            title: AppStrings().statistics.trans,
          ),
          GenericModel(
            onTap: () => Routes.notesRoute.moveTo,
            title: AppStrings().absenceAndPresence.trans,
          ),
        ];
      case '6':
        return AppListsConstant.listOfSParentCategories;
      case '7':
        return AppListsConstant
            .listOfSParentCategories; // case RoleType.School:
      //   return '${AppStrings().create.trans} ${AppStrings().school.trans} ${AppStrings().account.trans}';
      default:
        return AppListsConstant.listOfSParentCategories;
    }
  }

  static String registrationEndPointType(type) {
    print(type);
    switch (RoleType.values.byName(type)) {
      case RoleType.ProfessionalLecturer:
        return EndPoints.registerLecturer;
      case RoleType.Teacher:
        return EndPoints.registerTeacher;
      case RoleType.Student:
        return EndPoints.registerStudent;
      case RoleType.Parent:
        return EndPoints.registerParent;
      case RoleType.Assistant:
        return EndPoints.registerAssistant;
      case RoleType.School:
        return EndPoints.registerStudent;
      default:
        return EndPoints.registerStudent;
    }
  }

  static String coursesEndPointType(type) {
    print(type);
    switch (type) {
      case '8':
        return EndPoints.homeStudentCourses;
      case '2':
        return EndPoints.getHomeTeacherCourses;
      case '1':
        return EndPoints.homeStudentCourses;
      case '3':
        return EndPoints.homeStudentCourses;
      case '6':
        return EndPoints.homeStudentCourses;
      case '5':
        return EndPoints.homeStudentCourses;
      default:
        return EndPoints.homeStudentCourses;
    }
  }

  static String groupsEndPointType(type) {
    print(type);
    switch (type) {
      case '8':
        return EndPoints.registerLecturer;
      case '2':
        return EndPoints.getHomeTeacherGroups;
      case '1':
        return EndPoints.homeStudentGroups;
      case '3':
        return EndPoints.registerParent;
      case '6':
        return EndPoints.registerAssistant;
      case '5':
        return EndPoints.registerStudent;
      default:
        return EndPoints.registerStudent;
    }
  }
  //
  // static ToastGravity groupsEndPointType(AlertTypes type) {
  //   print(type);
  //   switch (type) {
  //     case AlertTypes.success:
  //       return ;
  //     case '2':
  //       return EndPoints.getHomeTeacherGroups;
  //     case '1':
  //       return EndPoints.homeStudentGroups;
  //     case '3':
  //       return EndPoints.registerParent;
  //     case '6':
  //       return EndPoints.registerAssistant;
  //     case '5':
  //       return EndPoints.registerStudent;
  //     default:
  //       return EndPoints.registerStudent;
  //   }
  // }

  static setToastColor(ToastColors color) {
    Color basicColor;
    switch (color) {
      case ToastColors.SUCCESS:
        basicColor = Colors.green;
        break;
      case ToastColors.ERROR:
        basicColor = Colors.red;
        break;
      case ToastColors.WARNING:
        basicColor = Colors.yellow;

        break;
    }
    return basicColor;
  }
}
