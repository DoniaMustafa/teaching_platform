import 'package:teaching/core/enums.dart';
import 'package:teaching/core/export/export.dart';

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

  static List<GenericModel> userDrawerType(String type) {
    print(type);
    switch (type) {
      case '1':
        return AppListsConstant.studentDrawerItems;
      case '2':
        print('dvav');
        return AppListsConstant.drawerItems;
      case '3':
        return AppListsConstant.studentDrawerItems;
      case '6':
        return AppListsConstant.studentDrawerItems;
      case '7':
        return AppListsConstant.studentDrawerItems; // case RoleType.School:
      //   return '${AppStrings().create.trans} ${AppStrings().school.trans} ${AppStrings().account.trans}';
      default:
        return AppListsConstant.studentDrawerItems;
    }
  }

  static List userCategoryType(String type) {
    print(type);
    switch (type) {
      case '1':
        return AppListsConstant.listOfStudentCategories;
      case '2':
        return AppListsConstant.listOfTeacherCategories;
      case '3':
        return AppListsConstant.listOfStudentCategories;
      case '6':
        return AppListsConstant.listOfStudentCategories;
      case '7':
        return AppListsConstant
            .listOfStudentCategories; // case RoleType.School:
      //   return '${AppStrings().create.trans} ${AppStrings().school.trans} ${AppStrings().account.trans}';
      default:
        return AppListsConstant.listOfStudentCategories;
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

  static String groupsAndCoursesEndPointType(type) {
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


}
