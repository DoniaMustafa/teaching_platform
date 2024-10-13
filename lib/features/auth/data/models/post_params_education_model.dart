import 'package:teaching/config/routes/app_routes.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/auth/presentation/pages/sign_up_py_phone_screen.dart';

import '../../../../core/utils/app_strings.dart';

class PostParamsEducationModel {
  final String? phoneNumber;
  final List<int>? educationTypeIds;
  final List<int>? programTypeIds;
  final List<int>? gradeIds;
  final List<int>? subjectIds;

  PostParamsEducationModel({
    this.phoneNumber,
    this.subjectIds,
    this.educationTypeIds,
    this.programTypeIds,
    this.gradeIds,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PhoneNumber'] = this.phoneNumber;
    data['EducationTypeIds'] = this.educationTypeIds;
    data['ProgramTypeIds'] = this.programTypeIds;
    data['GradeIds'] = this.gradeIds;
    if (subjectIds.isNotNull) {
      data['SubjectIds'] = this.subjectIds;
    }
    return data;
  }

  // Map<String, dynamic> pushToJson() => {
  //   "PhoneNumber": phoneNumber,
  //       "EducationTypeIds": educationTypeIds == null
  //           ? []
  //           : List<dynamic>.from(educationTypeIds!.map((x) => x)),
  //       "ProgramTypeIds": programTypeIds == null
  //           ? []
  //           : List<dynamic>.from(programTypeIds!.map((x) => x)),
  //       "GradeIds":
  //           gradeIds == null ? [] : List<dynamic>.from(gradeIds!.map((x) => x)),
  //
  //     };
}
