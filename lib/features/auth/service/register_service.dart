import 'package:teaching/core/enums.dart';
import 'package:teaching/core/export/export.dart';

class RegisterService {
  static String registerType(type) {
    print(type);
    switch (RoleType.values.byName(type)) {
      case RoleType.lecture:
        return '${AppStrings().create.trans} ${AppStrings().lecture.trans} ${AppStrings().account.trans}';
      case RoleType.teacher:
        return '${AppStrings().create.trans} ${AppStrings().teacher.trans} ${AppStrings().account.trans}';
      case RoleType.student:
        return '${AppStrings().create.trans} ${AppStrings().student.trans} ${AppStrings().account.trans}';
      case RoleType.parent:
        return '${AppStrings().create.trans} ${AppStrings().parent.trans} ${AppStrings().account.trans}';
      case RoleType.assistant:
        return '${AppStrings().create.trans} ${AppStrings().assistant.trans} ${AppStrings().account.trans}';
      case RoleType.school:
        return '${AppStrings().create.trans} ${AppStrings().school.trans} ${AppStrings().account.trans}';
      default:
        return '${AppStrings().create.trans} ${AppStrings().professionalCourse.trans} ${AppStrings().account.trans}';
    }
  }
}
