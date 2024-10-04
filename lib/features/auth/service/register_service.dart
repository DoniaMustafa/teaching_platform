import 'package:teaching/core/enums.dart';
import 'package:teaching/core/export/export.dart';

class RegisterService {
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
}
